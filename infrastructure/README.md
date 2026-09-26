# RSA Data Infrastructure

This package runs the Phase 1 data plane: Neo4j, Qdrant, and Postgres. The same application-level connection variables are used for the local stack and the free-tier team slice.

## Pinned runtime

| Store | Image | Host ports | Memory ceiling |
|---|---|---:|---:|
| Neo4j Community | `neo4j:2026.09.0-community` | 7474, 7687 | 40 GB |
| Qdrant | `qdrant/qdrant:v1.19.1` | 6333, 6334 | 12 GB |
| Postgres | `postgres:17.10-alpine3.24` | 5432 | 4 GB |

Neo4j receives an 8 GB fixed heap and 28 GB page cache. The combined container ceilings are 56 GB, leaving about 8 GB of a 64 GB host for Ubuntu, Docker, filesystem cache, and ingestion processes.

## First deployment

Run from the repository root on Ubuntu:

```bash
cp infrastructure/.env.example infrastructure/.env
chmod 600 infrastructure/.env
# Edit the paths, host binding, and all three secrets.
sudo mkdir -p /srv/rsa/data/{neo4j/data,neo4j/logs,qdrant/storage,postgres}
sudo mkdir -p /mnt/rsa-backups/{neo4j,qdrant,postgres}
sudo chown -R "$USER":"$USER" /srv/rsa /mnt/rsa-backups
bash scripts/infrastructure/preflight.sh infrastructure/.env
docker compose --env-file infrastructure/.env pull
docker compose --env-file infrastructure/.env up -d
bash scripts/infrastructure/verify-stack.sh infrastructure/.env
```

For a laptop prototype, change `RSA_DATA_ROOT` and `RSA_BACKUP_ROOT` to writable local directories. On Docker Desktop, relative paths under `infrastructure/` are simplest.

## Network model

The services share an internal Docker bridge. Published ports bind to `RSA_BIND_ADDRESS`, which defaults to `127.0.0.1`. On the home server, install Tailscale first and set this value to the server's Tailscale IPv4 address. Do not use `0.0.0.0` on a residential network.

## Operations

```bash
# Status and logs
docker compose --env-file infrastructure/.env ps
docker compose --env-file infrastructure/.env logs -f --tail=100

# Stop without deleting persisted data
docker compose --env-file infrastructure/.env down

# Back up all stores to RSA_BACKUP_ROOT
bash scripts/infrastructure/backup.sh infrastructure/.env
```

Never run `docker compose down -v` for this stack. The deployment uses bind mounts, but treating volume deletion as forbidden is a useful operational guardrail.

See [deployment-runbook.md](deployment-runbook.md), [cloud-slice.md](cloud-slice.md), and [tailscale.md](tailscale.md).
