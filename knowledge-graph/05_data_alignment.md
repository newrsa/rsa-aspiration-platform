# 05 — Source-to-Schema Alignment

**Package version:** 1.0  
**Date:** 2026-08-02  
**Target:** Neo4j 5.x  
**Author note:** Generated from the supplied RSA files only; no external facts were introduced.  
**Inputs:** The RSA Master Blueprint Version 1.0.docx, RSA_SCC_Ontology_v0.6.1a.md, RSA_GAS_Rulebook_v1.2.md, Question_Bank_All_Ontologies_NEP2020.md, RSA_SCC_Structural_Integrity_Test_Set.md, 1-Structured-Science.xlsx, 2-Structured- Arts_Humanities.xlsx, 3-Structured - Commerce.xlsx, 4-Strcutured-Management.xlsx, 5-Structured- Law.xlsx, 6-Structured-Interdisciplinary.xlsx

## Workbook inventory

| Workbook | Sheets (used range) | Source status |
|---|---|---|
| 1-Structured-Science.xlsx | Science Category A1:D12; Engineering A1:P414; Medicine A1:N62; Pure Science A1:N84; Data Analytics A1:N137; Design A1:P161; Defence A1:P84; Aviation A1:P74; Vocational A1:P66; Entrance Exam A1:J76 | raw curated workbook; normalization required |
| 2-Structured- Arts_Humanities.xlsx | Overview A1:H17; Career Master A1:Z161; Standard-wise Pathway A1:F10; Entrance Exams A1:G15; Subject Map A1:D11; Skill Portfolio A1:D11; Sources A1:C12; Category Summary A1:F15; Recognised_Institutions A1:F8; NEP2020_IKS_FolkCourses A1:F8; Humanities_Technology A1:F11 | raw curated workbook; normalization required |
| 3-Structured - Commerce.xlsx | Commerce Categories (Premium) A1:F16; CA Pathway A1:M12; CS Pathway A1:M12; CMA Pathway A1:M12; Banking Pathway A1:M12; Economics Pathway A1:M12; Data Analytics A1:M12; FinTech A1:M12; E-Commerce A1:M12; Wealth Mgmt A1:M12; Actuarial A1:M12; Entrance Exams Master A1:F13; Digital Marketing A1:M8; Business Analytics A1:M8; FinTech Advanced A1:M8; E-Commerce Advanced A1:M8; Industry Operations A1:M8; Advertising & Branding A1:M8; Specialized Accounting A1:M8; Global Freelance Careers A1:M8; Stock Market Advanced A1:M8 | raw curated workbook; normalization required |
| 4-Strcutured-Management.xlsx | Career Master A1:AJ69; Education Pathways A1:H11; UG Courses A1:I17; PG Courses A1:I14; Exams Regulatory A1:J17; Specializations A1:H12; Skill Taxonomy A1:G14; Preparation Roadmap A1:G11; Traditional Careers A1:Y25; Sector Management A1:Y21; Techno Driven Careers A1:Y17; Entrepreneurship Startup A1:Y7; Skill Non-MBA A1:Y18; AI Era Management A1:Y27; Mgmt Livelihood A1:K17; Emerging Niche Interdiscip A1:J18; Future AI Layer A1:G11; Regional Resource Frontier A1:S48; Low Investment Enterprise A1:O17; Govt Missions Programs A1:K17; Shadow Careers MBA A1:O14; License Matrix A1:F12; Review Dashboard A1:C9; Sources A1:D36 | raw curated workbook; normalization required |
| 5-Structured- Law.xlsx | Overview A1:C6; Career Master A1:Y92; Education Pathways A1:H11; Exams Regulatory A1:I14; License Matrix A1:G10; Future AI Layer A1:G12; Skill Taxonomy A1:F17; Sources A1:D20; Flexible Legal Livelihoods A1:J7; Law + Counselling A1:G5; Law + Education A1:G5; Law + Digital Economy A1:F6; Legal Micro-Entrepreneurship A1:F7; Emerging, Niche & Interdiscipli A1:I40 | raw curated workbook; normalization required |
| 6-Structured-Interdisciplinary.xlsx | Career Master A1:R40; Eligibility Architecture A1:H17; Preparation Roadmap 8-12 A1:G11; Entrance Exams Ecosystem A1:H12; Institutions Ecosystem Map A1:G15; Law + Technology + Governance A1:J7; Humanities + Technology A1:J7; Commerce + Analytics + FinTech A1:J7; Psychology + Business + AI A1:J7; Design + Business + Technology A1:J7; Agriculture + Sustainability + A1:J7; Healthcare + Analytics A1:J7; Public Policy + Economics A1:J7; Media + Communication + AI A1:J7; Emerging Frontier Careers A1:J8; Interdisciplinary Livelihood A1:K14; Govt NEP Missions Map A1:G12; Specialized Rare Domains A1:M54; Community Tribal Inclusive A1:Q40; Sources A1:D48 | raw curated workbook; normalization required |

