export type Persona = "aspirant" | "leader";
export type Intent = "career_discovery" | "eligibility" | "exams" | "coverage" | "traceability" | "interdisciplinary" | "universe_details" | "governance" | "data_quality" | "backend_details";

export type QueryPlan = {
  intent: Intent; title: string; interpretation: string; terms: string[]; expandedTerms: string[];
  universe: string; needsClarification: boolean; clarification?: string;
  cypher: string; parameters: Record<string, unknown>;
};

const ignored = new Set("a an and are as at available be can career careers could do does enter explore find for from have how i in into is me my need needed of on options or pathway pathways pursue related should show student tell the to want what which with would combine combines qualification qualifications required requirement".split(" "));
const universeMap: Record<string,string> = { science:"UNI-SCIENCE", engineering:"UNI-SCIENCE", commerce:"UNI-COMMERCE", humanities:"UNI-HUMANITIES", arts:"UNI-HUMANITIES", management:"UNI-MANAGEMENT", mba:"UNI-MANAGEMENT", law:"UNI-LAW", legal:"UNI-LAW", interdisciplinary:"UNI-INTERDISCIPLINARY" };
const expansions: Record<string,string[]> = {
  engineering:["engineer","engineering","technology","technical"], fintech:["fintech","financial technology","digital finance"],
  psychologist:["psychologist","psychology"], psychology:["psychologist","psychology"], ai:["ai","artificial intelligence","machine learning"],
  lawyer:["lawyer","advocate","legal"], law:["law","legal"], technology:["technology","digital","cyber","tech"],
  finance:["finance","financial","banking","investment"], design:["design","designer"], medical:["medical","healthcare","health"],
  environment:["environment","environmental","sustainability","climate"], data:["data","analytics","analyst"],
};

