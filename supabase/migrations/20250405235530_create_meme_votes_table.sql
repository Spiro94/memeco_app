-- Crear tabla meme_votes
set check_function_bodies = off;

create table "public"."meme_votes" (
    "id" uuid not null default gen_random_uuid(),
    "meme_id" uuid not null,
    "user_id" uuid not null,
    "is_like" boolean not null,
    "created_at" timestamp with time zone default now()
);

-- Habilitar RLS en meme_votes
alter table "public"."meme_votes" enable row level security;

-- Crear índices únicos para meme_votes
CREATE UNIQUE INDEX meme_votes_meme_id_user_id_key ON public.meme_votes USING btree (meme_id, user_id);
CREATE UNIQUE INDEX meme_votes_pkey ON public.meme_votes USING btree (id);

-- Agregar constraints primarios y foráneos
alter table "public"."meme_votes" add constraint "meme_votes_pkey" PRIMARY KEY using index "meme_votes_pkey";
alter table "public"."meme_votes" add constraint "meme_votes_meme_id_fkey" FOREIGN KEY (meme_id) REFERENCES memes(id) ON DELETE CASCADE not valid;
alter table "public"."meme_votes" validate constraint "meme_votes_meme_id_fkey";
alter table "public"."meme_votes" add constraint "meme_votes_meme_id_user_id_key" UNIQUE using index "meme_votes_meme_id_user_id_key";
alter table "public"."meme_votes" add constraint "meme_votes_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;
alter table "public"."meme_votes" validate constraint "meme_votes_user_id_fkey";
