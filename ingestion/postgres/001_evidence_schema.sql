CREATE SCHEMA IF NOT EXISTS evidence;

CREATE TABLE IF NOT EXISTS evidence.ingestion_run (
    run_id text PRIMARY KEY,
    pipeline_version text NOT NULL,
    started_at timestamptz NOT NULL,
    completed_at timestamptz,
    status text NOT NULL CHECK (status IN ('running', 'completed', 'completed_with_errors', 'failed')),
    report jsonb NOT NULL DEFAULT '{}'::jsonb
);

CREATE TABLE IF NOT EXISTS evidence.source_document (
    document_id text PRIMARY KEY,
    source_id text NOT NULL,
    title text NOT NULL,
    source_kind text NOT NULL,
    authority_id text,
    publisher text,
    publication_date text,
    canonical_url text,
    file_name text,
    content_hash char(64) NOT NULL,
    page_count integer,
    extracted_at timestamptz NOT NULL,
    pipeline_version text NOT NULL,
    categories jsonb NOT NULL DEFAULT '[]'::jsonb,
    metadata jsonb NOT NULL DEFAULT '{}'::jsonb,
    UNIQUE (source_id, content_hash)
);

CREATE TABLE IF NOT EXISTS evidence.content_chunk (
    chunk_id text PRIMARY KEY,
    document_id text NOT NULL REFERENCES evidence.source_document(document_id) ON DELETE CASCADE,
    chunk_index integer NOT NULL,
    locator_type text NOT NULL,
    locator_start text NOT NULL,
    locator_end text NOT NULL,
    text_content text NOT NULL,
    text_hash char(64) NOT NULL,
    word_count integer NOT NULL,
    categories jsonb NOT NULL DEFAULT '[]'::jsonb,
    language_code text NOT NULL DEFAULT 'en',
    UNIQUE (document_id, chunk_index)
);

CREATE TABLE IF NOT EXISTS evidence.ontology_link_candidate (
    candidate_id text PRIMARY KEY,
    chunk_id text NOT NULL REFERENCES evidence.content_chunk(chunk_id) ON DELETE CASCADE,
    entity_label text NOT NULL,
    reference_property text NOT NULL,
    reference_code text NOT NULL,
    matched_text text NOT NULL,
    match_method text NOT NULL,
    confidence numeric(5,4) NOT NULL CHECK (confidence >= 0 AND confidence <= 1),
    review_status text NOT NULL DEFAULT 'proposed' CHECK (review_status IN ('proposed', 'approved', 'rejected', 'superseded')),
    reviewer text,
    reviewed_at timestamptz,
    review_rationale text,
    UNIQUE (chunk_id, entity_label, reference_code)
);

CREATE INDEX IF NOT EXISTS idx_evidence_document_source
    ON evidence.source_document (source_id, publication_date);
CREATE INDEX IF NOT EXISTS idx_evidence_chunk_document
    ON evidence.content_chunk (document_id, chunk_index);
CREATE INDEX IF NOT EXISTS idx_evidence_chunk_search
    ON evidence.content_chunk USING gin (to_tsvector('english', text_content));
CREATE INDEX IF NOT EXISTS idx_evidence_candidate_review
    ON evidence.ontology_link_candidate (review_status, entity_label, reference_code);
