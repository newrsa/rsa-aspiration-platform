#!/usr/bin/env bash
set -euo pipefail

ENV_FILE="${1:-infrastructure/.env}"
set -a
# shellcheck disable=SC1090
source "$ENV_FILE"
set +a

bind_address="${RSA_BIND_ADDRESS:-127.0.0.1}"

docker compose --env-file "$ENV_FILE" ps

curl --fail --silent --show-error \
  "http://${bind_address}:${NEO4J_HTTP_PORT:-7474}/" >/dev/null

curl --fail --silent --show-error \
  -H "api-key: ${QDRANT_API_KEY}" \
  "http://${bind_address}:${QDRANT_HTTP_PORT:-6333}/readyz" >/dev/null

docker compose --env-file "$ENV_FILE" exec -T postgres \
  pg_isready -U "${POSTGRES_USER:-rsa_app}" -d "${POSTGRES_DB:-rsa}"

docker compose --env-file "$ENV_FILE" exec -T neo4j \
  cypher-shell -u neo4j -p "$NEO4J_PASSWORD" "RETURN 1 AS ready;"

echo "Neo4j, Qdrant, and Postgres are ready."
