import { NextRequest, NextResponse } from "next/server";
import { friendlyGraphError, GraphRow, runGraphQuery } from "../../../lib/neo4j";
import { QueryPlan, rankResults, understandQuestion } from "../../../lib/nlp";

export async function POST(request: NextRequest) {
  try {
    const body = await request.json() as { question?: string };
    const question = String(body.question || "").trim();
    if (question.length < 3 || question.length > 600) return NextResponse.json({ error: "Please ask a question between 3 and 600 characters." }, { status: 400 });
    const plan = understandQuestion(question);
    if (plan.needsClarification) return NextResponse.json({ question,intent:plan.intent,interpretation:plan.interpretation,answer:plan.clarification,columns:[],results:[],result_count:0,graph:{nodes:[],edges:[]},grounded:true,clarification_required:true });
    const result = await runGraphQuery(plan.cypher, plan.parameters);
    const ranked = rankResults(plan,result.rows);
    return NextResponse.json({
      question, intent: plan.intent, interpretation: plan.interpretation,
      answer: composeAnswer(plan, ranked), columns: result.columns,
      results: ranked, result_count: ranked.length,
      graph: toGraph(ranked), grounded: true,clarification_required:false,
    });
  } catch (error) {
    return NextResponse.json({ error: friendlyGraphError(error) }, { status: 500 });
  }
}

function composeAnswer(plan: QueryPlan, rows: GraphRow[]) {
  if (!rows.length) return `I understood your question, but the current graph has no close governed match for ${plan.terms.join(", ") || "that request"}. Try a broader subject or career name; I will not substitute unrelated results.`;
  if(plan.intent==="coverage") { const total=rows.reduce((sum,row)=>sum+Number(row.pathways||0),0); return `The graph currently represents ${total.toLocaleString()} pathway records across ${rows.length} universes. The table below separates pathway and career-outcome coverage so maturity is not mistaken for completeness.`; }
  if(plan.intent==="traceability") { const entities=rows.reduce((sum,row)=>sum+Number(row.traced_entities||0),0); return `Source traceability is active across ${entities.toLocaleString()} governed entities. Each result below shows how many graph entities and workbook source records are connected.`; }
  const top=rows.slice(0,3); const names=[...new Set(rows.map(row=>String(row.career||row.exam||row.pathway)))].slice(0,3).join(", ");
  if(plan.intent==="exams") return `For ${plan.terms.join(", ") || "this field"}, the closest examination records are ${names}. Check the conducting body and confidence fields because examination rules can change.`;
  if(plan.intent==="eligibility") { const first=top[0]; const missing=String(first.eligibility||"").includes("Not yet verified"); return missing ? `The graph identifies ${first.career||first.pathway} as the closest career match, but its governed eligibility and recommended route are not yet verified. I will not invent those requirements; use the source and confidence fields below while this evidence gap is reviewed.` : `The closest eligibility match is ${first.career||first.pathway}. The graph records ${first.eligibility} as the current requirement and ${first.recommended_pathway||"no separate recommended route"} as the route. I also found ${rows.length-1} alternative match${rows.length===2?"":"es"} below.`; }
  if(plan.intent==="interdisciplinary") return `The strongest mapped cross-domain options are ${names}. These results come from the Interdisciplinary universe and are ranked by overlap with ${plan.terms.join(" and ")}; open a pathway card to review its eligibility, route, confidence, and source.`;
  const domains=[...new Set(top.map(row=>String(row.domain||"")).filter(Boolean))];
  return `Based on ${plan.terms.join(" and ") || "your stated interest"}, the graph’s strongest matches are ${names}. They span ${domains.join(", ") || "the mapped career domains"}. I ranked only records that matched your question, rather than returning the first careers in the database.`;
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
