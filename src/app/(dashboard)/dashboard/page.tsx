import { Card } from "@/components/ui/card";
import { PageTitle } from "@/components/layout/page-title";
import { dashboardMetrics } from "@/lib/services/mock-data";

const cards = [
  ["Quartos disponíveis", dashboardMetrics.disponiveis],
  ["Quartos ocupados", dashboardMetrics.ocupados],
  ["Quartos reservados", dashboardMetrics.reservados],
  ["Aguardando limpeza", dashboardMetrics.aguardandoLimpeza],
  ["Em limpeza", dashboardMetrics.emLimpeza],
  ["Check-ins do dia", dashboardMetrics.checkinsHoje],
  ["Check-outs do dia", dashboardMetrics.checkoutsHoje],
  ["Faturamento do dia", `R$ ${dashboardMetrics.faturamentoHoje}`],
  ["Despesas do dia", `R$ ${dashboardMetrics.despesasHoje}`]
];

export default function DashboardPage() {
  return (
    <>
      <PageTitle title="Dashboard" subtitle="Visão geral de ocupação, faturamento e alertas operacionais." />
      <section className="grid gap-3 md:grid-cols-3 xl:grid-cols-4">
        {cards.map(([label, value]) => (
          <Card key={label}>
            <p className="text-sm text-slate-500">{label}</p>
            <p className="text-xl font-bold">{value}</p>
          </Card>
        ))}
      </section>
      <section className="mt-4 grid gap-3 lg:grid-cols-2">
        <Card>
          <h3 className="mb-2 font-semibold">Checkouts pendentes</h3>
          <ul className="space-y-1 text-sm"><li>Quarto 08 - 12:00</li><li>Quarto 14 - 12:30</li><li>Quarto 21 - 13:00</li></ul>
        </Card>
        <Card>
          <h3 className="mb-2 font-semibold">Quartos aguardando limpeza</h3>
          <ul className="space-y-1 text-sm"><li>Quarto 03</li><li>Quarto 12</li><li>Quarto 27</li></ul>
        </Card>
      </section>
    </>
  );
}
