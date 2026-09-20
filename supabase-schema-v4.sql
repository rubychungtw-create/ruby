-- Study Quest daily reflections and private note-photo storage.
create table if not exists public.task_reflections (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  task_key text not null,
  task_date date not null,
  task_title text not null,
  subject text not null,
  learned_text text not null default '',
  reflection_text text not null default '',
  photo_path text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (user_id, task_key)
);

alter table public.task_reflections enable row level security;
grant select, insert, update, delete on table public.task_reflections to authenticated;

create policy "task_reflections_select_own" on public.task_reflections for select to authenticated using (auth.uid() = user_id);
create policy "task_reflections_insert_own" on public.task_reflections for insert to authenticated with check (auth.uid() = user_id);
create policy "task_reflections_update_own" on public.task_reflections for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "task_reflections_delete_own" on public.task_reflections for delete to authenticated using (auth.uid() = user_id);

insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('study-notes', 'study-notes', false, 8388608, array['image/jpeg','image/png','image/webp'])
on conflict (id) do update set public=false, file_size_limit=8388608, allowed_mime_types=array['image/jpeg','image/png','image/webp'];

create policy "study_notes_select_own" on storage.objects for select to authenticated
using (bucket_id = 'study-notes' and (storage.foldername(name))[1] = auth.uid()::text);
create policy "study_notes_insert_own" on storage.objects for insert to authenticated
with check (bucket_id = 'study-notes' and (storage.foldername(name))[1] = auth.uid()::text);
