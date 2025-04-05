-- RLS policies para meme_votes
create policy "Allow delete for owner"
on "public"."meme_votes"
as permissive
for delete
to public
using ((user_id = auth.uid()));

create policy "Allow insert for authenticated users"
on "public"."meme_votes"
as permissive
for insert
to public
with check ((user_id = auth.uid()));

create policy "Allow select for authenticated users"
on "public"."meme_votes"
as permissive
for select
to public
using ((auth.uid() IS NOT NULL));

create policy "Allow update for owner"
on "public"."meme_votes"
as permissive
for update
to public
using ((user_id = auth.uid()));

-- RLS policy para profiles
create policy "Enable authenticated users to select profile"
on "public"."profiles"
as permissive
for select
to authenticated
using (true);
