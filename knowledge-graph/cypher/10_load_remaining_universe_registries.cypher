// Load Commerce v0.7, Humanities v0.8, Management v0.9 and Law v1.0.
// Copy all commerce_v0_7_*, humanities_v0_8_*, management_v0_9_* and law_v1_0_* CSVs to import/rsa.

// ---- Commerce v0.7 ----
LOAD CSV WITH HEADERS FROM 'file:///rsa/commerce_v0_7_domains.csv' AS row
CALL (row) { MATCH (u:Universe {universe_code:row.universe_code}) MERGE (d:Domain {domain_code:row.domain_code})
  ON CREATE SET d.id=randomUUID(),d.created_at=datetime(),d.created_by='rsa-finalized-loader'
  SET d:CommerceDomain,d.name=row.name,d.domain_nature=row.domain_nature,d.description=row.description,
      d.source_basis=row.source_basis,d.normalization_status=row.normalization_status,d.confidence=row.confidence,
      d.governance_status=row.governance_status,d.version=row.version,d.source=row.source_document,
      d.updated_at=datetime(),d.updated_by='rsa-finalized-loader' MERGE (d)-[:BELONGS_TO_UNIVERSE]->(u); } IN TRANSACTIONS OF 100 ROWS;
LOAD CSV WITH HEADERS FROM 'file:///rsa/commerce_v0_7_streams.csv' AS row
CALL (row) { MATCH (u:Universe {universe_code:row.universe_code}) MATCH (d:Domain {domain_code:row.domain_code})
  MERGE (s:Stream {stream_code:row.stream_code}) ON CREATE SET s.id=randomUUID(),s.created_at=datetime(),s.created_by='rsa-finalized-loader'
  SET s:CommerceStream,s.name=row.name,s.entity_nature=row.entity_nature,s.path_type=row.path_type,s.outcomes_raw=row.outcomes_raw,
      s.source_cluster=row.source_cluster,s.normalization_basis=row.normalization_basis,s.confidence=row.confidence,s.notes=row.notes,
      s.governance_status=row.governance_status,s.version=row.version,s.source=row.source_document,s.updated_at=datetime(),s.updated_by='rsa-finalized-loader'
  MERGE (s)-[:BELONGS_TO_UNIVERSE]->(u) MERGE (s)-[r:CONTAINED_IN]->(d) SET r.ontology_version=row.version; } IN TRANSACTIONS OF 100 ROWS;
LOAD CSV WITH HEADERS FROM 'file:///rsa/commerce_v0_7_career_outcomes.csv' AS row
CALL (row) { MATCH (u:Universe {universe_code:row.universe_code}) MERGE (c:CareerOutcome {career_outcome_code:row.career_outcome_code})
  ON CREATE SET c.id=randomUUID(),c.created_at=datetime(),c.created_by='rsa-finalized-loader'
  SET c.name=row.name,c.governance_status=row.governance_status,c.version=row.version,c.source=row.source_document,c.updated_at=datetime(),c.updated_by='rsa-finalized-loader'
  MERGE (c)-[:BELONGS_TO_UNIVERSE]->(u); } IN TRANSACTIONS OF 200 ROWS;
LOAD CSV WITH HEADERS FROM 'file:///rsa/commerce_v0_7_stream_career_links.csv' AS row
MATCH (s:Stream {stream_code:row.stream_code}) MATCH (c:CareerOutcome {career_outcome_code:row.career_outcome_code})
MERGE (s)-[r:LEADS_TO]->(c) SET r.ontology_version=row.version,r.source=row.source_document;

// ---- Humanities v0.8 ----
LOAD CSV WITH HEADERS FROM 'file:///rsa/humanities_v0_8_domains.csv' AS row
CALL (row) { MATCH (u:Universe {universe_code:row.universe_code}) MERGE (d:Domain {domain_code:row.domain_code})
  ON CREATE SET d.id=randomUUID(),d.created_at=datetime(),d.created_by='rsa-finalized-loader'
  SET d:HumanitiesDomain,d.name=row.name,d.domain_nature=row.domain_nature,d.description=row.description,d.baseline_stream_count=toInteger(row.baseline_stream_count),
      d.governance_status=row.governance_status,d.version=row.version,d.source=row.source_document,d.updated_at=datetime(),d.updated_by='rsa-finalized-loader'
  MERGE (d)-[:BELONGS_TO_UNIVERSE]->(u); } IN TRANSACTIONS OF 100 ROWS;
