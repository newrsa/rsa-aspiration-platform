export type Intent = "career_discovery" | "eligibility" | "exams" | "coverage" | "traceability" | "interdisciplinary";

export type QueryPlan = {
  intent: Intent;
  title: string;
  interpretation: string;
  terms: string[];
  cypher: string;
  parameters: Record<string, unknown>;
};

const stopWords = new Set("a an and are as at be can career careers could do does for from have how i in into is me my of on or should show the to what which with would options pathway pathways pursue tell want".split(" "));

export function understandQuestion(question: string): QueryPlan {
  const normalized = question.toLowerCase().replace(/[^a-z0-9+&\s-]/g, " ").replace(/\s+/g, " ").trim();
  const terms = [...new Set(normalized.split(" ").filter(word => word.length > 2 && !stopWords.has(word)))].slice(0, 8);
  let intent: Intent = "career_discovery";
  if (/eligible|eligibility|qualification|degree|required|requirement|bridge/.test(normalized)) intent = "eligibility";
  else if (/exam|entrance|admission|test/.test(normalized)) intent = "exams";
  else if (/coverage|how many|count|broad|universe/.test(normalized)) intent = "coverage";
  else if (/source|evidence|trace|provenance|verified/.test(normalized)) intent = "traceability";
  else if (/interdisciplinary|combine|combines|hybrid|cross faculty/.test(normalized)) intent = "interdisciplinary";

  const baseParameters = { terms };
  if (intent === "coverage") return {
    intent, terms, title: "Knowledge graph coverage", interpretation: "You are asking how much verified career knowledge is currently represented.", parameters: {},
    cypher: `MATCH (u:Universe)
OPTIONAL MATCH (s:Stream)-[:BELONGS_TO_UNIVERSE]->(u)
OPTIONAL MATCH (s)-[:LEADS_TO]->(c:CareerOutcome)
RETURN u.name AS universe,u.version AS version,u.ontology_definition_status AS ontology_status,
       count(DISTINCT s) AS pathways,count(DISTINCT c) AS career_outcomes
ORDER BY pathways DESC`,
  };
  if (intent === "traceability") return {
    intent, terms, title: "Evidence traceability", interpretation: "You are asking whether graph knowledge can be traced to source records.", parameters: {},
    cypher: `MATCH (n)-[:SUPPORTED_BY_SOURCE]->(src:SourceRecord)
RETURN labels(n)[0] AS entity_type,count(DISTINCT n) AS traced_entities,
       count(DISTINCT src) AS source_records
ORDER BY traced_entities DESC LIMIT 20`,
  };
  if (intent === "exams") return {
    intent, terms, title: "Entrance and qualifying examinations", interpretation: `I identified an examination-discovery question${terms.length ? ` involving ${terms.join(", ")}` : ""}.`, parameters: baseParameters,
    cypher: `MATCH (e:EntranceExam)
OPTIONAL MATCH (e)-[:BELONGS_TO_UNIVERSE]->(u:Universe)
WHERE size($terms)=0 OR any(term IN $terms WHERE toLower(coalesce(e.name,'')) CONTAINS term OR toLower(coalesce(u.name,'')) CONTAINS term)
RETURN e.name AS exam,u.name AS universe,e.exam_level AS level,e.conducting_body AS conducting_body,
       e.governance_status AS confidence LIMIT 25`,
  };
  if (intent === "eligibility") return {
    intent, terms, title: "Eligibility and pathway requirements", interpretation: `I identified an eligibility question${terms.length ? ` involving ${terms.join(", ")}` : ""}.`, parameters: baseParameters,
    cypher: `MATCH (s:Stream)-[:LEADS_TO]->(c:CareerOutcome)
OPTIONAL MATCH (s)-[:CONTAINED_IN]->(d:Domain)
OPTIONAL MATCH (s)-[:BELONGS_TO_UNIVERSE]->(u:Universe)
WHERE size($terms)=0 OR any(term IN $terms WHERE toLower(coalesce(s.name,'')) CONTAINS term OR toLower(coalesce(c.name,'')) CONTAINS term OR toLower(coalesce(d.name,'')) CONTAINS term)
RETURN c.name AS career,s.name AS pathway,d.name AS domain,u.name AS universe,
       coalesce(s.eligibility_summary,s.education_requirement,s.core_qualifications,'Not yet verified') AS eligibility,
       coalesce(s.recommended_pathway,s.structured_courses,'Not yet verified') AS recommended_pathway,
       coalesce(s.governance_status,c.governance_status) AS confidence LIMIT 20`,
  };
  const interdisciplinary = intent === "interdisciplinary";
  return {
    intent, terms, title: interdisciplinary ? "Interdisciplinary career pathways" : "Career pathway discovery",
    interpretation: `${interdisciplinary ? "I identified a cross-domain discovery question" : "I identified a career-discovery question"}${terms.length ? ` involving ${terms.join(", ")}` : ""}.`, parameters: { ...baseParameters, interdisciplinary },
    cypher: `MATCH (s:Stream)-[:LEADS_TO]->(c:CareerOutcome)
OPTIONAL MATCH (s)-[:CONTAINED_IN]->(d:Domain)
OPTIONAL MATCH (s)-[:BELONGS_TO_UNIVERSE]->(u:Universe)
WHERE (NOT $interdisciplinary OR u.universe_code='UNI-INTERDISCIPLINARY' OR s.path_type='Interdisciplinary')
  AND (size($terms)=0 OR any(term IN $terms WHERE toLower(coalesce(s.name,'')) CONTAINS term OR toLower(coalesce(c.name,'')) CONTAINS term OR toLower(coalesce(d.name,'')) CONTAINS term OR toLower(coalesce(s.outcomes_raw,'')) CONTAINS term))
RETURN c.name AS career,s.name AS pathway,d.name AS domain,u.name AS universe,
       coalesce(s.recommended_pathway,s.structured_courses,'Pathway detail pending verification') AS recommended_pathway,
       coalesce(s.governance_status,c.governance_status) AS confidence,
       coalesce(s.source,c.source) AS source LIMIT 24`,
  };
}
