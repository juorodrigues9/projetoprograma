-- Pousada SaaS - schema inicial
create extension if not exists "pgcrypto";

create type user_role as enum ('admin','reception','housekeeping','finance','manager');
create type room_status as enum ('disponivel','reservado','ocupado','aguardando_limpeza','em_limpeza','limpo','bloqueado','manutencao');
create type reservation_status as enum ('pendente','confirmada','cancelada','convertida','no_show');
create type stay_status as enum ('ativa','checkout_pendente','encerrada');
create type charge_status as enum ('ativo','cancelado','faturado');
create type payment_method as enum ('dinheiro','pix','cartao_debito','cartao_credito','transferencia','faturado');

create table if not exists profiles (
  id uuid primary key references auth.users(id),
  role user_role not null,
  full_name text not null,
  phone text,
  created_at timestamptz not null default now()
);

create table if not exists users (
  id uuid primary key default gen_random_uuid(),
  profile_id uuid not null references profiles(id),
  email text not null unique,
  is_active boolean not null default true,
  created_at timestamptz not null default now()
);

create table if not exists employees (
  id uuid primary key default gen_random_uuid(),
  profile_id uuid not null references profiles(id),
  code text unique,
  hire_date date,
  notes text
);

create table if not exists inn_settings (
  id uuid primary key default gen_random_uuid(),
  inn_name text not null,
  timezone text not null default 'America/Sao_Paulo',
  checkout_time time not null default '12:00',
  currency text not null default 'BRL',
  created_at timestamptz not null default now()
);

create table if not exists room_categories (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  default_rate numeric(10,2) not null
);

create table if not exists rooms (
  id uuid primary key default gen_random_uuid(),
  number text not null unique,
  room_category_id uuid not null references room_categories(id),
  capacity int not null,
  daily_rate numeric(10,2) not null,
  description text,
  notes text,
  status room_status not null default 'disponivel',
  updated_at timestamptz not null default now()
);

create table if not exists guests (
  id uuid primary key default gen_random_uuid(),
  full_name text not null,
  document text,
  phone text,
  email text,
  city text,
  car_plate text,
  created_at timestamptz not null default now()
);

create table if not exists reservations (
  id uuid primary key default gen_random_uuid(),
  guest_id uuid not null references guests(id),
  room_id uuid references rooms(id),
  status reservation_status not null default 'pendente',
  checkin_expected date not null,
  checkout_expected date not null,
  guests_count int not null,
  agreed_rate numeric(10,2) not null,
  source text not null,
  notes text,
  created_by uuid references profiles(id),
  created_at timestamptz not null default now()
);

create table if not exists reservation_guests (
  id uuid primary key default gen_random_uuid(),
  reservation_id uuid not null references reservations(id) on delete cascade,
  guest_name text not null,
  document text
);

create table if not exists stays (
  id uuid primary key default gen_random_uuid(),
  reservation_id uuid references reservations(id),
  guest_id uuid not null references guests(id),
  room_id uuid not null references rooms(id),
  status stay_status not null default 'ativa',
  checkin_at timestamptz not null,
  checkout_at timestamptz,
  daily_rate numeric(10,2) not null,
  nights int not null default 1,
  pending_reason text,
  created_by uuid references profiles(id)
);

create table if not exists product_categories (
  id uuid primary key default gen_random_uuid(),
  name text not null unique
);

create table if not exists products (
  id uuid primary key default gen_random_uuid(),
  category_id uuid not null references product_categories(id),
  name text not null,
  price numeric(10,2) not null,
  active boolean not null default true,
  stock int,
  notes text
);

create table if not exists stay_charges (
  id uuid primary key default gen_random_uuid(),
  stay_id uuid not null references stays(id) on delete cascade,
  product_id uuid references products(id),
  description text not null,
  category text not null,
  quantity numeric(10,2) not null,
  unit_value numeric(10,2) not null,
  total_value numeric(10,2) generated always as (quantity * unit_value) stored,
  status charge_status not null default 'ativo',
  cancel_reason text,
  created_by uuid references profiles(id),
  created_at timestamptz not null default now()
);

create table if not exists payments (
  id uuid primary key default gen_random_uuid(),
  stay_id uuid not null references stays(id),
  amount numeric(10,2) not null,
  method payment_method not null,
  paid_at timestamptz not null default now(),
  notes text,
  created_by uuid references profiles(id)
);

create table if not exists expense_categories (
  id uuid primary key default gen_random_uuid(),
  name text not null unique
);

create table if not exists expenses (
  id uuid primary key default gen_random_uuid(),
  category_id uuid not null references expense_categories(id),
  description text not null,
  amount numeric(10,2) not null,
  payment_method payment_method not null,
  incurred_on date not null,
  receipt_url text,
  notes text,
  created_by uuid references profiles(id)
);

create table if not exists cleaning_records (
  id uuid primary key default gen_random_uuid(),
  room_id uuid not null references rooms(id),
  stay_id uuid references stays(id),
  status room_status not null,
  started_at timestamptz,
  ended_at timestamptz,
  note text,
  employee_id uuid references employees(id),
  created_at timestamptz not null default now()
);

create table if not exists audit_logs (
  id bigserial primary key,
  actor_profile_id uuid references profiles(id),
  action text not null,
  entity text not null,
  entity_id text,
  details jsonb,
  created_at timestamptz not null default now()
);

create index if not exists idx_rooms_status on rooms(status);
create index if not exists idx_reservation_dates on reservations(checkin_expected, checkout_expected);
create index if not exists idx_stays_status on stays(status);
create index if not exists idx_stay_charges_stay on stay_charges(stay_id);
create index if not exists idx_payments_paid_at on payments(paid_at);
create index if not exists idx_expenses_incurred_on on expenses(incurred_on);
