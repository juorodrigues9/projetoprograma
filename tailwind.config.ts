import type { Config } from "tailwindcss";

const config: Config = {
  darkMode: ["class"],
  content: ["./src/**/*.{ts,tsx}"],
  theme: {
    extend: {
      colors: {
        border: "hsl(214 32% 91%)",
        input: "hsl(214 32% 91%)",
        ring: "hsl(222.2 84% 4.9%)",
        background: "hsl(210 20% 98%)",
        foreground: "hsl(222.2 84% 4.9%)",
        primary: { DEFAULT: "hsl(221 83% 53%)", foreground: "#fff" },
        card: { DEFAULT: "#fff", foreground: "hsl(222.2 84% 4.9%)" }
      }
    }
  },
  plugins: []
};

export default config;
