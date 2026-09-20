-- Study Quest task editing support.
-- Run once in the connected Supabase project's SQL editor.
alter table public.task_overrides
  add column if not exists subject text,
  add column if not exists task_name text,
  add column if not exists task_time text,
  add column if not exists clear_condition text,
  add column if not exists xp integer;
