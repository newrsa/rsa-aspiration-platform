// Structural integrity validation — Neo4j 5.x
// Critical: any returned row fails deployment.
MATCH (c:CareerOutcome) WHERE c.governance_status IN ['Validated','Published'] AND NOT EXISTS { MATCH (:Stream)-[:LEADS_TO]->(c) } AND NOT EXISTS { MATCH (:Licence)-[:UNLOCKS]->(c) } RETURN 'T44' AS test,c.career_outcome_code AS offender;
MATCH p=(s)-[:PREREQUISITE_OF*1..50]->(s) RETURN 'T45' AS test,[n IN nodes(p)|coalesce(n.skill_code,n.syllabus_topic_code,n.name)] AS cycle;
MATCH (e:EntranceExam) WHERE e.governance_status IN ['Validated','Published'] AND NOT EXISTS { MATCH (:Stream)-[:HAS_ENTRANCE_EXAM]->(e) } AND NOT EXISTS { MATCH (:Degree)-[:REQUIRES_EXAM]->(e) } AND NOT EXISTS { MATCH (:CareerOutcome)-[:HAS_FOLLOW_ON_EXAM]->(e) } RETURN 'T48' AS test,e.entrance_exam_code AS offender;
MATCH (s:Scholarship) WHERE s.governance_status='Published' AND size(coalesce(s.eligibility_categories,[]))=0 AND size(coalesce(s.special_circumstance_eligibility,[]))>3 RETURN 'T49' AS test,s.scholarship_code AS warning;
MATCH (n) WHERE any(k IN keys(n) WHERE n[k] IS NULL) RETURN 'NULL_PROPERTY' AS test,labels(n) AS labels,coalesce(n.id,'') AS id, [k IN keys(n) WHERE n[k] IS NULL] AS keys;
MATCH (n) WHERE n.governance_status IN ['Validated','Published'] AND NOT EXISTS { MATCH (n)-[:SUPPORTED_BY_SOURCE]->(:SourceRecord) } RETURN 'MISSING_PROVENANCE' AS test,labels(n),coalesce(n.id,'') AS id;
MATCH (s:Stream)-[r:CONTAINED_IN]->(:Domain) WITH s,sum(CASE WHEN r.primary=true THEN 1 ELSE 0 END) AS primaries WHERE primaries<>1 RETURN 'PRIMARY_PARENT' AS test,s.stream_code,primaries;
