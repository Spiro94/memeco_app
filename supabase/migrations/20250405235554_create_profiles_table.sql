-- Crear tabla profiles
create table "public"."profiles" (
    "id" uuid not null default auth.uid(),
    "created_at" timestamp with time zone not null default now(),
    "username" text not null,
    "email" text not null,
    "profile_picture" text
);

-- Habilitar RLS en profiles
alter table "public"."profiles" enable row level security;

-- Crear índice único para profiles
CREATE UNIQUE INDEX profiles_pkey ON public.profiles USING btree (id);

-- Agregar constraint primario y foráneo en profiles
alter table "public"."profiles" add constraint "profiles_pkey" PRIMARY KEY using index "profiles_pkey";
alter table "public"."profiles" add constraint "profiles_id_fkey" FOREIGN KEY (id) REFERENCES auth.users(id) not valid;
alter table "public"."profiles" validate constraint "profiles_id_fkey";
