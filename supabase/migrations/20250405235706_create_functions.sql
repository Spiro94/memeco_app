set check_function_bodies = off;

-- Función trigger para insertar perfiles (en esquema private)
CREATE OR REPLACE FUNCTION private.insert_profile()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO 'private'
AS $function$
declare
  x_username text;
begin
  x_username = new.raw_user_meta_data ->> 'username';
  insert into public.profiles (id, email, username)
  values (new.id, new.email, x_username);
  return new;
end;
$function$
;

-- Función RPC: get_meme_details
CREATE OR REPLACE FUNCTION public.get_meme_details(p_meme_id uuid)
 RETURNS TABLE(
   id uuid, 
   title text, 
   image_url text, 
   created_at timestamp with time zone, 
   likes integer, 
   dislikes integer, 
   my_vote boolean
 )
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
    ) as my_vote
  from memes m
  where m.id = p_meme_id;
$function$
;

-- Función RPC: get_meme_votes
CREATE OR REPLACE FUNCTION public.get_meme_votes(p_meme_id uuid)
 RETURNS TABLE(likes integer, dislikes integer)
 LANGUAGE sql
 STABLE
AS $function$
  select
    count(*) filter (where is_like = true) as likes,
    count(*) filter (where is_like = false) as dislikes
  from meme_votes
  where meme_id = p_meme_id;
$function$
;

-- Función RPC: get_memes_with_votes
CREATE OR REPLACE FUNCTION public.get_memes_with_votes()
 RETURNS TABLE(
   id uuid, 
   title text, 
   image_url text, 
   created_at timestamp with time zone, 
   likes integer, 
   dislikes integer, 
   my_vote boolean
 )
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
    ) as my_vote
  from memes m;
$function$
;
