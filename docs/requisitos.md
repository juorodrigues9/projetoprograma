# Requisitos Funcionais e Não Funcionais

## 1) Perfis e acesso

### RF-01 — Login de funcionários
- Usuário e senha para cada colaborador.
- Sessão com expiração e logout.
- Bloqueio de usuário inativo/desligado.

### RF-02 — Controle por perfil
- **Atendimento/Recepção:** check-in/checkout, lançamentos, recebimentos.
- **Limpeza:** visualizar quartos em limpeza e marcar quarto limpo.
- **Proprietário/Admin:** acesso total, relatórios e cadastros.

### RF-03 — Auditoria
- Registro de ações críticas: check-in, checkout, desconto, estorno, alteração de status de quarto.
- Quem fez, quando fez, e qual alteração foi feita.

## 2) Quartos e hospedagem

### RF-04 — Cadastro de quartos
- 31 quartos com número, tipo, capacidade e status.
- Status possíveis: disponível, ocupado, aguardando_limpeza, limpeza_em_andamento, bloqueado.

### RF-05 — Check-in
- Vincular hóspede ao quarto.
- Registrar data/hora de entrada e previsão de saída.

### RF-06 — Checkout
- Exibir resumo da conta (diárias + consumos + souvenirs + ajustes).
- Confirmar pagamento.
- Alterar quarto para aguardando limpeza.

## 3) Consumo e souvenirs

### RF-07 — Lançamento de itens
- Lançar item na conta da hospedagem com quantidade, preço unitário e observação.
- Categorias iniciais: consumação, souvenir.

### RF-08 — Correções e cancelamentos
- Estorno/cancelamento de item com motivo obrigatório.
- Ação auditada.

## 4) Recebimentos

### RF-09 — Registro de pagamento
- Formas de pagamento: pix, cartão de crédito, cartão de débito, dinheiro, transferência.
- Permitir pagamento misto (mais de uma forma no mesmo checkout).

### RF-10 — Fechamento de caixa (fase 2)
- Consolidado diário por operador.
- Conferência entre valores lançados e recebidos.

## 5) Limpeza e disponibilidade

### RF-11 — Fluxo de limpeza pós-checkout
- Checkout move quarto para aguardando limpeza.
- Equipe de limpeza marca início/fim da limpeza.
- Status final: disponível.

### RF-12 — Painel operacional
- Visualização rápida dos 31 quartos por cor/status.

## 6) Relatórios

### RF-13 — Painel do proprietário
- Recebimentos por período.
- Recebimentos por forma de pagamento.
- Ocupação por período.
- Quartos com maior consumo.

### RF-14 — Exportação
- Exportar relatórios em CSV.

## 7) Requisitos não funcionais

### RNF-01 — Segurança
- Acesso via HTTPS obrigatório.
- Senhas com hash seguro (Argon2 ou bcrypt).
- Política de senha mínima e troca periódica opcional.

### RNF-02 — Disponibilidade
- Backup diário automático.
- Plano de restauração testado.

### RNF-03 — Performance
- Operações comuns (abrir painel, lançar item, checkout) em até 2 segundos na rede local/boa internet.

### RNF-04 — Conformidade e privacidade
- Guardar somente dados necessários do hóspede.
- Política de retenção e controle de acesso a dados sensíveis.

### RNF-05 — Escalabilidade
- Estrutura preparada para múltiplas pousadas no futuro (campo `tenant_id`).