LOAD CSV WITH HEADERS FROM 'file:///rsa/humanities_v0_8_streams.csv' AS row
CALL (row) { MATCH (u:Universe {universe_code:row.universe_code}) MATCH (d:Domain {domain_code:row.domain_code})
  MERGE (s:Stream {stream_code:row.stream_code}) ON CREATE SET s.id=randomUUID(),s.created_at=datetime(),s.created_by='rsa-finalized-loader'
  SET s:HumanitiesStream,s.name=row.name,s.entity_nature=row.entity_nature,s.path_type=row.path_type,s.source_cluster=row.source_cluster,
      s.outcome_count=toInteger(row.outcome_count),s.outcomes_raw=row.outcomes_raw,s.governance_status=row.governance_status,
      s.version=row.version,s.source=row.source_document,s.updated_at=datetime(),s.updated_by='rsa-finalized-loader'
  MERGE (s)-[:BELONGS_TO_UNIVERSE]->(u) MERGE (s)-[r:CONTAINED_IN]->(d) SET r.ontology_version=row.version; } IN TRANSACTIONS OF 200 ROWS;
LOAD CSV WITH HEADERS FROM 'file:///rsa/humanities_v0_8_career_outcomes.csv' AS row
CALL (row) { MATCH (u:Universe {universe_code:row.universe_code}) MERGE (c:CareerOutcome {career_outcome_code:row.career_outcome_code})
  ON CREATE SET c.id=randomUUID(),c.created_at=datetime(),c.created_by='rsa-finalized-loader'
  SET c.name=row.name,c.governance_status=row.governance_status,c.version=row.version,c.source=row.source_document,c.updated_at=datetime(),c.updated_by='rsa-finalized-loader'
  MERGE (c)-[:BELONGS_TO_UNIVERSE]->(u); } IN TRANSACTIONS OF 200 ROWS;
LOAD CSV WITH HEADERS FROM 'file:///rsa/humanities_v0_8_stream_career_links.csv' AS row
MATCH (s:Stream {stream_code:row.stream_code}) MATCH (c:CareerOutcome {career_outcome_code:row.career_outcome_code})
MERGE (s)-[r:LEADS_TO]->(c) SET r.ontology_version=row.version,r.source=row.source_document;

// ---- Management v0.9 ----
LOAD CSV WITH HEADERS FROM 'file:///rsa/management_v0_9_domains.csv' AS row
CALL (row) { MATCH (u:Universe {universe_code:row.universe_code}) MERGE (d:Domain {domain_code:row.domain_code})
  ON CREATE SET d.id=randomUUID(),d.created_at=datetime(),d.created_by='rsa-finalized-loader'
  SET d:ManagementDomain,d.name=row.name,d.domain_nature=row.domain_nature,d.description=row.description,d.baseline_stream_count=toInteger(row.baseline_stream_count),
      d.governance_status=row.governance_status,d.version=row.version,d.source=row.source_document,d.updated_at=datetime(),d.updated_by='rsa-finalized-loader'
  MERGE (d)-[:BELONGS_TO_UNIVERSE]->(u); } IN TRANSACTIONS OF 100 ROWS;
LOAD CSV WITH HEADERS FROM 'file:///rsa/management_v0_9_streams.csv' AS row
CALL (row) { MATCH (u:Universe {universe_code:row.universe_code}) MATCH (d:Domain {domain_code:row.domain_code})
  MERGE (s:Stream {stream_code:row.stream_code}) ON CREATE SET s.id=randomUUID(),s.created_at=datetime(),s.created_by='rsa-finalized-loader'
  SET s:ManagementStream,s.name=row.name,s.entity_nature=row.entity_nature,s.source_cluster=row.source_cluster,s.source_subcluster=row.source_subcluster,
      s.education_requirement=row.education_requirement,s.minimum_entry_stage=row.minimum_entry_stage,s.recommended_pathway=row.recommended_pathway,
      s.governance_status=row.governance_status,s.version=row.version,s.source=row.source_document,s.updated_at=datetime(),s.updated_by='rsa-finalized-loader'
  MERGE (s)-[:BELONGS_TO_UNIVERSE]->(u) MERGE (s)-[r:CONTAINED_IN]->(d) SET r.ontology_version=row.version; } IN TRANSACTIONS OF 100 ROWS;
