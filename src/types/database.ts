export type Json = string | number | boolean | null | { [key: string]: Json | undefined } | Json[];

export interface AuditLog {
  id: number;
  action: string;
  entity: string;
  entity_id: string | null;
  details: Json | null;
  created_at: string;
}

export interface Payment {
  id: string;
  stay_id: string;
  amount: number;
  method: "dinheiro" | "pix" | "cartao_debito" | "cartao_credito" | "transferencia" | "faturado";
  paid_at: string;
}
