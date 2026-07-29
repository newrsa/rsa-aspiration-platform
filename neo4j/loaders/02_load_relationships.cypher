// Generated relationship loaders.
// Expected files: relationships/<relationship-id>.csv with source_code,target_code columns.

// Faculty-[:CONTAINS]->Domain
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_contains_faculty_domain.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Faculty {faculty_code: trim(row.source_code)})
MATCH (target:Domain {domain_code: trim(row.target_code)})
MERGE (source)-[r:CONTAINS]->(target)
SET
    r.registry_relationship_id = 'REL-CONTAINS-FACULTY-DOMAIN',
    r.updated_at = datetime();

// Domain-[:CONTAINS]->Stream
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_contains_domain_stream.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Domain {domain_code: trim(row.source_code)})
MATCH (target:Stream {stream_code: trim(row.target_code)})
MERGE (source)-[r:CONTAINS]->(target)
SET
    r.registry_relationship_id = 'REL-CONTAINS-DOMAIN-STREAM',
    r.updated_at = datetime();

// Stream-[:PROGRESSES_THROUGH]->EducationStage
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_progresses_through_stream_education_stage.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Stream {stream_code: trim(row.source_code)})
MATCH (target:EducationStage {stage_code: trim(row.target_code)})
MERGE (source)-[r:PROGRESSES_THROUGH]->(target)
SET
    r.registry_relationship_id = 'REL-PROGRESSES_THROUGH-STREAM-EDUCATION-STAGE',
    r.updated_at = datetime();

// Stream-[:AWARDS_DEGREE]->Degree
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_awards_degree_stream_degree.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Stream {stream_code: trim(row.source_code)})
MATCH (target:Degree {degree_code: trim(row.target_code)})
MERGE (source)-[r:AWARDS_DEGREE]->(target)
SET
    r.registry_relationship_id = 'REL-AWARDS_DEGREE-STREAM-DEGREE',
    r.updated_at = datetime();

// Stream-[:AWARDS_LICENCE]->Licence
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_awards_licence_stream_licence.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Stream {stream_code: trim(row.source_code)})
MATCH (target:Licence {licence_code: trim(row.target_code)})
MERGE (source)-[r:AWARDS_LICENCE]->(target)
SET
    r.registry_relationship_id = 'REL-AWARDS_LICENCE-STREAM-LICENCE',
    r.updated_at = datetime();

// Stream-[:LEADS_TO]->CareerOutcome
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_leads_to_stream_career_outcome.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Stream {stream_code: trim(row.source_code)})
MATCH (target:CareerOutcome {outcome_code: trim(row.target_code)})
MERGE (source)-[r:LEADS_TO]->(target)
SET
    r.registry_relationship_id = 'REL-LEADS_TO-STREAM-CAREER-OUTCOME',
    r.updated_at = datetime();

// Stream-[:REQUIRES_SUBJECT_COMBINATION]->SubjectCombination
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_requires_subject_combination_stream_subject_combination.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Stream {stream_code: trim(row.source_code)})
MATCH (target:SubjectCombination {combination_code: trim(row.target_code)})
MERGE (source)-[r:REQUIRES_SUBJECT_COMBINATION]->(target)
SET
    r.registry_relationship_id = 'REL-REQUIRES_SUBJECT_COMBINATION-STREAM-SUBJECT-COMBINATION',
    r.updated_at = datetime();

// Stream-[:HAS_ENTRANCE_EXAM]->EntranceExam
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_has_entrance_exam_stream_entrance_exam.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Stream {stream_code: trim(row.source_code)})
MATCH (target:EntranceExam {exam_code: trim(row.target_code)})
MERGE (source)-[r:HAS_ENTRANCE_EXAM]->(target)
SET
    r.registry_relationship_id = 'REL-HAS_ENTRANCE_EXAM-STREAM-ENTRANCE-EXAM',
    r.updated_at = datetime();

