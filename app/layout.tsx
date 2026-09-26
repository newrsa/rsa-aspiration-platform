import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "RSA Knowledge Intelligence Dashboard",
  description: "A live dashboard for exploring the RSA SCC Neo4j knowledge graph.",
};

export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  return <html lang="en"><body>{children}</body></html>;
}
