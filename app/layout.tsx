import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "RSA Career Guide — Knowledge Graph Assistant",
  description: "An evidence-backed conversational career guide powered by the RSA SCC Neo4j knowledge graph.",
};

export default function RootLayout({ children }: Readonly<{ children: React.ReactNode }>) {
  return <html lang="en"><body>{children}</body></html>;
}
