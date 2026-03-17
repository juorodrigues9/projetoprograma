export type UserRole = "admin" | "reception" | "housekeeping" | "finance" | "manager";
export type RoomStatus = "disponivel" | "reservado" | "ocupado" | "aguardando_limpeza" | "em_limpeza" | "limpo" | "bloqueado" | "manutencao";

export type Room = {
  id: string;
  numero: string;
  categoria: string;
  capacidade: number;
  valorDiaria: number;
  status: RoomStatus;
};

export type DashboardMetrics = {
  disponiveis: number;
  ocupados: number;
  reservados: number;
  emLimpeza: number;
  aguardandoLimpeza: number;
  checkinsHoje: number;
  checkoutsHoje: number;
  faturamentoHoje: number;
  despesasHoje: number;
};
