# RSA SCC Knowledge Graph Solution Package

**Package version:** 1.0  
**Date:** 2026-08-02  
**Target:** Neo4j 5.x  
**Author note:** Generated from the supplied RSA files only; no external facts were introduced.  
**Inputs:** The RSA Master Blueprint Version 1.0.docx, RSA_SCC_Ontology_v0.6.1a.md, RSA_GAS_Rulebook_v1.2.md, Question_Bank_All_Ontologies_NEP2020.md, RSA_SCC_Structural_Integrity_Test_Set.md, 1-Structured-Science.xlsx, 2-Structured- Arts_Humanities.xlsx, 3-Structured - Commerce.xlsx, 4-Strcutured-Management.xlsx, 5-Structured- Law.xlsx, 6-Structured-Interdisciplinary.xlsx

This package follows test-driven knowledge-graph engineering: Phase 0 derives acceptance criteria before ontology refinement, schema design or Cypher. Read files in numeric order.

The package intentionally distinguishes schema expressibility from source-data completeness. Proposed extensions are not represented as approved SCC v0.6.1a concepts.

The `data/` directory contains the canonical CSV staging layer generated from all six workbooks. The Cypher scripts in `cypher/` load those exact files in numeric order.

The package also includes an additive Interdisciplinary Universe v1.1 migration. After the base load, run scripts `06`, `07` and `08` to install the finalized 16-domain / 38-stream direct structure without deleting the earlier workbook-derived records.

Finalized Commerce v0.7, Humanities v0.8, Management v0.9, and Law v1.0 registries are provided as additive scripts `09`, `10`, and `11`. See `09_remaining_universe_migrations.md` for counts, status semantics, and loading instructions.
