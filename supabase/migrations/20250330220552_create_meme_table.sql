-- Create table: memes
create table public.memes (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  image_path text not null,
  creator_id uuid not null default auth.uid(),
  created_at timestamp with time zone default timezone('utc', now()) not null
);

-- Enable Row Level Security
alter table public.memes enable row level security;

-- Policy: Allow users to insert their own memes
create policy "Users can insert their own memes"
on public.memes for insert
with check (creator_id = auth.uid());

-- Policy: Allow anyone to read memes
create policy "Anyone can read memes"
on public.memes for select
using (true);

-- Policy: Allow users to update their own memes
create policy "Users can update their own memes"
on public.memes for update
using (creator_id = auth.uid());

-- Policy: Allow users to delete their own memes
create policy "Users can delete their own memes"
on public.memes for delete
using (creator_id = auth.uid());
