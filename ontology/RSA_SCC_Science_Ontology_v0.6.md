# RSA SCC Ontology v0.6 — Complete Technical Specification
**Version:** 0.6 (Consolidated Master — every field explicit for Cypher generation)
**Status:** National/global career structure standard
**Domain:** Structured Career Category (SCC)
**Universe status:** Science Universe complete
**Total:** 32 entities, ~574 properties, ~43 canonical relationships
**Intended use:** Source of truth for Cypher schema and data-loading queries.

**Source contributions:**
- **RSA v0.5.2** (Nilesh) — 23 core entities, Student-Practical Layer, Governance framework
- **Pranav ChatGPT** — 9 concept entities (Competency + Experience layers)
- **Sandeep Kimi** — Path-Type taxonomy, validation rule framework
- **NK Gemini** — Synthesis structure and design principles

**Architectural boundary:** This ontology captures universal facts about careers. Digital Twin (user-specific matching) is a separate product-layer specification.

---

## Table of Contents

1. Design principles
2. Ontology hierarchy
3. Universal Governance Metadata Block (applied to ALL entities)
4. Group A — Structure & Journey (7 entities)
5. Group B — Governance & Gateway (10 entities)
6. Group C — Ecosystem & Professional (5 entities)
7. Group D — Financial (2 entities)
8. Group E — Competency Concept entities (5 entities) — NEW in v0.6
9. Group F — Experience Concept entities (4 entities) — NEW in v0.6
10. Controlled vocabularies
11. Complete relationship inventory
12. Derived formulas
13. Data types reference
14. Deferrals and roadmap
15. Attribution

---

## 1. Design Principles

1. **Define once, reuse everywhere.** Shared entities exist once, referenced widely.
2. **Path not label.** A career is a chain of stages, exams, degrees, and outcomes.
3. **Refresh discipline.** Every time-varying field carries refresh_frequency, last_refreshed, source, data_owner.
4. **Inheritance.** Streams inherit conceptual attributes from parent Domain unless overridden.
5. **Ranges, not points.** Cost and salary use min/mid/max.
6. **Separation of concerns.** Degree (academic) ≠ Licence (regulatory) ≠ Certification (professional).
7. **Profession ends at profession.** Employer-specific data is peer dataset.
8. **Formal categories in schema; identity-based advice declined via routing tag.**
9. **Concept vs Runtime.** Ontology holds concepts. User-specific data is Digital Twin territory.
10. **Competency and Experience are first-class.** Not properties on Career Outcome, but entities.

---

## 2. Ontology Hierarchy

```
SCC (Structured Career Category)
    │ contains multiple Universes
    ├── Science Universe (v0.6 complete)
    ├── Commerce Universe (v0.7 pending Pranav's build)
    └── + more Universes

Inside each Universe:

SCC Faculty (Science / Commerce / Arts / Vocational / Open)
    ▼ CONTAINS
Domain (Engineering / Medical / Design / Defence / Aviation / Pure Science / Data-Math / Vocational)
    ▼ CONTAINS
Stream (Computer Science / MBBS / Commercial Pilot / ITI Electrician / etc.)
    ▼ PROGRESSES_THROUGH
Education Stage (K-12 / JC / UG / PG / Doctoral / Vocational / Certification)

At each Stage, a Stream references:
- Subject Combination + Subject + Subject Level
- Decision Point + Criterion + Activity
- Entrance Exam (with Syllabus Topics, Age Criteria, Citizenship Criteria)
- Degree AND/OR Licence AND/OR Certification (via Admission Pathway)
- Institution Type + Institution (with City, hostels, rankings, medium)
- Internship Type + Apprenticeship
- Career Outcome
    → EARNS_SALARY → Salary Range
    → HIRING_HUB_CITIES → City
    → HAS_FOLLOW_ON_EXAM → Entrance Exam
    → REQUIRES_APTITUDE → Aptitude
    → REQUIRES_SKILL → Skill
    → ALIGNS_WITH_INTEREST → Interest
    → FAVOURED_BY_TRAIT → Personality Trait

Financial support:
- Scholarship
- Education Loan

Governance:
- Regulatory Body (with State Units via HAS_STATE_UNIT)
- Subject Equivalence via SubjectEquivalenceRule
```

**Explicitly NOT part of this ontology:** DigitalTwinObservation, EvidenceItem, AlignmentResult, Recommendation, Escalation.

---

## 3. Universal Governance Metadata Block

**Every entity in this ontology carries these 12 properties in addition to its domain-specific properties. Where entity tables below repeat these, they are shown at the end of each table for reference.**

| # | Property | Type | Values / Notes |
|---|---|---|---|
| G1 | id | UUID | System-generated, immutable |
| G2 | `<entity>_code` | String | Reference Code (e.g., `STR-CS-ENG`) |
| G3 | created_at | DateTime | ISO 8601 UTC |
| G4 | updated_at | DateTime | ISO 8601 UTC |
| G5 | created_by | String | User ID or pipeline name |
| G6 | updated_by | String | User ID or pipeline name |
| G7 | version | String | Ontology version at creation (e.g., "0.6") |
| G8 | governance_status | Enum | Draft / Validated / Published / Deprecated |
| G9 | refresh_frequency | Enum | Static / Annual / 2-Yearly / On-Event |
| G10 | last_refreshed | Date | ISO 8601 |
| G11 | source | String | Authoritative source (e.g., "AICTE 2024", "NIRF 2024") |
| G12 | data_owner | String | Team or person responsible for accuracy |

---

# GROUP A — STRUCTURE & JOURNEY (7 entities)

---

## 3.1 SCC Faculty

The top-level academic faculty. 5 canonical values in Indian education system.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | faculty_id | UUID | System-generated | Static |
| 2 | faculty_code | String | `FAC-SCIENCE` / `FAC-COMMERCE` / `FAC-ARTS` / `FAC-VOCATIONAL` / `FAC-OPEN` | Static |
| 3 | name | String | Science / Commerce / Arts / Vocational / Open Schooling | Static |
| 4 | description | Text (~150 words) | Full description | Static |
| 5 | typical_entry_stage | Reference (Education Stage) | Typically JC1 or Class 11 | Static |
| 6 | typical_entry_age | Integer | Age of typical entry (15-16) | Static |
| 7 | entry_criteria_min_class_10_score_percent | Decimal | Min Class 10 aggregate percent | Static |
| 8 | entry_criteria_mandatory_subjects | List (String) | Subjects required for entry | Static |
| 9 | entry_criteria_board_flexibility | Enum | Strict / Flexible / Board-Agnostic | Static |
| 10 | typical_duration_years | Integer | Total years across faculty | Static |
| 11 | related_domains | List (Reference: Domain) | Domains under this Faculty | Static |
| 12 | parent_faculties | List (Reference: SCC Faculty) | For multi-faculty Streams | Static |
| 13 | exit_options | List (Reference: Stream) | Streams reachable | Static |
| 14 | active_status | Boolean | true / false | Static |
| 15 | universe | Enum | Science / Commerce / Arts / Multi | Static |
| G1-G12 | Governance block | See §3 | 12 properties | — |

**Total properties: 15 domain + 12 governance = 27.**

---

## 3.2 Domain

An academic discipline within a Faculty. Science Universe has 8 Domains.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | domain_id | UUID | System-generated | Static |
| 2 | domain_code | String | `DOM-ENGINEERING`, `DOM-MEDICAL`, etc. | Static |
| 3 | name | String | Engineering / Medical / Design / Defence / Aviation / Pure Science / Data-Math / Vocational | Static |
| 4 | parent_faculty | Reference (SCC Faculty) | Primary Faculty | Static |
| 5 | industry_alignment | List (String) | Industries this Domain serves | Static |
| 6 | description | Text (~150 words) | Full description | Static |
| 7 | typical_streams_count | Integer | Order of magnitude | Static |
| 8 | active_status | Boolean | true / false | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 8 domain + 12 governance = 20.**

**Science Universe Domain registry:** Engineering (41 streams), Medical (19), Pure Science (27), Data-Math (27), Design (25), Defence (38), Aviation (35), Vocational (43).

---

## 3.3 Stream

A specific career track. The core entity of the ontology. **Enriched in v0.6.**

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | stream_id | UUID | System-generated | Static |
| 2 | stream_code | String | `STR-CS-ENG`, `STR-MBBS`, `STR-CPL`, etc. | Static |
| 3 | name | String | Full name (e.g., Computer Science Engineering) | Static |
| 4 | also_known_as | List (String) | Alternative names (CSE, CS, Computer Engineering) | Static |
| 5 | parent_domain | Reference (Domain) | Primary Domain | Static |
| 6 | additional_domains | List (Reference: Domain) | For multi-domain streams | Static |
| 7 | primary_faculty | Reference (SCC Faculty) | Faculty | Static |
| 8 | universe | Enum | Science / Commerce / Multi | Static |
| 9 | **path_type** | Enum | **NEW v0.6 from Sandeep.** Core / Specialized / Niche / Long-tail / Edge-case / Emerging / Interdisciplinary / Advanced-systems | Static |
| 10 | typical_duration_years | Integer | Sum across all stages | Static |
| 11 | **stream_duration_category** | Enum | **NEW v0.6.** Short (<6mo) / Medium (6mo-2yr) / Standard (3-5yr) / Long (>5yr) | Static |
| 12 | primary_entrance_exams | List (Reference: Entrance Exam) | For entry | Annual |
| 13 | typical_subject_combinations | List (Reference: Subject Combination) | Required | Static |
| 14 | primary_degree | Reference (Degree) | Terminal Degree | Static |
| 15 | ug_degree | Reference (Degree) | UG-level Degree | Static |
| 16 | pg_degree | Reference (Degree) | PG-level Degree | Static |
| 17 | primary_licence | Reference (Licence) | Terminal Licence if any | Static |
| 18 | primary_certification | Reference (Certification) | Terminal Certification if any | Static |
| 19 | description | Text (~300 words) | Full description | Static |
| 20 | description_short | Text (~50 words) | Short summary | Static |
| 21 | typical_career_outcomes | List (Reference: Career Outcome) | Career Outcomes this Stream leads to | Annual |
| 22 | admission_pathways | List (Reference: Admission Pathway) | Regular / Lateral / Sports / etc. | Static |
| 23 | pg_series_membership | String | E.g., "Medical PG Series", "None" | Static |
| 24 | pg_series_level | Integer | 1 (UG), 2 (PG), 3 (Super-specialty) | Static |
| 25 | retry_and_gap_paths_gap_year_impact | Enum | Neutral / Slight / Significant / Blocking | Static |
| 26 | retry_and_gap_paths_dropout_paths | Structured (JSON) | Common dropout scenarios | Static |
| 27 | retry_and_gap_paths_reentry_options | List (String) | Ways to re-enter after gap | Static |
| 28 | **historical_dropout_rate_percent** | Decimal | **NEW v0.6.** Aggregate percentage | 2-Yearly |
| 29 | demand_trend | Enum | Growing / Stable / Declining / Volatile | Annual |
| 30 | typical_medium_of_instruction | List (String) | English / Hindi / Regional | Static |
| 31 | international_variants | List (Reference: Stream) | Foreign equivalent Streams | Static |
| 32 | typical_cost_range_ug_min_inr | BigInt | UG cost min (paise) | Annual |
| 33 | typical_cost_range_ug_mid_inr | BigInt | UG cost mid (paise) | Annual |
| 34 | typical_cost_range_ug_max_inr | BigInt | UG cost max (paise) | Annual |
| 35 | typical_cost_range_pg_min_inr | BigInt | PG cost min (paise) | Annual |
| 36 | typical_cost_range_pg_mid_inr | BigInt | PG cost mid (paise) | Annual |
| 37 | typical_cost_range_pg_max_inr | BigInt | PG cost max (paise) | Annual |
| 38 | typical_earning_start_age | Integer | Age at which earning begins | Static |
| 39 | related_streams | List (Reference: Stream) | Adjacent Streams | Static |
| 40 | active_status | Boolean | true / false | Annual |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 40 domain + 12 governance = 52.**

