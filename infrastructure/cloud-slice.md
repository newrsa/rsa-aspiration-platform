# Free-Tier Team Slice

The cloud slice is a small protocol-compatible development target. It is not the authoritative graph and must contain only the approved seed subset.

## Provisioning checklist

1. Create one Neo4j Aura Free instance and record its `neo4j+s://` URI, user, and generated password.
2. Create one Qdrant Cloud Free cluster and a scoped API key.
3. Create one managed Postgres project in Neon or Supabase and copy its TLS connection string.
4. Copy `.env.cloud.example` to an untracked `.env.cloud` file or place the values in the team's secret manager.
5. Give each developer individual provider access where supported. Avoid sending secrets in chat.
6. Load only the RSA seed dataset or one aspiration category.
7. Run connection smoke tests from the ingestion application before team hand-off.

## Environment contract

Application code must use only these names:

- `NEO4J_URI`, `NEO4J_USER`, `NEO4J_PASSWORD`
- `QDRANT_URL`, `QDRANT_API_KEY`
- `DATABASE_URL`

Switching between local and cloud environments must require changing environment values only. No provider-specific hostnames or credentials belong in source code.

## Boundary

Creating provider accounts, accepting terms, choosing regions, and storing recovery credentials requires an RSA-owned administrator. Those console actions cannot be safely automated from this repository. The repository supplies the exact environment contract and verification path used after provisioning.
