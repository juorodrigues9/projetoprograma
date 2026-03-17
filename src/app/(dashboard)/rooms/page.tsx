import { PageTitle } from "@/components/layout/page-title";
import { RoomMap } from "@/components/rooms/room-map";

export default function RoomsPage() {
  return (
    <>
      <PageTitle title="Mapa de Quartos" subtitle="Controle visual dos 31 quartos com status operacional em tempo real." />
      <RoomMap />
    </>
  );
}