// Stream-[:HAS_ADMISSION_PATHWAY]->AdmissionPathway
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_has_admission_pathway_stream_admission_pathway.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Stream {stream_code: trim(row.source_code)})
MATCH (target:AdmissionPathway {pathway_code: trim(row.target_code)})
MERGE (source)-[r:HAS_ADMISSION_PATHWAY]->(target)
SET
    r.registry_relationship_id = 'REL-HAS_ADMISSION_PATHWAY-STREAM-ADMISSION-PATHWAY',
    r.updated_at = datetime();

// SubjectCombination-[:REQUIRES_SUBJECT]->Subject
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_requires_subject_subject_combination_subject.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:SubjectCombination {combination_code: trim(row.source_code)})
MATCH (target:Subject {subject_code: trim(row.target_code)})
MERGE (source)-[r:REQUIRES_SUBJECT]->(target)
SET
    r.registry_relationship_id = 'REL-REQUIRES_SUBJECT-SUBJECT-COMBINATION-SUBJECT',
    r.updated_at = datetime();

// Stream-[:REQUIRES_SUBJECT_LEVEL]->SubjectLevel
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_requires_subject_level_stream_subject_level.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Stream {stream_code: trim(row.source_code)})
MATCH (target:SubjectLevel {subject_level_code: trim(row.target_code)})
MERGE (source)-[r:REQUIRES_SUBJECT_LEVEL]->(target)
SET
    r.registry_relationship_id = 'REL-REQUIRES_SUBJECT_LEVEL-STREAM-SUBJECT-LEVEL',
    r.updated_at = datetime();

// Stream-[:HAS_DECISION_POINT]->DecisionPoint
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_has_decision_point_stream_decision_point.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Stream {stream_code: trim(row.source_code)})
MATCH (target:DecisionPoint {decision_code: trim(row.target_code)})
MERGE (source)-[r:HAS_DECISION_POINT]->(target)
SET
    r.registry_relationship_id = 'REL-HAS_DECISION_POINT-STREAM-DECISION-POINT',
    r.updated_at = datetime();

// Stream-[:HAS_INTERNSHIP]->InternshipType
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_has_internship_stream_internship_type.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Stream {stream_code: trim(row.source_code)})
MATCH (target:InternshipType {internship_code: trim(row.target_code)})
MERGE (source)-[r:HAS_INTERNSHIP]->(target)
SET
    r.registry_relationship_id = 'REL-HAS_INTERNSHIP-STREAM-INTERNSHIP-TYPE',
    r.updated_at = datetime();

// Stream-[:HAS_APPRENTICESHIP]->Apprenticeship
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_has_apprenticeship_stream_apprenticeship.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Stream {stream_code: trim(row.source_code)})
MATCH (target:Apprenticeship {apprenticeship_code: trim(row.target_code)})
MERGE (source)-[r:HAS_APPRENTICESHIP]->(target)
SET
    r.registry_relationship_id = 'REL-HAS_APPRENTICESHIP-STREAM-APPRENTICESHIP',
    r.updated_at = datetime();

// Stream-[:HAS_CERTIFICATION_PATH]->Certification
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_has_certification_path_stream_certification.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Stream {stream_code: trim(row.source_code)})
MATCH (target:Certification {certification_code: trim(row.target_code)})
MERGE (source)-[r:HAS_CERTIFICATION_PATH]->(target)
SET
    r.registry_relationship_id = 'REL-HAS_CERTIFICATION_PATH-STREAM-CERTIFICATION',
    r.updated_at = datetime();

// EntranceExam-[:HAS_SYLLABUS_TOPIC]->SyllabusTopic
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_has_syllabus_topic_entrance_exam_syllabus_topic.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:EntranceExam {exam_code: trim(row.source_code)})
MATCH (target:SyllabusTopic {topic_code: trim(row.target_code)})
MERGE (source)-[r:HAS_SYLLABUS_TOPIC]->(target)
SET
    r.registry_relationship_id = 'REL-HAS_SYLLABUS_TOPIC-ENTRANCE-EXAM-SYLLABUS-TOPIC',
    r.updated_at = datetime();

// DecisionPoint-[:GATED_BY]->Criterion
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_gated_by_decision_point_criterion.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:DecisionPoint {decision_code: trim(row.source_code)})
MATCH (target:Criterion {criterion_code: trim(row.target_code)})
MERGE (source)-[r:GATED_BY]->(target)
SET
    r.registry_relationship_id = 'REL-GATED_BY-DECISION-POINT-CRITERION',
    r.updated_at = datetime();

