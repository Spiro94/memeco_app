-- Enable Row Level Security on the storage.objects table
alter table storage.objects enable row level security;

-- Allow anyone to read files from the 'images' bucket
create policy "Public read access to images"
on storage.objects for select
using (bucket_id = 'images');

-- Allow authenticated users to upload their own files to the 'images' bucket
create policy "Authenticated users can insert their own images"
on storage.objects for insert
with check (
  bucket_id = 'images'
  and auth.uid() is not null
  and owner = auth.uid()
);

-- Allow authenticated users to delete their own images
create policy "Authenticated users can delete their own images"
on storage.objects for delete
using (
  bucket_id = 'images'
  and owner = auth.uid()
);
