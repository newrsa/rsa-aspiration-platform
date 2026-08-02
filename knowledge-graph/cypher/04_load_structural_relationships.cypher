// Universe, hierarchy and career-path relationships from canonical CSVs.

LOAD CSV WITH HEADERS FROM 'file:///rsa/domains.csv' AS row
MATCH (n:Domain {domain_code:trim(row.domain_code)})
MATCH (u:Universe {universe_code:trim(row.universe_code)})
MERGE (n)-[:BELONGS_TO_UNIVERSE]->(u);

LOAD CSV WITH HEADERS FROM 'file:///rsa/streams.csv' AS row
MATCH (n:Stream {stream_code:trim(row.stream_code)})
MATCH (d:Domain {domain_code:trim(row.domain_code)})
MATCH (u:Universe {universe_code:trim(row.universe_code)})
MERGE (n)-[:BELONGS_TO_UNIVERSE]->(u)
MERGE (n)-[r:CONTAINED_IN]->(d)
ON CREATE SET r.primary=true;

LOAD CSV WITH HEADERS FROM 'file:///rsa/career_outcomes.csv' AS row
MATCH (n:CareerOutcome {career_outcome_code:trim(row.career_outcome_code)})
MATCH (u:Universe {universe_code:trim(row.universe_code)})
MERGE (n)-[:BELONGS_TO_UNIVERSE]->(u);

LOAD CSV WITH HEADERS FROM 'file:///rsa/entrance_exams.csv' AS row
MATCH (n:EntranceExam {entrance_exam_code:trim(row.entrance_exam_code)})
MATCH (u:Universe {universe_code:trim(row.universe_code)})
MERGE (n)-[:BELONGS_TO_UNIVERSE]->(u);

LOAD CSV WITH HEADERS FROM 'file:///rsa/degrees.csv' AS row
MATCH (n:Degree {degree_code:trim(row.degree_code)})
MATCH (u:Universe {universe_code:trim(row.universe_code)})
MERGE (n)-[:BELONGS_TO_UNIVERSE]->(u);

LOAD CSV WITH HEADERS FROM 'file:///rsa/institutions.csv' AS row
MATCH (n:Institution {institution_code:trim(row.institution_code)})
MATCH (u:Universe {universe_code:trim(row.universe_code)})
MERGE (n)-[:BELONGS_TO_UNIVERSE]->(u);

LOAD CSV WITH HEADERS FROM 'file:///rsa/stream_career_relationships.csv' AS row
MATCH (s:Stream {stream_code:trim(row.stream_code)})
MATCH (c:CareerOutcome {career_outcome_code:trim(row.career_outcome_code)})
MERGE (s)-[r:LEADS_TO]->(c)
SET r.source_record_code=row.source_record_code,r.updated_at=datetime();
