#!/usr/bin/env bash
set -euo pipefail

ENV_FILE="${RSA_POC_ENV_FILE:-infrastructure/.env.poc}"
OUTPUT_DIR="${RSA_INGESTION_OUTPUT:-datasets/ingestion}"

if [[ ! -f "$ENV_FILE" ]]; then
  echo "Missing $ENV_FILE. Start with the Docker POC setup." >&2
  exit 1
fi
if [[ ! -f "$OUTPUT_DIR/run_report.json" ]]; then
  echo "Missing generated ingestion output in $OUTPUT_DIR." >&2
  exit 1
fi

set -a
# shellcheck disable=SC1090
source "$ENV_FILE"
set +a

for container in rsa-postgres rsa-neo4j rsa-qdrant; do
  if [[ "$(docker inspect -f '{{.State.Running}}' "$container" 2>/dev/null || true)" != "true" ]]; then
    echo "$container is not running. Start the POC stack first." >&2
    exit 1
  fi
done

echo "Loading canonical extracted text into Postgres..."
docker exec rsa-postgres mkdir -p /tmp/rsa-ingestion
for file in postgres_documents.csv postgres_chunks.csv postgres_ontology_link_candidates.csv; do
  docker cp "$OUTPUT_DIR/$file" "rsa-postgres:/tmp/rsa-ingestion/$file"
done
docker exec -i \
  -e PGPASSWORD="$POSTGRES_PASSWORD" \
  rsa-postgres psql -v ON_ERROR_STOP=1 -U "${POSTGRES_USER:-rsa_app}" -d "${POSTGRES_DB:-rsa}" \
  < ingestion/postgres/001_evidence_schema.sql
docker exec -i \
  -e PGPASSWORD="$POSTGRES_PASSWORD" \
  rsa-postgres psql -v ON_ERROR_STOP=1 -U "${POSTGRES_USER:-rsa_app}" -d "${POSTGRES_DB:-rsa}" \
  < ingestion/postgres/002_import_from_container.sql

echo "Loading evidence metadata into Neo4j..."
docker exec -i rsa-neo4j cypher-shell -u neo4j -p "$NEO4J_PASSWORD" \
  < ingestion/neo4j/001_evidence_schema.cypher
docker exec -i rsa-neo4j cypher-shell -u neo4j -p "$NEO4J_PASSWORD" \
  < ingestion/neo4j/002_load_evidence.cypher

echo "Verifying evidence counts..."
docker exec -i rsa-neo4j cypher-shell -u neo4j -p "$NEO4J_PASSWORD" \
  "MATCH (d:SourceDocument) WITH count(d) AS documents MATCH (c:EvidenceChunk) RETURN documents, count(c) AS chunks;"

echo "Qdrant publication is intentionally deferred until an embedding model and vector dimensions are approved."
echo "Postgres text and Neo4j evidence metadata are loaded. Proposed ontology links still require review."
