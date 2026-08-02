# 06 — Cypher Execution Guide

**Package version:** 1.0  
**Date:** 2026-08-02  
**Target:** Neo4j 5.x  
**Author note:** Generated from the supplied RSA files only; no external facts were introduced.  
**Inputs:** The RSA Master Blueprint Version 1.0.docx, RSA_SCC_Ontology_v0.6.1a.md, RSA_GAS_Rulebook_v1.2.md, Question_Bank_All_Ontologies_NEP2020.md, RSA_SCC_Structural_Integrity_Test_Set.md, 1-Structured-Science.xlsx, 2-Structured- Arts_Humanities.xlsx, 3-Structured - Commerce.xlsx, 4-Strcutured-Management.xlsx, 5-Structured- Law.xlsx, 6-Structured-Interdisciplinary.xlsx

## Prerequisites

Neo4j 5.x. The scripts use only core Cypher functions including `randomUUID()`; APOC is not required. The package now includes the normalized CSV layer in `data/`. Copy those CSV files into a directory named `rsa` under Neo4j's configured import directory.

## Execution order

1. `cypher/01_create_schema.cypher`
2. `cypher/02_seed_universes.cypher`
3. `cypher/03_load_canonical_nodes.cypher`
4. `cypher/04_load_structural_relationships.cypher`
5. `cypher/05_load_provenance.cypher`
6. `cypher/30_integrity_validation.cypher`
7. `cypher/40_question_bank_queries.cypher` as the functional regression library

### Interdisciplinary v1.1 continuation

After the base scripts, run:

8. `cypher/06_migrate_interdisciplinary_v1_1_schema.cypher`
9. `cypher/07_load_interdisciplinary_v1_1.cypher`
10. `cypher/08_validate_interdisciplinary_v1_1.cypher`

Copy all `data/interdisciplinary_v1_1_*.csv` files into the same Neo4j `import/rsa` directory first. The migration marks the Interdisciplinary ontology definition Published while keeping its instance registry Validated pending the source checks explicitly deferred by v1.1.

### Finalized remaining universes

Copy all CSVs beginning `commerce_v0_7_`, `humanities_v0_8_`, `management_v0_9_`, and `law_v1_0_` into `import/rsa/`, then run:

11. `cypher/09_migrate_remaining_universe_schemas.cypher`
12. `cypher/10_load_remaining_universe_registries.cypher`
13. `cypher/11_validate_remaining_universes.cypher`

For demonstrations without parameter setup, run `cypher/41_demo_queries_no_parameters.cypher`. It contains embedded example values for structural validation, engineering-career discovery, and Law + Technology interdisciplinary discovery.

Run loaders with `cypher-shell --fail-fast`. The node and provenance loaders use batches of 1,000. Reruns are safe because nodes and relationships use governed deterministic codes. Review `data/normalization_report.json` and `data/quarantine.csv` before loading.

## Included CSV inventory

- `domains.csv`, `streams.csv`, `career_outcomes.csv`
- `entrance_exams.csv`, `skills.csv`, `degrees.csv`, `institutions.csv`
- `source_records.csv`
- `stream_career_relationships.csv`
- `entity_source_relationships.csv`
- `quarantine.csv`

The current normalization contains 916 streams, 916 career outcomes, 109 entrance exams, 604 skills, 85 degrees, 20 institutions, 2,410 source records and 4,244 provenance links. These counts describe mechanical mappings from the supplied files, not independent validation of their claims.

## Safety

Back up before first production load. Load into a staging database, require zero critical T44/T45/T48/provenance failures, compare counts and hashes, then promote. Rollback is database-level restore or removal by an explicit `load_batch_id`; never delete broadly by label.

## Expected limitations

The raw workbooks do not yet constitute authoritative current policy for every programme. Queries must return an evidence insufficiency response when no Validated/Published effective assertion exists.