**Data source:** 1-Structured-Science.xlsx (244 records), AICTE, UGC, NMC handbooks.

---

## 3.4 Education Stage

A discrete stage in the education journey.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | stage_id | UUID | System-generated | Static |
| 2 | stage_code | String | `EDU-JC1`, `EDU-UG-YR3`, etc. | Static |
| 3 | name | String | Junior College Year 1 / UG Year 3 / etc. | Static |
| 4 | stage_type | Enum | K-12 / Junior College / UG / PG / Doctoral / Vocational / Certification / Bridge | Static |
| 5 | stage_order | Integer | Sequential ordering | Static |
| 6 | typical_age_min | Integer | Minimum typical age | Static |
| 7 | typical_age_max | Integer | Maximum typical age | Static |
| 8 | typical_duration_months | Integer | Duration | Static |
| 9 | is_terminal | Boolean | Can end progression here | Static |
| 10 | prerequisite_stages | List (Reference: Education Stage) | Prior stages | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 10 domain + 12 governance = 22.**

---

## 3.5 Subject

An academic subject as a universal concept.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | subject_id | UUID | System-generated | Static |
| 2 | subject_code | String | `SUB-PHYSICS`, `SUB-MATHS`, etc. | Static |
| 3 | name | String | Physics / Mathematics / Biology / etc. | Static |
| 4 | subject_category | Enum | Core / Elective / Optional / Language | Static |
| 5 | discipline_family | Enum | Sciences / Mathematics / Languages / Humanities / Commerce / Vocational | Static |
| 6 | typical_stages_taught | List (Reference: Education Stage) | Where taught | Static |
| 7 | description | Text (~100 words) | Description | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 7 domain + 12 governance = 19.**

---

## 3.5b Subject Level

A specific level of depth of a Subject (e.g., "Physics at Class 11 CBSE" vs "Advanced Quantum Mechanics UG Year 3").

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | subject_level_id | UUID | System-generated | Static |
| 2 | subject_level_code | String | `SLV-PHYSICS-JC1` | Static |
| 3 | parent_subject | Reference (Subject) | Parent Subject | Static |
| 4 | education_stage | Reference (Education Stage) | Applicable stage | Static |
| 5 | depth_indicator | Enum | Introductory / Standard / Advanced / Specialised | Static |
| 6 | prerequisites | List (Reference: Subject Level) | Prior levels required | Static |
| 7 | typical_content_summary | Text (~100 words) | What is covered | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 7 domain + 12 governance = 19.**

---

## 3.6 Subject Combination

A canonical grouping of subjects (PCM, PCB, PCMB, etc.).

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | combination_id | UUID | System-generated | Static |
| 2 | combination_code | String | `SCB-PCM`, `SCB-PCB`, `SCB-PCMB`, etc. | Static |
| 3 | name | String | PCM / PCB / PCMB / etc. | Static |
| 4 | full_name | String | Physics-Chemistry-Mathematics | Static |
| 5 | mandatory_subjects | List (Reference: Subject) | MUST be included | Static |
| 6 | optional_subjects | List (Reference: Subject) | Common electives | Static |
| 7 | typical_faculty | Reference (SCC Faculty) | Faculty | Static |
| 8 | applicable_stages | List (Reference: Education Stage) | Applicable stages | Static |
| 9 | streams_enabled | List (Reference: Stream) | Streams unlocked | Static |
| 10 | boards_that_offer | List (String) | CBSE / ICSE / State Boards / IB / IGCSE | Static |
| 11 | switch_flexibility_within_year | Enum | Freely / With Cost / Not Allowed | Static |
| 12 | switch_flexibility_across_years | Enum | Freely / With Cost / Not Allowed | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 12 domain + 12 governance = 24.**

---

# GROUP B — GOVERNANCE & GATEWAY (10 entities)

---

## 4.1 Decision Point

A juncture at which a student must make a career-critical choice.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | decision_id | UUID | System-generated | Static |
| 2 | decision_code | String | `DCP-CHOOSE-PCM`, `DCP-CHOOSE-STREAM-UG`, etc. | Static |
| 3 | name | String | E.g., "Choose Subject Combination after Class 10" | Static |
| 4 | decision_type | Enum | Stream Selection / Branch Selection / Specialisation / Career Pivot / Exam Attempt / Continue-Exit / Institution Selection / Employment-vs-PG | Static |
| 5 | typical_stage | Reference (Education Stage) | Where this occurs | Static |
| 6 | typical_age | Integer | Age at decision | Static |
| 7 | criteria | List (Reference: Criterion) | Criteria applied | Static |
| 8 | supporting_activities_reference | List (Reference: Activity) | Activities that inform | Static |
| 9 | reversibility | Enum | Fully Reversible / Reversible with Cost / Difficult / Irreversible | Static |
| 10 | typical_stakeholders | List (String) | Student / Parent / Teacher / Counsellor | Static |
| 11 | consequence_downstream | Text (~100 words) | Impact of this decision | Static |
| 12 | typical_decision_horizon_months | Integer | How far ahead to plan | Static |
| 13 | related_streams | List (Reference: Stream) | Streams whose paths intersect | Static |
| 14 | active_status | Boolean | true / false | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 14 domain + 12 governance = 26.**

---

## 4.2 Criterion

A specific measurable factor applied at a Decision Point.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | criterion_id | UUID | System-generated | Static |
| 2 | criterion_code | String | `CRT-JEE-PERCENTILE`, `CRT-INTEREST-STRENGTH`, etc. | Static |
| 3 | name | String | E.g., "JEE Main Percentile" | Static |
| 4 | criterion_type | Enum | Score-based / Rank-based / Aptitude / Interest / Financial / Medical / Portfolio / Interview | Static |
| 5 | measurement_unit | String | Percentile / Rank / Score / Categorical | Static |
| 6 | typical_thresholds_min | String | Minimum acceptable | Annual |
| 7 | typical_thresholds_target | String | Target value | Annual |
| 8 | typical_thresholds_competitive | String | Competitive value | Annual |
| 9 | weight_at_decision | Decimal (0.0-1.0) | Weight | Static |
| 10 | applicable_decision_points | List (Reference: Decision Point) | Decision Points using this | Static |
| 11 | measurement_frequency | Enum | Once / Annual / Multi-attempt | Static |
| 12 | evidence_required | List (String) | Type of evidence needed | Static |
| 13 | typical_source_of_measurement | String | E.g., "NTA Result Portal" | Annual |
| 14 | notes_and_variations | Text (~100 words) | Special cases | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 14 domain + 12 governance = 26.**

---

## 4.3 Entrance Exam

A formal entrance examination. Enriched in v0.6 with 2 new fields.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | exam_id | UUID | System-generated | Static |
| 2 | exam_code | String | `EXAM-JEE-MAIN`, `EXAM-NEET-UG`, etc. | Static |
| 3 | name | String | Full official name | Static |
| 4 | also_known_as | List (String) | Alternative names | Static |
| 5 | conducting_body | Reference (Regulatory Body) | E.g., NTA | Static |
| 6 | counselling_body | Reference (Regulatory Body) | Often distinct from conducting | Static |
| 7 | exam_level | Enum | National / State / Institution / Private | Static |
| 8 | frequency_per_year | Integer | 1, 2, 3, 4 | Annual |
| 9 | typical_conduct_months | List (String) | Months when held | Annual |
| 10 | mode | Enum | CBT / OMR / Hybrid / Paper-based | Annual |
| 11 | session_number_pattern | Enum | Single / Multi-session-best-of / Multi-session-both-required | Annual |
| 12 | duration_hours | Decimal | Exam duration | Static |
| 13 | number_of_papers | Integer | Number of papers | Static |
| 14 | papers_structure | Structured (JSON) | Details per paper | Static |
| 15 | **sub_paper_variants** | List (String) | **NEW v0.6.** For exams with variants (GATE-CSE, GATE-ME, etc.) | Static |
| 16 | **scoring_types_available_has_score** | Boolean | **NEW v0.6.** Whether raw score is provided | Static |
| 17 | **scoring_types_available_has_percentile** | Boolean | **NEW v0.6.** Whether percentile is provided | Static |
| 18 | **scoring_types_available_has_rank** | Boolean | **NEW v0.6.** Whether rank is provided | Static |
| 19 | **scoring_types_available_has_normalisation** | Boolean | **NEW v0.6.** Whether normalisation is applied | Static |
| 20 | difficulty_indicator | Enum | Foundation / Intermediate / Advanced / Elite | Static |
| 21 | syllabus_reference | List (Reference: Syllabus Topic) | Syllabus topics | Annual |
| 22 | attempts_allowed_lifetime | Integer | Max lifetime attempts | Static |
| 23 | attempts_allowed_per_year | Integer | Max attempts per year | Static |
| 24 | age_criteria_min_age | Integer | Min age (years) | Static |
| 25 | age_criteria_max_age | Integer | Max age (years) | Static |
| 26 | age_criteria_reference_date | String | Date of reference (e.g., "1 Aug of exam year") | Static |
| 27 | age_criteria_exceptions | Text (~100 words) | Special cases | Static |
| 28 | citizenship_criteria_accepted_categories | List (String) | Indian / OCI / PIO / NRI / Foreign | Static |
| 29 | citizenship_criteria_excluded_categories | List (String) | Excluded categories | Static |
| 30 | citizenship_criteria_nri_provisions | Text (~100 words) | NRI-specific rules | Static |
| 31 | citizenship_criteria_oci_provisions | Text (~100 words) | OCI-specific rules | Static |
| 32 | education_prerequisites_class_passed | String | E.g., "Class 12", "Graduation" | Static |
| 33 | education_prerequisites_min_marks_percent | Decimal | Min marks required | Static |
| 34 | education_prerequisites_subjects_required | List (String) | Required subjects | Static |
| 35 | subject_prerequisites | List (Reference: Subject Combination) | Required combinations | Static |
| 36 | eligibility_disqualifiers_notes | Text (~100 words) | Notable exclusions | Static |
| 37 | reservation_categories | List (String) | General / EWS / OBC-NCL / SC / ST / PwD / etc. | Static |
| 38 | state_domicile_criteria | Structured (JSON) | For state-level exams | Static |
| 39 | marital_status_restriction | Enum | No Restriction / Unmarried Only / Married-Only / Other | Static |
| 40 | typical_application_fee_general_inr | Integer | Fee (paise) for General | Annual |
| 41 | typical_application_fee_obc_inr | Integer | Fee (paise) for OBC | Annual |
| 42 | typical_application_fee_sc_st_inr | Integer | Fee (paise) for SC/ST | Annual |
| 43 | typical_application_fee_pwd_inr | Integer | Fee (paise) for PwD | Annual |
| 44 | typical_application_fee_foreign_inr | Integer | Fee (paise) for foreign | Annual |
| 45 | application_window_typical_start_month | String | Start month | Annual |
| 46 | application_window_typical_end_month | String | End month | Annual |
| 47 | application_window_late_fee_window | String | Late fee window | Annual |
| 48 | typical_result_declaration_month | String | Month of result | Annual |
| 49 | application_process_summary | Text (~100 words) | Process summary | Annual |
| 50 | required_documents | List (String) | Documents typically required | Static |
| 51 | mock_test_availability | Enum | Official / Third-party Only / None | Annual |
| 52 | previous_year_paper_availability | Boolean | true / false | Static |
| 53 | typical_registrations_per_year | Integer | Order of magnitude | Annual |
| 54 | typical_success_rate_percent | Decimal | Aggregate | Annual |
| 55 | typical_cutoffs_general_by_year | Structured (JSON) | Historical cutoffs by year × category | Annual |
| 56 | leads_to_admissions_in_streams | List (Reference: Stream) | Streams unlocked | Static |
| 57 | leads_to_admissions_in_degrees | List (Reference: Degree) | Degrees unlocked | Static |
| 58 | leads_to_admissions_in_institutions | List (Reference: Institution) | Institutions unlocked | Static |
| 59 | international_variants | List (Reference: Entrance Exam) | Similar exams abroad | Static |
| 60 | calendar_history | Structured (JSON) | Past 5 years' dates | Annual |
| 61 | typical_coaching_needed | Enum | Not Required / Advisable / Almost Mandatory | Static |
| 62 | number_of_attempts_typical_before_success | Decimal | Average | Annual |
| 63 | related_exams | List (Reference: Entrance Exam) | Backup / alternative exams | Static |
| 64 | universe | Enum | Science / Commerce / Multi | Static |
| 65 | contact_email | String | Official contact | Annual |
| 66 | official_portal_url | String | Portal URL | Annual |
| 67 | active_status | Boolean | true / false | Annual |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 67 domain + 12 governance = 79.**

