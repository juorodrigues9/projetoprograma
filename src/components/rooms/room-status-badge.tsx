import { RoomStatus } from "@/types/domain";
import { Badge } from "@/components/ui/badge";

const style: Record<RoomStatus, string> = {
  disponivel: "bg-green-100 text-green-700",
  reservado: "bg-yellow-100 text-yellow-700",
  ocupado: "bg-red-100 text-red-700",
  aguardando_limpeza: "bg-blue-100 text-blue-700",
  em_limpeza: "bg-cyan-100 text-cyan-700",
  limpo: "bg-emerald-100 text-emerald-700",
  bloqueado: "bg-slate-200 text-slate-700",
  manutencao: "bg-orange-100 text-orange-700"
};

export function RoomStatusBadge({ status }: { status: RoomStatus }) {
  return <Badge className={style[status]}>{status.replaceAll("_", " ")}</Badge>;
}
