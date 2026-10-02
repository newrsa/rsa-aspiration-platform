# Unstructured Knowledge Ingestion

This module turns approved PDFs, web pages, and audio/video transcripts into
traceable evidence for the RSA Knowledge Platform. It does **not** allow a
document or web page to redefine the canonical ontology.

## Storage responsibilities

- **Postgres** is the canonical store for source versions, complete extracted
  text, chunks, ingestion runs, and review decisions.
- **Qdrant** stores embeddings plus the chunk citation payload used for semantic
  retrieval. Embedding generation is a separate, provider-controlled stage.
- **Neo4j** stores source-document and evidence-chunk metadata and only the
  ontology links that a reviewer has approved.
- **Raw files** remain outside Git in `ingestion/inbox/` or an external corpus
  location. Content hashes make every processed version identifiable.

## Trust boundary

All source content is untrusted input. Text found in a PDF, web page, transcript,
HTML comment, metadata field, or subtitle is treated as evidence text only. It
is never executed as an instruction, shell command, prompt, or configuration.

Automated ontology matches are written with `review_status=proposed`. The Neo4j
publisher only creates `SUPPORTED_BY_EVIDENCE` relationships for rows explicitly
changed to `approved`.

## Initial corpus

`config/source_catalog.json` registers the three supplied policy documents and
the eight official sites proposed for discovery. The website records are
deliberately conservative: a 403, timeout, stale URL, or restrictive robots rule
is a reason to pause or use an official export, never to bypass the publisher.

## Run the local extractor

Install the single PDF dependency in a virtual environment:

```bash
python -m pip install -r ingestion/requirements.txt
```

Place approved files in one directory, then run:

```bash
python scripts/ingestion/ingest_local.py \
  --catalog ingestion/config/source_catalog.json \
  --inbox /path/to/approved/files \
  --output datasets/ingestion
```

The current Windows POC can use:

```powershell
python scripts/ingestion/ingest_local.py `
  --catalog ingestion/config/source_catalog.json `
  --inbox C:\Users\Anvit\Downloads `
  --output datasets/ingestion
```

Generated files include:

- `documents.jsonl` - immutable source-version metadata;
- `chunks.jsonl` - complete extracted text with page/time provenance;
- `ontology_link_candidates.jsonl` - review queue;
- `postgres_*.csv` - canonical text-store import files;
- `neo4j_*.csv` - document/chunk metadata and reviewed graph links;
- `run_report.json` - counts, hashes, extraction warnings, and failures.

## Publication sequence

1. Extract and inspect `run_report.json`.
2. Review text quality and quarantine malformed or scanned sources.
3. Review ontology-link candidates; approve only evidence-backed mappings.
4. Load the Postgres schema and import full text.
5. Load Neo4j evidence metadata and approved relationships.
6. Generate embeddings and upsert chunks into Qdrant.
7. Run citation and retrieval acceptance tests before enabling answers.

See `docs/architecture/unstructured-ingestion.md` for the graph and retrieval
contract.
