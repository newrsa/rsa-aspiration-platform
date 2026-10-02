# RSA Aspiration Platform

The RSA Aspiration Platform combines an aspirant-facing conversational application with an ontology-driven, explainable career-intelligence foundation. The application interprets natural-language career questions, maps them to reviewed read-only Cypher templates, queries Neo4j, and presents grounded pathway results with confidence information.

## What is included

- Aspirant chatbot and leadership dashboard.
- Local NLP intent and entity router with no model cost.
- Server-side Neo4j connection; credentials never enter browser code.
- Approved, parameterized, read-only graph queries.
- Complete multi-universe knowledge-graph package under `knowledge-graph/`.
- Science ontology, implementation standards, and structural test sources under `ontology/`.
- Machine-readable semantic registry and generated Neo4j runtime assets.
- Docker-based Neo4j, Qdrant, and Postgres infrastructure for the build and ingestion phase.

## Repository map

- `app/`, `lib/`, `db/`, and `server/` — web application, NLP routing, data access, and local serving.
- `knowledge-graph/` — current multi-universe graph design, canonical data, migrations, and validation.
- `ontology/` — source ontology, GAS rulebook, structural tests, and master test bank.
- `semantic-kernel/` — invariant semantic and governance rules.
- `semantic-registry/` — machine-readable catalogs that drive generated implementation.
- `neo4j/` — generated schema, loaders, validation, notebooks, and query examples.
- `datasets/` — generated seed data used by the Neo4j smoke workflow.
- `infrastructure/` and `docker-compose.yml` — local data stack, cloud environment contract, Tailscale guidance, and operations runbooks.
- `ingestion/` — governed PDF, website, and transcript evidence architecture, source catalog, schemas, and database loaders.
- `docs/` — application, architecture, governance, security, and ADR documentation.
- `scripts/` and `tests/` — generators, operational helpers, and validation suites.

## Application setup

1. Install Node.js 22 or newer.
2. Start a loaded RSA Neo4j database.
3. Copy `.env.example` to `.env.local`.
4. Enter the Neo4j connection values in `.env.local`.
5. Run `npm install`.
6. Run `npm run dev` for this PC only, or `npm run dev:lan` for trusted local-network testing.
7. Open `http://localhost:3000`.

See [`FIRST_RUN_GUIDE.md`](FIRST_RUN_GUIDE.md) and [`docs/LOCAL_TEST_SERVER.md`](docs/LOCAL_TEST_SERVER.md). For testers outside the local network, follow [`docs/SECURE_TUNNEL.md`](docs/SECURE_TUNNEL.md); never expose Neo4j directly.

## Data infrastructure

The Phase 1 Neo4j, Qdrant, and Postgres stack is defined in [`docker-compose.yml`](docker-compose.yml). Start with [`infrastructure/README.md`](infrastructure/README.md). Credentials belong in the ignored `infrastructure/.env` file or an approved secret manager.

## Semantic registry workflow

Run `python scripts/validate_registry.py --strict` after changing a catalog. The current registry drives generated constraints, indexes, loaders, seed data, validation queries, and Neo4j Browser notebooks.

The governing principles are:

1. Ontology is the canonical semantic source of truth.
2. The semantic registry is the engineering source of truth.
3. Supported questions map to explicit, explainable traversals.
4. SCC stores universal facts; user state and comparative decisions remain outside it.

See [`docs/architecture/enterprise-architecture.md`](docs/architecture/enterprise-architecture.md) and [`semantic-registry/specification/semantic-registry-specification.yaml`](semantic-registry/specification/semantic-registry-specification.yaml).

## Security

- Never commit local environment or tunnel credential files.
- Do not expose Neo4j, Qdrant, or Postgres ports to the public internet.
- Use localhost for single-machine development and Tailscale for private team access.
- Add production authentication, HTTPS, rate limiting, audit logging, and managed serving infrastructure before admitting external users.
