import { roomsMock } from "@/lib/services/mock-data";
import { Card } from "@/components/ui/card";
import { RoomStatusBadge } from "./room-status-badge";

export function RoomMap() {
  return (
    <div className="grid grid-cols-1 gap-3 sm:grid-cols-2 xl:grid-cols-4">
      {roomsMock.map((room) => (
        <Card key={room.id} className="space-y-2">
          <div className="flex items-center justify-between">
            <h3 className="font-semibold">Quarto {room.numero}</h3>
            <RoomStatusBadge status={room.status} />
          </div>
          <p className="text-sm text-slate-600">{room.categoria} • {room.capacidade} hóspedes</p>
          <p className="text-sm font-medium">R$ {room.valorDiaria.toFixed(2)}/diária</p>
        </Card>
      ))}
    </div>
  );
}
