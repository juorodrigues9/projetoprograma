"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { BarChart3, BedDouble, CalendarRange, ClipboardList, House, Receipt, Settings, Sparkles, Users } from "lucide-react";
import { cn } from "@/lib/utils";

const links = [
  { href: "/dashboard", label: "Dashboard", icon: House },
  { href: "/rooms", label: "Quartos", icon: BedDouble },
  { href: "/reservations", label: "Reservas", icon: CalendarRange },
  { href: "/stays", label: "Hospedagens", icon: ClipboardList },
  { href: "/checkout", label: "Checkout", icon: Receipt },
  { href: "/housekeeping", label: "Governança", icon: Sparkles },
  { href: "/finance", label: "Financeiro", icon: BarChart3 },
  { href: "/reports", label: "Relatórios", icon: BarChart3 },
  { href: "/users", label: "Usuários", icon: Users },
  { href: "/settings", label: "Configurações", icon: Settings }
];

export function Sidebar() {
  const pathname = usePathname();

  return (
    <aside className="w-full border-r bg-white p-3 lg:w-64">
      <h1 className="mb-4 text-xl font-bold">PousadaOS</h1>
      <nav className="grid gap-1">
        {links.map((link) => {
          const Icon = link.icon;
          return (
            <Link key={link.href} href={link.href} className={cn("flex items-center gap-2 rounded-md px-3 py-2 text-sm", pathname === link.href ? "bg-blue-50 text-blue-700" : "text-slate-700 hover:bg-slate-100") }>
              <Icon className="h-4 w-4" /> {link.label}
            </Link>
          );
        })}
      </nav>
    </aside>
  );
}