export function understandQuestion(question: string, persona: Persona = "aspirant"): QueryPlan {
  const normalized = question.toLowerCase().replace(/[^a-z0-9+&\s-]/g," ").replace(/\s+/g," ").trim();
  const words = normalized.split(" ");
  let intent: Intent = "career_discovery";
  if (/eligible|eligibility|qualification|degree|required|requirement|bridge|education needed|can .* student|\benter\b/.test(normalized)) intent="eligibility";
  else if (/exam|entrance|admission|test/.test(normalized)) intent="exams";
  else if (/coverage|how many|count|broad|universes/.test(normalized)) intent="coverage";
  else if (/source|evidence|trace|provenance|verified/.test(normalized)) intent="traceability";
  else if (/interdisciplinary|combine|combines|hybrid|cross faculty/.test(normalized)) intent="interdisciplinary";

  const namedUniverses = words.map(word=>universeMap[word]).filter(Boolean);
  let universe = namedUniverses.length===1 ? namedUniverses[0] : "";
  if (intent==="interdisciplinary") universe="UNI-INTERDISCIPLINARY";
  const terms=[...new Set(words.filter(word=>word.length>2&&!ignored.has(word)&&!universeMap[word]))].slice(0,8);
  // Engineering is both a universe cue and a career concept. Cross-domain questions also need every parent-domain word for ranking.
  if (words.includes("engineering")) terms.push("engineering");
  if (intent==="interdisciplinary" || namedUniverses.length>1) words.filter(word=>universeMap[word] && word!=="interdisciplinary").forEach(word=>terms.push(word));
  const expandedTerms=[...new Set(terms.flatMap(term=>expansions[term]||[term]))];

  if (persona==="leader") {
    const params={universe};
    if (/quality|validation|integrity|duplicate|gap|orphan|missing/.test(normalized)) return plan("data_quality","Structural data quality","You are asking for current graph-integrity indicators.",terms,expandedTerms,universe,false,{},`CALL { MATCH (s:Stream) WHERE NOT EXISTS { MATCH (s)-[:CONTAINED_IN]->(:Domain) } RETURN count(s) AS streams_without_domain } CALL { MATCH (s:Stream) WHERE NOT EXISTS { MATCH (s)-[:LEADS_TO]->(:CareerOutcome) } RETURN count(s) AS streams_without_outcome } CALL { MATCH (c:CareerOutcome) WHERE NOT EXISTS { MATCH (:Stream)-[:LEADS_TO]->(c) } RETURN count(c) AS dangling_outcomes } CALL { MATCH (n) WHERE n.governance_status IN ['Validated','Published','Validated baseline'] AND NOT EXISTS { MATCH (n)-[:SUPPORTED_BY_SOURCE]->(:SourceRecord) } RETURN count(n) AS governed_records_without_row_provenance } RETURN streams_without_domain,streams_without_outcome,dangling_outcomes,governed_records_without_row_provenance`);
    if (/governance|status|published|draft|maturity|readiness/.test(normalized)) return plan("governance","Universe governance and readiness","You are asking how ontology publication and instance-data maturity differ by universe.",terms,expandedTerms,universe,false,params,`MATCH (u:Universe) WHERE $universe='' OR u.universe_code=$universe RETURN u.name AS universe,u.version AS version,coalesce(u.ontology_definition_status,u.governance_status) AS ontology_status,coalesce(u.instance_data_status,u.governance_status) AS data_status,u.source AS governing_source,u.last_refreshed AS last_refreshed ORDER BY universe`);
    if (/source|evidence|trace|provenance|verified/.test(normalized)) return plan("traceability","Evidence traceability","You are asking how graph entities connect to their source evidence.",terms,expandedTerms,universe,false,{},`MATCH (n)-[:SUPPORTED_BY_SOURCE]->(src:SourceRecord) RETURN labels(n)[0] AS entity_type,count(DISTINCT n) AS traced_entities,count(DISTINCT src) AS source_records ORDER BY traced_entities DESC LIMIT 30`);
    if (/backend|schema|labels|entities|architecture|database/.test(normalized) && !universe) return plan("backend_details","Backend graph composition","You are asking which principal entity types are populated in Neo4j.",terms,expandedTerms,universe,false,{labels:['Universe','Domain','Stream','CareerOutcome','EntranceExam','Skill','SourceRecord','ParentDiscipline']},`MATCH (n) UNWIND labels(n) AS label WITH label,n WHERE label IN $labels RETURN label AS entity_type,count(DISTINCT n) AS records ORDER BY records DESC`);
    if (universe || /universe|ontology|detail|contains|inside/.test(normalized)) return plan("universe_details","Universe implementation detail",`You are asking for the populated structure${universe?` of ${universe.replace('UNI-','').toLowerCase()}`:' of each universe'}.`,terms,expandedTerms,universe,false,params,`MATCH (u:Universe) WHERE $universe='' OR u.universe_code=$universe CALL (u) { OPTIONAL MATCH (d:Domain)-[:BELONGS_TO_UNIVERSE]->(u) RETURN count(DISTINCT d) AS loaded_domains,count(DISTINCT CASE WHEN d.version=u.version THEN d END) AS finalized_domains } CALL (u) { OPTIONAL MATCH (s:Stream)-[:BELONGS_TO_UNIVERSE]->(u) RETURN count(DISTINCT s) AS loaded_streams,count(DISTINCT CASE WHEN s.version=u.version THEN s END) AS finalized_streams } CALL (u) { OPTIONAL MATCH (c:CareerOutcome)-[:BELONGS_TO_UNIVERSE]->(u) RETURN count(DISTINCT c) AS loaded_career_outcomes,count(DISTINCT CASE WHEN c.version=u.version THEN c END) AS finalized_career_outcomes } CALL (u) { OPTIONAL MATCH (s:Stream)-[:BELONGS_TO_UNIVERSE]->(u) WHERE s.version=u.version OPTIONAL MATCH (s)-[:CONTAINED_IN]->(d:Domain) WITH d,count(DISTINCT s) AS n ORDER BY n DESC LIMIT 5 RETURN collect(d.name+' ('+toString(n)+')') AS largest_finalized_domains } RETURN u.name AS universe,u.version AS version,coalesce(u.ontology_definition_status,u.governance_status) AS ontology_status,coalesce(u.instance_data_status,u.governance_status) AS data_status,loaded_domains,finalized_domains,loaded_streams,finalized_streams,loaded_career_outcomes,finalized_career_outcomes,largest_finalized_domains,u.source AS governing_source,u.last_refreshed AS last_refreshed ORDER BY universe`);
    return plan("coverage","Knowledge graph coverage","You are asking for an executive summary of populated graph coverage.",[],[],"",false,{},`MATCH (u:Universe) OPTIONAL MATCH (s:Stream)-[:BELONGS_TO_UNIVERSE]->(u) OPTIONAL MATCH (s)-[:LEADS_TO]->(c:CareerOutcome) RETURN u.name AS universe,u.version AS version,coalesce(u.ontology_definition_status,u.governance_status) AS ontology_status,count(DISTINCT s) AS pathways,count(DISTINCT c) AS career_outcomes ORDER BY pathways DESC`);
  }

  if (intent==="coverage") return plan(intent,"Knowledge graph coverage","You are asking how much governed career knowledge is represented.",[],[],"",false,{},`MATCH (u:Universe) OPTIONAL MATCH (s:Stream)-[:BELONGS_TO_UNIVERSE]->(u) OPTIONAL MATCH (s)-[:LEADS_TO]->(c:CareerOutcome) RETURN u.name AS universe,u.version AS version,u.ontology_definition_status AS ontology_status,count(DISTINCT s) AS pathways,count(DISTINCT c) AS career_outcomes ORDER BY pathways DESC`);
  if (intent==="traceability") return plan(intent,"Evidence traceability","You are asking whether graph knowledge is connected to source evidence.",terms,expandedTerms,universe,false,{},`MATCH (n)-[:SUPPORTED_BY_SOURCE]->(src:SourceRecord) RETURN labels(n)[0] AS entity_type,count(DISTINCT n) AS traced_entities,count(DISTINCT src) AS source_records ORDER BY traced_entities DESC LIMIT 30`);
  if (!terms.length && !universe) return { ...plan(intent,"More detail needed","I need one more detail to search the graph meaningfully.",terms,expandedTerms,universe,true,{},"RETURN 1 AS ignored"), clarification:"Tell me a subject, interest, career, domain, or education stage—for example, ‘I like mathematics and machines’ or ‘How can I become a psychologist?’" };

  const params={universe};
  if(intent==="exams") return plan(intent,"Entrance and qualifying examinations",describe(intent,terms,universe),terms,expandedTerms,universe,false,params,`MATCH (e:EntranceExam) OPTIONAL MATCH (e)-[:BELONGS_TO_UNIVERSE]->(u:Universe) WHERE $universe='' OR u.universe_code=$universe RETURN e.name AS exam,u.name AS universe,e.exam_level AS level,e.conducting_body AS conducting_body,e.governance_status AS confidence LIMIT 300`);
  const common=`MATCH (s:Stream)-[:LEADS_TO]->(c:CareerOutcome) OPTIONAL MATCH (s)-[:CONTAINED_IN]->(d:Domain) OPTIONAL MATCH (s)-[:BELONGS_TO_UNIVERSE]->(u:Universe) WHERE $universe='' OR u.universe_code=$universe`;
  if(intent==="eligibility") return plan(intent,"Eligibility and pathway requirements",describe(intent,terms,universe),terms,expandedTerms,universe,false,params,`${common} RETURN c.name AS career,s.name AS pathway,d.name AS domain,u.name AS universe,coalesce(s.eligibility_summary,s.education_requirement,s.core_qualifications,'Not yet verified') AS eligibility,coalesce(s.recommended_pathway,s.structured_courses,'Not yet verified') AS recommended_pathway,coalesce(s.governance_status,c.governance_status) AS confidence,coalesce(s.source,c.source) AS source LIMIT 2000`);
  return plan(intent,intent==="interdisciplinary"?"Interdisciplinary career pathways":"Career pathway discovery",describe(intent,terms,universe),terms,expandedTerms,universe,false,params,`${common} RETURN c.name AS career,s.name AS pathway,d.name AS domain,u.name AS universe,coalesce(s.recommended_pathway,s.structured_courses,'Pathway detail pending verification') AS recommended_pathway,coalesce(s.eligibility_summary,s.education_requirement,s.core_qualifications) AS eligibility,coalesce(s.governance_status,c.governance_status) AS confidence,coalesce(s.source,c.source) AS source LIMIT 2000`);
}

