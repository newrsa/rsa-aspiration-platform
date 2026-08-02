export type Intent = "career_discovery" | "eligibility" | "exams" | "coverage" | "traceability" | "interdisciplinary";

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

export function understandQuestion(question: string): QueryPlan {
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
  if (["coverage","traceability"].includes(plan.intent)) return rows;
  const ranked=rows.map((row,index)=>{const text=Object.values(row).filter(v=>v!=null).join(" ").toLowerCase();let score=0;let matchedConcepts=0;for(const original of plan.terms){const variants=expansions[original]||[original];const matched=variants.some(term=>text.includes(term));if(matched)matchedConcepts++;}for(const term of plan.expandedTerms){if(text.includes(term))score+=term.includes(" ")?4:2;}for(const term of plan.terms){if(String(row.career||"").toLowerCase().includes(term))score+=6;if(String(row.pathway||row.exam||"").toLowerCase().includes(term))score+=5;if(String(row.domain||"").toLowerCase().includes(term))score+=3;}if(matchedConcepts===plan.terms.length)score+=8;return{row,score,index,matchedConcepts};}).filter(item=>item.score>0 && (plan.intent!=="interdisciplinary" || item.matchedConcepts>=Math.min(2,plan.terms.length))).sort((a,b)=>b.score-a.score||a.index-b.index);
  return ranked.slice(0,24).map(item=>({...item.row,relevance:item.score}));
}
