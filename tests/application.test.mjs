import assert from "node:assert/strict";
import { readFile } from "node:fs/promises";
import test from "node:test";

test("ships the aspirant chatbot and grounded API", async () => {
  const [page, ask, nlp, layout] = await Promise.all([
    readFile(new URL("../app/page.tsx", import.meta.url), "utf8"),
    readFile(new URL("../app/api/ask/route.ts", import.meta.url), "utf8"),
    readFile(new URL("../lib/nlp.ts", import.meta.url), "utf8"),
    readFile(new URL("../app/layout.tsx", import.meta.url), "utf8"),
  ]);
  assert.match(page, /RSA Career Guide/);
  assert.match(page, /\/api\/ask/);
  assert.match(ask, /understandQuestion/);
  assert.match(ask, /grounded:\s*true/);
  assert.match(nlp, /approved read-only|career_discovery/i);
  assert.match(layout, /Knowledge Graph Assistant/);
});

test("keeps database credentials server-side", async () => {
  const [page, graph, ignore] = await Promise.all([
    readFile(new URL("../app/page.tsx", import.meta.url), "utf8"),
    readFile(new URL("../lib/neo4j.ts", import.meta.url), "utf8"),
    readFile(new URL("../.gitignore", import.meta.url), "utf8"),
  ]);
  assert.doesNotMatch(page, /NEO4J_PASSWORD|connection\.password/);
  assert.match(graph, /process\.env\.NEO4J_PASSWORD/);
  assert.match(ignore, /\.env\*/);
});
