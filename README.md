# PousadaOS — Plataforma web de gestão de pousada

Sistema SaaS para operação completa de pousada (31 quartos no cenário inicial), com foco em reservas, check-in/check-out, consumação, financeiro, governança e visão gerencial.

## Stack

- Next.js 14 (App Router)
- TypeScript
- Tailwind CSS
- shadcn/ui (base de componentes em `src/components/ui`)
- Supabase (Auth + PostgreSQL + Storage)
- React Hook Form + Zod
- Lucide React
- Deploy preparado para Vercel

## Funcionalidades já estruturadas

- Login com Supabase Auth.
- Middleware de proteção de rotas privadas.
- Layout administrativo responsivo (sidebar + topbar).
- Páginas iniciais dos módulos:
  - Dashboard
  - Quartos (mapa funcional com 31 quartos)
  - Reservas
  - Hospedagens
  - Checkout
  - Governança
  - Financeiro
  - Relatórios
  - Usuários
  - Configurações
- Modelagem SQL completa para Supabase em `supabase/migrations`.
- Seeds iniciais com categorias e 31 quartos em `supabase/seed/seed.sql`.

## Estrutura de pastas

```bash
src/
  app/
  components/
  lib/
  hooks/
  schemas/
  types/
  actions/
supabase/
  migrations/
  seed/
```

## Configuração local

### 1) Instalação

```bash
npm install
```

### 2) Variáveis de ambiente

Crie `.env.local` com:

```bash
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
```

### 3) Rodar projeto

```bash
npm run dev
```

Acesse `http://localhost:3000`.

## Supabase

1. Crie o projeto no Supabase.
2. Execute a migration SQL de `supabase/migrations/20260317130000_initial_schema.sql`.
3. Execute `supabase/seed/seed.sql`.
4. Crie usuários em `Auth > Users` e vincule em `profiles/users` conforme seed/documentação.

## Deploy na Vercel

1. Conecte repositório na Vercel.
2. Configure variáveis de ambiente:
   - `NEXT_PUBLIC_SUPABASE_URL`
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY`
3. Build command: `npm run build`
4. Output: padrão Next.js.

## Próximos passos de implementação

1. Persistência real dos módulos (CRUD com Supabase).
2. RBAC por perfil via tabela `profiles` + policies.
3. Fluxo completo de check-in/check-out com regras de negócio obrigatórias.
4. Relatórios com filtros e exportação.
5. Auditoria automática em ações críticas.
