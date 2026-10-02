#!/usr/bin/env bash
set -euo pipefail

ENV_FILE="${1:-infrastructure/.env}"
set -a
# shellcheck disable=SC1090
source "$ENV_FILE"
set +a

bind_address="${RSA_BIND_ADDRESS:-127.0.0.1}"

docker compose --env-file "$ENV_FILE" ps

wait_for() {
  local label="$1"
  shift
  for attempt in $(seq 1 36); do
    if "$@" >/dev/null 2>&1; then
      echo "$label is ready."
      return 0
    fi
    sleep 5
  done
  echo "$label did not become ready within 180 seconds." >&2
  return 1
}

wait_for "Neo4j HTTP" curl --fail --silent --show-error \
  "http://${bind_address}:${NEO4J_HTTP_PORT:-7474}/"

wait_for "Qdrant" curl --fail --silent --show-error \
  -H "api-key: ${QDRANT_API_KEY}" \
  "http://${bind_address}:${QDRANT_HTTP_PORT:-6333}/readyz"

wait_for "Postgres" docker compose --env-file "$ENV_FILE" exec -T postgres \
  pg_isready -U "${POSTGRES_USER:-rsa_app}" -d "${POSTGRES_DB:-rsa}"

wait_for "Neo4j Bolt" docker compose --env-file "$ENV_FILE" exec -T neo4j \
  cypher-shell -u neo4j -p "$NEO4J_PASSWORD" "RETURN 1 AS ready;"

echo "Neo4j, Qdrant, and Postgres are ready."
