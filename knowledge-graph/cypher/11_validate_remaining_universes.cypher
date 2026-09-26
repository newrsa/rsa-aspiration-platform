// Expected authoritative baseline counts. Each row must return PASS.
UNWIND [
 {code:'UNI-COMMERCE',label:'CommerceStream',domains:15,streams:47,outcomes:111},
 {code:'UNI-HUMANITIES',label:'HumanitiesStream',domains:16,streams:125,outcomes:160},
 {code:'UNI-MANAGEMENT',label:'ManagementStream',domains:21,streams:67,outcomes:67},
 {code:'UNI-LAW',label:'LawStream',domains:22,streams:90,outcomes:90}
] AS expected
MATCH (u:Universe {universe_code:expected.code})
OPTIONAL MATCH (d:Domain)-[:BELONGS_TO_UNIVERSE]->(u)
WITH expected,u,count(DISTINCT d) AS domains
OPTIONAL MATCH (s:Stream)-[:BELONGS_TO_UNIVERSE]->(u)
WHERE expected.label IN labels(s)
WITH expected,u,domains,count(DISTINCT s) AS streams
OPTIONAL MATCH (c:CareerOutcome)-[:BELONGS_TO_UNIVERSE]->(u)
WITH expected,u,domains,streams,count(DISTINCT c) AS outcomes
RETURN expected.code AS universe,u.version AS version,u.ontology_definition_status AS ontology_status,
       u.instance_data_status AS data_status,domains,streams,outcomes,
       CASE WHEN domains=expected.domains AND streams=expected.streams AND outcomes=expected.outcomes THEN 'PASS' ELSE 'FAIL' END AS result
ORDER BY universe;

// Structural offenders: expected zero rows.
MATCH (s:Stream)
WHERE any(label IN ['CommerceStream','HumanitiesStream','ManagementStream','LawStream'] WHERE label IN labels(s))
  AND (NOT EXISTS { MATCH (s)-[:BELONGS_TO_UNIVERSE]->(:Universe) }
       OR NOT EXISTS { MATCH (s)-[:CONTAINED_IN]->(:Domain) }
       OR NOT EXISTS { MATCH (s)-[:LEADS_TO]->(:CareerOutcome) })
RETURN s.stream_code AS offender,'Missing universe, domain, or career-outcome relationship' AS issue;

// Duplicate-code audit: expected zero rows.
MATCH (s:Stream) WHERE s.stream_code IS NOT NULL
WITH s.stream_code AS code,collect(s) AS records WHERE size(records)>1
RETURN 'Stream' AS entity,code,size(records) AS duplicate_count
UNION ALL
MATCH (d:Domain) WHERE d.domain_code IS NOT NULL
WITH d.domain_code AS code,collect(d) AS records WHERE size(records)>1
RETURN 'Domain' AS entity,code,size(records) AS duplicate_count
UNION ALL
MATCH (c:CareerOutcome) WHERE c.career_outcome_code IS NOT NULL
WITH c.career_outcome_code AS code,collect(c) AS records WHERE size(records)>1
RETURN 'CareerOutcome' AS entity,code,size(records) AS duplicate_count;