// EntranceExam-[:CONDUCTED_BY]->RegulatoryBody
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_conducted_by_entrance_exam_regulatory_body.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:EntranceExam {exam_code: trim(row.source_code)})
MATCH (target:RegulatoryBody {body_code: trim(row.target_code)})
MERGE (source)-[r:CONDUCTED_BY]->(target)
SET
    r.registry_relationship_id = 'REL-CONDUCTED_BY-ENTRANCE-EXAM-REGULATORY-BODY',
    r.updated_at = datetime();

// Degree-[:APPROVED_BY]->RegulatoryBody
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_approved_by_degree_regulatory_body.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Degree {degree_code: trim(row.source_code)})
MATCH (target:RegulatoryBody {body_code: trim(row.target_code)})
MERGE (source)-[r:APPROVED_BY]->(target)
SET
    r.registry_relationship_id = 'REL-APPROVED_BY-DEGREE-REGULATORY-BODY',
    r.updated_at = datetime();

// Institution-[:REGULATED_BY]->RegulatoryBody
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_regulated_by_institution_regulatory_body.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Institution {institution_code: trim(row.source_code)})
MATCH (target:RegulatoryBody {body_code: trim(row.target_code)})
MERGE (source)-[r:REGULATED_BY]->(target)
SET
    r.registry_relationship_id = 'REL-REGULATED_BY-INSTITUTION-REGULATORY-BODY',
    r.updated_at = datetime();

// RegulatoryBody-[:COUNSELS_FOR]->EntranceExam
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_counsels_for_regulatory_body_entrance_exam.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:RegulatoryBody {body_code: trim(row.source_code)})
MATCH (target:EntranceExam {exam_code: trim(row.target_code)})
MERGE (source)-[r:COUNSELS_FOR]->(target)
SET
    r.registry_relationship_id = 'REL-COUNSELS_FOR-REGULATORY-BODY-ENTRANCE-EXAM',
    r.updated_at = datetime();

// CareerOutcome-[:LICENSED_BY]->Licence
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_licensed_by_career_outcome_licence.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:CareerOutcome {outcome_code: trim(row.source_code)})
MATCH (target:Licence {licence_code: trim(row.target_code)})
MERGE (source)-[r:LICENSED_BY]->(target)
SET
    r.registry_relationship_id = 'REL-LICENSED_BY-CAREER-OUTCOME-LICENCE',
    r.updated_at = datetime();

// Licence-[:ISSUED_BY]->RegulatoryBody
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_issued_by_licence_regulatory_body.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Licence {licence_code: trim(row.source_code)})
MATCH (target:RegulatoryBody {body_code: trim(row.target_code)})
MERGE (source)-[r:ISSUED_BY]->(target)
SET
    r.registry_relationship_id = 'REL-ISSUED_BY-LICENCE-REGULATORY-BODY',
    r.updated_at = datetime();

// CareerOutcome-[:HAS_FOLLOW_ON_EXAM]->EntranceExam
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_has_follow_on_exam_career_outcome_entrance_exam.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:CareerOutcome {outcome_code: trim(row.source_code)})
MATCH (target:EntranceExam {exam_code: trim(row.target_code)})
MERGE (source)-[r:HAS_FOLLOW_ON_EXAM]->(target)
SET
    r.registry_relationship_id = 'REL-HAS_FOLLOW_ON_EXAM-CAREER-OUTCOME-ENTRANCE-EXAM',
    r.updated_at = datetime();

// EntranceExam-[:PRECEDES]->EntranceExam
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_precedes_entrance_exam_entrance_exam.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:EntranceExam {exam_code: trim(row.source_code)})
MATCH (target:EntranceExam {exam_code: trim(row.target_code)})
MERGE (source)-[r:PRECEDES]->(target)
SET
    r.registry_relationship_id = 'REL-PRECEDES-ENTRANCE-EXAM-ENTRANCE-EXAM',
    r.updated_at = datetime();

