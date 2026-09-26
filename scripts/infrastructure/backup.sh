#!/usr/bin/env bash
set -euo pipefail

ENV_FILE="${1:-infrastructure/.env}"
set -a
# shellcheck disable=SC1090
source "$ENV_FILE"
set +a

timestamp=$(date -u +%Y%m%dT%H%M%SZ)
backup_root="${RSA_BACKUP_ROOT:?Set RSA_BACKUP_ROOT}"
mkdir -p "$backup_root/neo4j/$timestamp" "$backup_root/qdrant/$timestamp" "$backup_root/postgres/$timestamp"

echo "Creating Postgres logical backup..."
docker compose --env-file "$ENV_FILE" exec -T postgres \
  pg_dump -U "${POSTGRES_USER:-rsa_app}" -d "${POSTGRES_DB:-rsa}" -Fc \
  > "$backup_root/postgres/$timestamp/rsa.dump"

echo "Creating Qdrant collection snapshots..."
python3 scripts/infrastructure/qdrant-snapshot.py \
  --url "http://${RSA_BIND_ADDRESS:-127.0.0.1}:${QDRANT_HTTP_PORT:-6333}" \
  --manifest "$backup_root/qdrant/$timestamp/manifest.json"

echo "Stopping Neo4j for a consistent Community Edition dump..."
docker compose --env-file "$ENV_FILE" stop neo4j
restart_neo4j() {
  docker compose --env-file "$ENV_FILE" start neo4j >/dev/null
}
trap restart_neo4j EXIT

docker run --rm \
  -v "${RSA_DATA_ROOT:?Set RSA_DATA_ROOT}/neo4j/data:/data" \
  -v "$backup_root/neo4j/$timestamp:/backups" \
  neo4j/neo4j-admin:2026.09.0 \
  neo4j-admin database dump neo4j --to-path=/backups

restart_neo4j
trap - EXIT

echo "Backups completed under $backup_root at $timestamp."
