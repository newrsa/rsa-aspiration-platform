# Local Neo4j Development

This folder documents how to run the generated SCC runtime against a local Neo4j database.

## Requirements

- Neo4j running locally with Bolt enabled.
- `cypher-shell` available on PATH, or `CYPHER_SHELL` set to the full path of `cypher-shell`.
- `NEO4J_PASSWORD` set in the current terminal.

Defaults used by the smoke runner:

- `NEO4J_URI=bolt://localhost:7687`
- `NEO4J_USER=neo4j`
- `CSV_BASE_URL=file:///rsa/seed/`

## Seed Smoke Test

If Neo4j restricts `LOAD CSV` to its import directory, copy the seed CSVs there by passing `NEO4J_IMPORT_DIR`.

Example:

```powershell
$env:NEO4J_PASSWORD = "<your-password>"
$env:NEO4J_IMPORT_DIR = "<path-to-neo4j-import-directory>"
powershell -ExecutionPolicy Bypass -File tests\run_neo4j_smoke.ps1
```

If required-property constraints are not supported by your Neo4j edition, run:

```powershell
powershell -ExecutionPolicy Bypass -File tests\run_neo4j_smoke.ps1 -SkipRequiredPropertyConstraints
```

The smoke test regenerates derived artifacts, loads the seed dataset, verifies the core Science pathway, and runs structural integrity checks.
