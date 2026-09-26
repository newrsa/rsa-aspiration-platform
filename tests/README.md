# Tests

This directory contains local validation checks for the RSA Knowledge Platform repository.

## Local Checks

- `test_registry.ps1` runs the strict registry validator.
- `test_generation.ps1` regenerates the registry, Neo4j runtime artifacts, loader scaffolds, seed CSV files, and manual Neo4j notebook, then checks expected generated outputs.
- `run_neo4j_smoke.ps1` runs the generated schema, loaders, seed data, smoke queries, and structural validation against a local Neo4j database.
- `test_infrastructure.ps1` checks pinned database images, persistence and memory settings, network isolation, and validates the Compose model when Docker is installed.
