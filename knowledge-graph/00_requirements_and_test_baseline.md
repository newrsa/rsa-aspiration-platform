# 00 — Requirements and Test Baseline

**Package version:** 1.0  
**Date:** 2026-08-02  
**Target:** Neo4j 5.x  
**Author note:** Generated from the supplied RSA files only; no external facts were introduced.  
**Inputs:** The RSA Master Blueprint Version 1.0.docx, RSA_SCC_Ontology_v0.6.1a.md, RSA_GAS_Rulebook_v1.2.md, Question_Bank_All_Ontologies_NEP2020.md, RSA_SCC_Structural_Integrity_Test_Set.md, 1-Structured-Science.xlsx, 2-Structured- Arts_Humanities.xlsx, 3-Structured - Commerce.xlsx, 4-Strcutured-Management.xlsx, 5-Structured- Law.xlsx, 6-Structured-Interdisciplinary.xlsx

## Decision

The Question Bank and Structural Integrity Test Set are executable acceptance criteria **before** ontology refinement and again after ingestion. The supplied ontology is a candidate conceptual model, not automatic proof of coverage.

## Authority and conflict order

1. Blueprint for constitutional/business meaning.
2. SCC ontology v0.6.1a for current conceptual scope.
3. GAS v1.2 for translation into Neo4j.
4. Question Bank for functional acceptance.
5. Structural Integrity Test Set for graph-health and boundary gates.
6. Workbooks for available population evidence.

A conflict is reported; it is never silently flattened. The Blueprint's “constitution before code”, modularity, traceability, governance, versioning and continuous-evolution principles are the governing engineering constraints (Blueprint Volumes 1, 2, 3 and 5).

## Phase 0 acceptance catalogue

| Gate | Requirement | Evidence | Acceptance condition | Timing |
|---|---|---|---|---|
| P0-01 | Exact-question coverage | Question Bank, 300 questions | Every question maps to schema elements, a query family and a data-availability verdict | pre-design/post-load |
| P0-02 | Eligibility ≠ suitability | Evaluation criteria; GAS layer boundary | Queries never treat interests/skills as legal eligibility | all |
| P0-03 | Qualification distinctions | Commerce/Law questions | Degree, exam pass, membership, licence and practice right remain distinct | design/load |
| P0-04 | Legitimate alternatives | all universes | Failed gateway returns governed bridge/alternate paths, not invented advice | query |
| P0-05 | NEP flexibility | QB questions 11–30 in most universes | major/minor, open electives, ABC, transfer, exit/re-entry, RPL represented or explicitly unavailable | design |
| P0-06 | Evidence/experience | QB portfolio sections | projects, activities, internships, apprenticeships and certifications are queryable | design/load |
| P0-07 | Inclusion | QB inclusion sections | language, accommodation, rural/SEDG support and affordability are source-backed | design/load |
| P0-08 | Currency/governance | QB evaluation; GAS §§6–10 | every assertion exposes source, status, version and refresh date | load/query |
| P0-09 | No guaranteed outcomes | QB evaluation | salary/emerging-career results carry context and verification status | query |
| P0-10 | Boundary safety | Ontology §2; GAS §1/§16 | user observations/recommendations remain outside SCC | design |
| P0-11 | Graph health | Integrity T44–T50; GAS §9 | zero critical cycles/orphans; warnings classified | weekly/post-load |
| P0-12 | Idempotent deployment | implementation requirement | schema/load scripts rerun safely | deployment |

## Question Bank coverage baseline

- **Science:** 50 questions; Career discovery and subject choice (10); Flexible pathways and NEP choices (10); Experiential learning and readiness (10); Access, inclusion and support (10); Career outcomes and lifelong learning (10).
- **Humanities:** 50 questions; Career discovery and subject choice (10); Flexible pathways and NEP choices (10); Portfolio, research and experiential learning (10); Inclusion, language and IKS (10); Career outcomes and lifelong learning (10).
- **Commerce:** 50 questions; Career discovery and subject choice (10); Professional qualifications and progression (10); NEP flexibility, credits and vocational learning (10); Experience, inclusion and affordability (10); Career outcomes and lifelong learning (10).
- **Management:** 50 questions; Career discovery and education choice (10); NEP flexibility and programme structure (10); Practical experience and portfolio (10); Access, inclusion and regional pathways (10); Career outcomes and lifelong learning (10).
- **Law:** 50 questions; Career discovery and legal education (10); Professional permission and regulation (10); NEP flexibility and multidisciplinary learning (10); Experience, portfolio and inclusion (10); Career outcomes and lifelong learning (10).
- **Interdisciplinary:** 50 questions; Career discovery and integration (10); Cross-faculty entry and bridge learning (10); NEP programme and credit flexibility (10); Capstone, portfolio and application context (10); Community, inclusion and lifelong learning (10).

## Structural test applicability review

| Tests | v0.6.1a disposition | Gate |
|---|---|---|
| T26, T28, T29, T31, T33, T41, T43, T44, T47, T48 | applicable; structure present, population still required | pass only with data |
| T27 | addressed by GAS v1.2 `EQUIVALENT_TO`; verify actual licence data | warning until populated |
| T30, T32 | application/Decision Engine calculation; SCC supplies facts only | boundary pass |
| T34, T35, T42, T45, T46, T49 | supported with explicit curation/audit discipline | warning/critical as specified |
| T36–T40, T50 | Digital Twin/STC/Decision Engine/Student Journey boundary | out-of-SCC, interface contract required |

The test document's headline counts describe v0.5.2 and are not reused as v0.6.1a results.

## Pre-design finding

SCC v0.6.1a formally establishes Science and lists Commerce, Management, Law, Humanities and Interdisciplinary as planned releases. Yet the Question Bank and six workbooks demand all six now. Therefore the implementation uses one shared SCC schema, preserves `introduced_in_ontology_version`, and assigns non-Science records `Draft` or `Validated` until ontology governance approves them.

## Stop/go rule

Cypher may proceed only with: explicit extension labels for Question-Bank-only concepts; provenance on every loaded record; no Digital Twin runtime nodes; and visible `SUPPORTED`, `PARTIAL`, `MISSING`, or `OUT_OF_SCOPE` coverage verdicts.
