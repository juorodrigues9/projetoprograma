# Plataforma de Gestão de Pousada (MVP)

Este repositório contém uma proposta inicial para construir uma plataforma web (acesso via HTTPS) para controle operacional e financeiro de uma pousada com **31 quartos**.

## Objetivo

Permitir que equipe e proprietário gerenciem:

- Reservas, check-in e checkout.
- Gastos de consumação e souvenirs por hóspede/quarto.
- Fechamento de conta no checkout.
- Recebimentos com detalhamento por meio de pagamento.
- Status de limpeza e liberação de quarto.
- Acesso por login para funcionários, com trilha de auditoria.

## Escopo inicial (MVP)

1. **Autenticação e perfis**
   - Funcionário (recepção/atendimento).
   - Governança (limpeza).
   - Proprietário/administrador.
2. **Operação da hospedagem**
   - Cadastro de hóspedes.
   - Check-in / checkout.
   - Painel de quartos (31 unidades).
3. **Lançamentos de consumo**
   - Consumação (bar/restaurante).
   - Souvenirs.
   - Itens lançados na conta do quarto.
4. **Financeiro de checkout**
   - Total por hospedagem.
   - Registro de pagamento (PIX, cartão, dinheiro, transferência).
   - Situação da conta (aberta, fechada, estornada).
5. **Limpeza e disponibilidade**
   - Ao checkout: quarto muda para "aguardando limpeza".
   - Equipe marca "limpo" para voltar a "disponível".
6. **Relatórios do proprietário**
   - Recebimentos por período.
   - Recebimentos por forma de pagamento.
   - Taxa de ocupação e quartos indisponíveis.

## Artefatos desta proposta

- Requisitos detalhados: `docs/requisitos.md`
- Modelo de dados (SQL): `docs/modelo-dados.sql`
- Roadmap de implementação: `docs/roadmap-mvp.md`

## Próximo passo recomendado

Com esses artefatos aprovados, o próximo passo é implementar a aplicação com:

- Backend API (ex.: Node.js/NestJS ou Python/FastAPI).
- Frontend web responsivo (ex.: React).
- Banco relacional (PostgreSQL).
- Deploy com HTTPS (ex.: Nginx + certificado TLS) e backups automáticos.

## Próximo passo imediato

Consulte `docs/proximo-passo.md` para um plano objetivo de implementação da Sprint 1 (fluxo completo de operação da pousada em 5-7 dias).
