# Interdisciplinary Universe v1.1 Migration

**Date:** 2026-08-02  
**Authority:** `RSA_SCC_Ontology_v1.1_Interdisciplinary_Universe_Direct_Structure.md`  
**Target:** Neo4j 5.x

## Decision

The Interdisciplinary ontology definition is now treated as Published at v1.1. The 16 normalized Integration Domains and 38 baseline Streams are loaded as Validated instance data because the specification itself states that institution/exam coverage is partial, salary data is not publication-ready, and production chatbot use is not yet ready.

This distinction prevents a finalized ontology specification from being confused with fully verified operational data.

## Additive migration

The migration adds the v1.1 labels, constraints, exact registries and parent-discipline relationships. It does not delete the earlier workbook-derived Interdisciplinary nodes. Those records remain available for reconciliation until an approved crosswalk is produced.

## Files

- `cypher/06_migrate_interdisciplinary_v1_1_schema.cypher`
- `cypher/07_load_interdisciplinary_v1_1.cypher`
- `cypher/08_validate_interdisciplinary_v1_1.cypher`
- `data/interdisciplinary_v1_1_domains.csv`
- `data/interdisciplinary_v1_1_streams.csv`
- `data/interdisciplinary_v1_1_parent_disciplines.csv`
- `data/interdisciplinary_v1_1_stream_parent_links.csv`
- `data/interdisciplinary_v1_1_domain_parent_links.csv`

## Execution order

Run scripts 01–05 for the base graph, followed by 06, 07 and 08. Validation expects exactly 16 Integration Domains and 38 authoritative Interdisciplinary Streams.

## Deferred phases

The schema is prepared for IntegrationPattern, ApplicationContext, CrossFacultyEntryRule, BridgeCourse, MultidisciplinaryProgrammeStructure, MethodBundle, InterdisciplinaryCapstone, IntegrationEvidence, CommunityEmbeddedness and LivelihoodServiceModel. Their instance registries should be populated in the v1.1 implementation phases defined by the ontology rather than inferred from free text.
