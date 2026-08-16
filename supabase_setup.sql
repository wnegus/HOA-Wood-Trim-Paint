create table public.trim_votes (
  id uuid primary key default gen_random_uuid(),
  color_id text not null,
  points int not null,
  voter_name text,
  created_at timestamptz not null default now()
);

alter table public.trim_votes enable row level security;

create policy "Public can read trim votes" on public.trim_votes
  for select using (true);

create policy "Public can insert trim votes" on public.trim_votes
  for insert with check (true);

create policy "Public can delete trim votes" on public.trim_votes
  for delete using (true);
