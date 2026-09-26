// Connect every mapped entity to the exact workbook row that supports it.
LOAD CSV WITH HEADERS FROM 'file:///rsa/entity_source_relationships.csv' AS row
CALL (row) {
  WITH row WHERE row.entity_type='Domain'
  MATCH (n:Domain {domain_code:row.entity_code}), (src:SourceRecord {source_record_code:row.source_record_code})
  MERGE (n)-[:SUPPORTED_BY_SOURCE]->(src);
} IN TRANSACTIONS OF 1000 ROWS;
LOAD CSV WITH HEADERS FROM 'file:///rsa/entity_source_relationships.csv' AS row
CALL (row) {
  WITH row WHERE row.entity_type='Stream'
  MATCH (n:Stream {stream_code:row.entity_code}), (src:SourceRecord {source_record_code:row.source_record_code})
  MERGE (n)-[:SUPPORTED_BY_SOURCE]->(src);
} IN TRANSACTIONS OF 1000 ROWS;
LOAD CSV WITH HEADERS FROM 'file:///rsa/entity_source_relationships.csv' AS row
CALL (row) {
  WITH row WHERE row.entity_type='CareerOutcome'
  MATCH (n:CareerOutcome {career_outcome_code:row.entity_code}), (src:SourceRecord {source_record_code:row.source_record_code})
  MERGE (n)-[:SUPPORTED_BY_SOURCE]->(src);
} IN TRANSACTIONS OF 1000 ROWS;
LOAD CSV WITH HEADERS FROM 'file:///rsa/entity_source_relationships.csv' AS row
CALL (row) {
  WITH row WHERE row.entity_type='EntranceExam'
  MATCH (n:EntranceExam {entrance_exam_code:row.entity_code}), (src:SourceRecord {source_record_code:row.source_record_code})
  MERGE (n)-[:SUPPORTED_BY_SOURCE]->(src);
} IN TRANSACTIONS OF 1000 ROWS;
LOAD CSV WITH HEADERS FROM 'file:///rsa/entity_source_relationships.csv' AS row
CALL (row) {
  WITH row WHERE row.entity_type='Skill'
  MATCH (n:Skill {skill_code:row.entity_code}), (src:SourceRecord {source_record_code:row.source_record_code})
  MERGE (n)-[:SUPPORTED_BY_SOURCE]->(src);
} IN TRANSACTIONS OF 1000 ROWS;
LOAD CSV WITH HEADERS FROM 'file:///rsa/entity_source_relationships.csv' AS row
CALL (row) {
  WITH row WHERE row.entity_type='Degree'
  MATCH (n:Degree {degree_code:row.entity_code}), (src:SourceRecord {source_record_code:row.source_record_code})
  MERGE (n)-[:SUPPORTED_BY_SOURCE]->(src);
} IN TRANSACTIONS OF 1000 ROWS;
LOAD CSV WITH HEADERS FROM 'file:///rsa/entity_source_relationships.csv' AS row
CALL (row) {
  WITH row WHERE row.entity_type='Institution'
  MATCH (n:Institution {institution_code:row.entity_code}), (src:SourceRecord {source_record_code:row.source_record_code})
  MERGE (n)-[:SUPPORTED_BY_SOURCE]->(src);
} IN TRANSACTIONS OF 1000 ROWS;