---

## 4.4 Regulatory Body

A governing/regulatory body (NTA, NMC, AICTE, DGCA, etc.).

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | body_id | UUID | System-generated | Static |
| 2 | body_code | String | `REG-NTA`, `REG-NMC`, `REG-AICTE`, etc. | Static |
| 3 | name | String | Full official name | Static |
| 4 | acronym | String | NTA / NMC / AICTE / DGCA | Static |
| 5 | jurisdiction | Enum | National / State / International / Cross-Border | Static |
| 6 | jurisdiction_scope | String | India / Maharashtra / Karnataka / Global | Static |
| 7 | authority_type | Enum | Statutory / Constitutional / Executive / Autonomous | Static |
| 8 | ministry_or_parent | String | Ministry of Education / Ministry of Health / etc. | Static |
| 9 | conducts_exams | List (Reference: Entrance Exam) | Exams conducted | Static |
| 10 | approves_degrees | List (Reference: Degree) | Degree types approved | Static |
| 11 | issues_licences | List (Reference: Licence) | Licence types issued | Static |
| 12 | official_website | String | URL | Annual |
| 13 | state_units | List (Reference: Regulatory Body) | State-level sub-units | Static |
| 14 | parent_body | Reference (Regulatory Body) | If subordinate to another | Static |
| 15 | established_year | Integer | Year of establishment | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 15 domain + 12 governance = 27.**

---

## 4.5 Degree

An academic degree.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | degree_id | UUID | System-generated | Static |
| 2 | degree_code | String | `DEG-BTECH-CS`, `DEG-MBBS`, etc. | Static |
| 3 | name | String | Full name | Static |
| 4 | short_name | String | BTech / MBBS / BSc | Static |
| 5 | degree_level | Enum | Diploma / Certificate / UG / PG / Doctoral / Post-Doctoral | Static |
| 6 | programme_type | Enum | Standalone-UG / Integrated-UG-PG / Dual-Degree / Bridge / Vocational | Static |
| 7 | typical_duration_years | Decimal | Duration | Static |
| 8 | certification_body_scope | Enum | Central / State / Private / Autonomous / Foreign | Static |
| 9 | approving_bodies | List (Reference: Regulatory Body) | Bodies approving | Static |
| 10 | recognition_status | Enum | UGC-Approved / AICTE-Approved / MCI-Approved / Deemed / Foreign-Equivalent | Static |
| 11 | credit_hours | Integer | Total credit hours | Static |
| 12 | typical_specialisations | List (String) | Common specialisations | Static |
| 13 | equivalent_degrees | List (Reference: Degree) | Cross-country/board equivalents | Static |
| 14 | prerequisite_degree | Reference (Degree) | For PG/Doctoral | Static |
| 15 | typical_awarding_institutions | List (Reference: Institution) | Institutions awarding | Static |
| 16 | international_recognition_countries | List (String) | Countries recognising | Static |
| 17 | international_recognition_conditions | Text (~100 words) | Conditions | Static |
| 18 | active_status | Boolean | true / false | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 18 domain + 12 governance = 30.**

---

## 4.6 Institution Type

A category of institution (IIT, NIT, State University, Private, etc.).

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | type_id | UUID | System-generated | Static |
| 2 | type_code | String | `ITY-IIT`, `ITY-NIT`, etc. | Static |
| 3 | name | String | E.g., "Indian Institute of Technology" | Static |
| 4 | governance_model | Enum | Public / Private / Deemed / Autonomous / Government-Aided / Foreign | Static |
| 5 | regulator | Reference (Regulatory Body) | Primary regulator | Static |
| 6 | funding_source | Enum | Central / State / Private / Trust / Foreign | Static |
| 7 | typical_fee_range_min_annual_inr | BigInt | Min annual fee (paise) | Annual |
| 8 | typical_fee_range_max_annual_inr | BigInt | Max annual fee (paise) | Annual |
| 9 | typical_admission_pathway | List (Reference: Admission Pathway) | Common pathways | Static |
| 10 | accreditation_status_required | Enum | UGC / NAAC / AICTE / NBA / State | Static |
| 11 | placement_focus_typical | Enum | Strong / Moderate / Emerging / Weak | Annual |
| 12 | research_focus | Enum | Strong / Moderate / Emerging / Weak | Annual |
| 13 | international_ranking_frequent | Boolean | In global rankings | Annual |
| 14 | typical_seat_count | Integer | Order of magnitude | Static |
| 15 | typical_hostel_availability | Enum | Full / Partial / None | Static |
| 16 | typical_pathway_from_school | Enum | Direct / Post-JC / Post-UG | Static |
| 17 | rankings_source | String | NIRF / QS / Times / etc. | Annual |
| 18 | active_status | Boolean | true / false | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 18 domain + 12 governance = 30.**

---

## 4.7 Institution

A specific institution. Enriched in v0.6.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | institution_id | UUID | System-generated | Static |
| 2 | institution_code | String | `INST-IITB`, `INST-AIIMS-DELHI`, etc. | Static |
| 3 | name | String | Full official name | Static |
| 4 | short_name | String | "IITB", "AIIMS Delhi" | Static |
| 5 | institution_type | Reference (Institution Type) | Type | Static |
| 6 | established_year | Integer | Year | Static |
| 7 | parent_group | String | E.g., "IIT System", "AIIMS Network" | Static |
| 8 | city_location | Reference (City) | Primary city | Static |
| 9 | state | String | State | Static |
| 10 | campus_size_acres | Decimal | Campus area | Static |
| 11 | number_of_campuses | Integer | Multi-campus institutions | Static |
| 12 | streams_offered | List (Reference: Stream) | Streams offered | Annual |
| 13 | annual_intake_total | Integer | Total seats | Annual |
| 14 | annual_intake_by_stream | Structured (JSON) | Seats per Stream | Annual |
| 15 | approving_bodies | List (Reference: Regulatory Body) | Approving bodies | Static |
| 16 | accreditation_status | Enum | Active / Under-Review / Withdrawn / Never | Static |
| 17 | rankings | Structured (JSON) | List of {source, year, rank, category} | Annual |
| 18 | annual_tuition_min_inr | BigInt | Min tuition (paise) | Annual |
| 19 | annual_tuition_mid_inr | BigInt | Mid tuition (paise) | Annual |
| 20 | annual_tuition_max_inr | BigInt | Max tuition (paise) | Annual |
| 21 | annual_hostel_cost_min_inr | BigInt | Min hostel (paise) | Annual |
| 22 | annual_hostel_cost_max_inr | BigInt | Max hostel (paise) | Annual |
| 23 | annual_mess_cost_min_inr | BigInt | Min mess (paise) | Annual |
| 24 | annual_mess_cost_max_inr | BigInt | Max mess (paise) | Annual |
| 25 | annual_other_fees_min_inr | BigInt | Min other fees (paise) | Annual |
| 26 | annual_other_fees_max_inr | BigInt | Max other fees (paise) | Annual |
| 27 | scholarships_available | List (Reference: Scholarship) | Scholarships | Annual |
| 28 | education_loans_pre_approved | List (Reference: Education Loan) | Banks with pre-approval | Annual |
| 29 | admission_pathways_supported | List (Reference: Admission Pathway) | Pathways | Static |
| 30 | reservation_policy_seats_by_category | Structured (JSON) | Seat allocation by category | Annual |
| 31 | typical_placement_stats_avg_package_inr | BigInt | Average package (paise) | Annual |
| 32 | typical_placement_stats_median_package_inr | BigInt | Median (paise) | Annual |
| 33 | typical_placement_stats_top_recruiters | List (String) | Top recruiters | Annual |
| 34 | **placement_verification_status** | Enum | **NEW v0.6.** Self-Reported / Third-Party-Audited / Regulator-Verified / Publicly-Verified / Unverified | Annual |
| 35 | medium_of_instruction | List (String) | English / Hindi / Regional | Static |
| 36 | international_partnerships | List (String) | Foreign collaborations | Annual |
| 37 | hostel_availability | Enum | Full / Partial / None | Static |
| 38 | facilities_summary | Text (~100 words) | Facilities | Static |
| 39 | contact_email | String | Official contact | Annual |
| 40 | contact_phone | String | Phone | Annual |
| 41 | official_website | String | URL | Annual |
| 42 | admissions_email | String | Admissions contact | Annual |
| 43 | active_status | Boolean | true / false | Annual |
| 44 | is_pwd_accessible | Boolean | true / false | Static |
| 45 | universe_applicability | List (String) | Universes served | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 45 domain + 12 governance = 57.**

---

## 4.8 Admission Pathway

