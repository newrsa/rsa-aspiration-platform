\set ON_ERROR_STOP on

BEGIN;

CREATE TEMP TABLE stage_source_document (LIKE evidence.source_document INCLUDING DEFAULTS);
\copy stage_source_document (document_id,source_id,title,source_kind,authority_id,publisher,publication_date,canonical_url,file_name,content_hash,page_count,extracted_at,pipeline_version,categories,metadata) FROM '/tmp/rsa-ingestion/postgres_documents.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

INSERT INTO evidence.source_document
SELECT * FROM stage_source_document
ON CONFLICT (document_id) DO UPDATE SET
    title = EXCLUDED.title,
    canonical_url = EXCLUDED.canonical_url,
    extracted_at = EXCLUDED.extracted_at,
    pipeline_version = EXCLUDED.pipeline_version,
    categories = EXCLUDED.categories,
    metadata = EXCLUDED.metadata;

CREATE TEMP TABLE stage_content_chunk (LIKE evidence.content_chunk INCLUDING DEFAULTS);
\copy stage_content_chunk (chunk_id,document_id,chunk_index,locator_type,locator_start,locator_end,text_content,text_hash,word_count,categories,language_code) FROM '/tmp/rsa-ingestion/postgres_chunks.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

INSERT INTO evidence.content_chunk
SELECT * FROM stage_content_chunk
ON CONFLICT (chunk_id) DO UPDATE SET
    text_content = EXCLUDED.text_content,
    categories = EXCLUDED.categories,
    language_code = EXCLUDED.language_code;

CREATE TEMP TABLE stage_ontology_link_candidate (LIKE evidence.ontology_link_candidate INCLUDING DEFAULTS);
\copy stage_ontology_link_candidate (candidate_id,chunk_id,entity_label,reference_property,reference_code,matched_text,match_method,confidence,review_status,reviewer,reviewed_at,review_rationale) FROM '/tmp/rsa-ingestion/postgres_ontology_link_candidates.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');

INSERT INTO evidence.ontology_link_candidate
SELECT * FROM stage_ontology_link_candidate
ON CONFLICT (candidate_id) DO UPDATE SET
    matched_text = EXCLUDED.matched_text,
    match_method = EXCLUDED.match_method,
    confidence = EXCLUDED.confidence
WHERE evidence.ontology_link_candidate.review_status = 'proposed';

COMMIT;

SELECT 'source_documents' AS metric, count(*)::text AS value FROM evidence.source_document
UNION ALL
SELECT 'content_chunks', count(*)::text FROM evidence.content_chunk
UNION ALL
SELECT 'proposed_links', count(*)::text FROM evidence.ontology_link_candidate WHERE review_status='proposed';
