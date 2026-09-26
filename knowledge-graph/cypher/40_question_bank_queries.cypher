// Question Bank query-family library — parameterized Neo4j 5.x
// DISCOVERY
MATCH (u:Universe {name:$universe})<-[:BELONGS_TO_UNIVERSE]-(s:Stream)-[:LEADS_TO]->(c:CareerOutcome)
WHERE c.governance_status IN ['Validated','Published'] AND ($interest IS NULL OR EXISTS { MATCH (c)-[:ALIGNS_WITH_INTEREST]->(:Interest {name:$interest}) })
RETURN s.name,c.name,c.description,c.source ORDER BY c.name LIMIT 25;

// ELIGIBILITY with alternatives/bridges
MATCH (s:Stream {stream_code:$stream_code})
OPTIONAL MATCH (s)-[:HAS_CRITERION]->(cr:Criterion)
OPTIONAL MATCH (s)-[:HAS_ENTRANCE_EXAM]->(e:EntranceExam)
OPTIONAL MATCH (s)-[:REQUIRES_BRIDGE_COURSE]->(b:BridgeCourse)
RETURN s.name,collect(DISTINCT cr{.*}) AS criteria,collect(DISTINCT e{.*}) AS exams,collect(DISTINCT b{.*}) AS bridges;

// NEP POLICY
MATCH (p:ProgrammeOffering {programme_offering_code:$offering_code})
OPTIONAL MATCH (p)-[:IMPLEMENTS_CREDIT_POLICY]->(cp:CreditPolicy)
OPTIONAL MATCH (p)-[:PERMITS_EXIT_AWARD]->(ea:ExitAward)
RETURN p{.*},collect(DISTINCT cp{.*}) AS credit_policies,collect(DISTINCT ea{.*}) AS exit_awards;

// REGULATION
MATCH (c:CareerOutcome {career_outcome_code:$career_code})
OPTIONAL MATCH (c)<-[:UNLOCKS]-(l:Licence)-[:GOVERNED_BY]->(r:RegulatoryBody)
RETURN c.name,collect(DISTINCT {licence:l.name,status:l.governance_status,regulator:r.name,source:l.source}) AS permissions;

// COMPARE two paths; application formats the normalized maps.
UNWIND $stream_codes AS code MATCH (s:Stream {stream_code:code})
OPTIONAL MATCH (s)-[:LEADS_TO]->(c:CareerOutcome)
OPTIONAL MATCH (c)-[:EARNS_SALARY]->(sal:SalaryRange)
RETURN s.stream_code,s.name,count(DISTINCT c) AS outcome_count,min(sal.minimum_salary_inr) AS min_salary_paise,max(sal.maximum_salary_inr) AS max_salary_paise;