A route into a Stream.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | pathway_id | UUID | System-generated | Static |
| 2 | pathway_code | String | `PATH-REGULAR`, `PATH-DIPLOMA-LATERAL`, `PATH-SPORTS`, `PATH-NRI`, `PATH-FOREIGN-DASA`, etc. | Static |
| 3 | name | String | E.g., "Diploma Lateral Entry" | Static |
| 4 | pathway_type | Enum | Regular / Lateral / Sports / Cultural / NRI / Foreign / Management / Transfer / Bridge | Static |
| 5 | entry_stage | Reference (Education Stage) | Stage entered | Static |
| 6 | eligibility_summary | Text (~100 words) | Eligibility | Static |
| 7 | typical_seat_allocation_percent | Decimal | Percentage of seats | Static |
| 8 | evidence_required | List (String) | Documents needed | Static |
| 9 | competitive_process | Enum | Merit / Auction / Quota / Interview / Portfolio | Static |
| 10 | typical_streams_that_offer | List (Reference: Stream) | Streams offering | Static |
| 11 | typical_institutions_that_offer | List (Reference: Institution) | Institutions offering | Static |
| 12 | typical_fees_premium_percent | Decimal | Fee premium over regular | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 12 domain + 12 governance = 24.**

---

## 4.9 Syllabus Topic

A granular topic in an Entrance Exam or Subject curriculum.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | topic_id | UUID | System-generated | Static |
| 2 | topic_code | String | `SYL-JEE-MATH-CALCULUS`, etc. | Static |
| 3 | name | String | Topic name | Static |
| 4 | parent_subject | Reference (Subject) | Subject | Static |
| 5 | parent_exam | Reference (Entrance Exam) | If exam-specific | Static |
| 6 | weightage_in_exam_percent | Decimal | Weight | Annual |
| 7 | difficulty_indicator | Enum | Foundation / Intermediate / Advanced / Elite | Static |
| 8 | prerequisite_topics | List (Reference: Syllabus Topic) | PREREQUISITE_OF chain | Static |
| 9 | typical_time_to_master_hours | Integer | Hours needed | Static |
| 10 | source_reference | String | NCERT / State Board / etc. | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 10 domain + 12 governance = 22.**

---

## 4.10 Subject Equivalence Rule

A rule mapping equivalent subjects across boards / stages / countries.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | rule_id | UUID | System-generated | Static |
| 2 | rule_code | String | `SER-IB-MATH-HL-INDIAN-MATH`, etc. | Static |
| 3 | name | String | Rule name | Static |
| 4 | source_subject | Reference (Subject) | E.g., IB Math HL | Static |
| 5 | source_board | String | E.g., IB | Static |
| 6 | equivalent_subject | Reference (Subject) | E.g., Class 12 Mathematics | Static |
| 7 | target_board | String | E.g., CBSE | Static |
| 8 | applies_to_exams | List (Reference: Entrance Exam) | Exams accepting | Static |
| 9 | conditions | Text (~50 words) | Conditions | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 9 domain + 12 governance = 21.**

---

# GROUP C — ECOSYSTEM & PROFESSIONAL (5 entities)

---

## 5.1 Internship Type

A category of internship. Enriched in v0.6.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | internship_id | UUID | System-generated | Static |
| 2 | internship_code | String | `INT-CLINICAL-ROT`, `INT-TECH-SUMMER`, etc. | Static |
| 3 | name | String | Full name | Static |
| 4 | classification | Enum | Clinical-Rotation / Tech-Internship / Research / Field-Attachment / Corporate / Government / Startup / Non-Profit | Static |
| 5 | typical_duration_months | Integer | Duration | Static |
| 6 | typical_stipend_min_inr | BigInt | Min monthly stipend (paise) | Annual |
| 7 | typical_stipend_max_inr | BigInt | Max monthly stipend (paise) | Annual |
| 8 | typical_applicable_streams | List (Reference: Stream) | Streams including | Static |
| 9 | mandatory_for_streams | List (Reference: Stream) | Streams where mandatory | Static |
| 10 | is_paid_typical | Enum | Always-Paid / Often-Paid / Sometimes-Paid / Rarely-Paid / Never-Paid | Static |
| 11 | typical_hosting_organisations | List (String) | Types of hosts | Static |
| 12 | evidence_produced | List (String) | Certificate / Report / Recommendation | Static |
| 13 | **internship_verification_status** | Enum | **NEW v0.6.** Verified-by-Institution / Third-Party-Verified / Regulator-Recognised / Self-Reported / Under-Review | Annual |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 13 domain + 12 governance = 25.**

---

## 5.2 Career Outcome

A specific career path with employment reality. Substantially enriched in v0.6.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | outcome_id | UUID | System-generated | Static |
| 2 | outcome_code | String | `CAR-SW-ENGINEER`, `CAR-CARDIOLOGIST`, etc. | Static |
| 3 | name | String | E.g., "Software Engineer" | Static |
| 4 | also_known_as | List (String) | Alternative titles | Static |
| 5 | parent_stream | Reference (Stream) | Stream leading here | Static |
| 6 | related_streams | List (Reference: Stream) | Other Streams leading here | Static |
| 7 | employment_types_available | List (String) | Employed / Private-Practice / Consulting / Entrepreneur / Freelance / Faculty / Government / Public-Sector | Annual |
| 8 | typical_earning_start_age | Integer | Age at first pay | Static |
| 9 | typical_medium_of_work | List (String) | English / Hindi / Regional / Multi | Static |
| 10 | work_environment | List (String) | Office / Field / Lab / Home / Hospital / Studio / Site / Remote / Hybrid | Static |
| 11 | typical_industries | List (String) | Industries | Annual |
| 12 | typical_hiring_organisations | List (String) | Types of orgs | Annual |
| 13 | top_hiring_cities | List (Reference: City) | Cities | Annual |
| 14 | typical_probation_period_months | Integer | Duration | Static |
| 15 | remote_work_feasibility | Enum | Fully-Remote / Hybrid / Limited / Not-Feasible | Static |
| 16 | work_intensity | Enum | Low / Moderate / High / Extreme | Static |
| 17 | on_call_expectations | Enum | None / Occasional / Regular / 24x7 | Static |
| 18 | travel_expectations | Enum | None / Occasional / Frequent / Constant | Static |
| 19 | required_certifications | List (Reference: Certification) | Certifications needed | Static |
| 20 | required_licences | List (Reference: Licence) | Licences needed | Static |
| 21 | required_skills | List (Reference: Skill) | Skills needed (via REQUIRES_SKILL) | Static |
| 22 | required_aptitudes | List (Reference: Aptitude) | Aptitudes needed (via REQUIRES_APTITUDE) | Static |
| 23 | favoured_traits | List (Reference: Personality Trait) | Traits favoured (via FAVOURED_BY_TRAIT) | Static |
| 24 | aligned_interests | List (Reference: Interest) | Interests aligned (via ALIGNS_WITH_INTEREST) | Static |
| 25 | influenced_by_preferences | List (Reference: Work Preference) | Preferences influencing | Static |
| 26 | disability_inclusions_vision | Enum | Fully-Inclusive / Partially / Limited / Not-Inclusive | Static |
| 27 | disability_inclusions_hearing | Enum | Fully-Inclusive / Partially / Limited / Not-Inclusive | Static |
| 28 | disability_inclusions_mobility | Enum | Fully-Inclusive / Partially / Limited / Not-Inclusive | Static |
| 29 | disability_inclusions_cognitive | Enum | Fully-Inclusive / Partially / Limited / Not-Inclusive | Static |
| 30 | disability_inclusions_chronic_conditions | Enum | Fully-Inclusive / Partially / Limited / Not-Inclusive | Static |
| 31 | medical_exclusions | List (String) | Medical conditions disqualifying | Static |
| 32 | medical_fitness_standard | String | E.g., "Class 1 Medical / AFMB / DGCA" | Static |
| 33 | vision_correction_note | String | Whether correction allowed | Static |
| 34 | commission_types_available | Structured (JSON) | For military: {type, tenure, pension} | Static |
| 35 | career_progression_metric | String | "Flight Hours / Cases Handled / Publications" | Static |
| 36 | **career_ceiling_indicator** | Enum | **NEW v0.6.** Early / Mid / Late / None | Annual |
| 37 | **family_status_restrictions_marriage_during_training** | Boolean | **NEW v0.6.** true/false | Static |
| 38 | **family_status_restrictions_family_size_restrictions** | Text (~50 words) | **NEW v0.6.** Any restrictions | Static |
| 39 | **family_status_restrictions_spouse_profession_restrictions** | Text (~50 words) | **NEW v0.6.** Spouse profession | Static |
| 40 | typical_promotion_path | Structured (JSON) | Career ladder steps | Annual |
| 41 | international_relocation_feasibility | Enum | High / Moderate / Low / Very-Low | Static |
| 42 | typical_years_to_seniority | Integer | Years to senior role | Static |
| 43 | typical_hours_per_week_typical | Integer | Typical hours | Static |
| 44 | typical_hours_per_week_min | Integer | Min hours | Static |
| 45 | typical_hours_per_week_max | Integer | Max hours | Static |
| 46 | typical_holiday_norm_days | Integer | Days per year | Static |
| 47 | follow_on_entrance_exams | List (Reference: Entrance Exam) | Exams for progression | Static |
| 48 | related_career_outcomes | List (Reference: Career Outcome) | Adjacent careers | Static |
| 49 | future_disruption_risk | Enum | Low / Moderate / High / Very-High / Under-Debate | 2-Yearly |
| 50 | ideal_persona | Text (~200 words) | Personality fit description | Static |
| 51 | typical_dropout_rate_percent | Decimal | Aggregate dropout | Annual |
| 52 | typical_regret_data | Text (~100 words) | Reasons for career regret | Annual |
| 53 | typical_burnout_rate_percent | Decimal | Aggregate burnout | 2-Yearly |
| 54 | active_status | Boolean | true / false | Annual |
| 55 | universe | Enum | Science / Commerce / Multi | Static |
| 56 | professional_bodies_associated | List (String) | Professional bodies | Static |
| 57 | continuing_education_typical_hours_per_year | Integer | CE hours | Static |
| 58 | typical_certifications_over_career | List (Reference: Certification) | Certs typically pursued | Static |
| 59 | earnings_variability_indicator | Enum | Very-Stable / Stable / Variable / Highly-Variable | Static |
| 60 | typical_ownership_of_output | Enum | Employer-Owned / Shared / Personal | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 60 domain + 12 governance = 72.**

---

## 5.3 Salary Range

Salary data by Career Outcome and experience level.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | salary_id | UUID | System-generated | Static |
| 2 | salary_code | String | `SAL-SW-ENG-ENTRY`, `SAL-SW-ENG-5YR`, etc. | Static |
| 3 | career_outcome | Reference (Career Outcome) | Related outcome | Static |
| 4 | experience_bucket | Enum | Entry-0-2 / Early-3-5 / Mid-6-10 / Senior-11-15 / Leadership-16+ | Static |
| 5 | min_lpa | Decimal | Lowest observed | Annual |
| 6 | mid_lpa | Decimal | Median observed | Annual |
| 7 | max_lpa | Decimal | Highest observed | Annual |
| 8 | data_source | String | AmbitionBox / Glassdoor / etc. | Annual |
| 9 | data_year | Integer | Year collected | Annual |
| 10 | notes_on_variation | Text (~100 words) | Notes | Annual |
| 11 | applicable_cities | List (Reference: City) | Cities where data applies | Annual |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 11 domain + 12 governance = 23.**

---

## 5.4 City

