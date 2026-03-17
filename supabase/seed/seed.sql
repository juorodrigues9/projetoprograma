insert into inn_settings (inn_name) values ('Pousada Exemplo') on conflict do nothing;

insert into room_categories (name, default_rate) values
('Standard',240),('Luxo',320),('Família',390)
on conflict (name) do nothing;

insert into product_categories (name) values
('frigobar'),('bebidas'),('alimentação'),('souvenirs'),('lavanderia'),('taxa extra'),('desconto'),('cortesia'),('outros')
on conflict (name) do nothing;

insert into expense_categories (name) values
('manutenção'),('insumos'),('lavanderia'),('compras'),('fornecedores'),('folha'),('utilidades'),('outros')
on conflict (name) do nothing;

insert into rooms (number, room_category_id, capacity, daily_rate, status)
select
  lpad(gs::text,2,'0') as number,
  (select id from room_categories order by name limit 1 offset (gs % 3)),
  case when gs % 4 = 0 then 3 else 2 end,
  case when gs % 3 = 0 then 320 else 240 end,
  case when gs % 7 = 0 then 'ocupado'::room_status when gs % 5 = 0 then 'reservado'::room_status else 'disponivel'::room_status end
from generate_series(1,31) as gs
on conflict (number) do nothing;

-- Usuários de teste (criar usuários em auth.users no painel Supabase e depois vincular aqui)
-- Perfis sugeridos: admin@pousada.com, recepcao@pousada.com, governanca@pousada.com, financeiro@pousada.com, gerencia@pousada.com