LOAD CSV WITH HEADERS FROM 'file:///rsa/management_v0_9_career_outcomes.csv' AS row
CALL (row) { MATCH (u:Universe {universe_code:row.universe_code}) MERGE (c:CareerOutcome {career_outcome_code:row.career_outcome_code})
  ON CREATE SET c.id=randomUUID(),c.created_at=datetime(),c.created_by='rsa-finalized-loader'
  SET c.name=row.name,c.governance_status=row.governance_status,c.version=row.version,c.source=row.source_document,c.updated_at=datetime(),c.updated_by='rsa-finalized-loader'
  MERGE (c)-[:BELONGS_TO_UNIVERSE]->(u); } IN TRANSACTIONS OF 100 ROWS;
LOAD CSV WITH HEADERS FROM 'file:///rsa/management_v0_9_stream_career_links.csv' AS row
MATCH (s:Stream {stream_code:row.stream_code}) MATCH (c:CareerOutcome {career_outcome_code:row.career_outcome_code})
MERGE (s)-[r:LEADS_TO]->(c) SET r.ontology_version=row.version,r.source=row.source_document;

// ---- Law v1.0 ----
LOAD CSV WITH HEADERS FROM 'file:///rsa/law_v1_0_domains.csv' AS row
CALL (row) { MATCH (u:Universe {universe_code:row.universe_code}) MERGE (d:Domain {domain_code:row.domain_code})
  ON CREATE SET d.id=randomUUID(),d.created_at=datetime(),d.created_by='rsa-finalized-loader'
  SET d:LawDomain,d.name=row.name,d.domain_nature=row.domain_nature,d.description=row.description,d.baseline_stream_count=toInteger(row.baseline_stream_count),
      d.governance_status=row.governance_status,d.version=row.version,d.source=row.source_document,d.updated_at=datetime(),d.updated_by='rsa-finalized-loader'
  MERGE (d)-[:BELONGS_TO_UNIVERSE]->(u); } IN TRANSACTIONS OF 100 ROWS;
LOAD CSV WITH HEADERS FROM 'file:///rsa/law_v1_0_streams.csv' AS row
CALL (row) { MATCH (u:Universe {universe_code:row.universe_code}) MATCH (d:Domain {domain_code:row.domain_code})
  MERGE (s:Stream {stream_code:row.stream_code}) ON CREATE SET s.id=randomUUID(),s.created_at=datetime(),s.created_by='rsa-finalized-loader'
  SET s:LawStream,s.name=row.name,s.entity_nature=row.entity_nature,s.source_cluster=row.source_cluster,s.source_subcluster=row.source_subcluster,
      s.education_requirement=row.education_requirement,s.minimum_entry_stage=row.minimum_entry_stage,s.recommended_pathway=row.recommended_pathway,
      s.core_qualifications=row.core_qualifications,s.governance_status=row.governance_status,s.version=row.version,s.source=row.source_document,
      s.updated_at=datetime(),s.updated_by='rsa-finalized-loader'
  MERGE (s)-[:BELONGS_TO_UNIVERSE]->(u) MERGE (s)-[r:CONTAINED_IN]->(d) SET r.ontology_version=row.version; } IN TRANSACTIONS OF 100 ROWS;
LOAD CSV WITH HEADERS FROM 'file:///rsa/law_v1_0_career_outcomes.csv' AS row
CALL (row) { MATCH (u:Universe {universe_code:row.universe_code}) MERGE (c:CareerOutcome {career_outcome_code:row.career_outcome_code})
  ON CREATE SET c.id=randomUUID(),c.created_at=datetime(),c.created_by='rsa-finalized-loader'
  SET c.name=row.name,c.governance_status=row.governance_status,c.version=row.version,c.source=row.source_document,c.updated_at=datetime(),c.updated_by='rsa-finalized-loader'
  MERGE (c)-[:BELONGS_TO_UNIVERSE]->(u); } IN TRANSACTIONS OF 100 ROWS;
LOAD CSV WITH HEADERS FROM 'file:///rsa/law_v1_0_stream_career_links.csv' AS row
MATCH (s:Stream {stream_code:row.stream_code}) MATCH (c:CareerOutcome {career_outcome_code:row.career_outcome_code})
MERGE (s)-[r:LEADS_TO]->(c) SET r.ontology_version=row.version,r.source=row.source_document;

UNWIND ['UNI-COMMERCE','UNI-HUMANITIES','UNI-MANAGEMENT','UNI-LAW'] AS code
MATCH (u:Universe {universe_code:code})
SET u.instance_data_status='Validated baseline',u.updated_at=datetime(),u.updated_by='rsa-finalized-loader',u.last_refreshed=date();
