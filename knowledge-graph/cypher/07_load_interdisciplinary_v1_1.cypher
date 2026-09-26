// Load the authoritative 16-domain / 38-stream Interdisciplinary v1.1 registry.
// Copy interdisciplinary_v1_1_*.csv into <neo4j-import>/rsa/ first.

LOAD CSV WITH HEADERS FROM 'file:///rsa/interdisciplinary_v1_1_domains.csv' AS row
CALL (row) {
  MATCH (u:Universe {universe_code:row.universe_code})
  MERGE (d:Domain:IntegrationDomain {domain_code:row.domain_code})
  ON CREATE SET d.id=randomUUID(),d.created_at=datetime(),d.created_by='rsa-v1.1-loader'
  SET d.integration_domain_code=row.integration_domain_code,d.name=row.name,
      d.integration_nature=row.integration_nature,d.description=row.description,
      d.baseline_stream_count=toInteger(row.baseline_stream_count),
      d.governance_status=row.governance_status,d.version=row.version,
      d.source=row.source_document,d.updated_at=datetime(),d.updated_by='rsa-v1.1-loader',
      d.refresh_frequency='Annual',d.last_refreshed=date(),d.data_owner='ontology_team'
  MERGE (d)-[:BELONGS_TO_UNIVERSE]->(u);
} IN TRANSACTIONS OF 100 ROWS;

LOAD CSV WITH HEADERS FROM 'file:///rsa/interdisciplinary_v1_1_parent_disciplines.csv' AS row
CALL (row) {
  MERGE (p:ParentDiscipline:MultiUniverse {parent_discipline_code:row.parent_discipline_code})
  ON CREATE SET p.id=randomUUID(),p.created_at=datetime(),p.created_by='rsa-v1.1-loader'
  SET p.name=row.name,p.governance_status=row.governance_status,p.version=row.version,
      p.source=row.source_document,p.updated_at=datetime(),p.updated_by='rsa-v1.1-loader',
      p.refresh_frequency='Static',p.last_refreshed=date(),p.data_owner='ontology_team';
} IN TRANSACTIONS OF 100 ROWS;

LOAD CSV WITH HEADERS FROM 'file:///rsa/interdisciplinary_v1_1_streams.csv' AS row
CALL (row) {
  MATCH (u:Universe {universe_code:row.universe_code})
  MATCH (d:Domain:IntegrationDomain {domain_code:row.domain_code})
  MERGE (s:Stream {stream_code:row.stream_code})
  ON CREATE SET s.id=randomUUID(),s.created_at=datetime(),s.created_by='rsa-v1.1-loader'
  SET s:InterdisciplinaryStream,
      s.name=row.name,s.parent_disciplines_raw=row.parent_disciplines_raw,
      s.hybrid_cluster=row.hybrid_cluster,s.structured_courses=row.structured_courses,
      s.eligibility_summary=row.eligibility,s.entry_stage=row.entry_stage,
      s.institutions_ecosystem=row.institutions_ecosystem,s.entrance_route=row.entrance_route,
      s.core_skills_raw=row.core_skills,s.preparation_8_12=row.preparation_8_12,
      s.salary_revenue_raw=row.salary_revenue_raw,s.work_mode=row.work_mode,
      s.enterprise_scope=row.enterprise_scope,s.ai_technology_exposure=row.ai_technology_exposure,
      s.portfolio_requirement=row.portfolio_requirement,s.mission_relevance=row.mission_relevance,
      s.career_maturity=row.career_maturity,s.source_url=row.source_url,
      s.path_type='Interdisciplinary',s.governance_status=row.governance_status,
      s.version=row.version,s.source=row.source_document,s.updated_at=datetime(),
      s.updated_by='rsa-v1.1-loader',s.refresh_frequency='Annual',s.last_refreshed=date(),
      s.data_owner='ontology_team'
  MERGE (s)-[:BELONGS_TO_UNIVERSE]->(u)
  MERGE (s)-[parent:CONTAINED_IN]->(d)
  SET parent.primary=true,parent.ontology_version='1.1'
  MERGE (c:CareerOutcome {career_outcome_code:row.career_outcome_code})
  ON CREATE SET c.id=randomUUID(),c.created_at=datetime(),c.created_by='rsa-v1.1-loader'
  SET c.name=row.name,c.description=row.hybrid_cluster,c.work_mode=[row.work_mode],
      c.salary_revenue_raw=row.salary_revenue_raw,c.career_maturity=row.career_maturity,
      c.source_url=row.source_url,c.governance_status=row.governance_status,c.version=row.version,
      c.source=row.source_document,c.updated_at=datetime(),c.updated_by='rsa-v1.1-loader',
      c.refresh_frequency='Annual',c.last_refreshed=date(),c.data_owner='ontology_team'
  MERGE (c)-[:BELONGS_TO_UNIVERSE]->(u)
  MERGE (s)-[lead:LEADS_TO]->(c)
  SET lead.ontology_version='1.1',lead.source=row.source_document,lead.updated_at=datetime();
} IN TRANSACTIONS OF 100 ROWS;

LOAD CSV WITH HEADERS FROM 'file:///rsa/interdisciplinary_v1_1_stream_parent_links.csv' AS row
MATCH (s:Stream:InterdisciplinaryStream {stream_code:row.stream_code})
MATCH (p:ParentDiscipline {parent_discipline_code:row.parent_discipline_code})
MERGE (s)-[r:HAS_PARENT_DISCIPLINE]->(p)
SET r.contribution_type=row.contribution_type,r.ontology_version='1.1'
FOREACH (_ IN CASE WHEN row.contribution_type='Primary' THEN [1] ELSE [] END |
  MERGE (s)-[:HAS_PRIMARY_DISCIPLINE]->(p))
FOREACH (_ IN CASE WHEN row.contribution_type='Secondary' THEN [1] ELSE [] END |
  MERGE (s)-[:HAS_SECONDARY_DISCIPLINE]->(p));

LOAD CSV WITH HEADERS FROM 'file:///rsa/interdisciplinary_v1_1_domain_parent_links.csv' AS row
MATCH (d:Domain:IntegrationDomain {domain_code:row.domain_code})
MATCH (p:ParentDiscipline {parent_discipline_code:row.parent_discipline_code})
MERGE (d)-[r:HAS_PARENT_DISCIPLINE]->(p)
SET r.ontology_version='1.1';

// Mark the instance data validated only after all five input files have loaded.
MATCH (u:Universe {universe_code:'UNI-INTERDISCIPLINARY'})
SET u.instance_data_status='Validated',u.updated_at=datetime(),u.updated_by='rsa-v1.1-loader';
