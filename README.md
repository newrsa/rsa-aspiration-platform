# RSA Knowledge Platform

The RSA Knowledge Platform (RKP) is an ontology-driven, explainable career-intelligence foundation. Neo4j is the first runtime; the semantic registry is the engineering source of truth.

## Repository map

- `docs/` — architecture, governance, glossary, and architecture decision records (ADRs).
- `semantic-kernel/` — invariant semantic and governance rules.
- `semantic-registry/` — machine-readable catalogs that drive implementation.
- `ontology/` — source ontology material and its normalized representations.
- `neo4j/` — generated and hand-maintained runtime assets, loaders, validation, and query examples.
- `infrastructure/` — Docker deployment, local/cloud environment contracts, VPN guidance, and operational runbooks.
- `scripts/` — generators, validators, and operational helpers.
- `tests/` — registry, schema, and query acceptance tests.

## Bootstrap

Run `python bootstrap_rsa_repository.py` from the parent directory to create this scaffold. The bootstrap is idempotent: it does not overwrite existing files.

## Validate the registry

Run `python scripts/validate_registry.py` after changing a catalog. Use `--strict` once placeholders have been replaced by approved ontology-derived records.

## Principles

1. Ontology is the canonical semantic source of truth.
2. The semantic registry is the engineering source of truth.
3. Master test-bank questions map to explicit, explainable traversals.
4. SCC stores universal facts; user state and comparative decisions remain outside it.

See [`docs/architecture/enterprise-architecture.md`](docs/architecture/enterprise-architecture.md) and [`semantic-registry/specification/semantic-registry-specification.yaml`](semantic-registry/specification/semantic-registry-specification.yaml).

## Local data stack

The Phase 1 Neo4j, Qdrant, and Postgres stack is defined in [`docker-compose.yml`](docker-compose.yml). Start with [`infrastructure/README.md`](infrastructure/README.md); credentials belong in the ignored `infrastructure/.env` file.
