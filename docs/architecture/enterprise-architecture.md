# Enterprise Architecture Review

## Purpose

Define the reference architecture for the RSA Knowledge Platform (RKP) and its first runtime, the RSA Science Runtime (RSR).

## Platform boundary

The knowledge graph stores governed, universal facts. The Decision Engine owns comparative reasoning; the Digital Twin owns user-specific state; LLMs explain verified graph evidence rather than author facts.

## Architecture principles

1. Ontology first.
2. Query-driven design.
3. Modular universes and peer ontologies.
4. Explainability by explicit traversal.
5. Generation over duplicated definitions.
6. Governance, provenance, and versioning by design.
7. Pipeline logic remains independent of orchestration and connector products.
8. The serving plane consumes promoted releases and never depends on a live ingestion workflow.

## Initial acceptance criteria

- Registry references are internally valid.
- GAS naming and identity rules are represented in the registry.
- Structural integrity validations are executable.
- Each supported test-bank capability has a query-registry entry.
- Neo4j artifacts can be generated without redefining semantics.
