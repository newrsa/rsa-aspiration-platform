// Expected import files are generated under datasets/ingestion, which is
// available as file:///ingestion/ in the Docker POC's Neo4j import mount.

LOAD CSV WITH HEADERS FROM 'file:///ingestion/neo4j_documents.csv' AS row
MERGE (d:Evidence:SourceDocument {document_id: row.document_id})
SET d.source_id = row.source_id,
    d.title = row.title,
    d.source_kind = row.source_kind,
    d.authority_id = row.authority_id,
    d.publisher = row.publisher,
    d.publication_date = row.publication_date,
    d.canonical_url = row.canonical_url,
    d.content_hash = row.content_hash,
    d.extracted_at = datetime(row.extracted_at),
    d.pipeline_version = row.pipeline_version;

LOAD CSV WITH HEADERS FROM 'file:///ingestion/neo4j_chunks.csv' AS row
MATCH (d:SourceDocument {document_id: row.document_id})
MERGE (c:Evidence:EvidenceChunk {chunk_id: row.chunk_id})
SET c.document_id = row.document_id,
    c.chunk_index = toInteger(row.chunk_index),
    c.locator_type = row.locator_type,
    c.locator_start = row.locator_start,
    c.locator_end = row.locator_end,
    c.excerpt = row.excerpt,
    c.text_hash = row.text_hash,
    c.categories = split(row.categories, '|')
MERGE (d)-[:HAS_CHUNK]->(c);

// Dynamic label/property matching is supported by the pinned Neo4j runtime.
// Proposed rows are deliberately ignored: only reviewed approvals become graph edges.
LOAD CSV WITH HEADERS FROM 'file:///ingestion/neo4j_approved_links.csv' AS row
WITH row WHERE row.review_status = 'approved'
MATCH (c:EvidenceChunk {chunk_id: row.chunk_id})
MATCH (n:$(row.entity_label))
WHERE n[row.reference_property] = row.reference_code
MERGE (n)-[r:SUPPORTED_BY_EVIDENCE]->(c)
SET r.candidate_id = row.candidate_id,
    r.reviewed_at = datetime(row.reviewed_at),
    r.reviewer = row.reviewer,
    r.confidence = toFloat(row.confidence);