A city relevant for Institution location and Career Outcome hiring hubs.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | city_id | UUID | System-generated | Static |
| 2 | city_code | String | `CITY-PUN-MH`, `CITY-BLR-KA`, etc. | Static |
| 3 | name | String | Full name | Static |
| 4 | state | String | State | Static |
| 5 | country | String | Country | Static |
| 6 | tier | Enum | Tier-1 / Tier-2 / Tier-3 / Tier-4 / Special | Static |
| 7 | population_millions | Decimal | Population | 2-Yearly |
| 8 | major_hiring_sectors | List (String) | IT / Manufacturing / Finance / Healthcare / etc. | Annual |
| 9 | typical_hiring_companies | List (String) | Notable employers | Annual |
| 10 | annual_cost_of_living_min_inr | BigInt | Min (paise) | Annual |
| 11 | annual_cost_of_living_mid_inr | BigInt | Mid (paise) | Annual |
| 12 | annual_cost_of_living_max_inr | BigInt | Max (paise) | Annual |
| 13 | typical_rent_studio_inr | BigInt | Studio rent monthly (paise) | Annual |
| 14 | typical_rent_1bhk_inr | BigInt | 1BHK rent monthly (paise) | Annual |
| 15 | typical_rent_2bhk_inr | BigInt | 2BHK rent monthly (paise) | Annual |
| 16 | education_hubs | List (String) | Areas known for education | Static |
| 17 | major_institutions | List (Reference: Institution) | Major institutions | Static |
| 18 | typical_public_transport_availability | Enum | Extensive / Moderate / Limited / Emerging | Annual |
| 19 | international_airport | Boolean | true / false | Static |
| 20 | typical_climate_type | String | Tropical / Semi-Arid / etc. | Static |
| 21 | language_of_daily_use | List (String) | Local languages | Static |
| 22 | typical_safety_indicator | Enum | High / Moderate / Low | 2-Yearly |
| 23 | pwd_infrastructure_rating | Enum | Excellent / Good / Fair / Poor | 2-Yearly |
| 24 | language_transition_support | Enum | Extensive / Moderate / Limited / None | Static |
| 25 | study_hub_rating | Enum | High / Moderate / Low | 2-Yearly |
| 26 | metro_or_metropolitan | Boolean | true / false | Static |
| 27 | active_status | Boolean | true / false | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 27 domain + 12 governance = 39.**

---

## 5.5 Licence

A regulator-issued permit.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | licence_id | UUID | System-generated | Static |
| 2 | licence_code | String | `LIC-CPL`, `LIC-MBBS-REG`, `LIC-BAR-MH`, etc. | Static |
| 3 | name | String | Full name | Static |
| 4 | short_name | String | E.g., "CPL" | Static |
| 5 | issuing_body | Reference (Regulatory Body) | Issuer | Static |
| 6 | licensing_authority_scope | Enum | National / State / Regional / Cross-Border | Static |
| 7 | issuance_prerequisites_education | List (String) | Education prerequisites | Static |
| 8 | issuance_prerequisites_training_hours | Integer | Required training hours | Static |
| 9 | issuance_prerequisites_tests_passed | List (String) | Required tests | Static |
| 10 | issuance_prerequisites_medical | Text (~100 words) | Medical requirements | Static |
| 11 | issuance_prerequisites_background_check | Boolean | Required or not | Static |
| 12 | medical_certification_required | Boolean | true / false | Static |
| 13 | validity_period_years | Decimal | For time-limited licences | Static |
| 14 | renewable | Boolean | true / false | Static |
| 15 | renewal_frequency | Enum | None-Lifetime / Annual / 2-Yearly / 5-Yearly / Custom | Static |
| 16 | renewal_requirements_continuing_education_hours | Integer | CE hours required | Annual |
| 17 | renewal_requirements_medical_recheck | Boolean | true / false | Annual |
| 18 | renewal_requirements_fees_inr | BigInt | Renewal fee (paise) | Annual |
| 19 | typical_issuance_fee_inr | BigInt | Issuance fee (paise) | Annual |
| 20 | revocation_grounds | List (String) | Reasons for revocation | Static |
| 21 | prerequisite_training_hours | Integer | Total training before issuance | Static |
| 22 | cross_jurisdictional_equivalence | List (Reference: Licence) | Countries recognising (via EQUIVALENT_TO) | Static |
| 23 | grades_or_types_available | List (String) | Sub-types (CPL/ATPL) | Static |
| 24 | typical_holders_career_outcomes | List (Reference: Career Outcome) | Career Outcomes | Static |
| 25 | typical_issuance_success_rate_percent | Decimal | Success rate | 2-Yearly |
| 26 | active_status | Boolean | true / false | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 26 domain + 12 governance = 38.**

---

# GROUP D — FINANCIAL (2 entities)

---

## 6.1 Scholarship

Financial aid instrument.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | scholarship_id | UUID | System-generated | Static |
| 2 | scholarship_code | String | `SCH-INSPIRE-SHE`, `SCH-KVPY-SA`, etc. | Static |
| 3 | name | String | Full name | Static |
| 4 | award_type | Enum | Merit / Need / Category / Hybrid / Stipend / Contest-Award | Static |
| 5 | issuing_organisation | String | Government / Institution / Corporate / Trust | Static |
| 6 | issuing_body_type | Enum | Central-Govt / State-Govt / Institution / Private / Foreign | Static |
| 7 | annual_amount_min_inr | BigInt | Min amount (paise) | Annual |
| 8 | annual_amount_mid_inr | BigInt | Mid amount (paise) | Annual |
| 9 | annual_amount_max_inr | BigInt | Max amount (paise) | Annual |
| 10 | tenure_years | Decimal | Duration | Static |
| 11 | eligibility_categories | List (String) | General / EWS / OBC-NCL / SC / ST / PwD / Girl-Child / etc. | Static |
| 12 | eligibility_income_ceiling_inr | BigInt | Family income ceiling (paise) | Annual |
| 13 | eligibility_academic_criteria_min_class_10_percent | Decimal | Min Class 10 percent | Static |
| 14 | eligibility_academic_criteria_min_class_12_percent | Decimal | Min Class 12 percent | Static |
| 15 | eligibility_academic_criteria_min_ug_percent | Decimal | Min UG percent | Static |
| 16 | eligibility_domicile_state | List (String) | Domicile states required | Static |
| 17 | eligibility_domicile_district | List (String) | Districts if applicable | Static |
| 18 | special_circumstance_eligibility | Structured (JSON) | Rare/niche criteria | Static |
| 19 | applicable_streams | List (Reference: Stream) | Streams | Static |
| 20 | applicable_institutions | List (Reference: Institution) | Institutions | Static |
| 21 | applicable_stages | List (Reference: Education Stage) | Stages | Static |
| 22 | number_of_awards_annual | Integer | Slots per year | Annual |
| 23 | application_process_summary | Text (~100 words) | Process | Annual |
| 24 | application_deadlines | List (String) | Deadlines per year | Annual |
| 25 | required_documents | List (String) | Documents | Static |
| 26 | selection_process | Enum | Merit-Based / Interview / Combined / Merit+Interview | Static |
| 27 | stackable_with_other_scholarships | Boolean | true / false | Static |
| 28 | is_taxable | Boolean | true / false | Static |
| 29 | renewal_conditions | Structured (JSON) | Rules for continued eligibility | Static |
| 30 | disbursal_frequency | Enum | Lump-Sum / Annual / Semester / Monthly | Static |
| 31 | typical_success_rate_percent | Decimal | Application success rate | Annual |
| 32 | official_portal_url | String | URL | Annual |
| 33 | contact_email | String | Email | Annual |
| 34 | last_year_awardees_count | Integer | Historic data | Annual |
| 35 | funding_source | String | Source of funds | Annual |
| 36 | disbursal_delay_typical_months | Integer | Typical delay | Annual |
| 37 | linked_to_specific_exams | List (Reference: Entrance Exam) | Exams tied to eligibility | Static |
| 38 | pipeline_source | String | Authoritative source for data loading | Static |
| 39 | active_status | Boolean | true / false | Annual |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 39 domain + 12 governance = 51.**

---

## 6.2 Education Loan

Education loan product.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | loan_id | UUID | System-generated | Static |
| 2 | loan_code | String | `LOAN-SBI-SCHOLAR`, `LOAN-HDFC-EDU`, etc. | Static |
| 3 | name | String | Full product name | Static |
| 4 | lender_type | Enum | PSU-Bank / Private-Bank / NBFC / Cooperative / Foreign | Static |
| 5 | lender_name | String | Institution offering | Static |
| 6 | loan_amount_min_inr | BigInt | Min sanctionable (paise) | Annual |
| 7 | loan_amount_max_inr | BigInt | Max sanctionable (paise) | Annual |
| 8 | interest_rate_min_percent | Decimal | Min interest rate | Annual |
| 9 | interest_rate_mid_percent | Decimal | Typical interest rate | Annual |
| 10 | interest_rate_max_percent | Decimal | Max interest rate | Annual |
| 11 | interest_rate_type | Enum | Fixed / Floating / Hybrid | Annual |
| 12 | moratorium_period_years | Decimal | Course + grace | Static |
| 13 | simple_interest_during_moratorium | Boolean | true / false | Static |
| 14 | repayment_tenure_years | Decimal | Duration | Static |
| 15 | processing_fee_percent | Decimal | Percentage of loan | Annual |
| 16 | prepayment_penalty_percent | Decimal | Penalty | Static |
| 17 | collateral_required | Boolean | true / false | Static |
| 18 | collateral_types_accepted | List (String) | Property / FD / Third-party-guarantor | Static |
| 19 | collateral_threshold_inr | BigInt | Above which collateral needed (paise) | Annual |
| 20 | co_applicant_required | Boolean | true / false | Static |
| 21 | co_applicant_options | List (String) | Parent / Guardian / Spouse | Static |
| 22 | covers_tuition | Boolean | true / false | Static |
| 23 | covers_hostel_mess | Boolean | true / false | Static |
| 24 | covers_examination_fees | Boolean | true / false | Static |
| 25 | covers_books_equipment | Boolean | true / false | Static |
| 26 | covers_travel | Boolean | true / false | Static |
| 27 | covers_international_study | Boolean | true / false | Static |
| 28 | pre_approved_institutions | List (Reference: Institution) | Institutions | Annual |
| 29 | eligible_streams | List (Reference: Stream) | Streams | Static |
| 30 | eligibility_academic_min_percent | Decimal | Min academic | Static |
| 31 | eligibility_income_min_inr | BigInt | Min family income (paise) | Annual |
| 32 | eligibility_income_max_inr | BigInt | Max family income (paise) | Annual |
| 33 | interest_subsidy_available | Boolean | true / false | Annual |
| 34 | subsidy_scheme_name | String | E.g., "Central Sector Interest Subsidy" | Annual |
| 35 | subsidy_conditions | Structured (JSON) | Conditions | Annual |
| 36 | tax_benefits_section | String | E.g., "80E" | Static |
| 37 | tax_benefits_details | Text (~100 words) | Details | Static |
| 38 | typical_disbursal_time_days | Integer | Time to disbursal | Annual |
| 39 | required_documents | List (String) | Documents | Static |
| 40 | application_process_summary | Text (~100 words) | Process | Annual |
| 41 | official_portal_url | String | URL | Annual |
| 42 | contact_email | String | Email | Annual |
| 43 | active_status | Boolean | true / false | Annual |
| 44 | international_variants | List (String) | Similar products abroad | Static |
| 45 | notes | Text (~100 words) | Additional notes | Annual |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 45 domain + 12 governance = 57.**

