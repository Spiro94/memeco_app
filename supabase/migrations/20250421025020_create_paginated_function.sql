CREATE INDEX IF NOT EXISTS idx_memes_created_at ON public.memes USING btree (created_at DESC);

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.get_memes_with_votes_paginated(p_page_size integer DEFAULT 20, p_cursor timestamp with time zone DEFAULT NULL::timestamp with time zone, p_newer_than timestamp with time zone DEFAULT NULL::timestamp with time zone)
 RETURNS TABLE(id uuid, title text, image_url text, created_at timestamp with time zone, likes integer, dislikes integer, my_vote boolean, creator_id uuid, creator_username text, creator_profile_picture text)
 LANGUAGE sql
 STABLE SECURITY DEFINER
AS $function$
  select
    m.id,
    m.title,
    m.image_url,
    m.created_at,
    coalesce((select count(*) filter (where mv.is_like)  from meme_votes mv where mv.meme_id = m.id), 0) as likes,
    coalesce((select count(*) filter (where not mv.is_like) from meme_votes mv where mv.meme_id = m.id), 0) as dislikes,
    (select mv.is_like from meme_votes mv where mv.meme_id = m.id and mv.user_id = auth.uid() limit 1) as my_vote,
    m.creator_id,
    p.username,
    p.profile_picture
  from memes m
  join profiles p on p.id = m.creator_id
 where (p_cursor is null             -- first page OR older‑page path
       or m.created_at < p_cursor)
  and (p_newer_than is null         -- refresh filter (newer‑than path)
       or m.created_at > p_newer_than)
  order by m.created_at desc
  limit p_page_size;
$function$
;