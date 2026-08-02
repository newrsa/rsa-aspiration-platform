// RSA SCC leadership demo queries — Neo4j 5.x
// No :param commands or external parameters are required.

// DEMO 1 — Structural validation summary
CALL {
  MATCH (c:CareerOutcome)
  WHERE NOT EXISTS { MATCH (:Stream)-[:LEADS_TO]->(c) }
    AND NOT EXISTS { MATCH (:Licence)-[:UNLOCKS]->(c) }
  RETURN count(c) AS dangling_careers
}
CALL {
  MATCH (e:EntranceExam)
  WHERE NOT EXISTS { MATCH (:Stream)-[:HAS_ENTRANCE_EXAM]->(e) }
    AND NOT EXISTS { MATCH (:Degree)-[:REQUIRES_EXAM]->(e) }
    AND NOT EXISTS { MATCH (:CareerOutcome)-[:HAS_FOLLOW_ON_EXAM]->(e) }
  RETURN count(e) AS orphaned_exams
}
CALL {
  MATCH (n)
  WHERE n.governance_status IN ['Validated','Published']
    AND NOT EXISTS { MATCH (n)-[:SUPPORTED_BY_SOURCE]->(:SourceRecord) }
  RETURN count(n) AS missing_provenance
}
RETURN dangling_careers, orphaned_exams, missing_provenance,
       CASE WHEN dangling_careers=0 AND missing_provenance=0
            THEN 'PASS WITH REVIEW: core paths and provenance are intact; review orphaned exams.'
            ELSE 'ACTION NEEDED: resolve critical structural or provenance findings.' END AS verdict;

// DEMO 2 — Question Bank: engineering pathways and career outcomes
WITH 'engineering' AS demo_domain
MATCH (s:Stream)-[:LEADS_TO]->(c:CareerOutcome)
MATCH (s)-[:CONTAINED_IN]->(d:Domain)
OPTIONAL MATCH (s)-[:BELONGS_TO_UNIVERSE]->(u:Universe)
WHERE toLower(d.name) CONTAINS demo_domain
   OR toLower(s.name) CONTAINS demo_domain
RETURN c.name AS career, s.name AS pathway, d.name AS domain,
       u.name AS universe, c.governance_status AS status
ORDER BY universe, career LIMIT 30;

// DEMO 3 — Question Bank: Law + Technology + Governance careers
WITH 'UNI-INTERDISCIPLINARY' AS demo_universe,
     'law' AS first_keyword, 'technology' AS second_keyword
MATCH (u:Universe {universe_code:demo_universe})<-[:BELONGS_TO_UNIVERSE]-(s:Stream)
MATCH (s)-[:CONTAINED_IN]->(d:Domain)
MATCH (s)-[:LEADS_TO]->(c:CareerOutcome)
WHERE toLower(d.name) CONTAINS first_keyword
  AND toLower(d.name) CONTAINS second_keyword
RETURN c.name AS career, s.name AS pathway, d.name AS integration_domain,
       u.name AS universe, c.governance_status AS status
ORDER BY career LIMIT 30;
