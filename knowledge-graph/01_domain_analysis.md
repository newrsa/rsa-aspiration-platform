# 01 — Domain Analysis

**Package version:** 1.0  
**Date:** 2026-08-02  
**Target:** Neo4j 5.x  
**Author note:** Generated from the supplied RSA files only; no external facts were introduced.  
**Inputs:** The RSA Master Blueprint Version 1.0.docx, RSA_SCC_Ontology_v0.6.1a.md, RSA_GAS_Rulebook_v1.2.md, Question_Bank_All_Ontologies_NEP2020.md, RSA_SCC_Structural_Integrity_Test_Set.md, 1-Structured-Science.xlsx, 2-Structured- Arts_Humanities.xlsx, 3-Structured - Commerce.xlsx, 4-Strcutured-Management.xlsx, 5-Structured- Law.xlsx, 6-Structured-Interdisciplinary.xlsx

## Blueprint-to-ontology interpretation

The Blueprint defines a governed knowledge platform: research assets become versioned knowledge assets, then ontology modules, graph products and explainable services. SCC is one module inside that architecture. It is not the user profile, recommendation engine, workflow calendar or legal/financial advice layer.

## Entity inventory

| Label | Stable reference key | Status | Purpose |
|---|---|---|---|
| `Universe` | `universe_code` | ontology v0.6.1a | Current SCC concept |
| `SCCFaculty` | `faculty_code` | ontology v0.6.1a | Current SCC concept |
| `Domain` | `domain_code` | ontology v0.6.1a | Current SCC concept |
| `Stream` | `stream_code` | ontology v0.6.1a | Current SCC concept |
| `EducationStage` | `education_stage_code` | ontology v0.6.1a | Current SCC concept |
| `Subject` | `subject_code` | ontology v0.6.1a | Current SCC concept |
| `SubjectLevel` | `subject_level_code` | ontology v0.6.1a | Current SCC concept |
| `SubjectCombination` | `subject_combination_code` | ontology v0.6.1a | Current SCC concept |
| `DecisionPoint` | `decision_point_code` | ontology v0.6.1a | Current SCC concept |
| `Criterion` | `criterion_code` | ontology v0.6.1a | Current SCC concept |
| `EntranceExam` | `entrance_exam_code` | ontology v0.6.1a | Current SCC concept |
| `RegulatoryBody` | `regulatory_body_code` | ontology v0.6.1a | Current SCC concept |
| `Degree` | `degree_code` | ontology v0.6.1a | Current SCC concept |
| `InstitutionType` | `institution_type_code` | ontology v0.6.1a | Current SCC concept |
| `Institution` | `institution_code` | ontology v0.6.1a | Current SCC concept |
| `AdmissionPathway` | `admission_pathway_code` | ontology v0.6.1a | Current SCC concept |
| `SyllabusTopic` | `syllabus_topic_code` | ontology v0.6.1a | Current SCC concept |
| `SubjectEquivalenceRule` | `subject_equivalence_rule_code` | ontology v0.6.1a | Current SCC concept |
| `InternshipType` | `internship_type_code` | ontology v0.6.1a | Current SCC concept |
| `CareerOutcome` | `career_outcome_code` | ontology v0.6.1a | Current SCC concept |
| `SalaryRange` | `salary_range_code` | ontology v0.6.1a | Current SCC concept |
| `City` | `city_code` | ontology v0.6.1a | Current SCC concept |
| `Licence` | `licence_code` | ontology v0.6.1a | Current SCC concept |
| `Scholarship` | `scholarship_code` | ontology v0.6.1a | Current SCC concept |
| `EducationLoan` | `education_loan_code` | ontology v0.6.1a | Current SCC concept |
| `Interest` | `interest_code` | ontology v0.6.1a | Current SCC concept |
| `Aptitude` | `aptitude_code` | ontology v0.6.1a | Current SCC concept |
| `Skill` | `skill_code` | ontology v0.6.1a | Current SCC concept |
| `PersonalityTrait` | `personality_trait_code` | ontology v0.6.1a | Current SCC concept |
| `WorkPreference` | `work_preference_code` | ontology v0.6.1a | Current SCC concept |
| `Activity` | `activity_code` | ontology v0.6.1a | Current SCC concept |
| `Project` | `project_code` | ontology v0.6.1a | Current SCC concept |
| `Apprenticeship` | `apprenticeship_code` | ontology v0.6.1a | Current SCC concept |
| `Certification` | `certification_code` | ontology v0.6.1a | Current SCC concept |
| `ProgrammeOffering` | `programme_offering_code` | Phase-0 extension | Required by Question Bank; governance approval required |
| `CreditPolicy` | `credit_policy_code` | Phase-0 extension | Required by Question Bank; governance approval required |
| `ExitAward` | `exit_award_code` | Phase-0 extension | Required by Question Bank; governance approval required |
| `BridgeCourse` | `bridge_course_code` | Phase-0 extension | Required by Question Bank; governance approval required |
| `Language` | `language_code` | Phase-0 extension | Required by Question Bank; governance approval required |
| `Accommodation` | `accommodation_code` | Phase-0 extension | Required by Question Bank; governance approval required |
| `PortfolioRequirement` | `portfolio_requirement_code` | Phase-0 extension | Required by Question Bank; governance approval required |
| `SourceRecord` | `source_record_code` | Phase-0 extension | Required by Question Bank; governance approval required |