function plan(intent:Intent,title:string,interpretation:string,terms:string[],expandedTerms:string[],universe:string,needsClarification:boolean,parameters:Record<string,unknown>,cypher:string):QueryPlan{return{intent,title,interpretation,terms,expandedTerms,universe,needsClarification,parameters,cypher};}
function describe(intent:Intent,terms:string[],universe:string){const focus=terms.length?terms.join(", "):universe.replace("UNI-","").toLowerCase();return `I interpreted this as ${intent.replaceAll("_"," ")} focused on ${focus}.`;}

export function rankResults(plan:QueryPlan,rows:Record<string,unknown>[]) {
  if (["coverage","traceability","universe_details","governance","data_quality","backend_details"].includes(plan.intent)) return rows;
  const ranked=rows.map((row,index)=>{const text=Object.values(row).filter(v=>v!=null).join(" ").toLowerCase();let score=0;let matchedConcepts=0;for(const original of plan.terms){const variants=expansions[original]||[original];const matched=variants.some(term=>text.includes(term));if(matched)matchedConcepts++;}for(const term of plan.expandedTerms){if(text.includes(term))score+=term.includes(" ")?4:2;}for(const term of plan.terms){if(String(row.career||"").toLowerCase().includes(term))score+=6;if(String(row.pathway||row.exam||"").toLowerCase().includes(term))score+=5;if(String(row.domain||"").toLowerCase().includes(term))score+=3;}if(matchedConcepts===plan.terms.length)score+=8;return{row,score,index,matchedConcepts};}).filter(item=>item.score>0 && (plan.intent!=="interdisciplinary" || item.matchedConcepts>=Math.min(2,plan.terms.length))).sort((a,b)=>b.score-a.score||a.index-b.index);
  return ranked.slice(0,24).map(item=>({...item.row,relevance:item.score}));
}