// CareerOutcome-[:SUBSEQUENT_TO]->CareerOutcome
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_subsequent_to_career_outcome_career_outcome.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:CareerOutcome {outcome_code: trim(row.source_code)})
MATCH (target:CareerOutcome {outcome_code: trim(row.target_code)})
MERGE (source)-[r:SUBSEQUENT_TO]->(target)
SET
    r.registry_relationship_id = 'REL-SUBSEQUENT_TO-CAREER-OUTCOME-CAREER-OUTCOME',
    r.updated_at = datetime();

// Degree-[:PRECEDES]->Degree
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_precedes_degree_degree.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Degree {degree_code: trim(row.source_code)})
MATCH (target:Degree {degree_code: trim(row.target_code)})
MERGE (source)-[r:PRECEDES]->(target)
SET
    r.registry_relationship_id = 'REL-PRECEDES-DEGREE-DEGREE',
    r.updated_at = datetime();

// RegulatoryBody-[:HAS_STATE_UNIT]->RegulatoryBody
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_has_state_unit_regulatory_body_regulatory_body.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:RegulatoryBody {body_code: trim(row.source_code)})
MATCH (target:RegulatoryBody {body_code: trim(row.target_code)})
MERGE (source)-[r:HAS_STATE_UNIT]->(target)
SET
    r.registry_relationship_id = 'REL-HAS_STATE_UNIT-REGULATORY-BODY-REGULATORY-BODY',
    r.updated_at = datetime();

// Institution-[:PEER_OF]->Institution
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_peer_of_institution_institution.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Institution {institution_code: trim(row.source_code)})
MATCH (target:Institution {institution_code: trim(row.target_code)})
MERGE (source)-[r:PEER_OF]->(target)
SET
    r.registry_relationship_id = 'REL-PEER_OF-INSTITUTION-INSTITUTION',
    r.updated_at = datetime();

// Institution-[:LOCATED_IN]->City
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_located_in_institution_city.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Institution {institution_code: trim(row.source_code)})
MATCH (target:City {city_code: trim(row.target_code)})
MERGE (source)-[r:LOCATED_IN]->(target)
SET
    r.registry_relationship_id = 'REL-LOCATED_IN-INSTITUTION-CITY',
    r.updated_at = datetime();

// CareerOutcome-[:HIRING_HUB_CITY]->City
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_hiring_hub_city_career_outcome_city.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:CareerOutcome {outcome_code: trim(row.source_code)})
MATCH (target:City {city_code: trim(row.target_code)})
MERGE (source)-[r:HIRING_HUB_CITY]->(target)
SET
    r.registry_relationship_id = 'REL-HIRING_HUB_CITY-CAREER-OUTCOME-CITY',
    r.updated_at = datetime();

// Scholarship-[:APPLICABLE_TO]->Stream
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_applicable_to_scholarship_stream.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Scholarship {scholarship_code: trim(row.source_code)})
MATCH (target:Stream {stream_code: trim(row.target_code)})
MERGE (source)-[r:APPLICABLE_TO]->(target)
SET
    r.registry_relationship_id = 'REL-APPLICABLE_TO-SCHOLARSHIP-STREAM',
    r.updated_at = datetime();

// Scholarship-[:OFFERED_BY]->Institution
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_offered_by_scholarship_institution.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Scholarship {scholarship_code: trim(row.source_code)})
MATCH (target:Institution {institution_code: trim(row.target_code)})
MERGE (source)-[r:OFFERED_BY]->(target)
SET
    r.registry_relationship_id = 'REL-OFFERED_BY-SCHOLARSHIP-INSTITUTION',
    r.updated_at = datetime();

// Institution-[:PRE_APPROVED_BY_BANK]->EducationLoan
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_pre_approved_by_bank_institution_education_loan.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Institution {institution_code: trim(row.source_code)})
MATCH (target:EducationLoan {loan_code: trim(row.target_code)})
MERGE (source)-[r:PRE_APPROVED_BY_BANK]->(target)
SET
    r.registry_relationship_id = 'REL-PRE_APPROVED_BY_BANK-INSTITUTION-EDUCATION-LOAN',
    r.updated_at = datetime();

