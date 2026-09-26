// Canonical CSV node loader — Neo4j 5.x.
// Copy the package data/*.csv files into <neo4j-import>/rsa/ before execution.

LOAD CSV WITH HEADERS FROM 'file:///rsa/source_records.csv' AS row
CALL (row) {
  WITH row WHERE trim(row.source_record_code) <> ''
  MERGE (n:SourceRecord {source_record_code: trim(row.source_record_code)})
  ON CREATE SET n.id=randomUUID(), n.created_at=datetime(), n.created_by='rsa-canonical-loader'
  SET n.source_workbook=row.source_workbook, n.source_sheet=row.source_sheet,
      n.source_row=toInteger(row.source_row), n.source_url=row.source_url,
      n.content_hash=row.content_hash, n.raw_json=row.raw_json,
      n.updated_at=datetime(), n.updated_by='rsa-canonical-loader';
} IN TRANSACTIONS OF 1000 ROWS;

LOAD CSV WITH HEADERS FROM 'file:///rsa/domains.csv' AS row
CALL (row) {
  WITH row WHERE trim(row.domain_code) <> ''
  MERGE (n:Domain {domain_code:trim(row.domain_code)})
  ON CREATE SET n.id=randomUUID(),n.created_at=datetime(),n.created_by='rsa-canonical-loader'
  SET n.name=row.name,n.description=row.description,n.governance_status=row.governance_status,
      n.version=row.version,n.source=row.source_workbook,n.updated_at=datetime(),
      n.updated_by='rsa-canonical-loader',n.refresh_frequency='Annual',n.last_refreshed=date(),n.data_owner='ontology_team';
} IN TRANSACTIONS OF 1000 ROWS;

LOAD CSV WITH HEADERS FROM 'file:///rsa/streams.csv' AS row
CALL (row) {
  WITH row WHERE trim(row.stream_code) <> ''
  MERGE (n:Stream {stream_code:trim(row.stream_code)})
  ON CREATE SET n.id=randomUUID(),n.created_at=datetime(),n.created_by='rsa-canonical-loader'
  SET n.name=row.name,n.description=row.description,n.path_type=row.path_type,
      n.governance_status=row.governance_status,n.version=row.version,n.source=row.source_workbook,
      n.updated_at=datetime(),n.updated_by='rsa-canonical-loader',n.refresh_frequency='Annual',
      n.last_refreshed=date(),n.data_owner='ontology_team';
} IN TRANSACTIONS OF 1000 ROWS;

LOAD CSV WITH HEADERS FROM 'file:///rsa/career_outcomes.csv' AS row
CALL (row) {
  WITH row WHERE trim(row.career_outcome_code) <> ''
  MERGE (n:CareerOutcome {career_outcome_code:trim(row.career_outcome_code)})
  ON CREATE SET n.id=randomUUID(),n.created_at=datetime(),n.created_by='rsa-canonical-loader'
  SET n.name=row.name,n.description=row.description,n.governance_status=row.governance_status,
      n.version=row.version,n.source=row.source_workbook,n.updated_at=datetime(),
      n.updated_by='rsa-canonical-loader',n.refresh_frequency='Annual',n.last_refreshed=date(),n.data_owner='ontology_team';
} IN TRANSACTIONS OF 1000 ROWS;

LOAD CSV WITH HEADERS FROM 'file:///rsa/entrance_exams.csv' AS row
CALL (row) {
  WITH row WHERE trim(row.entrance_exam_code) <> ''
  MERGE (n:EntranceExam {entrance_exam_code:trim(row.entrance_exam_code)})
  ON CREATE SET n.id=randomUUID(),n.created_at=datetime(),n.created_by='rsa-canonical-loader'
  SET n.name=row.name,n.exam_level=row.level,n.eligibility_snapshot=row.eligibility_snapshot,
      n.conducting_body=row.conducting_body,n.source_url=row.source_url,
      n.governance_status=row.governance_status,n.version=row.version,n.source=row.source_workbook,
      n.updated_at=datetime(),n.updated_by='rsa-canonical-loader',n.refresh_frequency='Annual',
      n.last_refreshed=date(),n.data_owner='ontology_team';
} IN TRANSACTIONS OF 1000 ROWS;

LOAD CSV WITH HEADERS FROM 'file:///rsa/skills.csv' AS row
CALL (row) {
  WITH row WHERE trim(row.skill_code) <> ''
  MERGE (n:Skill:MultiUniverse {skill_code:trim(row.skill_code)})
  ON CREATE SET n.id=randomUUID(),n.created_at=datetime(),n.created_by='rsa-canonical-loader'
  SET n.name=row.name,n.category=row.category,n.description=row.description,
      n.governance_status=row.governance_status,n.version=row.version,n.source=row.source_workbook,
      n.updated_at=datetime(),n.updated_by='rsa-canonical-loader',n.refresh_frequency='Static',
      n.last_refreshed=date(),n.data_owner='ontology_team';
} IN TRANSACTIONS OF 1000 ROWS;

LOAD CSV WITH HEADERS FROM 'file:///rsa/degrees.csv' AS row
CALL (row) {
  WITH row WHERE trim(row.degree_code) <> ''
  MERGE (n:Degree {degree_code:trim(row.degree_code)})
  ON CREATE SET n.id=randomUUID(),n.created_at=datetime(),n.created_by='rsa-canonical-loader'
  SET n.name=row.name,n.degree_level=row.degree_level,n.typical_duration=row.duration,
      n.eligibility_snapshot=row.eligibility_snapshot,n.source_url=row.source_url,
      n.governance_status=row.governance_status,n.version=row.version,n.source=row.source_workbook,
      n.updated_at=datetime(),n.updated_by='rsa-canonical-loader',n.refresh_frequency='Annual',
      n.last_refreshed=date(),n.data_owner='ontology_team';
} IN TRANSACTIONS OF 1000 ROWS;

LOAD CSV WITH HEADERS FROM 'file:///rsa/institutions.csv' AS row
CALL (row) {
  WITH row WHERE trim(row.institution_code) <> ''
  MERGE (n:Institution {institution_code:trim(row.institution_code)})
  ON CREATE SET n.id=randomUUID(),n.created_at=datetime(),n.created_by='rsa-canonical-loader'
  SET n.name=row.name,n.institution_type_text=row.institution_type,n.source_url=row.source_url,
      n.governance_status=row.governance_status,n.version=row.version,n.source=row.source_workbook,
      n.updated_at=datetime(),n.updated_by='rsa-canonical-loader',n.refresh_frequency='Annual',
      n.last_refreshed=date(),n.data_owner='ontology_team';
} IN TRANSACTIONS OF 1000 ROWS;
