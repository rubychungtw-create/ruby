-- Study Quest weekly exam boss clears and score history.
create table if not exists public.exam_results (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  exam_key text not null,
  exam_date date not null,
  subject text not null check (char_length(subject) between 1 and 40),
  scope text not null check (char_length(scope) between 1 and 300),
  score numeric(5,1) not null check (score >= 0 and score <= 100),
  note text not null default '' check (char_length(note) <= 240),
  completed_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (user_id, exam_key)
);

create index if not exists exam_results_user_subject_date_idx
  on public.exam_results (user_id, subject, exam_date);

alter table public.exam_results enable row level security;
grant select, insert, update, delete on table public.exam_results to authenticated;

create policy "exam_results_select_own" on public.exam_results
  for select to authenticated using (auth.uid() = user_id);
create policy "exam_results_insert_own" on public.exam_results
  for insert to authenticated with check (auth.uid() = user_id);
create policy "exam_results_update_own" on public.exam_results
  for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "exam_results_delete_own" on public.exam_results
  for delete to authenticated using (auth.uid() = user_id);

