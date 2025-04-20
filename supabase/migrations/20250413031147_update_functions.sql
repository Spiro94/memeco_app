drop function if exists "public"."get_memes_with_votes"();

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.get_user_meme_stats(_user_id uuid)
 RETURNS TABLE(likes_given bigint, memes_posted bigint)
 LANGUAGE plpgsql
 STABLE
AS $function$
BEGIN
  RETURN QUERY
    SELECT
      (SELECT COUNT(*)
         FROM meme_votes
         WHERE user_id = _user_id
           AND is_like = true) AS likes_given,
      (SELECT COUNT(*)
         FROM memes
         WHERE creator_id = _user_id) AS memes_posted;
END;
$function$
;

CREATE OR REPLACE FUNCTION public.get_memes_with_votes()
 RETURNS TABLE(id uuid, title text, image_url text, created_at timestamp with time zone, likes integer, dislikes integer, my_vote boolean, creator_id uuid, creator_username text, creator_profile_picture text)
 LANGUAGE sql
AS $function$
  select
    m.id,
    m.title,
    m.image_url,
    m.created_at,
    coalesce(
      (select count(*) filter (where mv.is_like = true)
       from meme_votes mv
       where mv.meme_id = m.id), 0) as likes,
    coalesce(
      (select count(*) filter (where mv.is_like = false)
       from meme_votes mv
       where mv.meme_id = m.id), 0) as dislikes,
    (
      select mv.is_like
      from meme_votes mv
      where mv.meme_id = m.id and mv.user_id = auth.uid()
      limit 1
    ) as my_vote,
    m.creator_id as creator_id,
    p.username as creator_username,
    p.profile_picture as creator_profile_picture
  from memes m
  join profiles p on p.id = m.creator_id
  order by m.created_at desc;
$function$
;