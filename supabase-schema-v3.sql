-- Study Quest durable mission countdown timer.
create table if not exists public.focus_timers (
  user_id uuid primary key references auth.users(id) on delete cascade,
  phase text not null default 'work' check (phase in ('work', 'short_break', 'long_break')),
  round_count integer not null default 0 check (round_count between 0 and 3),
  running boolean not null default false,
  ends_at timestamptz,
  remaining_seconds integer not null default 2700 check (remaining_seconds between 0 and 7200),
  updated_at timestamptz not null default now()
);

alter table public.focus_timers enable row level security;

drop policy if exists "focus_timers_select_own" on public.focus_timers;
create policy "focus_timers_select_own" on public.focus_timers for select to authenticated using (auth.uid() = user_id);
drop policy if exists "focus_timers_insert_own" on public.focus_timers;
create policy "focus_timers_insert_own" on public.focus_timers for insert to authenticated with check (auth.uid() = user_id);
drop policy if exists "focus_timers_update_own" on public.focus_timers;
create policy "focus_timers_update_own" on public.focus_timers for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
drop policy if exists "focus_timers_delete_own" on public.focus_timers;
create policy "focus_timers_delete_own" on public.focus_timers for delete to authenticated using (auth.uid() = user_id);
