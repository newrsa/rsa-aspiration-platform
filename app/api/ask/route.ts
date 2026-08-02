import { NextRequest, NextResponse } from "next/server";
import { friendlyGraphError, GraphRow, runGraphQuery } from "../../../lib/neo4j";
import { Persona, QueryPlan, rankResults, understandQuestion } from "../../../lib/nlp";

export async function POST(request: NextRequest) {
  try {
    const body = await request.json() as { question?: string; persona?: Persona };
    const question = String(body.question || "").trim();
    const persona: Persona = body.persona === "leader" ? "leader" : "aspirant";
    if (question.length < 3 || question.length > 600) return NextResponse.json({ error: "Please ask a question between 3 and 600 characters." }, { status: 400 });
    const plan = understandQuestion(question,persona);
    if (plan.needsClarification) return NextResponse.json({ question,intent:plan.intent,interpretation:plan.interpretation,answer:plan.clarification,columns:[],results:[],result_count:0,graph:{nodes:[],edges:[]},grounded:true,clarification_required:true });
    const result = await runGraphQuery(plan.cypher, plan.parameters);
    const ranked = rankResults(plan,result.rows);
    return NextResponse.json({
      question, persona,intent: plan.intent, interpretation: plan.interpretation,
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
  if(plan.intent==="universe_details") { const first=rows[0]; if(rows.length===1)return `${first.universe} ${first.version||""} has a finalized baseline of ${Number(first.finalized_domains||0).toLocaleString()} domains, ${Number(first.finalized_streams||0).toLocaleString()} pathways and ${Number(first.finalized_career_outcomes||0).toLocaleString()} career outcomes. Neo4j currently holds ${Number(first.loaded_domains||0).toLocaleString()}, ${Number(first.loaded_streams||0).toLocaleString()} and ${Number(first.loaded_career_outcomes||0).toLocaleString()} respectively because earlier workbook-derived records are retained for reconciliation. Its ontology is ${first.ontology_status||"not recorded"}; instance data is ${first.data_status||"not recorded"}. Largest finalized domains: ${Array.isArray(first.largest_finalized_domains)?first.largest_finalized_domains.join(", "):"not available"}.`; return `The backend contains ${rows.length} universe definitions. Each card separates the finalized version baseline from all loaded records, so retained workbook data is not mistaken for authoritative ontology scope.`; }
  if(plan.intent==="governance") return `Governance is reported separately for ontology definitions and loaded instance data. This distinction explains why a finalized universe specification can be published while volatile eligibility, institutions, examinations or salary evidence remains a validated baseline or requires review.`;
  if(plan.intent==="backend_details") { const total=rows.reduce((sum,row)=>sum+Number(row.records||0),0); return `Neo4j currently contains ${total.toLocaleString()} records across the principal entity types shown below. These counts describe the populated backend structure, not independent factual certification of every record.`; }
  if(plan.intent==="data_quality") { const row=rows[0]||{}; const critical=Number(row.streams_without_domain||0)+Number(row.streams_without_outcome||0)+Number(row.dangling_outcomes||0); return critical===0?`The core pathway structure passes this live check: no streams are missing domains or career outcomes, and no career outcomes are dangling. Row-level provenance coverage is reported separately because finalized ontology baselines and workbook-derived records use different evidence models.`:`The live integrity check found ${critical} critical structural exceptions. Review the individual counts below before treating the graph as demo-ready.`; }
  if(plan.intent==="domain_coverage") { const top=rows.slice(0,3).map(row=>`${row.domain} (${row.pathways} pathways)`).join(", "); return `The deepest populated domains are ${top}. These are loaded-graph concentration figures; they should be read alongside universe version and maturity rather than as a judgement of labour-market importance.`; }
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
