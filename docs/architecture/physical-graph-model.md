# Physical Graph Model

Status: generated draft

This document is generated from the Semantic Registry and describes the first Neo4j physical model.

## Summary

- Node labels: 33
- Relationship patterns: 59
- Distinct relationship types: 46
- Unique constraints: 66
- Required property constraints: 66
- Lookup indexes: 0
- Full-text indexes: 31

## Node Label Inventory

- `Activity`
- `AdmissionPathway`
- `Apprenticeship`
- `Aptitude`
- `CareerOutcome`
- `Certification`
- `City`
- `Criterion`
- `DecisionPoint`
- `Degree`
- `Domain`
- `EducationLoan`
- `EducationStage`
- `EntranceExam`
- `Faculty`
- `Institution`
- `InstitutionType`
- `Interest`
- `InternshipType`
- `Licence`
- `PersonalityTrait`
- `Project`
- `RegulatoryBody`
- `SalaryRange`
- `Scholarship`
- `Skill`
- `Stream`
- `Subject`
- `SubjectCombination`
- `SubjectEquivalenceRule`
- `SubjectLevel`
- `SyllabusTopic`
- `WorkPreference`

## Relationship Type Inventory

- `ALIGNS_WITH_INTEREST`
- `APPLICABLE_TO`
- `APPROVED_BY`
- `AWARDS_DEGREE`
- `AWARDS_LICENCE`
- `CONDUCTED_BY`
- `CONTAINS`
- `CONTRIBUTES_TO`
- `COUNSELS_FOR`
- `COVERS_STREAM`
- `DEVELOPS_SKILL`
- `EQUIVALENT_TO`
- `FAVOURED_BY_TRAIT`
- `GATED_BY`
- `HAS_ADMISSION_PATHWAY`
- `HAS_APPRENTICESHIP`
- `HAS_CERTIFICATION_PATH`
- `HAS_DECISION_POINT`
- `HAS_ENTRANCE_EXAM`
- `HAS_FOLLOW_ON_EXAM`
- `HAS_INTERNSHIP`
- `HAS_STATE_UNIT`
- `HAS_SYLLABUS_TOPIC`
- `HIRING_HUB_CITY`
- `INFLUENCED_BY_PREFERENCE`
- `ISSUED_BY`
- `LEADS_TO`
- `LICENSED_BY`
- `LOCATED_IN`
- `OFFERED_BY`
- `PEER_OF`
- `PRECEDES`
- `PREREQUISITE_OF`
- `PRE_APPROVED_BY_BANK`
- `PROGRESSES_THROUGH`
- `REGULATED_BY`
- `REQUIRES_APTITUDE`
- `REQUIRES_EXAM`
- `REQUIRES_SKILL`
- `REQUIRES_SUBJECT`
- `REQUIRES_SUBJECT_COMBINATION`
- `REQUIRES_SUBJECT_LEVEL`
- `SUBSEQUENT_TO`
- `UNLOCKS`
- `USES_EQUIVALENCE_RULE`
- `VALIDATES_COMPETENCY`

## Generated Runtime Files

- `neo4j/constraints/01_node_identity_constraints.cypher`
- `neo4j/constraints/02_required_property_constraints.cypher`
- `neo4j/indexes/01_lookup_indexes.cypher`
- `neo4j/indexes/02_fulltext_indexes.cypher`
- `neo4j/schema/01_relationship_reference.cypher`
- `neo4j/validation/01_structural_integrity.cypher`

## Execution Order

1. Run identity constraints.
2. Run required property constraints after confirming Neo4j edition support.
3. Run lookup indexes.
4. Run full-text indexes.
5. Load data.
6. Run structural validation queries.
