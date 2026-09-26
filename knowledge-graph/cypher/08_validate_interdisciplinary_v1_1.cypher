// Interdisciplinary v1.1 validation. Any returned offender row requires review.

// Registry cardinality summary: expected 16 domains and 38 streams.
MATCH (u:Universe {universe_code:'UNI-INTERDISCIPLINARY'})
OPTIONAL MATCH (d:Domain:IntegrationDomain)-[:BELONGS_TO_UNIVERSE]->(u)
OPTIONAL MATCH (s:Stream:InterdisciplinaryStream)-[:BELONGS_TO_UNIVERSE]->(u)
RETURN u.governance_status AS ontology_status,
       u.instance_data_status AS data_status,
       count(DISTINCT d) AS domains,
       count(DISTINCT s) AS streams,
       CASE WHEN count(DISTINCT d)=16 AND count(DISTINCT s)=38
            THEN 'PASS' ELSE 'FAIL' END AS registry_cardinality;

// INT-VAL-001: every Stream has at least two parent disciplines.
MATCH (s:Stream:InterdisciplinaryStream)
OPTIONAL MATCH (s)-[:HAS_PARENT_DISCIPLINE]->(p:ParentDiscipline)
WITH s,count(DISTINCT p) AS parent_count
WHERE parent_count<2
RETURN 'INT-VAL-001' AS test,s.stream_code AS offender,parent_count;

// INT-VAL-003 and INT-VAL-013: structured pathway required; availability not implied.
MATCH (s:Stream:InterdisciplinaryStream)
WHERE trim(coalesce(s.structured_courses,''))=''
RETURN 'INT-VAL-003' AS test,s.stream_code AS offender,'Missing structured programme/pathway' AS issue;

// INT-VAL-005/006: eligibility must be explicit and bridge gaps reviewable.
MATCH (s:Stream:InterdisciplinaryStream)
WHERE trim(coalesce(s.eligibility_summary,''))=''
RETURN 'INT-VAL-005' AS test,s.stream_code AS offender,'Missing eligibility statement' AS issue;

// Domain and outcome integrity.
MATCH (s:Stream:InterdisciplinaryStream)
WHERE NOT EXISTS { MATCH (s)-[:CONTAINED_IN]->(:Domain:IntegrationDomain) }
   OR NOT EXISTS { MATCH (s)-[:LEADS_TO]->(:CareerOutcome) }
RETURN 'INT-STRUCTURE' AS test,s.stream_code AS offender;

// Current source gaps called out by v1.1 confidence statement.
MATCH (s:Stream:InterdisciplinaryStream)
WHERE trim(coalesce(s.source_url,''))=''
RETURN 'INT-SOURCE' AS test,s.stream_code AS offender,'Missing source URL' AS issue;

// Coexistence report: older workbook-derived heuristic nodes are retained for reconciliation.
MATCH (s:Stream)-[:BELONGS_TO_UNIVERSE]->(:Universe {universe_code:'UNI-INTERDISCIPLINARY'})
RETURN count(CASE WHEN s:InterdisciplinaryStream THEN 1 END) AS authoritative_v1_1_streams,
       count(CASE WHEN NOT s:InterdisciplinaryStream THEN 1 END) AS legacy_streams_to_reconcile;
