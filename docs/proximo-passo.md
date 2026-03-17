# Próximo passo (imediato): iniciar o MVP técnico

Como você já validou a visão funcional, o próximo passo é **subir uma primeira versão utilizável** para a recepção e para o proprietário testarem o fluxo completo.

## 1) Definição técnica (1 dia)

Escolha stack e padrão de deploy:

- Backend: **FastAPI** (Python) ou **NestJS** (Node).
- Frontend: **React**.
- Banco: **PostgreSQL**.
- Infra: Docker + Nginx com HTTPS.

> Recomendação prática: começar com FastAPI + React para acelerar CRUD + autenticação.

## 2) Entregável da Sprint 1 (5 a 7 dias)

Implementar somente o fluxo crítico ponta a ponta:

1. Login de funcionário.
2. Painel com 31 quartos e status.
3. Check-in em quarto disponível.
4. Lançamento de consumação/souvenir na conta.
5. Checkout com pagamento (PIX/dinheiro/cartão).
6. Mudança automática para `aguardando_limpeza`.
7. Usuário da limpeza marca `limpo` e quarto volta a `disponivel`.
8. Relatório simples diário de recebimentos por método de pagamento.

## 3) Backlog técnico mínimo

### Backend
- [ ] Autenticação (JWT + hash bcrypt/argon2).
- [ ] RBAC por perfil (`atendimento`, `limpeza`, `admin`).
- [ ] APIs: quartos, hóspedes, hospedagens, itens, pagamentos, limpeza.
- [ ] Auditoria das ações críticas.

### Frontend
- [ ] Tela de login.
- [ ] Dashboard de quartos (cards por status).
- [ ] Tela de hospedagem/consumos.
- [ ] Tela de checkout (pagamento misto).
- [ ] Tela de limpeza.
- [ ] Relatório básico do proprietário.

### Banco
- [ ] Aplicar `docs/modelo-dados.sql` via migrations.
- [ ] Seed inicial de 31 quartos.
- [ ] Usuários iniciais por perfil.

## 4) Critério para considerar “pronto para piloto”

- Fluxo completo (check-in → consumo → checkout → limpeza → disponível) funcionando sem intervenção manual no banco.
- Permissões separadas por perfil.
- Histórico de ações críticas disponível para auditoria.
- Relatório diário de recebimentos validado pelo proprietário.

## 5) Decisões que você precisa tomar agora

1. Qual stack deseja usar (FastAPI ou NestJS)?
2. O login será por usuário/senha local (MVP) ou com integração externa?
3. Quais dados do hóspede são obrigatórios no check-in?
4. Quais métodos de pagamento entram no MVP do checkout?

Com essas 4 decisões, a implementação já pode começar imediatamente.
