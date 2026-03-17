import { DashboardMetrics, Room, RoomStatus } from "@/types/domain";

const statuses: RoomStatus[] = ["disponivel", "ocupado", "reservado", "aguardando_limpeza", "em_limpeza", "manutencao"];

export const roomsMock: Room[] = Array.from({ length: 31 }, (_, idx) => {
  const i = idx + 1;
  return {
    id: `room-${i}`,
    numero: `${i}`,
    categoria: i % 3 === 0 ? "Luxo" : "Standard",
    capacidade: i % 4 === 0 ? 3 : 2,
    valorDiaria: i % 3 === 0 ? 320 : 240,
    status: statuses[i % statuses.length]
  };
});

export const dashboardMetrics: DashboardMetrics = {
  disponiveis: roomsMock.filter((r) => r.status === "disponivel").length,
  ocupados: roomsMock.filter((r) => r.status === "ocupado").length,
  reservados: roomsMock.filter((r) => r.status === "reservado").length,
  emLimpeza: roomsMock.filter((r) => r.status === "em_limpeza").length,
  aguardandoLimpeza: roomsMock.filter((r) => r.status === "aguardando_limpeza").length,
  checkinsHoje: 9,
  checkoutsHoje: 7,
  faturamentoHoje: 8430,
  despesasHoje: 2380
};
