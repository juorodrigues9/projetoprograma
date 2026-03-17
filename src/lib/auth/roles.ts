import { UserRole } from "@/types/domain";

export const roleLabels: Record<UserRole, string> = {
  admin: "Administrador",
  reception: "Recepção",
  housekeeping: "Governança",
  finance: "Financeiro",
  manager: "Gerência"
};

export const rolePermissions: Record<UserRole, string[]> = {
  admin: ["*"],
  reception: ["reservations", "checkin", "checkout", "charges", "payments", "rooms", "guests"],
  housekeeping: ["rooms", "cleaning"],
  finance: ["finance", "payments", "expenses", "reports_financial"],
  manager: ["dashboard", "rooms", "reports", "occupancy"]
};
