-- Study Quest homework cloud sync, one-click imports, and mistake revival.
alter table public.custom_tasks
  add column if not exists source_type text,
  add column if not exists source_key text,
  add column if not exists source_date date,
  add column if not exists source_category text;

create unique index if not exists custom_tasks_user_source_idx
  on public.custom_tasks (user_id, source_type, source_key)
  where source_key is not null;

create table if not exists public.homework_progress (
  user_id uuid not null references auth.users(id) on delete cascade,
  source_key text not null,
  source_date date not null,
  category text not null,
  subject text not null,
  title text not null,
  completed boolean not null default false,
  updated_at timestamptz not null default now(),
  primary key (user_id, source_key)
);

create table if not exists public.review_revives (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  source_task_key text not null,
  source_title text not null,
  subject text not null,
  review_date date not null,
  stage integer not null check (stage between 1 and 3),
  completed boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (user_id, source_task_key, stage)
);

create index if not exists review_revives_user_date_idx
  on public.review_revives (user_id, review_date, completed);

alter table public.homework_progress enable row level security;
alter table public.review_revives enable row level security;
grant select, insert, update, delete on table public.homework_progress to authenticated;
grant select, insert, update, delete on table public.review_revives to authenticated;

drop policy if exists "homework_progress_select_own" on public.homework_progress;
create policy "homework_progress_select_own" on public.homework_progress for select to authenticated using (auth.uid() = user_id);
drop policy if exists "homework_progress_insert_own" on public.homework_progress;
create policy "homework_progress_insert_own" on public.homework_progress for insert to authenticated with check (auth.uid() = user_id);
drop policy if exists "homework_progress_update_own" on public.homework_progress;
create policy "homework_progress_update_own" on public.homework_progress for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
drop policy if exists "homework_progress_delete_own" on public.homework_progress;
create policy "homework_progress_delete_own" on public.homework_progress for delete to authenticated using (auth.uid() = user_id);

drop policy if exists "review_revives_select_own" on public.review_revives;
create policy "review_revives_select_own" on public.review_revives for select to authenticated using (auth.uid() = user_id);
drop policy if exists "review_revives_insert_own" on public.review_revives;
create policy "review_revives_insert_own" on public.review_revives for insert to authenticated with check (auth.uid() = user_id);
drop policy if exists "review_revives_update_own" on public.review_revives;
create policy "review_revives_update_own" on public.review_revives for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
drop policy if exists "review_revives_delete_own" on public.review_revives;
create policy "review_revives_delete_own" on public.review_revives for delete to authenticated using (auth.uid() = user_id);

