-- Modelo inicial de banco de dados para MVP de gestão de pousada
-- Banco alvo: PostgreSQL

CREATE TABLE tenants (
  id BIGSERIAL PRIMARY KEY,
  nome VARCHAR(120) NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE users (
  id BIGSERIAL PRIMARY KEY,
  tenant_id BIGINT NOT NULL REFERENCES tenants(id),
  nome VARCHAR(120) NOT NULL,
  email VARCHAR(160) UNIQUE,
  username VARCHAR(80) NOT NULL,
  password_hash TEXT NOT NULL,
  role VARCHAR(30) NOT NULL CHECK (role IN ('atendimento', 'limpeza', 'admin')),
  ativo BOOLEAN NOT NULL DEFAULT TRUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE (tenant_id, username)
);

CREATE TABLE rooms (
  id BIGSERIAL PRIMARY KEY,
  tenant_id BIGINT NOT NULL REFERENCES tenants(id),
  numero VARCHAR(10) NOT NULL,
  tipo VARCHAR(50),
  capacidade INT,
  status VARCHAR(40) NOT NULL CHECK (status IN (
    'disponivel', 'ocupado', 'aguardando_limpeza', 'limpeza_em_andamento', 'bloqueado'
  )),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE (tenant_id, numero)
);

CREATE TABLE guests (
  id BIGSERIAL PRIMARY KEY,
  tenant_id BIGINT NOT NULL REFERENCES tenants(id),
  nome VARCHAR(160) NOT NULL,
  documento VARCHAR(40),
  telefone VARCHAR(30),
  email VARCHAR(160),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE stays (
  id BIGSERIAL PRIMARY KEY,
  tenant_id BIGINT NOT NULL REFERENCES tenants(id),
  room_id BIGINT NOT NULL REFERENCES rooms(id),
  guest_id BIGINT NOT NULL REFERENCES guests(id),
  checkin_at TIMESTAMPTZ NOT NULL,
  checkout_previsao_at TIMESTAMPTZ,
  checkout_at TIMESTAMPTZ,
  diaria_valor NUMERIC(12,2) NOT NULL,
  status VARCHAR(20) NOT NULL CHECK (status IN ('aberta', 'fechada', 'cancelada')),
  created_by BIGINT REFERENCES users(id),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE products (
  id BIGSERIAL PRIMARY KEY,
  tenant_id BIGINT NOT NULL REFERENCES tenants(id),
  nome VARCHAR(120) NOT NULL,
  categoria VARCHAR(30) NOT NULL CHECK (categoria IN ('consumacao', 'souvenir')),
  preco_base NUMERIC(12,2) NOT NULL,
  ativo BOOLEAN NOT NULL DEFAULT TRUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE stay_items (
  id BIGSERIAL PRIMARY KEY,
  tenant_id BIGINT NOT NULL REFERENCES tenants(id),
  stay_id BIGINT NOT NULL REFERENCES stays(id),
  product_id BIGINT REFERENCES products(id),
  descricao VARCHAR(160) NOT NULL,
  categoria VARCHAR(30) NOT NULL CHECK (categoria IN ('diaria', 'consumacao', 'souvenir', 'ajuste')),
  quantidade NUMERIC(10,2) NOT NULL DEFAULT 1,
  valor_unitario NUMERIC(12,2) NOT NULL,
  valor_total NUMERIC(12,2) GENERATED ALWAYS AS (quantidade * valor_unitario) STORED,
  estornado BOOLEAN NOT NULL DEFAULT FALSE,
  motivo_estorno TEXT,
  lancado_por BIGINT REFERENCES users(id),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE payments (
  id BIGSERIAL PRIMARY KEY,
  tenant_id BIGINT NOT NULL REFERENCES tenants(id),
  stay_id BIGINT NOT NULL REFERENCES stays(id),
  valor NUMERIC(12,2) NOT NULL,
  metodo VARCHAR(30) NOT NULL CHECK (metodo IN ('pix', 'cartao_credito', 'cartao_debito', 'dinheiro', 'transferencia')),
  status VARCHAR(20) NOT NULL CHECK (status IN ('confirmado', 'estornado', 'pendente')),
  recebido_por BIGINT REFERENCES users(id),
  observacao TEXT,
  paid_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE room_cleaning_logs (
  id BIGSERIAL PRIMARY KEY,
  tenant_id BIGINT NOT NULL REFERENCES tenants(id),
  room_id BIGINT NOT NULL REFERENCES rooms(id),
  stay_id BIGINT REFERENCES stays(id),
  status VARCHAR(30) NOT NULL CHECK (status IN ('aguardando_limpeza', 'limpeza_em_andamento', 'limpo')),
  updated_by BIGINT REFERENCES users(id),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  observacao TEXT
);

CREATE TABLE audit_logs (
  id BIGSERIAL PRIMARY KEY,
  tenant_id BIGINT NOT NULL REFERENCES tenants(id),
  user_id BIGINT REFERENCES users(id),
  entidade VARCHAR(80) NOT NULL,
  entidade_id BIGINT,
  acao VARCHAR(60) NOT NULL,
  detalhe JSONB,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Índices úteis
CREATE INDEX idx_stays_tenant_status ON stays(tenant_id, status);
CREATE INDEX idx_rooms_tenant_status ON rooms(tenant_id, status);
CREATE INDEX idx_payments_tenant_paid_at ON payments(tenant_id, paid_at);
CREATE INDEX idx_stay_items_tenant_stay ON stay_items(tenant_id, stay_id);
CREATE INDEX idx_audit_logs_tenant_created_at ON audit_logs(tenant_id, created_at);
