#!/usr/bin/env bash
set -euo pipefail

ENV_FILE="${1:-infrastructure/.env}"

if [[ ! -f "$ENV_FILE" ]]; then
  echo "Missing $ENV_FILE. Copy infrastructure/.env.example and fill it in." >&2
  exit 1
fi

for command_name in docker awk df findmnt; do
  command -v "$command_name" >/dev/null 2>&1 || {
    echo "Required command is missing: $command_name" >&2
    exit 1
  }
done

docker compose version >/dev/null

set -a
# shellcheck disable=SC1090
source "$ENV_FILE"
set +a

required=(RSA_DATA_ROOT RSA_BACKUP_ROOT NEO4J_PASSWORD QDRANT_API_KEY POSTGRES_PASSWORD)
for variable_name in "${required[@]}"; do
  if [[ -z "${!variable_name:-}" || "${!variable_name}" == replace-* ]]; then
    echo "Set a real value for $variable_name in $ENV_FILE" >&2
    exit 1
  fi
done

for data_path in "$RSA_DATA_ROOT" "$RSA_BACKUP_ROOT"; do
  if [[ "$data_path" != /* ]]; then
    echo "$data_path must be an absolute path on the server." >&2
    exit 1
  fi
  mkdir -p "$data_path"
  test -w "$data_path" || {
    echo "$data_path is not writable by $(id -un)." >&2
    exit 1
  }
done

available_kib=$(awk '/MemAvailable/ {print $2}' /proc/meminfo)
if (( available_kib < 56 * 1024 * 1024 )); then
  echo "Warning: less than 56 GiB is currently available; the 64 GB profile may swap." >&2
fi

data_free_kib=$(df -Pk "$RSA_DATA_ROOT" | awk 'NR==2 {print $4}')
if (( data_free_kib < 200 * 1024 * 1024 )); then
  echo "Warning: less than 200 GiB is free under RSA_DATA_ROOT." >&2
fi

if [[ "${RSA_BIND_ADDRESS:-127.0.0.1}" == "0.0.0.0" ]]; then
  echo "Refusing RSA_BIND_ADDRESS=0.0.0.0; use localhost or the Tailscale address." >&2
  exit 1
fi

docker compose --env-file "$ENV_FILE" config --quiet
echo "Preflight checks passed."