---

# GROUP E — COMPETENCY CONCEPT ENTITIES (5 entities) — NEW in v0.6

---

## 7.1 Interest

Universal interest area concept.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | interest_id | UUID | System-generated | Static |
| 2 | interest_code | String | `INTR-SPACE`, `INTR-ENVIRONMENT`, `INTR-AI`, etc. | Static |
| 3 | name | String | Interest name | Static |
| 4 | category | Enum | STEM / Arts / Social / Physical / Business / Humanitarian | Static |
| 5 | parent_interest | Reference (Interest) | Hierarchical parent | Static |
| 6 | related_domains | List (Reference: Domain) | Domains connected | Static |
| 7 | typical_expression_activities | List (Reference: Activity) | Activity types indicating this | Static |
| 8 | description | Text (~100 words) | Description | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 8 domain + 12 governance = 20.**

---

## 7.2 Aptitude

Universal aptitude category.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | aptitude_id | UUID | System-generated | Static |
| 2 | aptitude_code | String | `APT-NUMERICAL-REASONING`, `APT-SPATIAL-REASONING`, etc. | Static |
| 3 | name | String | Aptitude name | Static |
| 4 | type | Enum | Cognitive / Perceptual / Reasoning / Memory / Verbal / Physical | Static |
| 5 | standard_measurement_scale | String | "percentile" / "IQ-equivalent" / "domain-specific" | Static |
| 6 | standard_assessment_methods | List (String) | DAT / GATB / GRE-Analytical / Custom | Static |
| 7 | related_streams | List (Reference: Stream) | Streams requiring | Static |
| 8 | improvable_through_practice | Boolean | true / false | Static |
| 9 | related_career_outcomes | List (Reference: Career Outcome) | Career Outcomes | Static |
| 10 | parent_aptitude | Reference (Aptitude) | Hierarchical parent | Static |
| 11 | description | Text (~100 words) | Description | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 11 domain + 12 governance = 23.**

---

## 7.3 Skill

Universal learned competency.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | skill_id | UUID | System-generated | Static |
| 2 | skill_code | String | `SKL-PYTHON`, `SKL-WELDING`, `SKL-PUBLIC-SPEAKING`, etc. | Static |
| 3 | name | String | Skill name | Static |
| 4 | category | Enum | Technical / Analytical / Creative / Communication / Physical | Static |
| 5 | standard_proficiency_scale | String | "Beginner / Intermediate / Advanced / Expert" | Static |
| 6 | application_domain | List (String) | Industries where skill applies | Static |
| 7 | typical_time_to_develop_months | Integer | Universal average | Annual |
| 8 | prerequisites | List (Reference: Skill) | Prerequisite Skills (PREREQUISITE_OF chain) | Static |
| 9 | typical_verification_methods | List (String) | Test / Portfolio / Certification / Reference | Static |
| 10 | related_streams | List (Reference: Stream) | Streams requiring | Static |
| 11 | related_career_outcomes | List (Reference: Career Outcome) | Career Outcomes requiring | Static |
| 12 | is_transferable | Boolean | Cross-industry applicability | Static |
| 13 | description | Text (~100 words) | Description | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 13 domain + 12 governance = 25.**

---

## 7.4 Personality Trait

Universal personality dimension.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | trait_id | UUID | System-generated | Static |
| 2 | trait_code | String | `TRT-INTROVERSION`, `TRT-DETAIL-ORIENTATION`, etc. | Static |
| 3 | name | String | Trait name | Static |
| 4 | dimension | Enum | Big-Five / HEXACO / Values / Custom | Static |
| 5 | polarity_positive_pole | String | E.g., "Introversion" | Static |
| 6 | polarity_negative_pole | String | E.g., "Extraversion" | Static |
| 7 | polarity_is_bipolar | Boolean | true / false | Static |
| 8 | related_careers | List (Reference: Career Outcome) | Careers favoured by this trait | Static |
| 9 | standard_assessment_frameworks | List (String) | Big-Five / MBTI / etc. | Static |
| 10 | description | Text (~100 words) | Description | Static |
| 11 | parent_trait | Reference (Personality Trait) | Hierarchical parent | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 11 domain + 12 governance = 23.**

---

## 7.5 Work Preference

Universal work-style preference concept.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | preference_id | UUID | System-generated | Static |
| 2 | preference_code | String | `WPF-REMOTE-WORK`, `WPF-STABLE-INCOME`, etc. | Static |
| 3 | preference_type | Enum | WorkEnvironment / WorkHours / TeamStructure / TravelWillingness / RemotenessPreference / IncomeStability | Static |
| 4 | possible_values | List (String) | E.g., for WorkEnvironment: Office / Field / Remote / Hybrid | Static |
| 5 | career_relevance | List (Reference: Career Outcome) | Career Outcomes where this matters | Static |
| 6 | description | Text (~100 words) | Description | Static |
| 7 | assessment_source | String | Typical way preference is captured | Static |
| 8 | parent_preference | Reference (Work Preference) | Hierarchical parent | Static |
| 9 | flexibility_typical | Enum | Highly-Flexible / Moderately-Flexible / Rigid | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 9 domain + 12 governance = 21.**

---

# GROUP F — EXPERIENCE CONCEPT ENTITIES (4 entities) — NEW in v0.6

---

## 8.1 Activity

Universal category of extra-curricular activities.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | activity_id | UUID | System-generated | Static |
| 2 | activity_code | String | `ACT-ROBOTICS-CLUB`, `ACT-CODING-COMPETITION`, etc. | Static |
| 3 | name | String | Activity name | Static |
| 4 | category | Enum | Academic / Competition / Club / Self-Study / Coding / Sport / Cultural / Volunteering | Static |
| 5 | stage_range | List (Reference: Education Stage) | Applicable Education Stages | Static |
| 6 | typical_duration_months | Integer | Duration | Static |
| 7 | builds_skills | List (Reference: Skill) | Skills developed (via DEVELOPS_SKILL) | Static |
| 8 | develops_traits | List (Reference: Personality Trait) | Traits reinforced | Static |
| 9 | typical_cost_range_min_inr | BigInt | Min cost (paise) | Annual |
| 10 | typical_cost_range_max_inr | BigInt | Max cost (paise) | Annual |
| 11 | evidence_types_produced | List (String) | Project / Certificate / Report / Award | Static |
| 12 | related_streams | List (Reference: Stream) | Streams this activity supports | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 12 domain + 12 governance = 24.**

---

## 8.2 Project

Universal category of projects.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | project_id | UUID | System-generated | Static |
| 2 | project_code | String | `PRJ-CAPSTONE-ENG`, `PRJ-RESEARCH-UG`, etc. | Static |
| 3 | name | String | Project category name | Static |
| 4 | type | Enum | Academic / Personal / Hackathon / Research / Startup | Static |
| 5 | stage | Reference (Education Stage) | Typical stage | Static |
| 6 | typical_duration_months | Integer | Duration | Static |
| 7 | typical_team_size_min | Integer | Min team size | Static |
| 8 | typical_team_size_typical | Integer | Typical team size | Static |
| 9 | typical_team_size_max | Integer | Max team size | Static |
| 10 | typical_technologies_used | List (String) | Common technologies | Static |
| 11 | expected_deliverables | List (String) | Typical outputs | Static |
| 12 | typical_outcomes_or_impact | Text (~100 words) | Impact | Static |
| 13 | standard_verification_methods | List (String) | Authenticity verification | Static |
| 14 | skills_typically_demonstrated | List (Reference: Skill) | Skills shown (via DEVELOPS_SKILL) | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 14 domain + 12 governance = 26.**

---

## 8.3 Apprenticeship

Universal category of on-the-job training programmes.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | apprenticeship_id | UUID | System-generated | Static |
| 2 | apprenticeship_code | String | `APP-ELECTRICIAN-3YR`, `APP-CARPENTER-2YR`, etc. | Static |
| 3 | name | String | Apprenticeship name | Static |
| 4 | trade_or_role | String | Trade name | Static |
| 5 | typical_duration_months | Integer | Duration | Static |
| 6 | typical_stipend_min_inr | BigInt | Min monthly stipend (paise) | Annual |
| 7 | typical_stipend_max_inr | BigInt | Max monthly stipend (paise) | Annual |
| 8 | governing_body | Reference (Regulatory Body) | Governing body | Static |
| 9 | certification_awarded_on_completion | Reference (Certification) | Certificate awarded | Static |
| 10 | applicable_stages | List (Reference: Education Stage) | Applicable stages | Static |
| 11 | applicable_streams | List (Reference: Stream) | Streams | Static |
| 12 | typical_employers | List (String) | Types of hosts | Static |
| 13 | structured_learning_hours | Integer | Classroom hours | Static |
| 14 | hands_on_hours | Integer | Practical hours | Static |
| 15 | standard_verification_process | Text (~100 words) | Verification | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 15 domain + 12 governance = 27.**

---

## 8.4 Certification

Universal category of third-party certifications.

| # | Property | Type | Values / Notes | Refresh |
|---|---|---|---|---|
| 1 | certification_id | UUID | System-generated | Static |
| 2 | certification_code | String | `CERT-AWS-CP`, `CERT-PMP`, `CERT-CFA-1`, etc. | Static |
| 3 | name | String | Full name | Static |
| 4 | issuing_body | String | AWS / PMI / CFA Institute / etc. | Static |
| 5 | type | Enum | Professional / Vendor / Skill / Compliance / Continuing-Education | Static |
| 6 | typical_duration_hours | Integer | Study hours | Static |
| 7 | validity_period_years | Decimal | If time-limited | Static |
| 8 | renewable | Boolean | true / false | Static |
| 9 | typical_cost_inr | BigInt | Fee (paise) | Annual |
| 10 | applicable_career_outcomes | List (Reference: Career Outcome) | Career Outcomes | Static |
| 11 | stackable_with | List (Reference: Certification) | Other Certifications | Static |
| 12 | prerequisites | List (Reference: Certification) | Prerequisite Certifications/Skills | Static |
| 13 | assessment_method | Enum | Exam / Portfolio / Continuous / Combined | Static |
| 14 | industry_recognition_level | Enum | High / Medium / Low | Annual |
| 15 | verification_url_pattern | String | Where to verify | Annual |
| 16 | typical_pass_rate_percent | Decimal | Pass rate | 2-Yearly |
| 17 | international_recognition | Boolean | true / false | Static |
| G1-G12 | Governance block | See §3 | — | — |

**Total properties: 17 domain + 12 governance = 29.**

---

## 9. Controlled Vocabularies (Complete)

### 9.1 RequirementType
`MANDATORY` | `PREFERENTIAL` | `DEVELOPMENTAL` | `CONTEXTUAL`
Used on: REQUIRES_APTITUDE, REQUIRES_SKILL, ALIGNS_WITH_INTEREST, FAVOURED_BY_TRAIT, INFLUENCED_BY_PREFERENCE.

### 9.2 GovernanceStatus
`Draft` | `Validated` | `Published` | `Deprecated`
Used on: Every entity's `governance_status` property.

