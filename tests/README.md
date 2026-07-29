# Tests

This directory contains local validation checks for the RSA Knowledge Platform repository.

## Local Checks

- `test_registry.ps1` runs the strict registry validator.
- `test_generation.ps1` regenerates the registry, Neo4j runtime artifacts, loader scaffolds, and seed CSV files, then checks expected seed file counts.
- `run_neo4j_smoke.ps1` runs the generated schema, loaders, seed data, smoke queries, and structural validation against a local Neo4j database.