// EducationLoan-[:COVERS_STREAM]->Stream
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_covers_stream_education_loan_stream.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:EducationLoan {loan_code: trim(row.source_code)})
MATCH (target:Stream {stream_code: trim(row.target_code)})
MERGE (source)-[r:COVERS_STREAM]->(target)
SET
    r.registry_relationship_id = 'REL-COVERS_STREAM-EDUCATION-LOAN-STREAM',
    r.updated_at = datetime();

// Licence-[:EQUIVALENT_TO]->Licence
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_equivalent_to_licence_licence.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Licence {licence_code: trim(row.source_code)})
MATCH (target:Licence {licence_code: trim(row.target_code)})
MERGE (source)-[r:EQUIVALENT_TO]->(target)
SET
    r.registry_relationship_id = 'REL-EQUIVALENT_TO-LICENCE-LICENCE',
    r.updated_at = datetime();

// Degree-[:EQUIVALENT_TO]->Degree
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_equivalent_to_degree_degree.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Degree {degree_code: trim(row.source_code)})
MATCH (target:Degree {degree_code: trim(row.target_code)})
MERGE (source)-[r:EQUIVALENT_TO]->(target)
SET
    r.registry_relationship_id = 'REL-EQUIVALENT_TO-DEGREE-DEGREE',
    r.updated_at = datetime();

// EntranceExam-[:USES_EQUIVALENCE_RULE]->SubjectEquivalenceRule
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_uses_equivalence_rule_entrance_exam_subject_equivalence_rule.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:EntranceExam {exam_code: trim(row.source_code)})
MATCH (target:SubjectEquivalenceRule {rule_code: trim(row.target_code)})
MERGE (source)-[r:USES_EQUIVALENCE_RULE]->(target)
SET
    r.registry_relationship_id = 'REL-USES_EQUIVALENCE_RULE-ENTRANCE-EXAM-SUBJECT-EQUIVALENCE-RULE',
    r.updated_at = datetime();

// Stream-[:REQUIRES_APTITUDE]->Aptitude
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_requires_aptitude_stream_aptitude.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Stream {stream_code: trim(row.source_code)})
MATCH (target:Aptitude {aptitude_code: trim(row.target_code)})
MERGE (source)-[r:REQUIRES_APTITUDE]->(target)
SET
    r.registry_relationship_id = 'REL-REQUIRES_APTITUDE-STREAM-APTITUDE',
    r.updated_at = datetime();

// CareerOutcome-[:REQUIRES_APTITUDE]->Aptitude
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_requires_aptitude_career_outcome_aptitude.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:CareerOutcome {outcome_code: trim(row.source_code)})
MATCH (target:Aptitude {aptitude_code: trim(row.target_code)})
MERGE (source)-[r:REQUIRES_APTITUDE]->(target)
SET
    r.registry_relationship_id = 'REL-REQUIRES_APTITUDE-CAREER-OUTCOME-APTITUDE',
    r.updated_at = datetime();

// Stream-[:REQUIRES_SKILL]->Skill
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_requires_skill_stream_skill.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Stream {stream_code: trim(row.source_code)})
MATCH (target:Skill {skill_code: trim(row.target_code)})
MERGE (source)-[r:REQUIRES_SKILL]->(target)
SET
    r.registry_relationship_id = 'REL-REQUIRES_SKILL-STREAM-SKILL',
    r.updated_at = datetime();

// CareerOutcome-[:REQUIRES_SKILL]->Skill
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_requires_skill_career_outcome_skill.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:CareerOutcome {outcome_code: trim(row.source_code)})
MATCH (target:Skill {skill_code: trim(row.target_code)})
MERGE (source)-[r:REQUIRES_SKILL]->(target)
SET
    r.registry_relationship_id = 'REL-REQUIRES_SKILL-CAREER-OUTCOME-SKILL',
    r.updated_at = datetime();

// Stream-[:ALIGNS_WITH_INTEREST]->Interest
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_aligns_with_interest_stream_interest.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Stream {stream_code: trim(row.source_code)})
MATCH (target:Interest {interest_code: trim(row.target_code)})
MERGE (source)-[r:ALIGNS_WITH_INTEREST]->(target)
SET
    r.registry_relationship_id = 'REL-ALIGNS_WITH_INTEREST-STREAM-INTEREST',
    r.updated_at = datetime();

