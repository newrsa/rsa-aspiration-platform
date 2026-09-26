# Phase 1 Deployment Runbook

## Host baseline

- Ubuntu Server LTS, fully patched.
- Docker Engine with the Compose plugin.
- Local NVMe mounted persistently at `/srv/rsa`.
- External backup disk mounted persistently at `/mnt/rsa-backups`.
- Tailscale installed before database ports are made remotely reachable.
- NTP enabled and UPS shutdown integration configured.

Verify mount identities with `findmnt` before the first start and after every reboot. A missing mount can otherwise cause Docker to write database files to the smaller OS filesystem.

## Deployment order

1. Clone the repository onto the NVMe-backed filesystem.
2. Copy `infrastructure/.env.example` to `infrastructure/.env`.
3. Generate unique Neo4j, Qdrant, and Postgres secrets.
4. Set absolute `RSA_DATA_ROOT` and `RSA_BACKUP_ROOT` paths.
5. Install and authenticate Tailscale.
6. Set `RSA_BIND_ADDRESS` and `RSA_ADVERTISED_HOST` to the Tailscale address or MagicDNS name.
7. Run `scripts/infrastructure/preflight.sh`.
8. Pull the pinned images and start the stack.
9. Run `scripts/infrastructure/verify-stack.sh`.
10. Load the seed data and run the Neo4j validation notebook.
11. Run and verify the first backup before ingesting source data.

## Upgrades

1. Read all three vendors' release notes.
2. Take and test a backup.
3. Change one exact image tag at a time.
4. Start the changed service and run its health and smoke checks.
5. Record the upgrade in an ADR or operations log.

Never use floating tags such as `latest`, `community`, `v1`, or `17-alpine` in a reviewed deployment.

## Recovery posture

- Neo4j uses an offline `neo4j-admin database dump` in Phase 1 because downtime is acceptable and it works with Community Edition.
- Qdrant uses collection snapshots requested through its API.
- Postgres uses a logical custom-format `pg_dump`.
- Copy completed backup artifacts from the working backup directory to the external disk and periodically to an off-site location.
- Perform a restore drill at least quarterly and after any database major-version upgrade.