## Alignment findings

- Science is closest to the current ontology hierarchy but its domain sheets are denormalized pathway tables.
- Humanities, Management and Law provide explicit career masters plus auxiliary skills, institutions, regulatory or source sheets.
- Commerce is pathway-sheet oriented and requires entity deduplication across repeated columns.
- Interdisciplinary contains cross-domain structures and must reference parent-universe entities rather than duplicate them.
- Sheet names and row numbers are retained on `SourceRecord`; each created assertion links with `SUPPORTED_BY_SOURCE`.

## Normalization contract

Each workbook is exported to UTF-8 CSV per sheet. A deterministic staging step emits canonical files: `universes.csv`, `faculties.csv`, `domains.csv`, `streams.csv`, `career_outcomes.csv`, `exams.csv`, `degrees.csv`, `institutions.csv`, `skills.csv`, `licences.csv`, `relationships.csv`, and `source_records.csv`. Required columns are `code`, `name`, `source_workbook`, `source_sheet`, `source_row`, `version`, `governance_status`. Unknown columns are retained in a raw JSON payload; no source information is discarded.

## Key, cleansing and idempotency rules

- Normalize whitespace/Unicode; never lowercase displayed names.
- Generate reference codes from governed mapping tables, not row order.
- Deduplicate on entity type + authoritative code; name-only matches are quarantined.
- Convert rupees to integer paise; retain raw strings and currency source.
- Parse lists explicitly; do not store comma-separated foreign keys.
- Missing targets go to quarantine; never create nameless placeholder nodes.
- `MERGE` only on immutable reference code; set mutable properties after the match.
- Incremental loads use source hash and effective dates.

## Generated canonical data layer

The package includes UTF-8 CSV files under `data/`. Deterministic codes are based on universe plus normalized source name, with a short hash to prevent truncation collisions. Every mapped entity retains workbook, sheet and row provenance through `SourceRecord`.

| Output | Rows |
|---|---:|
| Domains | 379 |
| Streams | 916 |
| Career outcomes | 916 |
| Entrance exams | 109 |
| Skills | 604 |
| Degrees | 85 |
| Institutions | 20 |
| Source records | 2,410 |
| Stream-to-career relationships | 916 |
| Entity-to-source relationships | 4,244 |
| Quarantined rows | 0 |

Zero quarantined rows means the deterministic extraction completed; it does not constitute subject-matter validation. Several denormalized source rows intentionally produce granular Domain values and require ontology-team review before publication.

## Data readiness verdict

The workbooks are sufficient to seed broad career/pathway coverage, but not to prove all 300 questions. NEP programme policy, ABC/credit transfer, exit/re-entry, RPL, accessibility, language, current regulator status and verified financial data require authoritative enrichment. Production readiness is therefore conditional.