// CareerOutcome-[:ALIGNS_WITH_INTEREST]->Interest
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_aligns_with_interest_career_outcome_interest.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:CareerOutcome {outcome_code: trim(row.source_code)})
MATCH (target:Interest {interest_code: trim(row.target_code)})
MERGE (source)-[r:ALIGNS_WITH_INTEREST]->(target)
SET
    r.registry_relationship_id = 'REL-ALIGNS_WITH_INTEREST-CAREER-OUTCOME-INTEREST',
    r.updated_at = datetime();

// CareerOutcome-[:FAVOURED_BY_TRAIT]->PersonalityTrait
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_favoured_by_trait_career_outcome_personality_trait.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:CareerOutcome {outcome_code: trim(row.source_code)})
MATCH (target:PersonalityTrait {trait_code: trim(row.target_code)})
MERGE (source)-[r:FAVOURED_BY_TRAIT]->(target)
SET
    r.registry_relationship_id = 'REL-FAVOURED_BY_TRAIT-CAREER-OUTCOME-PERSONALITY-TRAIT',
    r.updated_at = datetime();

// Stream-[:INFLUENCED_BY_PREFERENCE]->WorkPreference
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_influenced_by_preference_stream_work_preference.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Stream {stream_code: trim(row.source_code)})
MATCH (target:WorkPreference {preference_code: trim(row.target_code)})
MERGE (source)-[r:INFLUENCED_BY_PREFERENCE]->(target)
SET
    r.registry_relationship_id = 'REL-INFLUENCED_BY_PREFERENCE-STREAM-WORK-PREFERENCE',
    r.updated_at = datetime();

// CareerOutcome-[:INFLUENCED_BY_PREFERENCE]->WorkPreference
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_influenced_by_preference_career_outcome_work_preference.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:CareerOutcome {outcome_code: trim(row.source_code)})
MATCH (target:WorkPreference {preference_code: trim(row.target_code)})
MERGE (source)-[r:INFLUENCED_BY_PREFERENCE]->(target)
SET
    r.registry_relationship_id = 'REL-INFLUENCED_BY_PREFERENCE-CAREER-OUTCOME-WORK-PREFERENCE',
    r.updated_at = datetime();

// Activity-[:DEVELOPS_SKILL]->Skill
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_develops_skill_activity_skill.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Activity {activity_code: trim(row.source_code)})
MATCH (target:Skill {skill_code: trim(row.target_code)})
MERGE (source)-[r:DEVELOPS_SKILL]->(target)
SET
    r.registry_relationship_id = 'REL-DEVELOPS_SKILL-ACTIVITY-SKILL',
    r.updated_at = datetime();

// Project-[:DEVELOPS_SKILL]->Skill
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_develops_skill_project_skill.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Project {project_code: trim(row.source_code)})
MATCH (target:Skill {skill_code: trim(row.target_code)})
MERGE (source)-[r:DEVELOPS_SKILL]->(target)
SET
    r.registry_relationship_id = 'REL-DEVELOPS_SKILL-PROJECT-SKILL',
    r.updated_at = datetime();

// Apprenticeship-[:DEVELOPS_SKILL]->Skill
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_develops_skill_apprenticeship_skill.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Apprenticeship {apprenticeship_code: trim(row.source_code)})
MATCH (target:Skill {skill_code: trim(row.target_code)})
MERGE (source)-[r:DEVELOPS_SKILL]->(target)
SET
    r.registry_relationship_id = 'REL-DEVELOPS_SKILL-APPRENTICESHIP-SKILL',
    r.updated_at = datetime();

// Certification-[:DEVELOPS_SKILL]->Skill
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_develops_skill_certification_skill.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Certification {certification_code: trim(row.source_code)})
MATCH (target:Skill {skill_code: trim(row.target_code)})
MERGE (source)-[r:DEVELOPS_SKILL]->(target)
SET
    r.registry_relationship_id = 'REL-DEVELOPS_SKILL-CERTIFICATION-SKILL',
    r.updated_at = datetime();