## Relationship inventory

| Type | Family | Origin |
|---|---|---|
| `BELONGS_TO_UNIVERSE` | scoping | ontology/GAS |
| `CONTAINS` | hierarchy | ontology/GAS |
| `CONTAINED_IN` | multi-parent | ontology/GAS |
| `PROGRESSES_THROUGH` | journey | ontology/GAS |
| `OFFERS_SUBJECT` | curriculum | ontology/GAS |
| `HAS_SUBJECT_LEVEL` | curriculum | ontology/GAS |
| `COMPRISES_SUBJECT` | combination | ontology/GAS |
| `HAS_DECISION_POINT` | decision | ontology/GAS |
| `HAS_CRITERION` | eligibility | ontology/GAS |
| `HAS_ENTRANCE_EXAM` | gateway | ontology/GAS |
| `REQUIRES_EXAM` | gateway | ontology/GAS |
| `GOVERNED_BY` | governance | ontology/GAS |
| `AWARDS_DEGREE` | qualification | ontology/GAS |
| `OFFERS_PROGRAMME` | offering | ontology/GAS |
| `USES_ADMISSION_PATHWAY` | admission | ontology/GAS |
| `COVERS_TOPIC` | syllabus | ontology/GAS |
| `EQUIVALENT_TO` | equivalence | ontology/GAS |
| `HAS_INTERNSHIP` | experience | ontology/GAS |
| `LEADS_TO` | outcome | ontology/GAS |
| `EARNS_SALARY` | outcome | ontology/GAS |
| `LOCATED_IN` | location | ontology/GAS |
| `HIRING_HUB_CITY` | location | ontology/GAS |
| `REQUIRES_LICENCE` | regulation | ontology/GAS |
| `UNLOCKS` | regulation | ontology/GAS |
| `HAS_SCHOLARSHIP` | finance | ontology/GAS |
| `SUPPORTED_BY_LOAN` | finance | ontology/GAS |
| `REQUIRES_APTITUDE` | competency | ontology/GAS |
| `REQUIRES_SKILL` | competency | ontology/GAS |
| `ALIGNS_WITH_INTEREST` | competency | ontology/GAS |
| `FAVOURED_BY_TRAIT` | competency | ontology/GAS |
| `INFLUENCED_BY_PREFERENCE` | competency | ontology/GAS |
| `DEVELOPS_SKILL` | experience | ontology/GAS |
| `VALIDATES_COMPETENCY` | experience | ontology/GAS |
| `CONTRIBUTES_TO` | experience | ontology/GAS |
| `PREREQUISITE_OF` | dependency | ontology/GAS |
| `HAS_FOLLOW_ON_EXAM` | transition | ontology/GAS |
| `HAS_STATE_UNIT` | governance | ontology/GAS |
| `IMPLEMENTS_CREDIT_POLICY` | nep | Phase-0 extension |
| `PERMITS_EXIT_AWARD` | nep | Phase-0 extension |
| `REQUIRES_BRIDGE_COURSE` | bridge | Phase-0 extension |
| `TAUGHT_IN` | language | Phase-0 extension |
| `PROVIDES_ACCOMMODATION` | inclusion | Phase-0 extension |
| `REQUIRES_PORTFOLIO` | portfolio | Phase-0 extension |
| `SUPPORTED_BY_SOURCE` | provenance | Phase-0 extension |

## Ambiguity rules

- `Interest` uses prefix `INTR`; `InternshipType` retains `INT`.
- Eligibility is a rule/criterion; suitability is an application-layer interpretation over SCC concepts.
- An exam pass is not a Degree, Licence, membership or practice right.
- A CareerOutcome is a role/outcome, not a programme or Stream.
- InstitutionType describes a category; Institution is a named provider; ProgrammeOffering is the time-bound intersection of Institution and Degree.
- `EQUIVALENT_TO` handles credential recognition; SubjectEquivalenceRule handles school-subject equivalence.
- Currency is stored as integer paise; displayed rupees are derived.
- User evidence and confidence belong to Digital Twin; SCC stores only universal Activity/Project/Certification concepts.

## Gap analysis

The current SCC core lacks first-class programme offerings, NEP credit policies, exit awards, bridge courses, delivery language, accommodations and portfolio requirements. These are essential to answer the supplied questions exactly, so they are isolated as proposed extensions rather than misrepresented as v0.6.1a ontology entities. Personal observations, conflicting evidence, personalised scoring and timetable feasibility remain peer-layer concerns.
