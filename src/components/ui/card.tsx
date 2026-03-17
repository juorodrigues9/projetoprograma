import { cn } from "@/lib/utils";
import { HTMLAttributes } from "react";

export const Card = ({ className, ...props }: HTMLAttributes<HTMLDivElement>) => (
  <div className={cn("rounded-xl border border-border bg-card p-4 shadow-sm", className)} {...props} />
);