### 9.3 PathType
`Core` | `Specialized` | `Niche` | `Long-tail` | `Edge-case` | `Emerging` | `Interdisciplinary` | `Advanced-systems`
Used on: Stream.path_type.

### 9.4 DecisionType
`Stream Selection` | `Branch Selection` | `Specialization` | `Career Pivot` | `Exam Attempt` | `Continue/Exit` | `Institution Selection` | `Employment vs PG`
Used on: Decision Point.decision_type.

### 9.5 InternshipTypeClassification
`Clinical-Rotation` | `Tech-Internship` | `Research-Internship` | `Field-Attachment` | `Corporate` | `Government` | `Startup` | `Non-Profit`
Used on: Internship Type.classification.

### 9.6 SkillCategory
`Technical` | `Analytical` | `Creative` | `Communication` | `Physical`
Used on: Skill.category.

### 9.7 ActivityCategory
`Academic` | `Competition` | `Club` | `Self-Study` | `Coding` | `Sport` | `Cultural` | `Volunteering`
Used on: Activity.category.

### 9.8 CertificationType
`Professional` | `Vendor` | `Skill` | `Compliance` | `Continuing-Education`
Used on: Certification.type.

### 9.9 RefreshFrequency
`Static` | `Annual` | `2-Yearly` | `On-Event`
Used on: Every entity's `refresh_frequency` property.

### 9.10 ExamLevel
`National` | `State` | `Institution` | `Private`
Used on: Entrance Exam.exam_level.

### 9.11 ExamMode
`CBT` | `OMR` | `Hybrid` | `Paper-based`
Used on: Entrance Exam.mode.

### 9.12 DegreeLevel
`Diploma` | `Certificate` | `UG` | `PG` | `Doctoral` | `Post-Doctoral`
Used on: Degree.degree_level.

### 9.13 ProgrammeType
`Standalone-UG` | `Integrated-UG-PG` | `Dual-Degree` | `Bridge` | `Vocational`
Used on: Degree.programme_type.

### 9.14 InstitutionGovernanceModel
`Public` | `Private` | `Deemed` | `Autonomous` | `Government-Aided` | `Foreign`
Used on: Institution Type.governance_model.

### 9.15 AdmissionPathwayType
`Regular` | `Lateral` | `Sports` | `Cultural` | `NRI` | `Foreign` | `Management` | `Transfer` | `Bridge`
Used on: Admission Pathway.pathway_type.

### 9.16 EmploymentType
`Employed` | `Private-Practice` | `Consulting` | `Entrepreneur` | `Freelance` | `Faculty` | `Government` | `Public-Sector`
Used on: Career Outcome.employment_types_available (list).

### 9.17 WorkEnvironment
`Office` | `Field` | `Lab` | `Home` | `Hospital` | `Studio` | `Site` | `Remote` | `Hybrid`
Used on: Career Outcome.work_environment (list).

### 9.18 CityTier
`Tier-1` | `Tier-2` | `Tier-3` | `Tier-4` | `Special`
Used on: City.tier.

### 9.19 ExperienceBucket
`Entry-0-2` | `Early-3-5` | `Mid-6-10` | `Senior-11-15` | `Leadership-16+`
Used on: Salary Range.experience_bucket.

### 9.20 CareerCeilingIndicator
`Early` | `Mid` | `Late` | `None`
Used on: Career Outcome.career_ceiling_indicator. NEW in v0.6.

### 9.21 PlacementVerificationStatus
`Self-Reported` | `Third-Party-Audited` | `Regulator-Verified` | `Publicly-Verified` | `Unverified`
Used on: Institution.placement_verification_status. NEW in v0.6.

### 9.22 InternshipVerificationStatus
`Verified-by-Institution` | `Third-Party-Verified` | `Regulator-Recognised` | `Self-Reported` | `Under-Review`
Used on: Internship Type.internship_verification_status. NEW in v0.6.

### 9.23 StreamDurationCategory
`Short (<6mo)` | `Medium (6mo-2yr)` | `Standard (3-5yr)` | `Long (>5yr)`
Used on: Stream.stream_duration_category. NEW in v0.6.

### 9.24 DemandTrend
`Growing` | `Stable` | `Declining` | `Volatile`
Used on: Stream.demand_trend.

### 9.25 FutureDisruptionRisk
`Low` | `Moderate` | `High` | `Very-High` | `Under-Debate`
Used on: Career Outcome.future_disruption_risk.

### 9.26 DisabilityInclusion
`Fully-Inclusive` | `Partially` | `Limited` | `Not-Inclusive`
Used on: Career Outcome.disability_inclusions_* fields (5 such fields).

### 9.27 RemoteWorkFeasibility
`Fully-Remote` | `Hybrid` | `Limited` | `Not-Feasible`
Used on: Career Outcome.remote_work_feasibility.

### 9.28 WorkIntensity
`Low` | `Moderate` | `High` | `Extreme`
Used on: Career Outcome.work_intensity.

### 9.29 OnCallExpectations
`None` | `Occasional` | `Regular` | `24x7`
Used on: Career Outcome.on_call_expectations.

### 9.30 TravelExpectations
`None` | `Occasional` | `Frequent` | `Constant`
Used on: Career Outcome.travel_expectations.

### 9.31 RenewalFrequency
`None-Lifetime` | `Annual` | `2-Yearly` | `5-Yearly` | `Custom`
Used on: Licence.renewal_frequency.

### 9.32 InterestCategory
`STEM` | `Arts` | `Social` | `Physical` | `Business` | `Humanitarian`
Used on: Interest.category.

### 9.33 AptitudeType
`Cognitive` | `Perceptual` | `Reasoning` | `Memory` | `Verbal` | `Physical`
Used on: Aptitude.type.

### 9.34 PersonalityDimension
`Big-Five` | `HEXACO` | `Values` | `Custom`
Used on: Personality Trait.dimension.

### 9.35 WorkPreferenceType
`WorkEnvironment` | `WorkHours` | `TeamStructure` | `TravelWillingness` | `RemotenessPreference` | `IncomeStability`
Used on: Work Preference.preference_type.

---

## 10. Complete Relationship Inventory (~43 relationships)

### 10.1 Structural (from v0.5.2)

| # | Relationship | Source | Target | Cardinality | Properties |
|---|---|---|---|---|---|
| 1 | CONTAINS | SCC Faculty | Domain | 1..* | — |
| 2 | CONTAINS | Domain | Stream | 1..* | primary (Boolean) — See Rule 11.6 |
| 3 | PROGRESSES_THROUGH | Stream | Education Stage | 1..* | sequence_order (Integer) |
| 4 | AWARDS_DEGREE | Stream | Degree | 0..* | — |
| 5 | AWARDS_LICENCE | Stream | Licence | 0..* | — |
| 6 | LEADS_TO | Stream | Career Outcome | 1..* | probability (Decimal) |

### 10.2 Eligibility (from v0.5.2)

| # | Relationship | Source | Target | Cardinality | Properties |
|---|---|---|---|---|---|
| 7 | REQUIRES_SUBJECT_COMBINATION | Stream | Subject Combination | 1..* | — |
| 8 | HAS_ENTRANCE_EXAM | Stream | Entrance Exam | 0..* | is_mandatory (Boolean), exam_purpose (String) |
| 9 | HAS_ADMISSION_PATHWAY | Stream | Admission Pathway | 1..* | — |
| 10 | REQUIRES_SUBJECT | Subject Combination | Subject | 1..* | — |
| 11 | REQUIRES_SUBJECT_LEVEL | Stream | Subject Level | 0..* | — |

### 10.3 Learning & Decision (from v0.5.2)

| # | Relationship | Source | Target | Cardinality | Properties |
|---|---|---|---|---|---|
| 12 | HAS_DECISION_POINT | Stream | Decision Point | 0..* | — |
| 13 | HAS_INTERNSHIP | Stream | Internship Type | 0..* | is_mandatory (Boolean) |
| 14 | HAS_APPRENTICESHIP | Stream | Apprenticeship | 0..* | — |
| 15 | HAS_CERTIFICATION_PATH | Stream | Certification | 0..* | — |
| 16 | HAS_SYLLABUS_TOPIC | Entrance Exam | Syllabus Topic | 1..* | — |
| 17 | GATED_BY | Decision Point | Criterion | 1..* | weight (Decimal) |

### 10.4 Governance (from v0.5.2)

| # | Relationship | Source | Target | Cardinality | Properties |
|---|---|---|---|---|---|
| 18 | CONDUCTED_BY | Entrance Exam | Regulatory Body | 1 | — |
| 19 | APPROVED_BY | Degree | Regulatory Body | 1..* | — |
| 20 | REGULATED_BY | Institution | Regulatory Body | 1..* | — |
| 21 | COUNSELS_FOR | Regulatory Body | Entrance Exam | 0..* | — |
| 22 | LICENSED_BY | Career Outcome | Licence | 0..* | is_mandatory (Boolean) |
| 23 | ISSUED_BY | Licence | Regulatory Body | 1 | — |

### 10.5 Career Transitions (from v0.5.2, GAS v1.1)

