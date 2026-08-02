# 03 — Neo4j Property Graph Schema Design

**Package version:** 1.0  
**Date:** 2026-08-02  
**Target:** Neo4j 5.x  
**Author note:** Generated from the supplied RSA files only; no external facts were introduced.  
**Inputs:** The RSA Master Blueprint Version 1.0.docx, RSA_SCC_Ontology_v0.6.1a.md, RSA_GAS_Rulebook_v1.2.md, Question_Bank_All_Ontologies_NEP2020.md, RSA_SCC_Structural_Integrity_Test_Set.md, 1-Structured-Science.xlsx, 2-Structured- Arts_Humanities.xlsx, 3-Structured - Commerce.xlsx, 4-Strcutured-Management.xlsx, 5-Structured- Law.xlsx, 6-Structured-Interdisciplinary.xlsx

## Node design

Every node carries `id`, its reference code, `name`, `created_at`, `updated_at`, `created_by`, `updated_by`, `version`, `governance_status`, `refresh_frequency`, `last_refreshed`, `source`, and `data_owner` where applicable.

| Label | Unique key | Class |
|---|---|---|
| `Universe` | `universe_code` | canonical |
| `SCCFaculty` | `faculty_code` | canonical |
| `Domain` | `domain_code` | canonical |
| `Stream` | `stream_code` | canonical |
| `EducationStage` | `education_stage_code` | canonical |
| `Subject` | `subject_code` | canonical |
| `SubjectLevel` | `subject_level_code` | canonical |
| `SubjectCombination` | `subject_combination_code` | canonical |
| `DecisionPoint` | `decision_point_code` | canonical |
| `Criterion` | `criterion_code` | canonical |
| `EntranceExam` | `entrance_exam_code` | canonical |
| `RegulatoryBody` | `regulatory_body_code` | canonical |
| `Degree` | `degree_code` | canonical |
| `InstitutionType` | `institution_type_code` | canonical |
| `Institution` | `institution_code` | canonical |
| `AdmissionPathway` | `admission_pathway_code` | canonical |
| `SyllabusTopic` | `syllabus_topic_code` | canonical |
| `SubjectEquivalenceRule` | `subject_equivalence_rule_code` | canonical |
| `InternshipType` | `internship_type_code` | canonical |
| `CareerOutcome` | `career_outcome_code` | canonical |
| `SalaryRange` | `salary_range_code` | canonical |
| `City` | `city_code` | canonical |
| `Licence` | `licence_code` | canonical |
| `Scholarship` | `scholarship_code` | canonical |
| `EducationLoan` | `education_loan_code` | canonical |
| `Interest` | `interest_code` | canonical |
| `Aptitude` | `aptitude_code` | canonical |
| `Skill` | `skill_code` | canonical |
| `PersonalityTrait` | `personality_trait_code` | canonical |
| `WorkPreference` | `work_preference_code` | canonical |
| `Activity` | `activity_code` | canonical |
| `Project` | `project_code` | canonical |
| `Apprenticeship` | `apprenticeship_code` | canonical |
| `Certification` | `certification_code` | canonical |
| `ProgrammeOffering` | `programme_offering_code` | proposed extension |
| `CreditPolicy` | `credit_policy_code` | proposed extension |
| `ExitAward` | `exit_award_code` | proposed extension |
| `BridgeCourse` | `bridge_course_code` | proposed extension |
| `Language` | `language_code` | proposed extension |
| `Accommodation` | `accommodation_code` | proposed extension |
| `PortfolioRequirement` | `portfolio_requirement_code` | proposed extension |
| `SourceRecord` | `source_record_code` | proposed extension |

## Relationships

| Type | Family |
|---|---|
| `BELONGS_TO_UNIVERSE` | scoping |
| `CONTAINS` | hierarchy |
| `CONTAINED_IN` | multi-parent |
| `PROGRESSES_THROUGH` | journey |
| `OFFERS_SUBJECT` | curriculum |
| `HAS_SUBJECT_LEVEL` | curriculum |
| `COMPRISES_SUBJECT` | combination |
| `HAS_DECISION_POINT` | decision |
| `HAS_CRITERION` | eligibility |
| `HAS_ENTRANCE_EXAM` | gateway |
| `REQUIRES_EXAM` | gateway |
| `GOVERNED_BY` | governance |
| `AWARDS_DEGREE` | qualification |
| `OFFERS_PROGRAMME` | offering |
| `USES_ADMISSION_PATHWAY` | admission |
| `COVERS_TOPIC` | syllabus |
| `EQUIVALENT_TO` | equivalence |
| `HAS_INTERNSHIP` | experience |
| `LEADS_TO` | outcome |
| `EARNS_SALARY` | outcome |
| `LOCATED_IN` | location |
| `HIRING_HUB_CITY` | location |
| `REQUIRES_LICENCE` | regulation |
| `UNLOCKS` | regulation |
| `HAS_SCHOLARSHIP` | finance |
| `SUPPORTED_BY_LOAN` | finance |
| `REQUIRES_APTITUDE` | competency |
| `REQUIRES_SKILL` | competency |
| `ALIGNS_WITH_INTEREST` | competency |
| `FAVOURED_BY_TRAIT` | competency |
| `INFLUENCED_BY_PREFERENCE` | competency |
| `DEVELOPS_SKILL` | experience |
| `VALIDATES_COMPETENCY` | experience |
| `CONTRIBUTES_TO` | experience |
| `PREREQUISITE_OF` | dependency |
| `HAS_FOLLOW_ON_EXAM` | transition |
| `HAS_STATE_UNIT` | governance |
| `IMPLEMENTS_CREDIT_POLICY` | nep |
| `PERMITS_EXIT_AWARD` | nep |
| `REQUIRES_BRIDGE_COURSE` | bridge |
| `TAUGHT_IN` | language |
| `PROVIDES_ACCOMMODATION` | inclusion |
| `REQUIRES_PORTFOLIO` | portfolio |
| `SUPPORTED_BY_SOURCE` | provenance |

## Index strategy

Unique constraints back every reference-code lookup. A global UUID uniqueness constraint is created per label because Neo4j Community does not provide a cross-label uniqueness constraint. Full-text search spans named discovery labels. Range indexes cover governance status, refresh dates, effective dates and common cost/salary filters.

## Query-performance review

Lookup starts from an indexed Universe/code/name, then follows bounded paths. Programme-level NEP questions use the reified ProgrammeOffering hub and stay within 2–4 hops. Unbounded paths are forbidden except integrity cycle detection. High-degree nodes such as City, Skill and Universe are filtered/indexed before expansion.

## Three design iterations

1. **Structural:** separated Degree, Licence, Exam and CareerOutcome; introduced ProgrammeOffering for contextual facts.
2. **Query-first:** added NEP, bridge, language, accommodation and portfolio extensions required by the Question Bank.
3. **Extensibility:** retained shared concepts as MultiUniverse, added temporal provenance, and kept runtime personalization outside SCC.

## GAS compliance

PascalCase singular labels; UPPER_SNAKE_CASE relationships; snake_case properties; UUID plus immutable human code; governance block; paise currency; explicit relationship direction; no generic `RELATED_TO`; idempotent constraints; weekly audit queries. The proposed labels are clearly marked because GAS cannot authorize domain-design changes.
