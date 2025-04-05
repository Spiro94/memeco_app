-- Grants para la tabla meme_votes
grant delete on table "public"."meme_votes" to "anon";
grant insert on table "public"."meme_votes" to "anon";
grant references on table "public"."meme_votes" to "anon";
grant select on table "public"."meme_votes" to "anon";
grant trigger on table "public"."meme_votes" to "anon";
grant truncate on table "public"."meme_votes" to "anon";
grant update on table "public"."meme_votes" to "anon";

grant delete on table "public"."meme_votes" to "authenticated";
grant insert on table "public"."meme_votes" to "authenticated";
grant references on table "public"."meme_votes" to "authenticated";
grant select on table "public"."meme_votes" to "authenticated";
grant trigger on table "public"."meme_votes" to "authenticated";
grant truncate on table "public"."meme_votes" to "authenticated";
grant update on table "public"."meme_votes" to "authenticated";

grant delete on table "public"."meme_votes" to "service_role";
grant insert on table "public"."meme_votes" to "service_role";
grant references on table "public"."meme_votes" to "service_role";
grant select on table "public"."meme_votes" to "service_role";
grant trigger on table "public"."meme_votes" to "service_role";
grant truncate on table "public"."meme_votes" to "service_role";
grant update on table "public"."meme_votes" to "service_role";

-- Grants para la tabla profiles
grant delete on table "public"."profiles" to "anon";
grant insert on table "public"."profiles" to "anon";
grant references on table "public"."profiles" to "anon";
grant select on table "public"."profiles" to "anon";
grant trigger on table "public"."profiles" to "anon";
grant truncate on table "public"."profiles" to "anon";
grant update on table "public"."profiles" to "anon";

grant delete on table "public"."profiles" to "authenticated";
grant insert on table "public"."profiles" to "authenticated";
grant references on table "public"."profiles" to "authenticated";
grant select on table "public"."profiles" to "authenticated";
grant trigger on table "public"."profiles" to "authenticated";
grant truncate on table "public"."profiles" to "authenticated";
grant update on table "public"."profiles" to "authenticated";

grant delete on table "public"."profiles" to "service_role";
grant insert on table "public"."profiles" to "service_role";
grant references on table "public"."profiles" to "service_role";
grant select on table "public"."profiles" to "service_role";
grant trigger on table "public"."profiles" to "service_role";
grant truncate on table "public"."profiles" to "service_role";
grant update on table "public"."profiles" to "service_role";
