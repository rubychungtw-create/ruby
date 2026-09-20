-- Study Quest focus goal and distraction parking lot.
alter table public.focus_timers
  add column if not exists goal_task_key text;

create table if not exists public.distraction_items (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  content text not null check (char_length(content) between 1 and 120),
  created_at timestamptz not null default now()
);

alter table public.distraction_items enable row level security;
grant select, insert, update, delete on table public.distraction_items to authenticated;

create policy "distraction_items_select_own" on public.distraction_items
  for select to authenticated using (auth.uid() = user_id);
create policy "distraction_items_insert_own" on public.distraction_items
  for insert to authenticated with check (auth.uid() = user_id);
create policy "distraction_items_update_own" on public.distraction_items
  for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "distraction_items_delete_own" on public.distraction_items
  for delete to authenticated using (auth.uid() = user_id);
