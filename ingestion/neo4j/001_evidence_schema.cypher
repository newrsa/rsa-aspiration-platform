// Evidence-layer constraints. These labels do not redefine SCC domain entities.
CREATE CONSTRAINT source_document_id_unique IF NOT EXISTS
FOR (n:SourceDocument) REQUIRE n.document_id IS UNIQUE;

CREATE CONSTRAINT evidence_chunk_id_unique IF NOT EXISTS
FOR (n:EvidenceChunk) REQUIRE n.chunk_id IS UNIQUE;

CREATE INDEX source_document_source_id IF NOT EXISTS
FOR (n:SourceDocument) ON (n.source_id);

CREATE INDEX evidence_chunk_document_id IF NOT EXISTS
FOR (n:EvidenceChunk) ON (n.document_id);

CREATE FULLTEXT INDEX evidence_chunk_excerpt IF NOT EXISTS
FOR (n:EvidenceChunk) ON EACH [n.excerpt];
