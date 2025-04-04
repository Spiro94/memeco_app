set check_function_bodies = off;

CREATE SCHEMA IF NOT EXISTS private;

CREATE OR REPLACE FUNCTION private.insert_profile()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO 'private'
AS $function$declare
  x_username text;
begin
  x_username = new.raw_user_meta_data ->> 'username';

  insert into public.profiles (id, email, username)
  values (new.id, new.email, x_username);

  return new;
end;$function$
;

CREATE OR REPLACE TRIGGER after_user_signup
AFTER INSERT ON auth.users
FOR EACH ROW
EXECUTE FUNCTION private.insert_profile();