# ADR-005: Own the Build Plane, Move the Serving Plane Later

- **Status:** Accepted
- **Date:** 2026-09-26
- **Decision owners:** RSA platform team

## Context

RSA's present workload is graph construction, corpus ingestion, and internal development. It has no external uptime or service-level requirement. Customer-facing serving will later require stronger availability, network, security, and data-protection controls than a residential deployment can provide.

## Decision

Phase 1 runs the authoritative ingestion data plane on an RSA-owned Ubuntu server with directly attached NVMe storage. Neo4j, Qdrant, and Postgres run as pinned Docker Compose services. Team access uses Tailscale, and a small managed cloud slice holds only representative development data.

When external serving begins, the serving plane moves to managed services or cloud-hosted containers. The owned server remains the authoritative ingestion and data-production machine until a later ADR changes that responsibility.

Application code addresses stores through a stable environment-variable contract, so deployment location is configuration rather than application logic.

## Consequences

- Phase 1 avoids recurring infrastructure spend while preserving reproducibility.
- RSA owns hardware maintenance, patching, backup validation, UPS behavior, and physical security.
- The home server must never be treated as a customer-serving production endpoint.
- Persistent data lives outside containers on local NVMe; backups live on separately mounted storage.
- Database ports are exposed only on localhost or the Tailscale interface.
- Image upgrades are explicit changes to exact tags and require backup plus smoke validation.

## Revisit triggers

Revisit this decision before the first external user, when uptime commitments appear, when regulated personal data enters the platform, or when ingestion throughput exceeds the owned server's measured capacity.
