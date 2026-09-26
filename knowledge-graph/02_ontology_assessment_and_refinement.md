# 02 — Ontology Assessment and Refinement

**Package version:** 1.0  
**Date:** 2026-08-02  
**Target:** Neo4j 5.x  
**Author note:** Generated from the supplied RSA files only; no external facts were introduced.  
**Inputs:** The RSA Master Blueprint Version 1.0.docx, RSA_SCC_Ontology_v0.6.1a.md, RSA_GAS_Rulebook_v1.2.md, Question_Bank_All_Ontologies_NEP2020.md, RSA_SCC_Structural_Integrity_Test_Set.md, 1-Structured-Science.xlsx, 2-Structured- Arts_Humanities.xlsx, 3-Structured - Commerce.xlsx, 4-Strcutured-Management.xlsx, 5-Structured- Law.xlsx, 6-Structured-Interdisciplinary.xlsx

## Assessment

The 34 current entities form a strong career-navigation backbone. They cover structural hierarchy, gateways, qualifications, institutions, regulators, career outcomes, finance, competency concepts and experience concepts. They do not fully cover the functional contract derived from the 300 questions.

## Refinement decision

Retain all v0.6.1a concepts. Add eight proposed implementation labels behind a governance flag (`extension_status='PROPOSED'`). Do not add Digital Twin runtime entities. Reify programme-specific facts on `ProgrammeOffering` to avoid incorrectly attaching fees, language, exit rules or accommodations globally to a Degree or Institution.

## Cardinality decisions

- Each Universe-scoped record has at least one `BELONGS_TO_UNIVERSE`.
- A Stream may be contained in multiple Domains; exactly one `CONTAINED_IN.primary=true`.
- A ProgrammeOffering belongs to exactly one Institution and one Degree, while policies may vary by effective period.
- Multiple mandatory licences are additive (AND) unless an explicit relationship group states OR.
- `PREREQUISITE_OF` must be acyclic.
- Multi-universe competency concepts use `:MultiUniverse`, not duplicated nodes.

## Temporal and provenance semantics

All mutable assertions use `effective_from`, optional `effective_to`, governance metadata and `SUPPORTED_BY_SOURCE`. A record is query-eligible when Published/Validated and effective at the requested date. Deprecated facts remain for audit but are excluded by default.

## Boundary decisions

| Capability | Owner | SCC responsibility |
|---|---|---|
| Personal profile/evidence/confidence | Digital Twin | expose concepts and evidence types only |
| Matching and alternatives | Decision Engine | provide governed paths and constraints |
| Skill-vs-degree valuation | STC/Decision Engine | expose requirements, never score user |
| Timetable conflicts | Student Journey | expose duration/workload facts if known |
| Legal/financial/medical advice | qualified service/human | provide informational sources and escalation flag |