| # | Relationship | Source | Target | Cardinality | Properties |
|---|---|---|---|---|---|
| 24 | HAS_FOLLOW_ON_EXAM | Career Outcome | Entrance Exam | 0..* | — |
| 25 | PRECEDES | Entrance Exam | Entrance Exam | 0..* | is_prerequisite (Boolean), sequence_order (Integer), min_gap_months (Integer), bypass_conditions (JSON) |
| 26 | SUBSEQUENT_TO | Career Outcome | Career Outcome | 0..* | — |
| 27 | PRECEDES | Degree | Degree | 0..* | (Same as #25 for Degrees) |

### 10.6 Regulator Hierarchy (from GAS v1.1)

| # | Relationship | Source | Target | Cardinality | Properties |
|---|---|---|---|---|---|
| 28 | HAS_STATE_UNIT | Regulatory Body | Regulatory Body | 0..* | jurisdiction_scope (String), governance_type (Enum), established_year (Integer) |
| 29 | PEER_OF | Institution | Institution | 0..* | peer_group_name (String) |

### 10.7 Location (from v0.5.2)

| # | Relationship | Source | Target | Cardinality | Properties |
|---|---|---|---|---|---|
| 30 | LOCATED_IN | Institution | City | 1 | — |
| 31 | HIRING_HUB_CITY | Career Outcome | City | 0..* | rank_within_career (Integer) |

### 10.8 Financial (from v0.5.2)

| # | Relationship | Source | Target | Cardinality | Properties |
|---|---|---|---|---|---|
| 32 | APPLICABLE_TO | Scholarship | Stream | 0..* | universe (String) |
| 33 | OFFERED_BY | Scholarship | Institution | 0..* | — |
| 34 | PRE_APPROVED_BY_BANK | Institution | Education Loan | 0..* | — |
| 35 | COVERS_STREAM | Education Loan | Stream | 0..* | — |

### 10.9 Cross-Jurisdictional (from GAS v1.2)

| # | Relationship | Source | Target | Cardinality | Properties |
|---|---|---|---|---|---|
| 36 | EQUIVALENT_TO | Licence | Licence | 0..* | target_jurisdiction (String), recognition_authority (String), conversion_requirements (JSON), effective_from (Date), effective_to (Date), bilateral_agreement (Boolean), restrictions (List) |
| 37 | EQUIVALENT_TO | Degree | Degree | 0..* | (Same properties as #36) |
| 38 | USES_EQUIVALENCE_RULE | Entrance Exam | Subject Equivalence Rule | 0..* | — |

### 10.10 Competency (NEW in v0.6)

| # | Relationship | Source | Target | Cardinality | Properties |
|---|---|---|---|---|---|
| 39 | REQUIRES_APTITUDE | Stream | Aptitude | 0..* | requirement_type (Enum), minimum_threshold (String), evidence_notes (String) |
| 40 | REQUIRES_APTITUDE | Career Outcome | Aptitude | 0..* | (Same as #39) |
| 41 | REQUIRES_SKILL | Stream | Skill | 0..* | requirement_type (Enum), minimum_threshold (String) |
| 42 | REQUIRES_SKILL | Career Outcome | Skill | 0..* | (Same as #41) |
| 43 | ALIGNS_WITH_INTEREST | Stream | Interest | 0..* | alignment_strength (Decimal 0-1) |
| 44 | ALIGNS_WITH_INTEREST | Career Outcome | Interest | 0..* | (Same as #43) |
| 45 | FAVOURED_BY_TRAIT | Career Outcome | Personality Trait | 0..* | advantage_direction (Enum) |
| 46 | INFLUENCED_BY_PREFERENCE | Stream | Work Preference | 0..* | requirement_type (Enum) |
| 47 | INFLUENCED_BY_PREFERENCE | Career Outcome | Work Preference | 0..* | (Same as #46) |

### 10.11 Experience (NEW in v0.6)

| # | Relationship | Source | Target | Cardinality | Properties |
|---|---|---|---|---|---|
| 48 | DEVELOPS_SKILL | Activity | Skill | 0..* | proficiency_gain (Enum), typical_duration_months (Integer) |
| 49 | DEVELOPS_SKILL | Project | Skill | 0..* | (Same as #48) |
| 50 | DEVELOPS_SKILL | Apprenticeship | Skill | 0..* | (Same as #48) |
| 51 | DEVELOPS_SKILL | Certification | Skill | 0..* | (Same as #48) |
| 52 | VALIDATES_COMPETENCY | Certification | Skill | 0..* | certification_validity_expiry (Boolean) |
| 53 | VALIDATES_COMPETENCY | Certification | Aptitude | 0..* | (Same as #52) |
| 54 | CONTRIBUTES_TO | Certification | Career Outcome | 0..* | contribution_weight (Decimal 0-1) |
| 55 | CONTRIBUTES_TO | Apprenticeship | Career Outcome | 0..* | (Same as #54) |
| 56 | PREREQUISITE_OF | Skill | Skill | 0..* | — |
| 57 | PREREQUISITE_OF | Syllabus Topic | Syllabus Topic | 0..* | — |

**Total canonical relationships: ~43 (deduplicated by relationship-type name); ~57 counting multiple source/target patterns.**

---

## 11. Derived Formulas

### 11.1 Total Annual Cost

```
Total Annual Cost (student × institution × year) =
    Institution.annual_tuition_mid_inr
  + (Institution.annual_hostel_cost_max_inr IF living_arrangement == "Hostel"
     ELSE 0)
  + (Institution.annual_mess_cost_max_inr IF living_arrangement == "Hostel"
     ELSE 0)
  + Institution.annual_other_fees_max_inr
  + (City.annual_cost_of_living_mid_inr × living_adjustment_factor)

Living Adjustment Factors:
  Hostel: 0.4
  Outside Campus: 1.0
  Day Scholar: 0.6
```

### 11.2 Financial Independence Age

```
Financial Independence Age (per Career Outcome × Stream) =
    Career Outcome.typical_earning_start_age
  + Career Outcome.typical_probation_period_months / 12
  + Career Outcome.typical_years_to_seniority × 0.4
```

### 11.3 Total Time to Career

```
Total Time to Career (per Stream) =
    Sum over Education Stages of typical_duration_months / 12
  + typical_gap_years_expected
  + internship_apprenticeship_duration_months / 12
  + licence_acquisition_time_months / 12
```

### 11.4 Path Suitability Score (concept-level only; per-user matching is Digital Twin)

For Stream × user profile matching:

```
Suitability Score (Concept-Level) =
    (Number of REQUIRES_APTITUDE relationships matched × weight_aptitude)
  + (Number of REQUIRES_SKILL relationships matched × weight_skill)
  + (Number of ALIGNS_WITH_INTEREST relationships matched × weight_interest)
  + (Number of FAVOURED_BY_TRAIT relationships matched × weight_trait)
  + (Number of INFLUENCED_BY_PREFERENCE relationships matched × weight_preference)

Note: Weights are consumer-platform configurable; ontology provides raw counts.
Note: Actual user matching (with observations, evidence, alignment) is Digital Twin territory.
```

---

## 12. Data Types Reference

### 12.1 Neo4j type mapping

| Ontology type | Neo4j type | Notes |
|---|---|---|
| String | STRING | UTF-8 |
| Integer | INTEGER | 64-bit |
| BigInt | INTEGER | For currency in paise |
| Decimal / Float | FLOAT | For percentages, ratings |
| Boolean | BOOLEAN | true / false |
| Date | DATE | ISO 8601 |
| DateTime | DATETIME | ISO 8601 with timezone |
| List (any) | LIST | Homogeneous list |
| Structured (JSON) | STRING | JSON-encoded, decoded via APOC |
| Reference | STRING (holds target UUID or Reference Code) | Enforced by application logic |

### 12.2 Currency handling

**All INR amounts stored as BigInt (Integer in Neo4j) in paise, not rupees.**

Rationale: Avoids floating-point rounding errors in cost calculations. Display formatting happens at application layer.

Examples:
- ₹1,00,000/year → stored as `10000000` (10 million paise)
- ₹5.5 lakh → stored as `55000000`

### 12.3 Enum handling

**Enums stored as STRING with the values shown in Section 9.**

Example:
- Stream.demand_trend: `"Growing"` (not `"GROWING"`)

Enum values follow the format shown in §9 exactly.

### 12.4 Reference handling

**References to other entities carry the target's Reference Code** (e.g., `STR-CS-ENG`, `INST-IITB`).

At runtime, Cypher joins resolve these via `MATCH`. UUIDs are used internally for graph edges.

---

## 13. Deferrals and Roadmap

### 13.1 Explicitly deferred to future versions

- Commerce Universe scale-out — v0.7 (in build by Pranav)
- Type Rating (sub-entity under Licence, for Aviation) — v0.8
- Exam Session (sub-entity under Entrance Exam, for multi-session exams) — v0.8
- Hostel details on Institution — deferred as college-specific
- Institution safety index — policy discussion pending
- International study paths (comprehensive) — v0.7+

### 13.2 Explicitly excluded (belong to peer ontologies)

- **Digital Twin** — Individual user matching, evidence, recommendations. RSA product-owned.
- **STC (Skills-to-Career)** — Career progression after entry
- **CTG (Career Transition Graph)** — Skill-based pivots
- **Life Decision Layer** — Family circumstance, mental health
- **Employer/Company Dataset** — Per-employer specifics
- **Coaching Ecosystem** — Prep materials, coaching institutes
- **Sports/Performance Career Layer** — Non-exam-gated sports careers
- **Hobby/Exploration Layer** — Non-career skill/interest
- **Labour Market Analytics** — Future disruption risk, employment forecasts
- **Research Ethics Layer** — Plagiarism, AI in research

### 13.3 Roadmap to v1.0

- v0.7 — Commerce Universe complete
- v0.8 — Type Rating + Exam Session sub-entities
- v0.9 — Cross-Universe refinements from field usage
- v1.0 — Final consolidated master, ready for national/global reuse

---

## 14. Reservation Policy

**Type X — Formal reservation queries: answered factually.**
Categories: General, EWS, OBC-NCL, SC, ST, PwD, Defence Wards, Ex-Servicemen Wards, Kashmiri Migrants, North-East, State Domicile, PIO/OCI, Single Girl Child.

**Type Y — Identity-based advice: declined via routing tag to Life Decision Layer / wellbeing.**

---

## 15. Attribution

**RSA v0.5.2 (Nilesh) contributed:**
- 23 core entities (Groups A–D)
- ~484 base properties
- 35 base relationships
- Student-Practical Layer, Financial Layer, Geographic Layer
- Licence entity
- Governance framework
- All Phase 2 field additions (13 backlog items absorbed)

**Pranav ChatGPT contributed (concept entities only):**
- 9 NEW concept entities (Groups E, F)
- 8 controlled vocabularies (concept ones retained; product ones excluded)
- Upper-level conceptual model of Competency + Experience

**Sandeep Kimi contributed:**
- Path-Type taxonomy (Stream.path_type)
- Validation rule framework
- Traceability approach

**NK Gemini contributed:**
- Synthesis structure and design principles
- Boundary clarity on ontology vs product-layer separation

**Explicitly NOT absorbed:**
- Digital Twin runtime entities (Observation, EvidenceItem, AlignmentResult, Recommendation, Alternative, Gap, Escalation)
- Cypher implementation details (belong to separate Implementation Guide)
- Product-specific vocabularies (AlignmentStatus, EscalationReason, EvidenceSourceType)

---

## Total Property Count Summary

| Group | Entities | Domain Properties | With Governance (each +12) | Total |
|---|---|---|---|---|
| A — Structure & Journey | 7 | 100 | 84 | 184 |
| B — Governance & Gateway | 10 | 184 | 120 | 304 |
| C — Ecosystem & Professional | 5 | 122 | 60 | 182 |
| D — Financial | 2 | 84 | 24 | 108 |
| E — Competency Concept | 5 | 52 | 60 | 112 |
| F — Experience Concept | 4 | 58 | 48 | 106 |
| **TOTAL** | **33 entity variants (32 entity types)** | **~600 domain** | **396 governance** | **~996 total** |

**Reconciliation:** The v0.6 headline count of "~574 properties" refers to distinct domain-specific field slots. Adding the 12 universal governance properties per entity yields the fully populated Neo4j property count of ~996.

Structured JSON sub-fields (like `age_criteria_*`) are counted as separate fields in the entity tables, which increases the property count when broken out from v0.5.2's structured blocks.

---

## Confidence statement

**v0.6 is the merged master baseline. Four sources converged. Every field is explicitly documented for Cypher generation.**

- 32 entity types (33 including Subject Level sub-entity)
- ~574 distinct domain properties documented with types, allowed values, refresh frequency
- 57 relationship variants across 12 canonical patterns
- 35 controlled vocabularies with complete value lists
- 4 derived formulas
- Clean separation: ontology (concepts) vs product logic (Digital Twin)
- All v0.5.2 achievements preserved
- 13 v0.5.2 backlog fields absorbed
- Universal concept entities from Pranav's Competency/Experience layers retained
- Path-Type taxonomy from Sandeep applied
- NK Gemini's synthesis principles honoured with corrected boundary

**Ready for:**
- Cypher schema generation (per GAS v1.2 conventions)
- Data pipeline development
- Team review

*End of RSA SCC Ontology v0.6 — Complete Technical Specification for Cypher Generation.*
