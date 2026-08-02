import { NextRequest, NextResponse } from "next/server";
import { friendlyGraphError, GraphRow, runGraphQuery } from "../../../lib/neo4j";
import { understandQuestion } from "../../../lib/nlp";

export async function POST(request: NextRequest) {
  try {
    const body = await request.json() as { question?: string };
    const question = String(body.question || "").trim();
    if (question.length < 3 || question.length > 600) return NextResponse.json({ error: "Please ask a question between 3 and 600 characters." }, { status: 400 });
    const plan = understandQuestion(question);
    const result = await runGraphQuery(plan.cypher, plan.parameters);
    return NextResponse.json({
      question, intent: plan.intent, interpretation: plan.interpretation,
      answer: composeAnswer(plan.title, result.rows), columns: result.columns,
      results: result.rows, result_count: result.rows.length,
      graph: toGraph(result.rows), grounded: true,
    });
  } catch (error) {
    return NextResponse.json({ error: friendlyGraphError(error) }, { status: 500 });
  }
}

function composeAnswer(title: string, rows: GraphRow[]) {
  if (!rows.length) return `I could not find a sufficiently close verified match for “${title}”. Try naming a career, domain, subject, or universe more specifically.`;
  const names = rows.slice(0, 5).map(row => String(row.career || row.pathway || row.exam || row.universe || row.entity_type || "result"));
  return `${title}: I found ${rows.length} matching graph result${rows.length === 1 ? "" : "s"}. The strongest initial matches are ${names.join(", ")}. Review the pathway cards and confidence labels below before making a decision.`;
}

function toGraph(rows: GraphRow[]) {
  const nodes = new Map<string, { id: string; label: string; type: string }>();
  const edges: { source: string; target: string; label: string }[] = [];
  for (const row of rows.slice(0, 10)) {
    const chain = [["universe", "Universe"], ["domain", "Domain"], ["pathway", "Pathway"], ["career", "Career"]] as const;
    let previous: string | null = null;
    for (const [key, type] of chain) {
      if (!row[key]) continue;
      const label = String(row[key]); const id = `${type}:${label}`;
      nodes.set(id, { id, label, type });
      if (previous) edges.push({ source: previous, target: id, label: type === "Career" ? "LEADS TO" : "CONTAINS" });
      previous = id;
    }
  }
  return { nodes: [...nodes.values()], edges };
}