// Certification-[:VALIDATES_COMPETENCY]->Skill
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_validates_competency_certification_skill.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Certification {certification_code: trim(row.source_code)})
MATCH (target:Skill {skill_code: trim(row.target_code)})
MERGE (source)-[r:VALIDATES_COMPETENCY]->(target)
SET
    r.registry_relationship_id = 'REL-VALIDATES_COMPETENCY-CERTIFICATION-SKILL',
    r.updated_at = datetime();

// Certification-[:VALIDATES_COMPETENCY]->Aptitude
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_validates_competency_certification_aptitude.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Certification {certification_code: trim(row.source_code)})
MATCH (target:Aptitude {aptitude_code: trim(row.target_code)})
MERGE (source)-[r:VALIDATES_COMPETENCY]->(target)
SET
    r.registry_relationship_id = 'REL-VALIDATES_COMPETENCY-CERTIFICATION-APTITUDE',
    r.updated_at = datetime();

// Certification-[:CONTRIBUTES_TO]->CareerOutcome
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_contributes_to_certification_career_outcome.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Certification {certification_code: trim(row.source_code)})
MATCH (target:CareerOutcome {outcome_code: trim(row.target_code)})
MERGE (source)-[r:CONTRIBUTES_TO]->(target)
SET
    r.registry_relationship_id = 'REL-CONTRIBUTES_TO-CERTIFICATION-CAREER-OUTCOME',
    r.updated_at = datetime();

// Apprenticeship-[:CONTRIBUTES_TO]->CareerOutcome
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_contributes_to_apprenticeship_career_outcome.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Apprenticeship {apprenticeship_code: trim(row.source_code)})
MATCH (target:CareerOutcome {outcome_code: trim(row.target_code)})
MERGE (source)-[r:CONTRIBUTES_TO]->(target)
SET
    r.registry_relationship_id = 'REL-CONTRIBUTES_TO-APPRENTICESHIP-CAREER-OUTCOME',
    r.updated_at = datetime();

// Skill-[:PREREQUISITE_OF]->Skill
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_prerequisite_of_skill_skill.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Skill {skill_code: trim(row.source_code)})
MATCH (target:Skill {skill_code: trim(row.target_code)})
MERGE (source)-[r:PREREQUISITE_OF]->(target)
SET
    r.registry_relationship_id = 'REL-PREREQUISITE_OF-SKILL-SKILL',
    r.updated_at = datetime();

// SyllabusTopic-[:PREREQUISITE_OF]->SyllabusTopic
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_prerequisite_of_syllabus_topic_syllabus_topic.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:SyllabusTopic {topic_code: trim(row.source_code)})
MATCH (target:SyllabusTopic {topic_code: trim(row.target_code)})
MERGE (source)-[r:PREREQUISITE_OF]->(target)
SET
    r.registry_relationship_id = 'REL-PREREQUISITE_OF-SYLLABUS-TOPIC-SYLLABUS-TOPIC',
    r.updated_at = datetime();

// Licence-[:UNLOCKS]->CareerOutcome
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_unlocks_licence_career_outcome.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Licence {licence_code: trim(row.source_code)})
MATCH (target:CareerOutcome {outcome_code: trim(row.target_code)})
MERGE (source)-[r:UNLOCKS]->(target)
SET
    r.registry_relationship_id = 'REL-UNLOCKS-LICENCE-CAREER-OUTCOME',
    r.updated_at = datetime();

// Degree-[:REQUIRES_EXAM]->EntranceExam
LOAD CSV WITH HEADERS FROM $csv_base_url + 'relationships/rel_requires_exam_degree_entrance_exam.csv' AS row
WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL
MATCH (source:Degree {degree_code: trim(row.source_code)})
MATCH (target:EntranceExam {exam_code: trim(row.target_code)})
MERGE (source)-[r:REQUIRES_EXAM]->(target)
SET
    r.registry_relationship_id = 'REL-REQUIRES-EXAM-DEGREE-ENTRANCE-EXAM',
    r.updated_at = datetime();
