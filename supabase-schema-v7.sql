-- Study Quest weekly calendar companion pet cloud save.
create table if not exists public.pet_profiles (
  user_id uuid primary key references auth.users(id) on delete cascade,
  pet_type text not null default 'shiba' check (pet_type in ('shiba', 'cat')),
  pet_name text not null default '小柴' check (char_length(pet_name) between 1 and 16),
  fed_count integer not null default 0 check (fed_count >= 0),
  last_fed_level integer not null default 0 check (last_fed_level >= 0),
  spent_xp integer not null default 0 check (spent_xp >= 0),
  inventory text[] not null default '{}',
  updated_at timestamptz not null default now()
);

alter table public.pet_profiles enable row level security;
grant select, insert, update, delete on table public.pet_profiles to authenticated;

create policy "pet_profiles_select_own" on public.pet_profiles
  for select to authenticated using (auth.uid() = user_id);
create policy "pet_profiles_insert_own" on public.pet_profiles
  for insert to authenticated with check (auth.uid() = user_id);
create policy "pet_profiles_update_own" on public.pet_profiles
  for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "pet_profiles_delete_own" on public.pet_profiles
  for delete to authenticated using (auth.uid() = user_id);

