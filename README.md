# RSA Knowledge Platform

The RSA Knowledge Platform (RKP) is an ontology-driven, explainable career-intelligence foundation. Neo4j is the first runtime; the semantic registry is the engineering source of truth.

## Repository map

- `docs/` — architecture, governance, glossary, and architecture decision records (ADRs).
- `semantic-kernel/` — invariant semantic and governance rules.
- `semantic-registry/` — machine-readable catalogs that drive implementation.
- `ontology/` — source ontology material and its normalized representations.
- `neo4j/` — generated and hand-maintained runtime assets, loaders, validation, and query examples.
- `scripts/` — generators, validators, and operational helpers.
- `tests/` — registry, schema, and query acceptance tests.

## Bootstrap

Run `python bootstrap_rsa_repository.py` from the parent directory to create this scaffold. The bootstrap is idempotent: it does not overwrite existing files.

## Principles

1. Ontology is the canonical semantic source of truth.
2. The semantic registry is the engineering source of truth.
3. Master test-bank questions map to explicit, explainable traversals.
4. SCC stores universal facts; user state and comparative decisions remain outside it.

See [`docs/architecture/enterprise-architecture.md`](docs/architecture/enterprise-architecture.md) and [`semantic-registry/specification/semantic-registry-specification.yaml`](semantic-registry/specification/semantic-registry-specification.yaml).
