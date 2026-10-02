#!/usr/bin/env bash
set -euo pipefail

ENV_FILE="${RSA_POC_ENV_FILE:-infrastructure/.env.poc}"
COMPOSE=(docker compose --env-file "$ENV_FILE" -f docker-compose.yml -f docker-compose.poc.yml)
ACTION="${1:-help}"

require_environment() {
  if [[ ! -f "$ENV_FILE" ]]; then
    echo "Missing $ENV_FILE." >&2
    echo "Run: cp infrastructure/.env.poc.example $ENV_FILE" >&2
    exit 1
  fi

  command -v docker >/dev/null 2>&1 || {
    echo "Docker is not available. Start Docker Desktop and enable Ubuntu WSL integration." >&2
    exit 1
  }
  docker compose version >/dev/null

  if grep -q "replace-with-" "$ENV_FILE"; then
    echo "Replace every placeholder secret in $ENV_FILE before starting." >&2
    exit 1
  fi
}

case "$ACTION" in
  config)
    require_environment
    "${COMPOSE[@]}" config
    ;;
  pull)
    require_environment
    "${COMPOSE[@]}" pull
    ;;
  up)
    require_environment
    available_kib=$(awk '/MemAvailable/ {print $2}' /proc/meminfo)
    if (( available_kib < 6 * 1024 * 1024 )); then
      echo "Warning: less than 6 GiB is free inside WSL. Close memory-heavy Windows apps first." >&2
    fi
    "${COMPOSE[@]}" config --quiet
    "${COMPOSE[@]}" pull
    "${COMPOSE[@]}" up -d
    bash scripts/infrastructure/verify-stack.sh "$ENV_FILE"
    ;;
  down)
    require_environment
    "${COMPOSE[@]}" down
    ;;
  status)
    require_environment
    "${COMPOSE[@]}" ps
    ;;
  logs)
    require_environment
    "${COMPOSE[@]}" logs -f --tail=100
    ;;
  destroy)
    echo "Destructive action intentionally not automated." >&2
    echo "After exporting needed data, explicitly run the two-file Compose command with: down --volumes" >&2
    exit 2
    ;;
  *)
    echo "Usage: bash scripts/infrastructure/poc.sh {config|pull|up|down|status|logs}" >&2
    exit 2
    ;;
esac
