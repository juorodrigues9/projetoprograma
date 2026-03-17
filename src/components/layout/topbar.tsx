import { Bell, LogOut } from "lucide-react";
import { Button } from "@/components/ui/button";

export function Topbar() {
  return (
    <header className="flex items-center justify-between border-b bg-white px-4 py-3">
      <div>
        <p className="text-sm text-slate-500">Operação em tempo real</p>
        <h2 className="font-semibold">Painel da pousada</h2>
      </div>
      <div className="flex items-center gap-2">
        <Button variant="outline" size="sm"><Bell className="mr-1 h-4 w-4" /> Alertas</Button>
        <Button variant="secondary" size="sm"><LogOut className="mr-1 h-4 w-4" /> Sair</Button>
      </div>
    </header>
  );
}
