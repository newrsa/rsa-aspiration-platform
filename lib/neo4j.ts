export type GraphRow = Record<string, unknown>;

export async function runGraphQuery(statement: string, parameters: Record<string, unknown> = {}) {
  if (!isReadOnly(statement)) throw new Error("Only approved read-only graph queries are permitted.");

  const base = (process.env.NEO4J_HTTP_URL || "http://127.0.0.1:7474").replace(/\/$/, "");
  const database = encodeURIComponent(process.env.NEO4J_DATABASE || "neo4j");
  const username = process.env.NEO4J_USERNAME || "neo4j";
  const password = process.env.NEO4J_PASSWORD;
  if (!password) throw new Error("NEO4J_PASSWORD is not configured on the application server.");

  const auth = Buffer.from(`${username}:${password}`).toString("base64");
  const response = await fetch(`${base}/db/${database}/tx/commit`, {
    method: "POST",
    headers: { "Content-Type": "application/json", Authorization: `Basic ${auth}` },
    body: JSON.stringify({ statements: [{ statement, parameters, resultDataContents: ["row"] }] }),
    cache: "no-store",
  });
  if (!response.ok) throw new Error(response.status === 401 ? "Neo4j rejected the configured credentials." : `Neo4j returned HTTP ${response.status}.`);

  const payload = await response.json() as { errors?: { message?: string }[]; results?: { columns: string[]; data: { row: unknown[] }[] }[] };
  if (payload.errors?.length) throw new Error(payload.errors[0].message || "Neo4j query failed.");
  const result = payload.results?.[0] || { columns: [], data: [] };
  const rows = result.data.map(item => Object.fromEntries(result.columns.map((column, index) => [column, item.row[index]])));
  return { columns: result.columns, rows };
}

function isReadOnly(cypher: string) {
  const forbidden = /\b(CREATE|MERGE|DELETE|DETACH|SET|REMOVE|DROP|ALTER|GRANT|DENY|REVOKE|LOAD\s+CSV|CALL\s+dbms|CALL\s+apoc)\b/i;
  return typeof cypher === "string" && cypher.trim().length > 0 && !forbidden.test(cypher);
}

export function friendlyGraphError(error: unknown) {
  const message = error instanceof Error ? error.message : "Unable to query the knowledge graph.";
  if (/fetch failed|ECONNREFUSED|network/i.test(message)) return "The knowledge graph is offline. Start Neo4j Desktop and confirm the application environment settings.";
  return message;
}
