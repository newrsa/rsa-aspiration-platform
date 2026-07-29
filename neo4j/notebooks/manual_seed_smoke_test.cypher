// RSA Knowledge Platform - Manual Neo4j Seed Smoke-Test Notebook
// Open this file in Neo4j Browser or copy one section at a time.
// Generated from the canonical Neo4j runtime artifacts.

// Manual preparation:
// 1. Start a local Neo4j database.
// 2. Copy datasets/seed into Neo4j's import directory as seed.
// 3. Run each numbered section below in order.


// -----------------------------------------------------------------------------
// 01 Parameters
// -----------------------------------------------------------------------------

// Default expects datasets/seed copied into Neo4j's import directory as seed.
:param csv_base_url => 'file:///seed/';


// -----------------------------------------------------------------------------
// 02 Identity Constraints
// -----------------------------------------------------------------------------

// Generated from semantic-registry/property-catalog/properties.yaml
// Neo4j 5.x node identity and reference-code constraints.

CREATE CONSTRAINT con_faculty_faculty_id_unique IF NOT EXISTS
FOR (n:Faculty) REQUIRE n.faculty_id IS UNIQUE;

CREATE CONSTRAINT con_faculty_faculty_code_unique IF NOT EXISTS
FOR (n:Faculty) REQUIRE n.faculty_code IS UNIQUE;

CREATE CONSTRAINT con_domain_domain_id_unique IF NOT EXISTS
FOR (n:Domain) REQUIRE n.domain_id IS UNIQUE;

CREATE CONSTRAINT con_domain_domain_code_unique IF NOT EXISTS
FOR (n:Domain) REQUIRE n.domain_code IS UNIQUE;

CREATE CONSTRAINT con_stream_stream_id_unique IF NOT EXISTS
FOR (n:Stream) REQUIRE n.stream_id IS UNIQUE;

CREATE CONSTRAINT con_stream_stream_code_unique IF NOT EXISTS
FOR (n:Stream) REQUIRE n.stream_code IS UNIQUE;

CREATE CONSTRAINT con_educationstage_stage_id_unique IF NOT EXISTS
FOR (n:EducationStage) REQUIRE n.stage_id IS UNIQUE;

CREATE CONSTRAINT con_educationstage_stage_code_unique IF NOT EXISTS
FOR (n:EducationStage) REQUIRE n.stage_code IS UNIQUE;

CREATE CONSTRAINT con_subject_subject_id_unique IF NOT EXISTS
FOR (n:Subject) REQUIRE n.subject_id IS UNIQUE;

CREATE CONSTRAINT con_subject_subject_code_unique IF NOT EXISTS
FOR (n:Subject) REQUIRE n.subject_code IS UNIQUE;

CREATE CONSTRAINT con_subjectlevel_subject_level_id_unique IF NOT EXISTS
FOR (n:SubjectLevel) REQUIRE n.subject_level_id IS UNIQUE;

CREATE CONSTRAINT con_subjectlevel_subject_level_code_unique IF NOT EXISTS
FOR (n:SubjectLevel) REQUIRE n.subject_level_code IS UNIQUE;

CREATE CONSTRAINT con_subjectcombination_combination_id_unique IF NOT EXISTS
FOR (n:SubjectCombination) REQUIRE n.combination_id IS UNIQUE;

CREATE CONSTRAINT con_subjectcombination_combination_code_unique IF NOT EXISTS
FOR (n:SubjectCombination) REQUIRE n.combination_code IS UNIQUE;

CREATE CONSTRAINT con_decisionpoint_decision_id_unique IF NOT EXISTS
FOR (n:DecisionPoint) REQUIRE n.decision_id IS UNIQUE;

CREATE CONSTRAINT con_decisionpoint_decision_code_unique IF NOT EXISTS
FOR (n:DecisionPoint) REQUIRE n.decision_code IS UNIQUE;

CREATE CONSTRAINT con_criterion_criterion_id_unique IF NOT EXISTS
FOR (n:Criterion) REQUIRE n.criterion_id IS UNIQUE;

CREATE CONSTRAINT con_criterion_criterion_code_unique IF NOT EXISTS
FOR (n:Criterion) REQUIRE n.criterion_code IS UNIQUE;

CREATE CONSTRAINT con_entranceexam_exam_id_unique IF NOT EXISTS
FOR (n:EntranceExam) REQUIRE n.exam_id IS UNIQUE;

CREATE CONSTRAINT con_entranceexam_exam_code_unique IF NOT EXISTS
FOR (n:EntranceExam) REQUIRE n.exam_code IS UNIQUE;

CREATE CONSTRAINT con_regulatorybody_body_id_unique IF NOT EXISTS
FOR (n:RegulatoryBody) REQUIRE n.body_id IS UNIQUE;

CREATE CONSTRAINT con_regulatorybody_body_code_unique IF NOT EXISTS
FOR (n:RegulatoryBody) REQUIRE n.body_code IS UNIQUE;

CREATE CONSTRAINT con_degree_degree_id_unique IF NOT EXISTS
FOR (n:Degree) REQUIRE n.degree_id IS UNIQUE;

CREATE CONSTRAINT con_degree_degree_code_unique IF NOT EXISTS
FOR (n:Degree) REQUIRE n.degree_code IS UNIQUE;

CREATE CONSTRAINT con_institutiontype_type_id_unique IF NOT EXISTS
FOR (n:InstitutionType) REQUIRE n.type_id IS UNIQUE;

CREATE CONSTRAINT con_institutiontype_type_code_unique IF NOT EXISTS
FOR (n:InstitutionType) REQUIRE n.type_code IS UNIQUE;

CREATE CONSTRAINT con_institution_institution_id_unique IF NOT EXISTS
FOR (n:Institution) REQUIRE n.institution_id IS UNIQUE;

CREATE CONSTRAINT con_institution_institution_code_unique IF NOT EXISTS
FOR (n:Institution) REQUIRE n.institution_code IS UNIQUE;

CREATE CONSTRAINT con_admissionpathway_pathway_id_unique IF NOT EXISTS
FOR (n:AdmissionPathway) REQUIRE n.pathway_id IS UNIQUE;

CREATE CONSTRAINT con_admissionpathway_pathway_code_unique IF NOT EXISTS
FOR (n:AdmissionPathway) REQUIRE n.pathway_code IS UNIQUE;

CREATE CONSTRAINT con_syllabustopic_topic_id_unique IF NOT EXISTS
FOR (n:SyllabusTopic) REQUIRE n.topic_id IS UNIQUE;

CREATE CONSTRAINT con_syllabustopic_topic_code_unique IF NOT EXISTS
FOR (n:SyllabusTopic) REQUIRE n.topic_code IS UNIQUE;

CREATE CONSTRAINT con_subjectequivalencerule_rule_id_unique IF NOT EXISTS
FOR (n:SubjectEquivalenceRule) REQUIRE n.rule_id IS UNIQUE;

CREATE CONSTRAINT con_subjectequivalencerule_rule_code_unique IF NOT EXISTS
FOR (n:SubjectEquivalenceRule) REQUIRE n.rule_code IS UNIQUE;

CREATE CONSTRAINT con_internshiptype_internship_id_unique IF NOT EXISTS
FOR (n:InternshipType) REQUIRE n.internship_id IS UNIQUE;

CREATE CONSTRAINT con_internshiptype_internship_code_unique IF NOT EXISTS
FOR (n:InternshipType) REQUIRE n.internship_code IS UNIQUE;

CREATE CONSTRAINT con_careeroutcome_outcome_id_unique IF NOT EXISTS
FOR (n:CareerOutcome) REQUIRE n.outcome_id IS UNIQUE;

CREATE CONSTRAINT con_careeroutcome_outcome_code_unique IF NOT EXISTS
FOR (n:CareerOutcome) REQUIRE n.outcome_code IS UNIQUE;

CREATE CONSTRAINT con_salaryrange_salary_id_unique IF NOT EXISTS
FOR (n:SalaryRange) REQUIRE n.salary_id IS UNIQUE;

CREATE CONSTRAINT con_salaryrange_salary_code_unique IF NOT EXISTS
FOR (n:SalaryRange) REQUIRE n.salary_code IS UNIQUE;

CREATE CONSTRAINT con_city_city_id_unique IF NOT EXISTS
FOR (n:City) REQUIRE n.city_id IS UNIQUE;

CREATE CONSTRAINT con_city_city_code_unique IF NOT EXISTS
FOR (n:City) REQUIRE n.city_code IS UNIQUE;

CREATE CONSTRAINT con_licence_licence_id_unique IF NOT EXISTS
FOR (n:Licence) REQUIRE n.licence_id IS UNIQUE;

CREATE CONSTRAINT con_licence_licence_code_unique IF NOT EXISTS
FOR (n:Licence) REQUIRE n.licence_code IS UNIQUE;

CREATE CONSTRAINT con_scholarship_scholarship_id_unique IF NOT EXISTS
FOR (n:Scholarship) REQUIRE n.scholarship_id IS UNIQUE;

CREATE CONSTRAINT con_scholarship_scholarship_code_unique IF NOT EXISTS
FOR (n:Scholarship) REQUIRE n.scholarship_code IS UNIQUE;

CREATE CONSTRAINT con_educationloan_loan_id_unique IF NOT EXISTS
FOR (n:EducationLoan) REQUIRE n.loan_id IS UNIQUE;

CREATE CONSTRAINT con_educationloan_loan_code_unique IF NOT EXISTS
FOR (n:EducationLoan) REQUIRE n.loan_code IS UNIQUE;

CREATE CONSTRAINT con_interest_interest_id_unique IF NOT EXISTS
FOR (n:Interest) REQUIRE n.interest_id IS UNIQUE;

CREATE CONSTRAINT con_interest_interest_code_unique IF NOT EXISTS
FOR (n:Interest) REQUIRE n.interest_code IS UNIQUE;

CREATE CONSTRAINT con_aptitude_aptitude_id_unique IF NOT EXISTS
FOR (n:Aptitude) REQUIRE n.aptitude_id IS UNIQUE;

CREATE CONSTRAINT con_aptitude_aptitude_code_unique IF NOT EXISTS
FOR (n:Aptitude) REQUIRE n.aptitude_code IS UNIQUE;

CREATE CONSTRAINT con_skill_skill_id_unique IF NOT EXISTS
FOR (n:Skill) REQUIRE n.skill_id IS UNIQUE;

CREATE CONSTRAINT con_skill_skill_code_unique IF NOT EXISTS
FOR (n:Skill) REQUIRE n.skill_code IS UNIQUE;

CREATE CONSTRAINT con_personalitytrait_trait_id_unique IF NOT EXISTS
FOR (n:PersonalityTrait) REQUIRE n.trait_id IS UNIQUE;

CREATE CONSTRAINT con_personalitytrait_trait_code_unique IF NOT EXISTS
FOR (n:PersonalityTrait) REQUIRE n.trait_code IS UNIQUE;

CREATE CONSTRAINT con_workpreference_preference_id_unique IF NOT EXISTS
FOR (n:WorkPreference) REQUIRE n.preference_id IS UNIQUE;

CREATE CONSTRAINT con_workpreference_preference_code_unique IF NOT EXISTS
FOR (n:WorkPreference) REQUIRE n.preference_code IS UNIQUE;

CREATE CONSTRAINT con_activity_activity_id_unique IF NOT EXISTS
FOR (n:Activity) REQUIRE n.activity_id IS UNIQUE;

CREATE CONSTRAINT con_activity_activity_code_unique IF NOT EXISTS
FOR (n:Activity) REQUIRE n.activity_code IS UNIQUE;

CREATE CONSTRAINT con_project_project_id_unique IF NOT EXISTS
FOR (n:Project) REQUIRE n.project_id IS UNIQUE;

CREATE CONSTRAINT con_project_project_code_unique IF NOT EXISTS
FOR (n:Project) REQUIRE n.project_code IS UNIQUE;

CREATE CONSTRAINT con_apprenticeship_apprenticeship_id_unique IF NOT EXISTS
FOR (n:Apprenticeship) REQUIRE n.apprenticeship_id IS UNIQUE;

CREATE CONSTRAINT con_apprenticeship_apprenticeship_code_unique IF NOT EXISTS
FOR (n:Apprenticeship) REQUIRE n.apprenticeship_code IS UNIQUE;

CREATE CONSTRAINT con_certification_certification_id_unique IF NOT EXISTS
FOR (n:Certification) REQUIRE n.certification_id IS UNIQUE;

CREATE CONSTRAINT con_certification_certification_code_unique IF NOT EXISTS
FOR (n:Certification) REQUIRE n.certification_code IS UNIQUE;


// -----------------------------------------------------------------------------
// 03 Required Property Constraints
// -----------------------------------------------------------------------------

// These constraints require a Neo4j edition that supports node property existence constraints.
// If your Neo4j environment rejects this section, skip it and continue with the next section.

// Generated from required=true registry properties.
// Run after confirming the target Neo4j edition supports property existence constraints.

CREATE CONSTRAINT con_faculty_faculty_id_required IF NOT EXISTS
FOR (n:Faculty) REQUIRE n.faculty_id IS NOT NULL;

CREATE CONSTRAINT con_faculty_faculty_code_required IF NOT EXISTS
FOR (n:Faculty) REQUIRE n.faculty_code IS NOT NULL;

CREATE CONSTRAINT con_domain_domain_id_required IF NOT EXISTS
FOR (n:Domain) REQUIRE n.domain_id IS NOT NULL;

CREATE CONSTRAINT con_domain_domain_code_required IF NOT EXISTS
FOR (n:Domain) REQUIRE n.domain_code IS NOT NULL;

CREATE CONSTRAINT con_stream_stream_id_required IF NOT EXISTS
FOR (n:Stream) REQUIRE n.stream_id IS NOT NULL;

CREATE CONSTRAINT con_stream_stream_code_required IF NOT EXISTS
FOR (n:Stream) REQUIRE n.stream_code IS NOT NULL;

CREATE CONSTRAINT con_educationstage_stage_id_required IF NOT EXISTS
FOR (n:EducationStage) REQUIRE n.stage_id IS NOT NULL;

CREATE CONSTRAINT con_educationstage_stage_code_required IF NOT EXISTS
FOR (n:EducationStage) REQUIRE n.stage_code IS NOT NULL;

CREATE CONSTRAINT con_subject_subject_id_required IF NOT EXISTS
FOR (n:Subject) REQUIRE n.subject_id IS NOT NULL;

CREATE CONSTRAINT con_subject_subject_code_required IF NOT EXISTS
FOR (n:Subject) REQUIRE n.subject_code IS NOT NULL;

CREATE CONSTRAINT con_subjectlevel_subject_level_id_required IF NOT EXISTS
FOR (n:SubjectLevel) REQUIRE n.subject_level_id IS NOT NULL;

CREATE CONSTRAINT con_subjectlevel_subject_level_code_required IF NOT EXISTS
FOR (n:SubjectLevel) REQUIRE n.subject_level_code IS NOT NULL;

CREATE CONSTRAINT con_subjectcombination_combination_id_required IF NOT EXISTS
FOR (n:SubjectCombination) REQUIRE n.combination_id IS NOT NULL;

CREATE CONSTRAINT con_subjectcombination_combination_code_required IF NOT EXISTS
FOR (n:SubjectCombination) REQUIRE n.combination_code IS NOT NULL;

CREATE CONSTRAINT con_decisionpoint_decision_id_required IF NOT EXISTS
FOR (n:DecisionPoint) REQUIRE n.decision_id IS NOT NULL;

CREATE CONSTRAINT con_decisionpoint_decision_code_required IF NOT EXISTS
FOR (n:DecisionPoint) REQUIRE n.decision_code IS NOT NULL;

CREATE CONSTRAINT con_criterion_criterion_id_required IF NOT EXISTS
FOR (n:Criterion) REQUIRE n.criterion_id IS NOT NULL;

CREATE CONSTRAINT con_criterion_criterion_code_required IF NOT EXISTS
FOR (n:Criterion) REQUIRE n.criterion_code IS NOT NULL;

CREATE CONSTRAINT con_entranceexam_exam_id_required IF NOT EXISTS
FOR (n:EntranceExam) REQUIRE n.exam_id IS NOT NULL;

CREATE CONSTRAINT con_entranceexam_exam_code_required IF NOT EXISTS
FOR (n:EntranceExam) REQUIRE n.exam_code IS NOT NULL;

CREATE CONSTRAINT con_regulatorybody_body_id_required IF NOT EXISTS
FOR (n:RegulatoryBody) REQUIRE n.body_id IS NOT NULL;

CREATE CONSTRAINT con_regulatorybody_body_code_required IF NOT EXISTS
FOR (n:RegulatoryBody) REQUIRE n.body_code IS NOT NULL;

CREATE CONSTRAINT con_degree_degree_id_required IF NOT EXISTS
FOR (n:Degree) REQUIRE n.degree_id IS NOT NULL;

CREATE CONSTRAINT con_degree_degree_code_required IF NOT EXISTS
FOR (n:Degree) REQUIRE n.degree_code IS NOT NULL;

CREATE CONSTRAINT con_institutiontype_type_id_required IF NOT EXISTS
FOR (n:InstitutionType) REQUIRE n.type_id IS NOT NULL;

CREATE CONSTRAINT con_institutiontype_type_code_required IF NOT EXISTS
FOR (n:InstitutionType) REQUIRE n.type_code IS NOT NULL;

CREATE CONSTRAINT con_institution_institution_id_required IF NOT EXISTS
FOR (n:Institution) REQUIRE n.institution_id IS NOT NULL;

CREATE CONSTRAINT con_institution_institution_code_required IF NOT EXISTS
FOR (n:Institution) REQUIRE n.institution_code IS NOT NULL;

CREATE CONSTRAINT con_admissionpathway_pathway_id_required IF NOT EXISTS
FOR (n:AdmissionPathway) REQUIRE n.pathway_id IS NOT NULL;

CREATE CONSTRAINT con_admissionpathway_pathway_code_required IF NOT EXISTS
FOR (n:AdmissionPathway) REQUIRE n.pathway_code IS NOT NULL;

CREATE CONSTRAINT con_syllabustopic_topic_id_required IF NOT EXISTS
FOR (n:SyllabusTopic) REQUIRE n.topic_id IS NOT NULL;

CREATE CONSTRAINT con_syllabustopic_topic_code_required IF NOT EXISTS
FOR (n:SyllabusTopic) REQUIRE n.topic_code IS NOT NULL;

CREATE CONSTRAINT con_subjectequivalencerule_rule_id_required IF NOT EXISTS
FOR (n:SubjectEquivalenceRule) REQUIRE n.rule_id IS NOT NULL;

CREATE CONSTRAINT con_subjectequivalencerule_rule_code_required IF NOT EXISTS
FOR (n:SubjectEquivalenceRule) REQUIRE n.rule_code IS NOT NULL;

CREATE CONSTRAINT con_internshiptype_internship_id_required IF NOT EXISTS
FOR (n:InternshipType) REQUIRE n.internship_id IS NOT NULL;

CREATE CONSTRAINT con_internshiptype_internship_code_required IF NOT EXISTS
FOR (n:InternshipType) REQUIRE n.internship_code IS NOT NULL;

CREATE CONSTRAINT con_careeroutcome_outcome_id_required IF NOT EXISTS
FOR (n:CareerOutcome) REQUIRE n.outcome_id IS NOT NULL;

CREATE CONSTRAINT con_careeroutcome_outcome_code_required IF NOT EXISTS
FOR (n:CareerOutcome) REQUIRE n.outcome_code IS NOT NULL;

CREATE CONSTRAINT con_salaryrange_salary_id_required IF NOT EXISTS
FOR (n:SalaryRange) REQUIRE n.salary_id IS NOT NULL;

CREATE CONSTRAINT con_salaryrange_salary_code_required IF NOT EXISTS
FOR (n:SalaryRange) REQUIRE n.salary_code IS NOT NULL;

CREATE CONSTRAINT con_city_city_id_required IF NOT EXISTS
FOR (n:City) REQUIRE n.city_id IS NOT NULL;

CREATE CONSTRAINT con_city_city_code_required IF NOT EXISTS
FOR (n:City) REQUIRE n.city_code IS NOT NULL;

CREATE CONSTRAINT con_licence_licence_id_required IF NOT EXISTS
FOR (n:Licence) REQUIRE n.licence_id IS NOT NULL;

CREATE CONSTRAINT con_licence_licence_code_required IF NOT EXISTS
FOR (n:Licence) REQUIRE n.licence_code IS NOT NULL;

CREATE CONSTRAINT con_scholarship_scholarship_id_required IF NOT EXISTS
FOR (n:Scholarship) REQUIRE n.scholarship_id IS NOT NULL;

CREATE CONSTRAINT con_scholarship_scholarship_code_required IF NOT EXISTS
FOR (n:Scholarship) REQUIRE n.scholarship_code IS NOT NULL;

CREATE CONSTRAINT con_educationloan_loan_id_required IF NOT EXISTS
FOR (n:EducationLoan) REQUIRE n.loan_id IS NOT NULL;

CREATE CONSTRAINT con_educationloan_loan_code_required IF NOT EXISTS
FOR (n:EducationLoan) REQUIRE n.loan_code IS NOT NULL;

CREATE CONSTRAINT con_interest_interest_id_required IF NOT EXISTS
FOR (n:Interest) REQUIRE n.interest_id IS NOT NULL;

CREATE CONSTRAINT con_interest_interest_code_required IF NOT EXISTS
FOR (n:Interest) REQUIRE n.interest_code IS NOT NULL;

CREATE CONSTRAINT con_aptitude_aptitude_id_required IF NOT EXISTS
FOR (n:Aptitude) REQUIRE n.aptitude_id IS NOT NULL;

CREATE CONSTRAINT con_aptitude_aptitude_code_required IF NOT EXISTS
FOR (n:Aptitude) REQUIRE n.aptitude_code IS NOT NULL;

CREATE CONSTRAINT con_skill_skill_id_required IF NOT EXISTS
FOR (n:Skill) REQUIRE n.skill_id IS NOT NULL;

CREATE CONSTRAINT con_skill_skill_code_required IF NOT EXISTS
FOR (n:Skill) REQUIRE n.skill_code IS NOT NULL;

CREATE CONSTRAINT con_personalitytrait_trait_id_required IF NOT EXISTS
FOR (n:PersonalityTrait) REQUIRE n.trait_id IS NOT NULL;

CREATE CONSTRAINT con_personalitytrait_trait_code_required IF NOT EXISTS
FOR (n:PersonalityTrait) REQUIRE n.trait_code IS NOT NULL;

CREATE CONSTRAINT con_workpreference_preference_id_required IF NOT EXISTS
FOR (n:WorkPreference) REQUIRE n.preference_id IS NOT NULL;

CREATE CONSTRAINT con_workpreference_preference_code_required IF NOT EXISTS
FOR (n:WorkPreference) REQUIRE n.preference_code IS NOT NULL;

CREATE CONSTRAINT con_activity_activity_id_required IF NOT EXISTS
FOR (n:Activity) REQUIRE n.activity_id IS NOT NULL;

CREATE CONSTRAINT con_activity_activity_code_required IF NOT EXISTS
FOR (n:Activity) REQUIRE n.activity_code IS NOT NULL;

CREATE CONSTRAINT con_project_project_id_required IF NOT EXISTS
FOR (n:Project) REQUIRE n.project_id IS NOT NULL;

CREATE CONSTRAINT con_project_project_code_required IF NOT EXISTS
FOR (n:Project) REQUIRE n.project_code IS NOT NULL;

CREATE CONSTRAINT con_apprenticeship_apprenticeship_id_required IF NOT EXISTS
FOR (n:Apprenticeship) REQUIRE n.apprenticeship_id IS NOT NULL;

CREATE CONSTRAINT con_apprenticeship_apprenticeship_code_required IF NOT EXISTS
FOR (n:Apprenticeship) REQUIRE n.apprenticeship_code IS NOT NULL;

CREATE CONSTRAINT con_certification_certification_id_required IF NOT EXISTS
FOR (n:Certification) REQUIRE n.certification_id IS NOT NULL;

CREATE CONSTRAINT con_certification_certification_code_required IF NOT EXISTS
FOR (n:Certification) REQUIRE n.certification_code IS NOT NULL;


// -----------------------------------------------------------------------------
// 04 Lookup Indexes
// -----------------------------------------------------------------------------

// Generated from indexed=true, unique=false registry properties.
// Uniqueness constraints already create backing indexes and are not duplicated here.


// -----------------------------------------------------------------------------
// 05 Full-Text Indexes
// -----------------------------------------------------------------------------

// Generated for human-facing text retrieval and GraphRAG-ready search.
// Full-text indexes cover available name/display/description/alias fields per label.

CREATE FULLTEXT INDEX ftx_faculty_text IF NOT EXISTS
FOR (n:Faculty) ON EACH [n.name, n.description];

CREATE FULLTEXT INDEX ftx_domain_text IF NOT EXISTS
FOR (n:Domain) ON EACH [n.name, n.description];

CREATE FULLTEXT INDEX ftx_stream_text IF NOT EXISTS
FOR (n:Stream) ON EACH [n.name, n.description];

CREATE FULLTEXT INDEX ftx_educationstage_text IF NOT EXISTS
FOR (n:EducationStage) ON EACH [n.name];

CREATE FULLTEXT INDEX ftx_subject_text IF NOT EXISTS
FOR (n:Subject) ON EACH [n.name, n.description];

CREATE FULLTEXT INDEX ftx_subjectcombination_text IF NOT EXISTS
FOR (n:SubjectCombination) ON EACH [n.name];

CREATE FULLTEXT INDEX ftx_decisionpoint_text IF NOT EXISTS
FOR (n:DecisionPoint) ON EACH [n.name];

CREATE FULLTEXT INDEX ftx_criterion_text IF NOT EXISTS
FOR (n:Criterion) ON EACH [n.name];

CREATE FULLTEXT INDEX ftx_entranceexam_text IF NOT EXISTS
FOR (n:EntranceExam) ON EACH [n.name];

CREATE FULLTEXT INDEX ftx_regulatorybody_text IF NOT EXISTS
FOR (n:RegulatoryBody) ON EACH [n.name];

CREATE FULLTEXT INDEX ftx_degree_text IF NOT EXISTS
FOR (n:Degree) ON EACH [n.name];

CREATE FULLTEXT INDEX ftx_institutiontype_text IF NOT EXISTS
FOR (n:InstitutionType) ON EACH [n.name];

CREATE FULLTEXT INDEX ftx_institution_text IF NOT EXISTS
FOR (n:Institution) ON EACH [n.name];

CREATE FULLTEXT INDEX ftx_admissionpathway_text IF NOT EXISTS
FOR (n:AdmissionPathway) ON EACH [n.name];

CREATE FULLTEXT INDEX ftx_syllabustopic_text IF NOT EXISTS
FOR (n:SyllabusTopic) ON EACH [n.name];

CREATE FULLTEXT INDEX ftx_subjectequivalencerule_text IF NOT EXISTS
FOR (n:SubjectEquivalenceRule) ON EACH [n.name];

CREATE FULLTEXT INDEX ftx_internshiptype_text IF NOT EXISTS
FOR (n:InternshipType) ON EACH [n.name];

CREATE FULLTEXT INDEX ftx_careeroutcome_text IF NOT EXISTS
FOR (n:CareerOutcome) ON EACH [n.name];

CREATE FULLTEXT INDEX ftx_city_text IF NOT EXISTS
FOR (n:City) ON EACH [n.name];

CREATE FULLTEXT INDEX ftx_licence_text IF NOT EXISTS
FOR (n:Licence) ON EACH [n.name];

CREATE FULLTEXT INDEX ftx_scholarship_text IF NOT EXISTS
FOR (n:Scholarship) ON EACH [n.name];

CREATE FULLTEXT INDEX ftx_educationloan_text IF NOT EXISTS
FOR (n:EducationLoan) ON EACH [n.name, n.notes];

CREATE FULLTEXT INDEX ftx_interest_text IF NOT EXISTS
FOR (n:Interest) ON EACH [n.name, n.description];

CREATE FULLTEXT INDEX ftx_aptitude_text IF NOT EXISTS
FOR (n:Aptitude) ON EACH [n.name, n.description];

CREATE FULLTEXT INDEX ftx_skill_text IF NOT EXISTS
FOR (n:Skill) ON EACH [n.name, n.description];

CREATE FULLTEXT INDEX ftx_personalitytrait_text IF NOT EXISTS
FOR (n:PersonalityTrait) ON EACH [n.name, n.description];

CREATE FULLTEXT INDEX ftx_workpreference_text IF NOT EXISTS
FOR (n:WorkPreference) ON EACH [n.description];

CREATE FULLTEXT INDEX ftx_activity_text IF NOT EXISTS
FOR (n:Activity) ON EACH [n.name];

CREATE FULLTEXT INDEX ftx_project_text IF NOT EXISTS
FOR (n:Project) ON EACH [n.name];

CREATE FULLTEXT INDEX ftx_apprenticeship_text IF NOT EXISTS
FOR (n:Apprenticeship) ON EACH [n.name];

CREATE FULLTEXT INDEX ftx_certification_text IF NOT EXISTS
FOR (n:Certification) ON EACH [n.name];


// -----------------------------------------------------------------------------
// 06 Load Nodes
// -----------------------------------------------------------------------------

// Before running this section, copy datasets/seed into Neo4j's import directory as seed.
// Expected example path inside Neo4j import directory: seed/nodes/faculty.csv

// Generated node loaders.
// Set $csv_base_url to a Neo4j-readable URL such as 'file:///rsa/'.
// Expected files: nodes/<entity-name>.csv.

// Faculty
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/faculty.csv' AS row
WITH row WHERE row.faculty_code IS NOT NULL AND trim(row.faculty_code) <> ''
MERGE (n:Faculty {faculty_code: trim(row.faculty_code)})
SET
    n.faculty_id = coalesce(CASE WHEN row.faculty_id IS NULL OR trim(row.faculty_id) = '' THEN null ELSE trim(row.faculty_id) END, n.faculty_id, randomUUID()),
    n.faculty_code = trim(row.faculty_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.description = CASE WHEN row.description IS NULL OR trim(row.description) = '' THEN null ELSE trim(row.description) END,
    n.typical_entry_stage = CASE WHEN row.typical_entry_stage IS NULL OR trim(row.typical_entry_stage) = '' THEN null ELSE trim(row.typical_entry_stage) END,
    n.typical_entry_age = CASE WHEN CASE WHEN row.typical_entry_age IS NULL OR trim(row.typical_entry_age) = '' THEN null ELSE trim(row.typical_entry_age) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_entry_age IS NULL OR trim(row.typical_entry_age) = '' THEN null ELSE trim(row.typical_entry_age) END) END,
    n.entry_criteria_min_class_10_score_percent = CASE WHEN CASE WHEN row.entry_criteria_min_class_10_score_percent IS NULL OR trim(row.entry_criteria_min_class_10_score_percent) = '' THEN null ELSE trim(row.entry_criteria_min_class_10_score_percent) END IS NULL THEN null ELSE toFloat(CASE WHEN row.entry_criteria_min_class_10_score_percent IS NULL OR trim(row.entry_criteria_min_class_10_score_percent) = '' THEN null ELSE trim(row.entry_criteria_min_class_10_score_percent) END) END,
    n.entry_criteria_mandatory_subjects = CASE WHEN row.entry_criteria_mandatory_subjects IS NULL OR trim(row.entry_criteria_mandatory_subjects) = '' THEN null ELSE trim(row.entry_criteria_mandatory_subjects) END,
    n.entry_criteria_board_flexibility = CASE WHEN row.entry_criteria_board_flexibility IS NULL OR trim(row.entry_criteria_board_flexibility) = '' THEN null ELSE trim(row.entry_criteria_board_flexibility) END,
    n.typical_duration_years = CASE WHEN CASE WHEN row.typical_duration_years IS NULL OR trim(row.typical_duration_years) = '' THEN null ELSE trim(row.typical_duration_years) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_duration_years IS NULL OR trim(row.typical_duration_years) = '' THEN null ELSE trim(row.typical_duration_years) END) END,
    n.related_domains = CASE WHEN row.related_domains IS NULL OR trim(row.related_domains) = '' THEN null ELSE trim(row.related_domains) END,
    n.parent_faculties = CASE WHEN row.parent_faculties IS NULL OR trim(row.parent_faculties) = '' THEN null ELSE trim(row.parent_faculties) END,
    n.exit_options = CASE WHEN row.exit_options IS NULL OR trim(row.exit_options) = '' THEN null ELSE trim(row.exit_options) END,
    n.active_status = CASE WHEN CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END) END,
    n.universe = CASE WHEN row.universe IS NULL OR trim(row.universe) = '' THEN null ELSE trim(row.universe) END,
    n.registry_entity_id = 'ENT-FACULTY',
    n.updated_at = datetime();

// Domain
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/domain.csv' AS row
WITH row WHERE row.domain_code IS NOT NULL AND trim(row.domain_code) <> ''
MERGE (n:Domain {domain_code: trim(row.domain_code)})
SET
    n.domain_id = coalesce(CASE WHEN row.domain_id IS NULL OR trim(row.domain_id) = '' THEN null ELSE trim(row.domain_id) END, n.domain_id, randomUUID()),
    n.domain_code = trim(row.domain_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.parent_faculty = CASE WHEN row.parent_faculty IS NULL OR trim(row.parent_faculty) = '' THEN null ELSE trim(row.parent_faculty) END,
    n.industry_alignment = CASE WHEN row.industry_alignment IS NULL OR trim(row.industry_alignment) = '' THEN null ELSE trim(row.industry_alignment) END,
    n.description = CASE WHEN row.description IS NULL OR trim(row.description) = '' THEN null ELSE trim(row.description) END,
    n.typical_streams_count = CASE WHEN CASE WHEN row.typical_streams_count IS NULL OR trim(row.typical_streams_count) = '' THEN null ELSE trim(row.typical_streams_count) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_streams_count IS NULL OR trim(row.typical_streams_count) = '' THEN null ELSE trim(row.typical_streams_count) END) END,
    n.active_status = CASE WHEN CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END) END,
    n.registry_entity_id = 'ENT-DOMAIN',
    n.updated_at = datetime();

// Stream
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/stream.csv' AS row
WITH row WHERE row.stream_code IS NOT NULL AND trim(row.stream_code) <> ''
MERGE (n:Stream {stream_code: trim(row.stream_code)})
SET
    n.stream_id = coalesce(CASE WHEN row.stream_id IS NULL OR trim(row.stream_id) = '' THEN null ELSE trim(row.stream_id) END, n.stream_id, randomUUID()),
    n.stream_code = trim(row.stream_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.also_known_as = CASE WHEN row.also_known_as IS NULL OR trim(row.also_known_as) = '' THEN null ELSE trim(row.also_known_as) END,
    n.parent_domain = CASE WHEN row.parent_domain IS NULL OR trim(row.parent_domain) = '' THEN null ELSE trim(row.parent_domain) END,
    n.additional_domains = CASE WHEN row.additional_domains IS NULL OR trim(row.additional_domains) = '' THEN null ELSE trim(row.additional_domains) END,
    n.primary_faculty = CASE WHEN row.primary_faculty IS NULL OR trim(row.primary_faculty) = '' THEN null ELSE trim(row.primary_faculty) END,
    n.universe = CASE WHEN row.universe IS NULL OR trim(row.universe) = '' THEN null ELSE trim(row.universe) END,
    n.path_type = CASE WHEN row.path_type IS NULL OR trim(row.path_type) = '' THEN null ELSE trim(row.path_type) END,
    n.typical_duration_years = CASE WHEN CASE WHEN row.typical_duration_years IS NULL OR trim(row.typical_duration_years) = '' THEN null ELSE trim(row.typical_duration_years) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_duration_years IS NULL OR trim(row.typical_duration_years) = '' THEN null ELSE trim(row.typical_duration_years) END) END,
    n.stream_duration_category = CASE WHEN row.stream_duration_category IS NULL OR trim(row.stream_duration_category) = '' THEN null ELSE trim(row.stream_duration_category) END,
    n.primary_entrance_exams = CASE WHEN row.primary_entrance_exams IS NULL OR trim(row.primary_entrance_exams) = '' THEN null ELSE trim(row.primary_entrance_exams) END,
    n.typical_subject_combinations = CASE WHEN row.typical_subject_combinations IS NULL OR trim(row.typical_subject_combinations) = '' THEN null ELSE trim(row.typical_subject_combinations) END,
    n.primary_degree = CASE WHEN row.primary_degree IS NULL OR trim(row.primary_degree) = '' THEN null ELSE trim(row.primary_degree) END,
    n.ug_degree = CASE WHEN row.ug_degree IS NULL OR trim(row.ug_degree) = '' THEN null ELSE trim(row.ug_degree) END,
    n.pg_degree = CASE WHEN row.pg_degree IS NULL OR trim(row.pg_degree) = '' THEN null ELSE trim(row.pg_degree) END,
    n.primary_licence = CASE WHEN row.primary_licence IS NULL OR trim(row.primary_licence) = '' THEN null ELSE trim(row.primary_licence) END,
    n.primary_certification = CASE WHEN row.primary_certification IS NULL OR trim(row.primary_certification) = '' THEN null ELSE trim(row.primary_certification) END,
    n.description = CASE WHEN row.description IS NULL OR trim(row.description) = '' THEN null ELSE trim(row.description) END,
    n.description_short = CASE WHEN row.description_short IS NULL OR trim(row.description_short) = '' THEN null ELSE trim(row.description_short) END,
    n.typical_career_outcomes = CASE WHEN row.typical_career_outcomes IS NULL OR trim(row.typical_career_outcomes) = '' THEN null ELSE trim(row.typical_career_outcomes) END,
    n.admission_pathways = CASE WHEN row.admission_pathways IS NULL OR trim(row.admission_pathways) = '' THEN null ELSE trim(row.admission_pathways) END,
    n.pg_series_membership = CASE WHEN row.pg_series_membership IS NULL OR trim(row.pg_series_membership) = '' THEN null ELSE trim(row.pg_series_membership) END,
    n.pg_series_level = CASE WHEN CASE WHEN row.pg_series_level IS NULL OR trim(row.pg_series_level) = '' THEN null ELSE trim(row.pg_series_level) END IS NULL THEN null ELSE toInteger(CASE WHEN row.pg_series_level IS NULL OR trim(row.pg_series_level) = '' THEN null ELSE trim(row.pg_series_level) END) END,
    n.retry_and_gap_paths_gap_year_impact = CASE WHEN row.retry_and_gap_paths_gap_year_impact IS NULL OR trim(row.retry_and_gap_paths_gap_year_impact) = '' THEN null ELSE trim(row.retry_and_gap_paths_gap_year_impact) END,
    n.retry_and_gap_paths_dropout_paths = CASE WHEN row.retry_and_gap_paths_dropout_paths IS NULL OR trim(row.retry_and_gap_paths_dropout_paths) = '' THEN null ELSE trim(row.retry_and_gap_paths_dropout_paths) END,
    n.retry_and_gap_paths_reentry_options = CASE WHEN row.retry_and_gap_paths_reentry_options IS NULL OR trim(row.retry_and_gap_paths_reentry_options) = '' THEN null ELSE trim(row.retry_and_gap_paths_reentry_options) END,
    n.historical_dropout_rate_percent = CASE WHEN CASE WHEN row.historical_dropout_rate_percent IS NULL OR trim(row.historical_dropout_rate_percent) = '' THEN null ELSE trim(row.historical_dropout_rate_percent) END IS NULL THEN null ELSE toFloat(CASE WHEN row.historical_dropout_rate_percent IS NULL OR trim(row.historical_dropout_rate_percent) = '' THEN null ELSE trim(row.historical_dropout_rate_percent) END) END,
    n.demand_trend = CASE WHEN row.demand_trend IS NULL OR trim(row.demand_trend) = '' THEN null ELSE trim(row.demand_trend) END,
    n.typical_medium_of_instruction = CASE WHEN row.typical_medium_of_instruction IS NULL OR trim(row.typical_medium_of_instruction) = '' THEN null ELSE trim(row.typical_medium_of_instruction) END,
    n.international_variants = CASE WHEN row.international_variants IS NULL OR trim(row.international_variants) = '' THEN null ELSE trim(row.international_variants) END,
    n.typical_cost_range_ug_min_inr = CASE WHEN CASE WHEN row.typical_cost_range_ug_min_inr IS NULL OR trim(row.typical_cost_range_ug_min_inr) = '' THEN null ELSE trim(row.typical_cost_range_ug_min_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_cost_range_ug_min_inr IS NULL OR trim(row.typical_cost_range_ug_min_inr) = '' THEN null ELSE trim(row.typical_cost_range_ug_min_inr) END) END,
    n.typical_cost_range_ug_mid_inr = CASE WHEN CASE WHEN row.typical_cost_range_ug_mid_inr IS NULL OR trim(row.typical_cost_range_ug_mid_inr) = '' THEN null ELSE trim(row.typical_cost_range_ug_mid_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_cost_range_ug_mid_inr IS NULL OR trim(row.typical_cost_range_ug_mid_inr) = '' THEN null ELSE trim(row.typical_cost_range_ug_mid_inr) END) END,
    n.typical_cost_range_ug_max_inr = CASE WHEN CASE WHEN row.typical_cost_range_ug_max_inr IS NULL OR trim(row.typical_cost_range_ug_max_inr) = '' THEN null ELSE trim(row.typical_cost_range_ug_max_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_cost_range_ug_max_inr IS NULL OR trim(row.typical_cost_range_ug_max_inr) = '' THEN null ELSE trim(row.typical_cost_range_ug_max_inr) END) END,
    n.typical_cost_range_pg_min_inr = CASE WHEN CASE WHEN row.typical_cost_range_pg_min_inr IS NULL OR trim(row.typical_cost_range_pg_min_inr) = '' THEN null ELSE trim(row.typical_cost_range_pg_min_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_cost_range_pg_min_inr IS NULL OR trim(row.typical_cost_range_pg_min_inr) = '' THEN null ELSE trim(row.typical_cost_range_pg_min_inr) END) END,
    n.typical_cost_range_pg_mid_inr = CASE WHEN CASE WHEN row.typical_cost_range_pg_mid_inr IS NULL OR trim(row.typical_cost_range_pg_mid_inr) = '' THEN null ELSE trim(row.typical_cost_range_pg_mid_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_cost_range_pg_mid_inr IS NULL OR trim(row.typical_cost_range_pg_mid_inr) = '' THEN null ELSE trim(row.typical_cost_range_pg_mid_inr) END) END,
    n.typical_cost_range_pg_max_inr = CASE WHEN CASE WHEN row.typical_cost_range_pg_max_inr IS NULL OR trim(row.typical_cost_range_pg_max_inr) = '' THEN null ELSE trim(row.typical_cost_range_pg_max_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_cost_range_pg_max_inr IS NULL OR trim(row.typical_cost_range_pg_max_inr) = '' THEN null ELSE trim(row.typical_cost_range_pg_max_inr) END) END,
    n.typical_earning_start_age = CASE WHEN CASE WHEN row.typical_earning_start_age IS NULL OR trim(row.typical_earning_start_age) = '' THEN null ELSE trim(row.typical_earning_start_age) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_earning_start_age IS NULL OR trim(row.typical_earning_start_age) = '' THEN null ELSE trim(row.typical_earning_start_age) END) END,
    n.related_streams = CASE WHEN row.related_streams IS NULL OR trim(row.related_streams) = '' THEN null ELSE trim(row.related_streams) END,
    n.active_status = CASE WHEN CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END) END,
    n.registry_entity_id = 'ENT-STREAM',
    n.updated_at = datetime();

// EducationStage
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/educationstage.csv' AS row
WITH row WHERE row.stage_code IS NOT NULL AND trim(row.stage_code) <> ''
MERGE (n:EducationStage {stage_code: trim(row.stage_code)})
SET
    n.stage_id = coalesce(CASE WHEN row.stage_id IS NULL OR trim(row.stage_id) = '' THEN null ELSE trim(row.stage_id) END, n.stage_id, randomUUID()),
    n.stage_code = trim(row.stage_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.stage_type = CASE WHEN row.stage_type IS NULL OR trim(row.stage_type) = '' THEN null ELSE trim(row.stage_type) END,
    n.stage_order = CASE WHEN CASE WHEN row.stage_order IS NULL OR trim(row.stage_order) = '' THEN null ELSE trim(row.stage_order) END IS NULL THEN null ELSE toInteger(CASE WHEN row.stage_order IS NULL OR trim(row.stage_order) = '' THEN null ELSE trim(row.stage_order) END) END,
    n.typical_age_min = CASE WHEN CASE WHEN row.typical_age_min IS NULL OR trim(row.typical_age_min) = '' THEN null ELSE trim(row.typical_age_min) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_age_min IS NULL OR trim(row.typical_age_min) = '' THEN null ELSE trim(row.typical_age_min) END) END,
    n.typical_age_max = CASE WHEN CASE WHEN row.typical_age_max IS NULL OR trim(row.typical_age_max) = '' THEN null ELSE trim(row.typical_age_max) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_age_max IS NULL OR trim(row.typical_age_max) = '' THEN null ELSE trim(row.typical_age_max) END) END,
    n.typical_duration_months = CASE WHEN CASE WHEN row.typical_duration_months IS NULL OR trim(row.typical_duration_months) = '' THEN null ELSE trim(row.typical_duration_months) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_duration_months IS NULL OR trim(row.typical_duration_months) = '' THEN null ELSE trim(row.typical_duration_months) END) END,
    n.is_terminal = CASE WHEN CASE WHEN row.is_terminal IS NULL OR trim(row.is_terminal) = '' THEN null ELSE trim(row.is_terminal) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.is_terminal IS NULL OR trim(row.is_terminal) = '' THEN null ELSE trim(row.is_terminal) END) END,
    n.prerequisite_stages = CASE WHEN row.prerequisite_stages IS NULL OR trim(row.prerequisite_stages) = '' THEN null ELSE trim(row.prerequisite_stages) END,
    n.registry_entity_id = 'ENT-EDUCATION-STAGE',
    n.updated_at = datetime();

// Subject
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/subject.csv' AS row
WITH row WHERE row.subject_code IS NOT NULL AND trim(row.subject_code) <> ''
MERGE (n:Subject {subject_code: trim(row.subject_code)})
SET
    n.subject_id = coalesce(CASE WHEN row.subject_id IS NULL OR trim(row.subject_id) = '' THEN null ELSE trim(row.subject_id) END, n.subject_id, randomUUID()),
    n.subject_code = trim(row.subject_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.subject_category = CASE WHEN row.subject_category IS NULL OR trim(row.subject_category) = '' THEN null ELSE trim(row.subject_category) END,
    n.discipline_family = CASE WHEN row.discipline_family IS NULL OR trim(row.discipline_family) = '' THEN null ELSE trim(row.discipline_family) END,
    n.typical_stages_taught = CASE WHEN row.typical_stages_taught IS NULL OR trim(row.typical_stages_taught) = '' THEN null ELSE trim(row.typical_stages_taught) END,
    n.description = CASE WHEN row.description IS NULL OR trim(row.description) = '' THEN null ELSE trim(row.description) END,
    n.registry_entity_id = 'ENT-SUBJECT',
    n.updated_at = datetime();

// SubjectLevel
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/subjectlevel.csv' AS row
WITH row WHERE row.subject_level_code IS NOT NULL AND trim(row.subject_level_code) <> ''
MERGE (n:SubjectLevel {subject_level_code: trim(row.subject_level_code)})
SET
    n.subject_level_id = coalesce(CASE WHEN row.subject_level_id IS NULL OR trim(row.subject_level_id) = '' THEN null ELSE trim(row.subject_level_id) END, n.subject_level_id, randomUUID()),
    n.subject_level_code = trim(row.subject_level_code),
    n.parent_subject = CASE WHEN row.parent_subject IS NULL OR trim(row.parent_subject) = '' THEN null ELSE trim(row.parent_subject) END,
    n.education_stage = CASE WHEN row.education_stage IS NULL OR trim(row.education_stage) = '' THEN null ELSE trim(row.education_stage) END,
    n.depth_indicator = CASE WHEN row.depth_indicator IS NULL OR trim(row.depth_indicator) = '' THEN null ELSE trim(row.depth_indicator) END,
    n.prerequisites = CASE WHEN row.prerequisites IS NULL OR trim(row.prerequisites) = '' THEN null ELSE trim(row.prerequisites) END,
    n.typical_content_summary = CASE WHEN row.typical_content_summary IS NULL OR trim(row.typical_content_summary) = '' THEN null ELSE trim(row.typical_content_summary) END,
    n.registry_entity_id = 'ENT-SUBJECT-LEVEL',
    n.updated_at = datetime();

// SubjectCombination
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/subjectcombination.csv' AS row
WITH row WHERE row.combination_code IS NOT NULL AND trim(row.combination_code) <> ''
MERGE (n:SubjectCombination {combination_code: trim(row.combination_code)})
SET
    n.combination_id = coalesce(CASE WHEN row.combination_id IS NULL OR trim(row.combination_id) = '' THEN null ELSE trim(row.combination_id) END, n.combination_id, randomUUID()),
    n.combination_code = trim(row.combination_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.full_name = CASE WHEN row.full_name IS NULL OR trim(row.full_name) = '' THEN null ELSE trim(row.full_name) END,
    n.mandatory_subjects = CASE WHEN row.mandatory_subjects IS NULL OR trim(row.mandatory_subjects) = '' THEN null ELSE trim(row.mandatory_subjects) END,
    n.optional_subjects = CASE WHEN row.optional_subjects IS NULL OR trim(row.optional_subjects) = '' THEN null ELSE trim(row.optional_subjects) END,
    n.typical_faculty = CASE WHEN row.typical_faculty IS NULL OR trim(row.typical_faculty) = '' THEN null ELSE trim(row.typical_faculty) END,
    n.applicable_stages = CASE WHEN row.applicable_stages IS NULL OR trim(row.applicable_stages) = '' THEN null ELSE trim(row.applicable_stages) END,
    n.streams_enabled = CASE WHEN row.streams_enabled IS NULL OR trim(row.streams_enabled) = '' THEN null ELSE trim(row.streams_enabled) END,
    n.boards_that_offer = CASE WHEN row.boards_that_offer IS NULL OR trim(row.boards_that_offer) = '' THEN null ELSE trim(row.boards_that_offer) END,
    n.switch_flexibility_within_year = CASE WHEN row.switch_flexibility_within_year IS NULL OR trim(row.switch_flexibility_within_year) = '' THEN null ELSE trim(row.switch_flexibility_within_year) END,
    n.switch_flexibility_across_years = CASE WHEN row.switch_flexibility_across_years IS NULL OR trim(row.switch_flexibility_across_years) = '' THEN null ELSE trim(row.switch_flexibility_across_years) END,
    n.registry_entity_id = 'ENT-SUBJECT-COMBINATION',
    n.updated_at = datetime();

// DecisionPoint
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/decisionpoint.csv' AS row
WITH row WHERE row.decision_code IS NOT NULL AND trim(row.decision_code) <> ''
MERGE (n:DecisionPoint {decision_code: trim(row.decision_code)})
SET
    n.decision_id = coalesce(CASE WHEN row.decision_id IS NULL OR trim(row.decision_id) = '' THEN null ELSE trim(row.decision_id) END, n.decision_id, randomUUID()),
    n.decision_code = trim(row.decision_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.decision_type = CASE WHEN row.decision_type IS NULL OR trim(row.decision_type) = '' THEN null ELSE trim(row.decision_type) END,
    n.typical_stage = CASE WHEN row.typical_stage IS NULL OR trim(row.typical_stage) = '' THEN null ELSE trim(row.typical_stage) END,
    n.typical_age = CASE WHEN CASE WHEN row.typical_age IS NULL OR trim(row.typical_age) = '' THEN null ELSE trim(row.typical_age) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_age IS NULL OR trim(row.typical_age) = '' THEN null ELSE trim(row.typical_age) END) END,
    n.criteria = CASE WHEN row.criteria IS NULL OR trim(row.criteria) = '' THEN null ELSE trim(row.criteria) END,
    n.supporting_activities_reference = CASE WHEN row.supporting_activities_reference IS NULL OR trim(row.supporting_activities_reference) = '' THEN null ELSE trim(row.supporting_activities_reference) END,
    n.reversibility = CASE WHEN row.reversibility IS NULL OR trim(row.reversibility) = '' THEN null ELSE trim(row.reversibility) END,
    n.typical_stakeholders = CASE WHEN row.typical_stakeholders IS NULL OR trim(row.typical_stakeholders) = '' THEN null ELSE trim(row.typical_stakeholders) END,
    n.consequence_downstream = CASE WHEN row.consequence_downstream IS NULL OR trim(row.consequence_downstream) = '' THEN null ELSE trim(row.consequence_downstream) END,
    n.typical_decision_horizon_months = CASE WHEN CASE WHEN row.typical_decision_horizon_months IS NULL OR trim(row.typical_decision_horizon_months) = '' THEN null ELSE trim(row.typical_decision_horizon_months) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_decision_horizon_months IS NULL OR trim(row.typical_decision_horizon_months) = '' THEN null ELSE trim(row.typical_decision_horizon_months) END) END,
    n.related_streams = CASE WHEN row.related_streams IS NULL OR trim(row.related_streams) = '' THEN null ELSE trim(row.related_streams) END,
    n.active_status = CASE WHEN CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END) END,
    n.registry_entity_id = 'ENT-DECISION-POINT',
    n.updated_at = datetime();

// Criterion
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/criterion.csv' AS row
WITH row WHERE row.criterion_code IS NOT NULL AND trim(row.criterion_code) <> ''
MERGE (n:Criterion {criterion_code: trim(row.criterion_code)})
SET
    n.criterion_id = coalesce(CASE WHEN row.criterion_id IS NULL OR trim(row.criterion_id) = '' THEN null ELSE trim(row.criterion_id) END, n.criterion_id, randomUUID()),
    n.criterion_code = trim(row.criterion_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.criterion_type = CASE WHEN row.criterion_type IS NULL OR trim(row.criterion_type) = '' THEN null ELSE trim(row.criterion_type) END,
    n.measurement_unit = CASE WHEN row.measurement_unit IS NULL OR trim(row.measurement_unit) = '' THEN null ELSE trim(row.measurement_unit) END,
    n.typical_thresholds_min = CASE WHEN row.typical_thresholds_min IS NULL OR trim(row.typical_thresholds_min) = '' THEN null ELSE trim(row.typical_thresholds_min) END,
    n.typical_thresholds_target = CASE WHEN row.typical_thresholds_target IS NULL OR trim(row.typical_thresholds_target) = '' THEN null ELSE trim(row.typical_thresholds_target) END,
    n.typical_thresholds_competitive = CASE WHEN row.typical_thresholds_competitive IS NULL OR trim(row.typical_thresholds_competitive) = '' THEN null ELSE trim(row.typical_thresholds_competitive) END,
    n.weight_at_decision = CASE WHEN CASE WHEN row.weight_at_decision IS NULL OR trim(row.weight_at_decision) = '' THEN null ELSE trim(row.weight_at_decision) END IS NULL THEN null ELSE toFloat(CASE WHEN row.weight_at_decision IS NULL OR trim(row.weight_at_decision) = '' THEN null ELSE trim(row.weight_at_decision) END) END,
    n.applicable_decision_points = CASE WHEN row.applicable_decision_points IS NULL OR trim(row.applicable_decision_points) = '' THEN null ELSE trim(row.applicable_decision_points) END,
    n.measurement_frequency = CASE WHEN row.measurement_frequency IS NULL OR trim(row.measurement_frequency) = '' THEN null ELSE trim(row.measurement_frequency) END,
    n.evidence_required = CASE WHEN row.evidence_required IS NULL OR trim(row.evidence_required) = '' THEN null ELSE trim(row.evidence_required) END,
    n.typical_source_of_measurement = CASE WHEN row.typical_source_of_measurement IS NULL OR trim(row.typical_source_of_measurement) = '' THEN null ELSE trim(row.typical_source_of_measurement) END,
    n.notes_and_variations = CASE WHEN row.notes_and_variations IS NULL OR trim(row.notes_and_variations) = '' THEN null ELSE trim(row.notes_and_variations) END,
    n.registry_entity_id = 'ENT-CRITERION',
    n.updated_at = datetime();

// EntranceExam
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/entranceexam.csv' AS row
WITH row WHERE row.exam_code IS NOT NULL AND trim(row.exam_code) <> ''
MERGE (n:EntranceExam {exam_code: trim(row.exam_code)})
SET
    n.exam_id = coalesce(CASE WHEN row.exam_id IS NULL OR trim(row.exam_id) = '' THEN null ELSE trim(row.exam_id) END, n.exam_id, randomUUID()),
    n.exam_code = trim(row.exam_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.also_known_as = CASE WHEN row.also_known_as IS NULL OR trim(row.also_known_as) = '' THEN null ELSE trim(row.also_known_as) END,
    n.conducting_body = CASE WHEN row.conducting_body IS NULL OR trim(row.conducting_body) = '' THEN null ELSE trim(row.conducting_body) END,
    n.counselling_body = CASE WHEN row.counselling_body IS NULL OR trim(row.counselling_body) = '' THEN null ELSE trim(row.counselling_body) END,
    n.exam_level = CASE WHEN row.exam_level IS NULL OR trim(row.exam_level) = '' THEN null ELSE trim(row.exam_level) END,
    n.frequency_per_year = CASE WHEN CASE WHEN row.frequency_per_year IS NULL OR trim(row.frequency_per_year) = '' THEN null ELSE trim(row.frequency_per_year) END IS NULL THEN null ELSE toInteger(CASE WHEN row.frequency_per_year IS NULL OR trim(row.frequency_per_year) = '' THEN null ELSE trim(row.frequency_per_year) END) END,
    n.typical_conduct_months = CASE WHEN row.typical_conduct_months IS NULL OR trim(row.typical_conduct_months) = '' THEN null ELSE trim(row.typical_conduct_months) END,
    n.mode = CASE WHEN row.mode IS NULL OR trim(row.mode) = '' THEN null ELSE trim(row.mode) END,
    n.session_number_pattern = CASE WHEN row.session_number_pattern IS NULL OR trim(row.session_number_pattern) = '' THEN null ELSE trim(row.session_number_pattern) END,
    n.duration_hours = CASE WHEN CASE WHEN row.duration_hours IS NULL OR trim(row.duration_hours) = '' THEN null ELSE trim(row.duration_hours) END IS NULL THEN null ELSE toFloat(CASE WHEN row.duration_hours IS NULL OR trim(row.duration_hours) = '' THEN null ELSE trim(row.duration_hours) END) END,
    n.number_of_papers = CASE WHEN CASE WHEN row.number_of_papers IS NULL OR trim(row.number_of_papers) = '' THEN null ELSE trim(row.number_of_papers) END IS NULL THEN null ELSE toInteger(CASE WHEN row.number_of_papers IS NULL OR trim(row.number_of_papers) = '' THEN null ELSE trim(row.number_of_papers) END) END,
    n.papers_structure = CASE WHEN row.papers_structure IS NULL OR trim(row.papers_structure) = '' THEN null ELSE trim(row.papers_structure) END,
    n.sub_paper_variants = CASE WHEN row.sub_paper_variants IS NULL OR trim(row.sub_paper_variants) = '' THEN null ELSE trim(row.sub_paper_variants) END,
    n.scoring_types_available_has_score = CASE WHEN CASE WHEN row.scoring_types_available_has_score IS NULL OR trim(row.scoring_types_available_has_score) = '' THEN null ELSE trim(row.scoring_types_available_has_score) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.scoring_types_available_has_score IS NULL OR trim(row.scoring_types_available_has_score) = '' THEN null ELSE trim(row.scoring_types_available_has_score) END) END,
    n.scoring_types_available_has_percentile = CASE WHEN CASE WHEN row.scoring_types_available_has_percentile IS NULL OR trim(row.scoring_types_available_has_percentile) = '' THEN null ELSE trim(row.scoring_types_available_has_percentile) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.scoring_types_available_has_percentile IS NULL OR trim(row.scoring_types_available_has_percentile) = '' THEN null ELSE trim(row.scoring_types_available_has_percentile) END) END,
    n.scoring_types_available_has_rank = CASE WHEN CASE WHEN row.scoring_types_available_has_rank IS NULL OR trim(row.scoring_types_available_has_rank) = '' THEN null ELSE trim(row.scoring_types_available_has_rank) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.scoring_types_available_has_rank IS NULL OR trim(row.scoring_types_available_has_rank) = '' THEN null ELSE trim(row.scoring_types_available_has_rank) END) END,
    n.scoring_types_available_has_normalisation = CASE WHEN CASE WHEN row.scoring_types_available_has_normalisation IS NULL OR trim(row.scoring_types_available_has_normalisation) = '' THEN null ELSE trim(row.scoring_types_available_has_normalisation) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.scoring_types_available_has_normalisation IS NULL OR trim(row.scoring_types_available_has_normalisation) = '' THEN null ELSE trim(row.scoring_types_available_has_normalisation) END) END,
    n.difficulty_indicator = CASE WHEN row.difficulty_indicator IS NULL OR trim(row.difficulty_indicator) = '' THEN null ELSE trim(row.difficulty_indicator) END,
    n.syllabus_reference = CASE WHEN row.syllabus_reference IS NULL OR trim(row.syllabus_reference) = '' THEN null ELSE trim(row.syllabus_reference) END,
    n.attempts_allowed_lifetime = CASE WHEN CASE WHEN row.attempts_allowed_lifetime IS NULL OR trim(row.attempts_allowed_lifetime) = '' THEN null ELSE trim(row.attempts_allowed_lifetime) END IS NULL THEN null ELSE toInteger(CASE WHEN row.attempts_allowed_lifetime IS NULL OR trim(row.attempts_allowed_lifetime) = '' THEN null ELSE trim(row.attempts_allowed_lifetime) END) END,
    n.attempts_allowed_per_year = CASE WHEN CASE WHEN row.attempts_allowed_per_year IS NULL OR trim(row.attempts_allowed_per_year) = '' THEN null ELSE trim(row.attempts_allowed_per_year) END IS NULL THEN null ELSE toInteger(CASE WHEN row.attempts_allowed_per_year IS NULL OR trim(row.attempts_allowed_per_year) = '' THEN null ELSE trim(row.attempts_allowed_per_year) END) END,
    n.age_criteria_min_age = CASE WHEN CASE WHEN row.age_criteria_min_age IS NULL OR trim(row.age_criteria_min_age) = '' THEN null ELSE trim(row.age_criteria_min_age) END IS NULL THEN null ELSE toInteger(CASE WHEN row.age_criteria_min_age IS NULL OR trim(row.age_criteria_min_age) = '' THEN null ELSE trim(row.age_criteria_min_age) END) END,
    n.age_criteria_max_age = CASE WHEN CASE WHEN row.age_criteria_max_age IS NULL OR trim(row.age_criteria_max_age) = '' THEN null ELSE trim(row.age_criteria_max_age) END IS NULL THEN null ELSE toInteger(CASE WHEN row.age_criteria_max_age IS NULL OR trim(row.age_criteria_max_age) = '' THEN null ELSE trim(row.age_criteria_max_age) END) END,
    n.age_criteria_reference_date = CASE WHEN row.age_criteria_reference_date IS NULL OR trim(row.age_criteria_reference_date) = '' THEN null ELSE trim(row.age_criteria_reference_date) END,
    n.age_criteria_exceptions = CASE WHEN row.age_criteria_exceptions IS NULL OR trim(row.age_criteria_exceptions) = '' THEN null ELSE trim(row.age_criteria_exceptions) END,
    n.citizenship_criteria_accepted_categories = CASE WHEN row.citizenship_criteria_accepted_categories IS NULL OR trim(row.citizenship_criteria_accepted_categories) = '' THEN null ELSE trim(row.citizenship_criteria_accepted_categories) END,
    n.citizenship_criteria_excluded_categories = CASE WHEN row.citizenship_criteria_excluded_categories IS NULL OR trim(row.citizenship_criteria_excluded_categories) = '' THEN null ELSE trim(row.citizenship_criteria_excluded_categories) END,
    n.citizenship_criteria_nri_provisions = CASE WHEN row.citizenship_criteria_nri_provisions IS NULL OR trim(row.citizenship_criteria_nri_provisions) = '' THEN null ELSE trim(row.citizenship_criteria_nri_provisions) END,
    n.citizenship_criteria_oci_provisions = CASE WHEN row.citizenship_criteria_oci_provisions IS NULL OR trim(row.citizenship_criteria_oci_provisions) = '' THEN null ELSE trim(row.citizenship_criteria_oci_provisions) END,
    n.education_prerequisites_class_passed = CASE WHEN row.education_prerequisites_class_passed IS NULL OR trim(row.education_prerequisites_class_passed) = '' THEN null ELSE trim(row.education_prerequisites_class_passed) END,
    n.education_prerequisites_min_marks_percent = CASE WHEN CASE WHEN row.education_prerequisites_min_marks_percent IS NULL OR trim(row.education_prerequisites_min_marks_percent) = '' THEN null ELSE trim(row.education_prerequisites_min_marks_percent) END IS NULL THEN null ELSE toFloat(CASE WHEN row.education_prerequisites_min_marks_percent IS NULL OR trim(row.education_prerequisites_min_marks_percent) = '' THEN null ELSE trim(row.education_prerequisites_min_marks_percent) END) END,
    n.education_prerequisites_subjects_required = CASE WHEN row.education_prerequisites_subjects_required IS NULL OR trim(row.education_prerequisites_subjects_required) = '' THEN null ELSE trim(row.education_prerequisites_subjects_required) END,
    n.subject_prerequisites = CASE WHEN row.subject_prerequisites IS NULL OR trim(row.subject_prerequisites) = '' THEN null ELSE trim(row.subject_prerequisites) END,
    n.eligibility_disqualifiers_notes = CASE WHEN row.eligibility_disqualifiers_notes IS NULL OR trim(row.eligibility_disqualifiers_notes) = '' THEN null ELSE trim(row.eligibility_disqualifiers_notes) END,
    n.reservation_categories = CASE WHEN row.reservation_categories IS NULL OR trim(row.reservation_categories) = '' THEN null ELSE trim(row.reservation_categories) END,
    n.state_domicile_criteria = CASE WHEN row.state_domicile_criteria IS NULL OR trim(row.state_domicile_criteria) = '' THEN null ELSE trim(row.state_domicile_criteria) END,
    n.marital_status_restriction = CASE WHEN row.marital_status_restriction IS NULL OR trim(row.marital_status_restriction) = '' THEN null ELSE trim(row.marital_status_restriction) END,
    n.typical_application_fee_general_inr = CASE WHEN CASE WHEN row.typical_application_fee_general_inr IS NULL OR trim(row.typical_application_fee_general_inr) = '' THEN null ELSE trim(row.typical_application_fee_general_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_application_fee_general_inr IS NULL OR trim(row.typical_application_fee_general_inr) = '' THEN null ELSE trim(row.typical_application_fee_general_inr) END) END,
    n.typical_application_fee_obc_inr = CASE WHEN CASE WHEN row.typical_application_fee_obc_inr IS NULL OR trim(row.typical_application_fee_obc_inr) = '' THEN null ELSE trim(row.typical_application_fee_obc_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_application_fee_obc_inr IS NULL OR trim(row.typical_application_fee_obc_inr) = '' THEN null ELSE trim(row.typical_application_fee_obc_inr) END) END,
    n.typical_application_fee_sc_st_inr = CASE WHEN CASE WHEN row.typical_application_fee_sc_st_inr IS NULL OR trim(row.typical_application_fee_sc_st_inr) = '' THEN null ELSE trim(row.typical_application_fee_sc_st_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_application_fee_sc_st_inr IS NULL OR trim(row.typical_application_fee_sc_st_inr) = '' THEN null ELSE trim(row.typical_application_fee_sc_st_inr) END) END,
    n.typical_application_fee_pwd_inr = CASE WHEN CASE WHEN row.typical_application_fee_pwd_inr IS NULL OR trim(row.typical_application_fee_pwd_inr) = '' THEN null ELSE trim(row.typical_application_fee_pwd_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_application_fee_pwd_inr IS NULL OR trim(row.typical_application_fee_pwd_inr) = '' THEN null ELSE trim(row.typical_application_fee_pwd_inr) END) END,
    n.typical_application_fee_foreign_inr = CASE WHEN CASE WHEN row.typical_application_fee_foreign_inr IS NULL OR trim(row.typical_application_fee_foreign_inr) = '' THEN null ELSE trim(row.typical_application_fee_foreign_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_application_fee_foreign_inr IS NULL OR trim(row.typical_application_fee_foreign_inr) = '' THEN null ELSE trim(row.typical_application_fee_foreign_inr) END) END,
    n.application_window_typical_start_month = CASE WHEN row.application_window_typical_start_month IS NULL OR trim(row.application_window_typical_start_month) = '' THEN null ELSE trim(row.application_window_typical_start_month) END,
    n.application_window_typical_end_month = CASE WHEN row.application_window_typical_end_month IS NULL OR trim(row.application_window_typical_end_month) = '' THEN null ELSE trim(row.application_window_typical_end_month) END,
    n.application_window_late_fee_window = CASE WHEN row.application_window_late_fee_window IS NULL OR trim(row.application_window_late_fee_window) = '' THEN null ELSE trim(row.application_window_late_fee_window) END,
    n.typical_result_declaration_month = CASE WHEN row.typical_result_declaration_month IS NULL OR trim(row.typical_result_declaration_month) = '' THEN null ELSE trim(row.typical_result_declaration_month) END,
    n.application_process_summary = CASE WHEN row.application_process_summary IS NULL OR trim(row.application_process_summary) = '' THEN null ELSE trim(row.application_process_summary) END,
    n.required_documents = CASE WHEN row.required_documents IS NULL OR trim(row.required_documents) = '' THEN null ELSE trim(row.required_documents) END,
    n.mock_test_availability = CASE WHEN row.mock_test_availability IS NULL OR trim(row.mock_test_availability) = '' THEN null ELSE trim(row.mock_test_availability) END,
    n.previous_year_paper_availability = CASE WHEN CASE WHEN row.previous_year_paper_availability IS NULL OR trim(row.previous_year_paper_availability) = '' THEN null ELSE trim(row.previous_year_paper_availability) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.previous_year_paper_availability IS NULL OR trim(row.previous_year_paper_availability) = '' THEN null ELSE trim(row.previous_year_paper_availability) END) END,
    n.typical_registrations_per_year = CASE WHEN CASE WHEN row.typical_registrations_per_year IS NULL OR trim(row.typical_registrations_per_year) = '' THEN null ELSE trim(row.typical_registrations_per_year) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_registrations_per_year IS NULL OR trim(row.typical_registrations_per_year) = '' THEN null ELSE trim(row.typical_registrations_per_year) END) END,
    n.typical_success_rate_percent = CASE WHEN CASE WHEN row.typical_success_rate_percent IS NULL OR trim(row.typical_success_rate_percent) = '' THEN null ELSE trim(row.typical_success_rate_percent) END IS NULL THEN null ELSE toFloat(CASE WHEN row.typical_success_rate_percent IS NULL OR trim(row.typical_success_rate_percent) = '' THEN null ELSE trim(row.typical_success_rate_percent) END) END,
    n.typical_cutoffs_general_by_year = CASE WHEN row.typical_cutoffs_general_by_year IS NULL OR trim(row.typical_cutoffs_general_by_year) = '' THEN null ELSE trim(row.typical_cutoffs_general_by_year) END,
    n.leads_to_admissions_in_streams = CASE WHEN row.leads_to_admissions_in_streams IS NULL OR trim(row.leads_to_admissions_in_streams) = '' THEN null ELSE trim(row.leads_to_admissions_in_streams) END,
    n.leads_to_admissions_in_degrees = CASE WHEN row.leads_to_admissions_in_degrees IS NULL OR trim(row.leads_to_admissions_in_degrees) = '' THEN null ELSE trim(row.leads_to_admissions_in_degrees) END,
    n.leads_to_admissions_in_institutions = CASE WHEN row.leads_to_admissions_in_institutions IS NULL OR trim(row.leads_to_admissions_in_institutions) = '' THEN null ELSE trim(row.leads_to_admissions_in_institutions) END,
    n.international_variants = CASE WHEN row.international_variants IS NULL OR trim(row.international_variants) = '' THEN null ELSE trim(row.international_variants) END,
    n.calendar_history = CASE WHEN row.calendar_history IS NULL OR trim(row.calendar_history) = '' THEN null ELSE trim(row.calendar_history) END,
    n.typical_coaching_needed = CASE WHEN row.typical_coaching_needed IS NULL OR trim(row.typical_coaching_needed) = '' THEN null ELSE trim(row.typical_coaching_needed) END,
    n.number_of_attempts_typical_before_success = CASE WHEN CASE WHEN row.number_of_attempts_typical_before_success IS NULL OR trim(row.number_of_attempts_typical_before_success) = '' THEN null ELSE trim(row.number_of_attempts_typical_before_success) END IS NULL THEN null ELSE toFloat(CASE WHEN row.number_of_attempts_typical_before_success IS NULL OR trim(row.number_of_attempts_typical_before_success) = '' THEN null ELSE trim(row.number_of_attempts_typical_before_success) END) END,
    n.related_exams = CASE WHEN row.related_exams IS NULL OR trim(row.related_exams) = '' THEN null ELSE trim(row.related_exams) END,
    n.universe = CASE WHEN row.universe IS NULL OR trim(row.universe) = '' THEN null ELSE trim(row.universe) END,
    n.contact_email = CASE WHEN row.contact_email IS NULL OR trim(row.contact_email) = '' THEN null ELSE trim(row.contact_email) END,
    n.official_portal_url = CASE WHEN row.official_portal_url IS NULL OR trim(row.official_portal_url) = '' THEN null ELSE trim(row.official_portal_url) END,
    n.active_status = CASE WHEN CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END) END,
    n.registry_entity_id = 'ENT-ENTRANCE-EXAM',
    n.updated_at = datetime();

// RegulatoryBody
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/regulatorybody.csv' AS row
WITH row WHERE row.body_code IS NOT NULL AND trim(row.body_code) <> ''
MERGE (n:RegulatoryBody {body_code: trim(row.body_code)})
SET
    n.body_id = coalesce(CASE WHEN row.body_id IS NULL OR trim(row.body_id) = '' THEN null ELSE trim(row.body_id) END, n.body_id, randomUUID()),
    n.body_code = trim(row.body_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.acronym = CASE WHEN row.acronym IS NULL OR trim(row.acronym) = '' THEN null ELSE trim(row.acronym) END,
    n.jurisdiction = CASE WHEN row.jurisdiction IS NULL OR trim(row.jurisdiction) = '' THEN null ELSE trim(row.jurisdiction) END,
    n.jurisdiction_scope = CASE WHEN row.jurisdiction_scope IS NULL OR trim(row.jurisdiction_scope) = '' THEN null ELSE trim(row.jurisdiction_scope) END,
    n.authority_type = CASE WHEN row.authority_type IS NULL OR trim(row.authority_type) = '' THEN null ELSE trim(row.authority_type) END,
    n.ministry_or_parent = CASE WHEN row.ministry_or_parent IS NULL OR trim(row.ministry_or_parent) = '' THEN null ELSE trim(row.ministry_or_parent) END,
    n.conducts_exams = CASE WHEN row.conducts_exams IS NULL OR trim(row.conducts_exams) = '' THEN null ELSE trim(row.conducts_exams) END,
    n.approves_degrees = CASE WHEN row.approves_degrees IS NULL OR trim(row.approves_degrees) = '' THEN null ELSE trim(row.approves_degrees) END,
    n.issues_licences = CASE WHEN row.issues_licences IS NULL OR trim(row.issues_licences) = '' THEN null ELSE trim(row.issues_licences) END,
    n.official_website = CASE WHEN row.official_website IS NULL OR trim(row.official_website) = '' THEN null ELSE trim(row.official_website) END,
    n.state_units = CASE WHEN row.state_units IS NULL OR trim(row.state_units) = '' THEN null ELSE trim(row.state_units) END,
    n.parent_body = CASE WHEN row.parent_body IS NULL OR trim(row.parent_body) = '' THEN null ELSE trim(row.parent_body) END,
    n.established_year = CASE WHEN CASE WHEN row.established_year IS NULL OR trim(row.established_year) = '' THEN null ELSE trim(row.established_year) END IS NULL THEN null ELSE toInteger(CASE WHEN row.established_year IS NULL OR trim(row.established_year) = '' THEN null ELSE trim(row.established_year) END) END,
    n.registry_entity_id = 'ENT-REGULATORY-BODY',
    n.updated_at = datetime();

// Degree
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/degree.csv' AS row
WITH row WHERE row.degree_code IS NOT NULL AND trim(row.degree_code) <> ''
MERGE (n:Degree {degree_code: trim(row.degree_code)})
SET
    n.degree_id = coalesce(CASE WHEN row.degree_id IS NULL OR trim(row.degree_id) = '' THEN null ELSE trim(row.degree_id) END, n.degree_id, randomUUID()),
    n.degree_code = trim(row.degree_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.short_name = CASE WHEN row.short_name IS NULL OR trim(row.short_name) = '' THEN null ELSE trim(row.short_name) END,
    n.degree_level = CASE WHEN row.degree_level IS NULL OR trim(row.degree_level) = '' THEN null ELSE trim(row.degree_level) END,
    n.programme_type = CASE WHEN row.programme_type IS NULL OR trim(row.programme_type) = '' THEN null ELSE trim(row.programme_type) END,
    n.typical_duration_years = CASE WHEN CASE WHEN row.typical_duration_years IS NULL OR trim(row.typical_duration_years) = '' THEN null ELSE trim(row.typical_duration_years) END IS NULL THEN null ELSE toFloat(CASE WHEN row.typical_duration_years IS NULL OR trim(row.typical_duration_years) = '' THEN null ELSE trim(row.typical_duration_years) END) END,
    n.certification_body_scope = CASE WHEN row.certification_body_scope IS NULL OR trim(row.certification_body_scope) = '' THEN null ELSE trim(row.certification_body_scope) END,
    n.approving_bodies = CASE WHEN row.approving_bodies IS NULL OR trim(row.approving_bodies) = '' THEN null ELSE trim(row.approving_bodies) END,
    n.recognition_status = CASE WHEN row.recognition_status IS NULL OR trim(row.recognition_status) = '' THEN null ELSE trim(row.recognition_status) END,
    n.credit_hours = CASE WHEN CASE WHEN row.credit_hours IS NULL OR trim(row.credit_hours) = '' THEN null ELSE trim(row.credit_hours) END IS NULL THEN null ELSE toInteger(CASE WHEN row.credit_hours IS NULL OR trim(row.credit_hours) = '' THEN null ELSE trim(row.credit_hours) END) END,
    n.typical_specialisations = CASE WHEN row.typical_specialisations IS NULL OR trim(row.typical_specialisations) = '' THEN null ELSE trim(row.typical_specialisations) END,
    n.equivalent_degrees = CASE WHEN row.equivalent_degrees IS NULL OR trim(row.equivalent_degrees) = '' THEN null ELSE trim(row.equivalent_degrees) END,
    n.prerequisite_degree = CASE WHEN row.prerequisite_degree IS NULL OR trim(row.prerequisite_degree) = '' THEN null ELSE trim(row.prerequisite_degree) END,
    n.typical_awarding_institutions = CASE WHEN row.typical_awarding_institutions IS NULL OR trim(row.typical_awarding_institutions) = '' THEN null ELSE trim(row.typical_awarding_institutions) END,
    n.international_recognition_countries = CASE WHEN row.international_recognition_countries IS NULL OR trim(row.international_recognition_countries) = '' THEN null ELSE trim(row.international_recognition_countries) END,
    n.international_recognition_conditions = CASE WHEN row.international_recognition_conditions IS NULL OR trim(row.international_recognition_conditions) = '' THEN null ELSE trim(row.international_recognition_conditions) END,
    n.active_status = CASE WHEN CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END) END,
    n.registry_entity_id = 'ENT-DEGREE',
    n.updated_at = datetime();

// InstitutionType
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/institutiontype.csv' AS row
WITH row WHERE row.type_code IS NOT NULL AND trim(row.type_code) <> ''
MERGE (n:InstitutionType {type_code: trim(row.type_code)})
SET
    n.type_id = coalesce(CASE WHEN row.type_id IS NULL OR trim(row.type_id) = '' THEN null ELSE trim(row.type_id) END, n.type_id, randomUUID()),
    n.type_code = trim(row.type_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.governance_model = CASE WHEN row.governance_model IS NULL OR trim(row.governance_model) = '' THEN null ELSE trim(row.governance_model) END,
    n.regulator = CASE WHEN row.regulator IS NULL OR trim(row.regulator) = '' THEN null ELSE trim(row.regulator) END,
    n.funding_source = CASE WHEN row.funding_source IS NULL OR trim(row.funding_source) = '' THEN null ELSE trim(row.funding_source) END,
    n.typical_fee_range_min_annual_inr = CASE WHEN CASE WHEN row.typical_fee_range_min_annual_inr IS NULL OR trim(row.typical_fee_range_min_annual_inr) = '' THEN null ELSE trim(row.typical_fee_range_min_annual_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_fee_range_min_annual_inr IS NULL OR trim(row.typical_fee_range_min_annual_inr) = '' THEN null ELSE trim(row.typical_fee_range_min_annual_inr) END) END,
    n.typical_fee_range_max_annual_inr = CASE WHEN CASE WHEN row.typical_fee_range_max_annual_inr IS NULL OR trim(row.typical_fee_range_max_annual_inr) = '' THEN null ELSE trim(row.typical_fee_range_max_annual_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_fee_range_max_annual_inr IS NULL OR trim(row.typical_fee_range_max_annual_inr) = '' THEN null ELSE trim(row.typical_fee_range_max_annual_inr) END) END,
    n.typical_admission_pathway = CASE WHEN row.typical_admission_pathway IS NULL OR trim(row.typical_admission_pathway) = '' THEN null ELSE trim(row.typical_admission_pathway) END,
    n.accreditation_status_required = CASE WHEN row.accreditation_status_required IS NULL OR trim(row.accreditation_status_required) = '' THEN null ELSE trim(row.accreditation_status_required) END,
    n.placement_focus_typical = CASE WHEN row.placement_focus_typical IS NULL OR trim(row.placement_focus_typical) = '' THEN null ELSE trim(row.placement_focus_typical) END,
    n.research_focus = CASE WHEN row.research_focus IS NULL OR trim(row.research_focus) = '' THEN null ELSE trim(row.research_focus) END,
    n.international_ranking_frequent = CASE WHEN CASE WHEN row.international_ranking_frequent IS NULL OR trim(row.international_ranking_frequent) = '' THEN null ELSE trim(row.international_ranking_frequent) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.international_ranking_frequent IS NULL OR trim(row.international_ranking_frequent) = '' THEN null ELSE trim(row.international_ranking_frequent) END) END,
    n.typical_seat_count = CASE WHEN CASE WHEN row.typical_seat_count IS NULL OR trim(row.typical_seat_count) = '' THEN null ELSE trim(row.typical_seat_count) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_seat_count IS NULL OR trim(row.typical_seat_count) = '' THEN null ELSE trim(row.typical_seat_count) END) END,
    n.typical_hostel_availability = CASE WHEN row.typical_hostel_availability IS NULL OR trim(row.typical_hostel_availability) = '' THEN null ELSE trim(row.typical_hostel_availability) END,
    n.typical_pathway_from_school = CASE WHEN row.typical_pathway_from_school IS NULL OR trim(row.typical_pathway_from_school) = '' THEN null ELSE trim(row.typical_pathway_from_school) END,
    n.rankings_source = CASE WHEN row.rankings_source IS NULL OR trim(row.rankings_source) = '' THEN null ELSE trim(row.rankings_source) END,
    n.active_status = CASE WHEN CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END) END,
    n.registry_entity_id = 'ENT-INSTITUTION-TYPE',
    n.updated_at = datetime();

// Institution
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/institution.csv' AS row
WITH row WHERE row.institution_code IS NOT NULL AND trim(row.institution_code) <> ''
MERGE (n:Institution {institution_code: trim(row.institution_code)})
SET
    n.institution_id = coalesce(CASE WHEN row.institution_id IS NULL OR trim(row.institution_id) = '' THEN null ELSE trim(row.institution_id) END, n.institution_id, randomUUID()),
    n.institution_code = trim(row.institution_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.short_name = CASE WHEN row.short_name IS NULL OR trim(row.short_name) = '' THEN null ELSE trim(row.short_name) END,
    n.institution_type = CASE WHEN row.institution_type IS NULL OR trim(row.institution_type) = '' THEN null ELSE trim(row.institution_type) END,
    n.established_year = CASE WHEN CASE WHEN row.established_year IS NULL OR trim(row.established_year) = '' THEN null ELSE trim(row.established_year) END IS NULL THEN null ELSE toInteger(CASE WHEN row.established_year IS NULL OR trim(row.established_year) = '' THEN null ELSE trim(row.established_year) END) END,
    n.parent_group = CASE WHEN row.parent_group IS NULL OR trim(row.parent_group) = '' THEN null ELSE trim(row.parent_group) END,
    n.city_location = CASE WHEN row.city_location IS NULL OR trim(row.city_location) = '' THEN null ELSE trim(row.city_location) END,
    n.state = CASE WHEN row.state IS NULL OR trim(row.state) = '' THEN null ELSE trim(row.state) END,
    n.campus_size_acres = CASE WHEN CASE WHEN row.campus_size_acres IS NULL OR trim(row.campus_size_acres) = '' THEN null ELSE trim(row.campus_size_acres) END IS NULL THEN null ELSE toFloat(CASE WHEN row.campus_size_acres IS NULL OR trim(row.campus_size_acres) = '' THEN null ELSE trim(row.campus_size_acres) END) END,
    n.number_of_campuses = CASE WHEN CASE WHEN row.number_of_campuses IS NULL OR trim(row.number_of_campuses) = '' THEN null ELSE trim(row.number_of_campuses) END IS NULL THEN null ELSE toInteger(CASE WHEN row.number_of_campuses IS NULL OR trim(row.number_of_campuses) = '' THEN null ELSE trim(row.number_of_campuses) END) END,
    n.streams_offered = CASE WHEN row.streams_offered IS NULL OR trim(row.streams_offered) = '' THEN null ELSE trim(row.streams_offered) END,
    n.annual_intake_total = CASE WHEN CASE WHEN row.annual_intake_total IS NULL OR trim(row.annual_intake_total) = '' THEN null ELSE trim(row.annual_intake_total) END IS NULL THEN null ELSE toInteger(CASE WHEN row.annual_intake_total IS NULL OR trim(row.annual_intake_total) = '' THEN null ELSE trim(row.annual_intake_total) END) END,
    n.annual_intake_by_stream = CASE WHEN row.annual_intake_by_stream IS NULL OR trim(row.annual_intake_by_stream) = '' THEN null ELSE trim(row.annual_intake_by_stream) END,
    n.approving_bodies = CASE WHEN row.approving_bodies IS NULL OR trim(row.approving_bodies) = '' THEN null ELSE trim(row.approving_bodies) END,
    n.accreditation_status = CASE WHEN row.accreditation_status IS NULL OR trim(row.accreditation_status) = '' THEN null ELSE trim(row.accreditation_status) END,
    n.rankings = CASE WHEN row.rankings IS NULL OR trim(row.rankings) = '' THEN null ELSE trim(row.rankings) END,
    n.annual_tuition_min_inr = CASE WHEN CASE WHEN row.annual_tuition_min_inr IS NULL OR trim(row.annual_tuition_min_inr) = '' THEN null ELSE trim(row.annual_tuition_min_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.annual_tuition_min_inr IS NULL OR trim(row.annual_tuition_min_inr) = '' THEN null ELSE trim(row.annual_tuition_min_inr) END) END,
    n.annual_tuition_mid_inr = CASE WHEN CASE WHEN row.annual_tuition_mid_inr IS NULL OR trim(row.annual_tuition_mid_inr) = '' THEN null ELSE trim(row.annual_tuition_mid_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.annual_tuition_mid_inr IS NULL OR trim(row.annual_tuition_mid_inr) = '' THEN null ELSE trim(row.annual_tuition_mid_inr) END) END,
    n.annual_tuition_max_inr = CASE WHEN CASE WHEN row.annual_tuition_max_inr IS NULL OR trim(row.annual_tuition_max_inr) = '' THEN null ELSE trim(row.annual_tuition_max_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.annual_tuition_max_inr IS NULL OR trim(row.annual_tuition_max_inr) = '' THEN null ELSE trim(row.annual_tuition_max_inr) END) END,
    n.annual_hostel_cost_min_inr = CASE WHEN CASE WHEN row.annual_hostel_cost_min_inr IS NULL OR trim(row.annual_hostel_cost_min_inr) = '' THEN null ELSE trim(row.annual_hostel_cost_min_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.annual_hostel_cost_min_inr IS NULL OR trim(row.annual_hostel_cost_min_inr) = '' THEN null ELSE trim(row.annual_hostel_cost_min_inr) END) END,
    n.annual_hostel_cost_max_inr = CASE WHEN CASE WHEN row.annual_hostel_cost_max_inr IS NULL OR trim(row.annual_hostel_cost_max_inr) = '' THEN null ELSE trim(row.annual_hostel_cost_max_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.annual_hostel_cost_max_inr IS NULL OR trim(row.annual_hostel_cost_max_inr) = '' THEN null ELSE trim(row.annual_hostel_cost_max_inr) END) END,
    n.annual_mess_cost_min_inr = CASE WHEN CASE WHEN row.annual_mess_cost_min_inr IS NULL OR trim(row.annual_mess_cost_min_inr) = '' THEN null ELSE trim(row.annual_mess_cost_min_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.annual_mess_cost_min_inr IS NULL OR trim(row.annual_mess_cost_min_inr) = '' THEN null ELSE trim(row.annual_mess_cost_min_inr) END) END,
    n.annual_mess_cost_max_inr = CASE WHEN CASE WHEN row.annual_mess_cost_max_inr IS NULL OR trim(row.annual_mess_cost_max_inr) = '' THEN null ELSE trim(row.annual_mess_cost_max_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.annual_mess_cost_max_inr IS NULL OR trim(row.annual_mess_cost_max_inr) = '' THEN null ELSE trim(row.annual_mess_cost_max_inr) END) END,
    n.annual_other_fees_min_inr = CASE WHEN CASE WHEN row.annual_other_fees_min_inr IS NULL OR trim(row.annual_other_fees_min_inr) = '' THEN null ELSE trim(row.annual_other_fees_min_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.annual_other_fees_min_inr IS NULL OR trim(row.annual_other_fees_min_inr) = '' THEN null ELSE trim(row.annual_other_fees_min_inr) END) END,
    n.annual_other_fees_max_inr = CASE WHEN CASE WHEN row.annual_other_fees_max_inr IS NULL OR trim(row.annual_other_fees_max_inr) = '' THEN null ELSE trim(row.annual_other_fees_max_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.annual_other_fees_max_inr IS NULL OR trim(row.annual_other_fees_max_inr) = '' THEN null ELSE trim(row.annual_other_fees_max_inr) END) END,
    n.scholarships_available = CASE WHEN row.scholarships_available IS NULL OR trim(row.scholarships_available) = '' THEN null ELSE trim(row.scholarships_available) END,
    n.education_loans_pre_approved = CASE WHEN row.education_loans_pre_approved IS NULL OR trim(row.education_loans_pre_approved) = '' THEN null ELSE trim(row.education_loans_pre_approved) END,
    n.admission_pathways_supported = CASE WHEN row.admission_pathways_supported IS NULL OR trim(row.admission_pathways_supported) = '' THEN null ELSE trim(row.admission_pathways_supported) END,
    n.reservation_policy_seats_by_category = CASE WHEN row.reservation_policy_seats_by_category IS NULL OR trim(row.reservation_policy_seats_by_category) = '' THEN null ELSE trim(row.reservation_policy_seats_by_category) END,
    n.typical_placement_stats_avg_package_inr = CASE WHEN CASE WHEN row.typical_placement_stats_avg_package_inr IS NULL OR trim(row.typical_placement_stats_avg_package_inr) = '' THEN null ELSE trim(row.typical_placement_stats_avg_package_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_placement_stats_avg_package_inr IS NULL OR trim(row.typical_placement_stats_avg_package_inr) = '' THEN null ELSE trim(row.typical_placement_stats_avg_package_inr) END) END,
    n.typical_placement_stats_median_package_inr = CASE WHEN CASE WHEN row.typical_placement_stats_median_package_inr IS NULL OR trim(row.typical_placement_stats_median_package_inr) = '' THEN null ELSE trim(row.typical_placement_stats_median_package_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_placement_stats_median_package_inr IS NULL OR trim(row.typical_placement_stats_median_package_inr) = '' THEN null ELSE trim(row.typical_placement_stats_median_package_inr) END) END,
    n.typical_placement_stats_top_recruiters = CASE WHEN row.typical_placement_stats_top_recruiters IS NULL OR trim(row.typical_placement_stats_top_recruiters) = '' THEN null ELSE trim(row.typical_placement_stats_top_recruiters) END,
    n.placement_verification_status = CASE WHEN row.placement_verification_status IS NULL OR trim(row.placement_verification_status) = '' THEN null ELSE trim(row.placement_verification_status) END,
    n.medium_of_instruction = CASE WHEN row.medium_of_instruction IS NULL OR trim(row.medium_of_instruction) = '' THEN null ELSE trim(row.medium_of_instruction) END,
    n.international_partnerships = CASE WHEN row.international_partnerships IS NULL OR trim(row.international_partnerships) = '' THEN null ELSE trim(row.international_partnerships) END,
    n.hostel_availability = CASE WHEN row.hostel_availability IS NULL OR trim(row.hostel_availability) = '' THEN null ELSE trim(row.hostel_availability) END,
    n.facilities_summary = CASE WHEN row.facilities_summary IS NULL OR trim(row.facilities_summary) = '' THEN null ELSE trim(row.facilities_summary) END,
    n.contact_email = CASE WHEN row.contact_email IS NULL OR trim(row.contact_email) = '' THEN null ELSE trim(row.contact_email) END,
    n.contact_phone = CASE WHEN row.contact_phone IS NULL OR trim(row.contact_phone) = '' THEN null ELSE trim(row.contact_phone) END,
    n.official_website = CASE WHEN row.official_website IS NULL OR trim(row.official_website) = '' THEN null ELSE trim(row.official_website) END,
    n.admissions_email = CASE WHEN row.admissions_email IS NULL OR trim(row.admissions_email) = '' THEN null ELSE trim(row.admissions_email) END,
    n.active_status = CASE WHEN CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END) END,
    n.is_pwd_accessible = CASE WHEN CASE WHEN row.is_pwd_accessible IS NULL OR trim(row.is_pwd_accessible) = '' THEN null ELSE trim(row.is_pwd_accessible) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.is_pwd_accessible IS NULL OR trim(row.is_pwd_accessible) = '' THEN null ELSE trim(row.is_pwd_accessible) END) END,
    n.universe_applicability = CASE WHEN row.universe_applicability IS NULL OR trim(row.universe_applicability) = '' THEN null ELSE trim(row.universe_applicability) END,
    n.registry_entity_id = 'ENT-INSTITUTION',
    n.updated_at = datetime();

// AdmissionPathway
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/admissionpathway.csv' AS row
WITH row WHERE row.pathway_code IS NOT NULL AND trim(row.pathway_code) <> ''
MERGE (n:AdmissionPathway {pathway_code: trim(row.pathway_code)})
SET
    n.pathway_id = coalesce(CASE WHEN row.pathway_id IS NULL OR trim(row.pathway_id) = '' THEN null ELSE trim(row.pathway_id) END, n.pathway_id, randomUUID()),
    n.pathway_code = trim(row.pathway_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.pathway_type = CASE WHEN row.pathway_type IS NULL OR trim(row.pathway_type) = '' THEN null ELSE trim(row.pathway_type) END,
    n.entry_stage = CASE WHEN row.entry_stage IS NULL OR trim(row.entry_stage) = '' THEN null ELSE trim(row.entry_stage) END,
    n.eligibility_summary = CASE WHEN row.eligibility_summary IS NULL OR trim(row.eligibility_summary) = '' THEN null ELSE trim(row.eligibility_summary) END,
    n.typical_seat_allocation_percent = CASE WHEN CASE WHEN row.typical_seat_allocation_percent IS NULL OR trim(row.typical_seat_allocation_percent) = '' THEN null ELSE trim(row.typical_seat_allocation_percent) END IS NULL THEN null ELSE toFloat(CASE WHEN row.typical_seat_allocation_percent IS NULL OR trim(row.typical_seat_allocation_percent) = '' THEN null ELSE trim(row.typical_seat_allocation_percent) END) END,
    n.evidence_required = CASE WHEN row.evidence_required IS NULL OR trim(row.evidence_required) = '' THEN null ELSE trim(row.evidence_required) END,
    n.competitive_process = CASE WHEN row.competitive_process IS NULL OR trim(row.competitive_process) = '' THEN null ELSE trim(row.competitive_process) END,
    n.typical_streams_that_offer = CASE WHEN row.typical_streams_that_offer IS NULL OR trim(row.typical_streams_that_offer) = '' THEN null ELSE trim(row.typical_streams_that_offer) END,
    n.typical_institutions_that_offer = CASE WHEN row.typical_institutions_that_offer IS NULL OR trim(row.typical_institutions_that_offer) = '' THEN null ELSE trim(row.typical_institutions_that_offer) END,
    n.typical_fees_premium_percent = CASE WHEN CASE WHEN row.typical_fees_premium_percent IS NULL OR trim(row.typical_fees_premium_percent) = '' THEN null ELSE trim(row.typical_fees_premium_percent) END IS NULL THEN null ELSE toFloat(CASE WHEN row.typical_fees_premium_percent IS NULL OR trim(row.typical_fees_premium_percent) = '' THEN null ELSE trim(row.typical_fees_premium_percent) END) END,
    n.registry_entity_id = 'ENT-ADMISSION-PATHWAY',
    n.updated_at = datetime();

// SyllabusTopic
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/syllabustopic.csv' AS row
WITH row WHERE row.topic_code IS NOT NULL AND trim(row.topic_code) <> ''
MERGE (n:SyllabusTopic {topic_code: trim(row.topic_code)})
SET
    n.topic_id = coalesce(CASE WHEN row.topic_id IS NULL OR trim(row.topic_id) = '' THEN null ELSE trim(row.topic_id) END, n.topic_id, randomUUID()),
    n.topic_code = trim(row.topic_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.parent_subject = CASE WHEN row.parent_subject IS NULL OR trim(row.parent_subject) = '' THEN null ELSE trim(row.parent_subject) END,
    n.parent_exam = CASE WHEN row.parent_exam IS NULL OR trim(row.parent_exam) = '' THEN null ELSE trim(row.parent_exam) END,
    n.weightage_in_exam_percent = CASE WHEN CASE WHEN row.weightage_in_exam_percent IS NULL OR trim(row.weightage_in_exam_percent) = '' THEN null ELSE trim(row.weightage_in_exam_percent) END IS NULL THEN null ELSE toFloat(CASE WHEN row.weightage_in_exam_percent IS NULL OR trim(row.weightage_in_exam_percent) = '' THEN null ELSE trim(row.weightage_in_exam_percent) END) END,
    n.difficulty_indicator = CASE WHEN row.difficulty_indicator IS NULL OR trim(row.difficulty_indicator) = '' THEN null ELSE trim(row.difficulty_indicator) END,
    n.prerequisite_topics = CASE WHEN row.prerequisite_topics IS NULL OR trim(row.prerequisite_topics) = '' THEN null ELSE trim(row.prerequisite_topics) END,
    n.typical_time_to_master_hours = CASE WHEN CASE WHEN row.typical_time_to_master_hours IS NULL OR trim(row.typical_time_to_master_hours) = '' THEN null ELSE trim(row.typical_time_to_master_hours) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_time_to_master_hours IS NULL OR trim(row.typical_time_to_master_hours) = '' THEN null ELSE trim(row.typical_time_to_master_hours) END) END,
    n.source_reference = CASE WHEN row.source_reference IS NULL OR trim(row.source_reference) = '' THEN null ELSE trim(row.source_reference) END,
    n.registry_entity_id = 'ENT-SYLLABUS-TOPIC',
    n.updated_at = datetime();

// SubjectEquivalenceRule
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/subjectequivalencerule.csv' AS row
WITH row WHERE row.rule_code IS NOT NULL AND trim(row.rule_code) <> ''
MERGE (n:SubjectEquivalenceRule {rule_code: trim(row.rule_code)})
SET
    n.rule_id = coalesce(CASE WHEN row.rule_id IS NULL OR trim(row.rule_id) = '' THEN null ELSE trim(row.rule_id) END, n.rule_id, randomUUID()),
    n.rule_code = trim(row.rule_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.source_subject = CASE WHEN row.source_subject IS NULL OR trim(row.source_subject) = '' THEN null ELSE trim(row.source_subject) END,
    n.source_board = CASE WHEN row.source_board IS NULL OR trim(row.source_board) = '' THEN null ELSE trim(row.source_board) END,
    n.equivalent_subject = CASE WHEN row.equivalent_subject IS NULL OR trim(row.equivalent_subject) = '' THEN null ELSE trim(row.equivalent_subject) END,
    n.target_board = CASE WHEN row.target_board IS NULL OR trim(row.target_board) = '' THEN null ELSE trim(row.target_board) END,
    n.applies_to_exams = CASE WHEN row.applies_to_exams IS NULL OR trim(row.applies_to_exams) = '' THEN null ELSE trim(row.applies_to_exams) END,
    n.conditions = CASE WHEN row.conditions IS NULL OR trim(row.conditions) = '' THEN null ELSE trim(row.conditions) END,
    n.registry_entity_id = 'ENT-SUBJECT-EQUIVALENCE-RULE',
    n.updated_at = datetime();

// InternshipType
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/internshiptype.csv' AS row
WITH row WHERE row.internship_code IS NOT NULL AND trim(row.internship_code) <> ''
MERGE (n:InternshipType {internship_code: trim(row.internship_code)})
SET
    n.internship_id = coalesce(CASE WHEN row.internship_id IS NULL OR trim(row.internship_id) = '' THEN null ELSE trim(row.internship_id) END, n.internship_id, randomUUID()),
    n.internship_code = trim(row.internship_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.classification = CASE WHEN row.classification IS NULL OR trim(row.classification) = '' THEN null ELSE trim(row.classification) END,
    n.typical_duration_months = CASE WHEN CASE WHEN row.typical_duration_months IS NULL OR trim(row.typical_duration_months) = '' THEN null ELSE trim(row.typical_duration_months) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_duration_months IS NULL OR trim(row.typical_duration_months) = '' THEN null ELSE trim(row.typical_duration_months) END) END,
    n.typical_stipend_min_inr = CASE WHEN CASE WHEN row.typical_stipend_min_inr IS NULL OR trim(row.typical_stipend_min_inr) = '' THEN null ELSE trim(row.typical_stipend_min_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_stipend_min_inr IS NULL OR trim(row.typical_stipend_min_inr) = '' THEN null ELSE trim(row.typical_stipend_min_inr) END) END,
    n.typical_stipend_max_inr = CASE WHEN CASE WHEN row.typical_stipend_max_inr IS NULL OR trim(row.typical_stipend_max_inr) = '' THEN null ELSE trim(row.typical_stipend_max_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_stipend_max_inr IS NULL OR trim(row.typical_stipend_max_inr) = '' THEN null ELSE trim(row.typical_stipend_max_inr) END) END,
    n.typical_applicable_streams = CASE WHEN row.typical_applicable_streams IS NULL OR trim(row.typical_applicable_streams) = '' THEN null ELSE trim(row.typical_applicable_streams) END,
    n.mandatory_for_streams = CASE WHEN row.mandatory_for_streams IS NULL OR trim(row.mandatory_for_streams) = '' THEN null ELSE trim(row.mandatory_for_streams) END,
    n.is_paid_typical = CASE WHEN row.is_paid_typical IS NULL OR trim(row.is_paid_typical) = '' THEN null ELSE trim(row.is_paid_typical) END,
    n.typical_hosting_organisations = CASE WHEN row.typical_hosting_organisations IS NULL OR trim(row.typical_hosting_organisations) = '' THEN null ELSE trim(row.typical_hosting_organisations) END,
    n.evidence_produced = CASE WHEN row.evidence_produced IS NULL OR trim(row.evidence_produced) = '' THEN null ELSE trim(row.evidence_produced) END,
    n.internship_verification_status = CASE WHEN row.internship_verification_status IS NULL OR trim(row.internship_verification_status) = '' THEN null ELSE trim(row.internship_verification_status) END,
    n.registry_entity_id = 'ENT-INTERNSHIP-TYPE',
    n.updated_at = datetime();

// CareerOutcome
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/careeroutcome.csv' AS row
WITH row WHERE row.outcome_code IS NOT NULL AND trim(row.outcome_code) <> ''
MERGE (n:CareerOutcome {outcome_code: trim(row.outcome_code)})
SET
    n.outcome_id = coalesce(CASE WHEN row.outcome_id IS NULL OR trim(row.outcome_id) = '' THEN null ELSE trim(row.outcome_id) END, n.outcome_id, randomUUID()),
    n.outcome_code = trim(row.outcome_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.also_known_as = CASE WHEN row.also_known_as IS NULL OR trim(row.also_known_as) = '' THEN null ELSE trim(row.also_known_as) END,
    n.parent_stream = CASE WHEN row.parent_stream IS NULL OR trim(row.parent_stream) = '' THEN null ELSE trim(row.parent_stream) END,
    n.related_streams = CASE WHEN row.related_streams IS NULL OR trim(row.related_streams) = '' THEN null ELSE trim(row.related_streams) END,
    n.employment_types_available = CASE WHEN row.employment_types_available IS NULL OR trim(row.employment_types_available) = '' THEN null ELSE trim(row.employment_types_available) END,
    n.typical_earning_start_age = CASE WHEN CASE WHEN row.typical_earning_start_age IS NULL OR trim(row.typical_earning_start_age) = '' THEN null ELSE trim(row.typical_earning_start_age) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_earning_start_age IS NULL OR trim(row.typical_earning_start_age) = '' THEN null ELSE trim(row.typical_earning_start_age) END) END,
    n.typical_medium_of_work = CASE WHEN row.typical_medium_of_work IS NULL OR trim(row.typical_medium_of_work) = '' THEN null ELSE trim(row.typical_medium_of_work) END,
    n.work_environment = CASE WHEN row.work_environment IS NULL OR trim(row.work_environment) = '' THEN null ELSE trim(row.work_environment) END,
    n.typical_industries = CASE WHEN row.typical_industries IS NULL OR trim(row.typical_industries) = '' THEN null ELSE trim(row.typical_industries) END,
    n.typical_hiring_organisations = CASE WHEN row.typical_hiring_organisations IS NULL OR trim(row.typical_hiring_organisations) = '' THEN null ELSE trim(row.typical_hiring_organisations) END,
    n.top_hiring_cities = CASE WHEN row.top_hiring_cities IS NULL OR trim(row.top_hiring_cities) = '' THEN null ELSE trim(row.top_hiring_cities) END,
    n.typical_probation_period_months = CASE WHEN CASE WHEN row.typical_probation_period_months IS NULL OR trim(row.typical_probation_period_months) = '' THEN null ELSE trim(row.typical_probation_period_months) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_probation_period_months IS NULL OR trim(row.typical_probation_period_months) = '' THEN null ELSE trim(row.typical_probation_period_months) END) END,
    n.remote_work_feasibility = CASE WHEN row.remote_work_feasibility IS NULL OR trim(row.remote_work_feasibility) = '' THEN null ELSE trim(row.remote_work_feasibility) END,
    n.work_intensity = CASE WHEN row.work_intensity IS NULL OR trim(row.work_intensity) = '' THEN null ELSE trim(row.work_intensity) END,
    n.on_call_expectations = CASE WHEN row.on_call_expectations IS NULL OR trim(row.on_call_expectations) = '' THEN null ELSE trim(row.on_call_expectations) END,
    n.travel_expectations = CASE WHEN row.travel_expectations IS NULL OR trim(row.travel_expectations) = '' THEN null ELSE trim(row.travel_expectations) END,
    n.required_certifications = CASE WHEN row.required_certifications IS NULL OR trim(row.required_certifications) = '' THEN null ELSE trim(row.required_certifications) END,
    n.required_licences = CASE WHEN row.required_licences IS NULL OR trim(row.required_licences) = '' THEN null ELSE trim(row.required_licences) END,
    n.required_skills = CASE WHEN row.required_skills IS NULL OR trim(row.required_skills) = '' THEN null ELSE trim(row.required_skills) END,
    n.required_aptitudes = CASE WHEN row.required_aptitudes IS NULL OR trim(row.required_aptitudes) = '' THEN null ELSE trim(row.required_aptitudes) END,
    n.favoured_traits = CASE WHEN row.favoured_traits IS NULL OR trim(row.favoured_traits) = '' THEN null ELSE trim(row.favoured_traits) END,
    n.aligned_interests = CASE WHEN row.aligned_interests IS NULL OR trim(row.aligned_interests) = '' THEN null ELSE trim(row.aligned_interests) END,
    n.influenced_by_preferences = CASE WHEN row.influenced_by_preferences IS NULL OR trim(row.influenced_by_preferences) = '' THEN null ELSE trim(row.influenced_by_preferences) END,
    n.disability_inclusions_vision = CASE WHEN row.disability_inclusions_vision IS NULL OR trim(row.disability_inclusions_vision) = '' THEN null ELSE trim(row.disability_inclusions_vision) END,
    n.disability_inclusions_hearing = CASE WHEN row.disability_inclusions_hearing IS NULL OR trim(row.disability_inclusions_hearing) = '' THEN null ELSE trim(row.disability_inclusions_hearing) END,
    n.disability_inclusions_mobility = CASE WHEN row.disability_inclusions_mobility IS NULL OR trim(row.disability_inclusions_mobility) = '' THEN null ELSE trim(row.disability_inclusions_mobility) END,
    n.disability_inclusions_cognitive = CASE WHEN row.disability_inclusions_cognitive IS NULL OR trim(row.disability_inclusions_cognitive) = '' THEN null ELSE trim(row.disability_inclusions_cognitive) END,
    n.disability_inclusions_chronic_conditions = CASE WHEN row.disability_inclusions_chronic_conditions IS NULL OR trim(row.disability_inclusions_chronic_conditions) = '' THEN null ELSE trim(row.disability_inclusions_chronic_conditions) END,
    n.medical_exclusions = CASE WHEN row.medical_exclusions IS NULL OR trim(row.medical_exclusions) = '' THEN null ELSE trim(row.medical_exclusions) END,
    n.medical_fitness_standard = CASE WHEN row.medical_fitness_standard IS NULL OR trim(row.medical_fitness_standard) = '' THEN null ELSE trim(row.medical_fitness_standard) END,
    n.vision_correction_note = CASE WHEN row.vision_correction_note IS NULL OR trim(row.vision_correction_note) = '' THEN null ELSE trim(row.vision_correction_note) END,
    n.commission_types_available = CASE WHEN row.commission_types_available IS NULL OR trim(row.commission_types_available) = '' THEN null ELSE trim(row.commission_types_available) END,
    n.career_progression_metric = CASE WHEN row.career_progression_metric IS NULL OR trim(row.career_progression_metric) = '' THEN null ELSE trim(row.career_progression_metric) END,
    n.career_ceiling_indicator = CASE WHEN row.career_ceiling_indicator IS NULL OR trim(row.career_ceiling_indicator) = '' THEN null ELSE trim(row.career_ceiling_indicator) END,
    n.family_status_restrictions_marriage_during_training = CASE WHEN CASE WHEN row.family_status_restrictions_marriage_during_training IS NULL OR trim(row.family_status_restrictions_marriage_during_training) = '' THEN null ELSE trim(row.family_status_restrictions_marriage_during_training) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.family_status_restrictions_marriage_during_training IS NULL OR trim(row.family_status_restrictions_marriage_during_training) = '' THEN null ELSE trim(row.family_status_restrictions_marriage_during_training) END) END,
    n.family_status_restrictions_family_size_restrictions = CASE WHEN row.family_status_restrictions_family_size_restrictions IS NULL OR trim(row.family_status_restrictions_family_size_restrictions) = '' THEN null ELSE trim(row.family_status_restrictions_family_size_restrictions) END,
    n.family_status_restrictions_spouse_profession_restrictions = CASE WHEN row.family_status_restrictions_spouse_profession_restrictions IS NULL OR trim(row.family_status_restrictions_spouse_profession_restrictions) = '' THEN null ELSE trim(row.family_status_restrictions_spouse_profession_restrictions) END,
    n.typical_promotion_path = CASE WHEN row.typical_promotion_path IS NULL OR trim(row.typical_promotion_path) = '' THEN null ELSE trim(row.typical_promotion_path) END,
    n.international_relocation_feasibility = CASE WHEN row.international_relocation_feasibility IS NULL OR trim(row.international_relocation_feasibility) = '' THEN null ELSE trim(row.international_relocation_feasibility) END,
    n.typical_years_to_seniority = CASE WHEN CASE WHEN row.typical_years_to_seniority IS NULL OR trim(row.typical_years_to_seniority) = '' THEN null ELSE trim(row.typical_years_to_seniority) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_years_to_seniority IS NULL OR trim(row.typical_years_to_seniority) = '' THEN null ELSE trim(row.typical_years_to_seniority) END) END,
    n.typical_hours_per_week_typical = CASE WHEN CASE WHEN row.typical_hours_per_week_typical IS NULL OR trim(row.typical_hours_per_week_typical) = '' THEN null ELSE trim(row.typical_hours_per_week_typical) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_hours_per_week_typical IS NULL OR trim(row.typical_hours_per_week_typical) = '' THEN null ELSE trim(row.typical_hours_per_week_typical) END) END,
    n.typical_hours_per_week_min = CASE WHEN CASE WHEN row.typical_hours_per_week_min IS NULL OR trim(row.typical_hours_per_week_min) = '' THEN null ELSE trim(row.typical_hours_per_week_min) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_hours_per_week_min IS NULL OR trim(row.typical_hours_per_week_min) = '' THEN null ELSE trim(row.typical_hours_per_week_min) END) END,
    n.typical_hours_per_week_max = CASE WHEN CASE WHEN row.typical_hours_per_week_max IS NULL OR trim(row.typical_hours_per_week_max) = '' THEN null ELSE trim(row.typical_hours_per_week_max) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_hours_per_week_max IS NULL OR trim(row.typical_hours_per_week_max) = '' THEN null ELSE trim(row.typical_hours_per_week_max) END) END,
    n.typical_holiday_norm_days = CASE WHEN CASE WHEN row.typical_holiday_norm_days IS NULL OR trim(row.typical_holiday_norm_days) = '' THEN null ELSE trim(row.typical_holiday_norm_days) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_holiday_norm_days IS NULL OR trim(row.typical_holiday_norm_days) = '' THEN null ELSE trim(row.typical_holiday_norm_days) END) END,
    n.follow_on_entrance_exams = CASE WHEN row.follow_on_entrance_exams IS NULL OR trim(row.follow_on_entrance_exams) = '' THEN null ELSE trim(row.follow_on_entrance_exams) END,
    n.related_career_outcomes = CASE WHEN row.related_career_outcomes IS NULL OR trim(row.related_career_outcomes) = '' THEN null ELSE trim(row.related_career_outcomes) END,
    n.future_disruption_risk = CASE WHEN row.future_disruption_risk IS NULL OR trim(row.future_disruption_risk) = '' THEN null ELSE trim(row.future_disruption_risk) END,
    n.ideal_persona = CASE WHEN row.ideal_persona IS NULL OR trim(row.ideal_persona) = '' THEN null ELSE trim(row.ideal_persona) END,
    n.typical_dropout_rate_percent = CASE WHEN CASE WHEN row.typical_dropout_rate_percent IS NULL OR trim(row.typical_dropout_rate_percent) = '' THEN null ELSE trim(row.typical_dropout_rate_percent) END IS NULL THEN null ELSE toFloat(CASE WHEN row.typical_dropout_rate_percent IS NULL OR trim(row.typical_dropout_rate_percent) = '' THEN null ELSE trim(row.typical_dropout_rate_percent) END) END,
    n.typical_regret_data = CASE WHEN row.typical_regret_data IS NULL OR trim(row.typical_regret_data) = '' THEN null ELSE trim(row.typical_regret_data) END,
    n.typical_burnout_rate_percent = CASE WHEN CASE WHEN row.typical_burnout_rate_percent IS NULL OR trim(row.typical_burnout_rate_percent) = '' THEN null ELSE trim(row.typical_burnout_rate_percent) END IS NULL THEN null ELSE toFloat(CASE WHEN row.typical_burnout_rate_percent IS NULL OR trim(row.typical_burnout_rate_percent) = '' THEN null ELSE trim(row.typical_burnout_rate_percent) END) END,
    n.active_status = CASE WHEN CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END) END,
    n.universe = CASE WHEN row.universe IS NULL OR trim(row.universe) = '' THEN null ELSE trim(row.universe) END,
    n.professional_bodies_associated = CASE WHEN row.professional_bodies_associated IS NULL OR trim(row.professional_bodies_associated) = '' THEN null ELSE trim(row.professional_bodies_associated) END,
    n.continuing_education_typical_hours_per_year = CASE WHEN CASE WHEN row.continuing_education_typical_hours_per_year IS NULL OR trim(row.continuing_education_typical_hours_per_year) = '' THEN null ELSE trim(row.continuing_education_typical_hours_per_year) END IS NULL THEN null ELSE toInteger(CASE WHEN row.continuing_education_typical_hours_per_year IS NULL OR trim(row.continuing_education_typical_hours_per_year) = '' THEN null ELSE trim(row.continuing_education_typical_hours_per_year) END) END,
    n.typical_certifications_over_career = CASE WHEN row.typical_certifications_over_career IS NULL OR trim(row.typical_certifications_over_career) = '' THEN null ELSE trim(row.typical_certifications_over_career) END,
    n.earnings_variability_indicator = CASE WHEN row.earnings_variability_indicator IS NULL OR trim(row.earnings_variability_indicator) = '' THEN null ELSE trim(row.earnings_variability_indicator) END,
    n.typical_ownership_of_output = CASE WHEN row.typical_ownership_of_output IS NULL OR trim(row.typical_ownership_of_output) = '' THEN null ELSE trim(row.typical_ownership_of_output) END,
    n.registry_entity_id = 'ENT-CAREER-OUTCOME',
    n.updated_at = datetime();

// SalaryRange
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/salaryrange.csv' AS row
WITH row WHERE row.salary_code IS NOT NULL AND trim(row.salary_code) <> ''
MERGE (n:SalaryRange {salary_code: trim(row.salary_code)})
SET
    n.salary_id = coalesce(CASE WHEN row.salary_id IS NULL OR trim(row.salary_id) = '' THEN null ELSE trim(row.salary_id) END, n.salary_id, randomUUID()),
    n.salary_code = trim(row.salary_code),
    n.career_outcome = CASE WHEN row.career_outcome IS NULL OR trim(row.career_outcome) = '' THEN null ELSE trim(row.career_outcome) END,
    n.experience_bucket = CASE WHEN row.experience_bucket IS NULL OR trim(row.experience_bucket) = '' THEN null ELSE trim(row.experience_bucket) END,
    n.min_lpa = CASE WHEN CASE WHEN row.min_lpa IS NULL OR trim(row.min_lpa) = '' THEN null ELSE trim(row.min_lpa) END IS NULL THEN null ELSE toFloat(CASE WHEN row.min_lpa IS NULL OR trim(row.min_lpa) = '' THEN null ELSE trim(row.min_lpa) END) END,
    n.mid_lpa = CASE WHEN CASE WHEN row.mid_lpa IS NULL OR trim(row.mid_lpa) = '' THEN null ELSE trim(row.mid_lpa) END IS NULL THEN null ELSE toFloat(CASE WHEN row.mid_lpa IS NULL OR trim(row.mid_lpa) = '' THEN null ELSE trim(row.mid_lpa) END) END,
    n.max_lpa = CASE WHEN CASE WHEN row.max_lpa IS NULL OR trim(row.max_lpa) = '' THEN null ELSE trim(row.max_lpa) END IS NULL THEN null ELSE toFloat(CASE WHEN row.max_lpa IS NULL OR trim(row.max_lpa) = '' THEN null ELSE trim(row.max_lpa) END) END,
    n.data_source = CASE WHEN row.data_source IS NULL OR trim(row.data_source) = '' THEN null ELSE trim(row.data_source) END,
    n.data_year = CASE WHEN CASE WHEN row.data_year IS NULL OR trim(row.data_year) = '' THEN null ELSE trim(row.data_year) END IS NULL THEN null ELSE toInteger(CASE WHEN row.data_year IS NULL OR trim(row.data_year) = '' THEN null ELSE trim(row.data_year) END) END,
    n.notes_on_variation = CASE WHEN row.notes_on_variation IS NULL OR trim(row.notes_on_variation) = '' THEN null ELSE trim(row.notes_on_variation) END,
    n.applicable_cities = CASE WHEN row.applicable_cities IS NULL OR trim(row.applicable_cities) = '' THEN null ELSE trim(row.applicable_cities) END,
    n.registry_entity_id = 'ENT-SALARY-RANGE',
    n.updated_at = datetime();

// City
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/city.csv' AS row
WITH row WHERE row.city_code IS NOT NULL AND trim(row.city_code) <> ''
MERGE (n:City {city_code: trim(row.city_code)})
SET
    n.city_id = coalesce(CASE WHEN row.city_id IS NULL OR trim(row.city_id) = '' THEN null ELSE trim(row.city_id) END, n.city_id, randomUUID()),
    n.city_code = trim(row.city_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.state = CASE WHEN row.state IS NULL OR trim(row.state) = '' THEN null ELSE trim(row.state) END,
    n.country = CASE WHEN row.country IS NULL OR trim(row.country) = '' THEN null ELSE trim(row.country) END,
    n.tier = CASE WHEN row.tier IS NULL OR trim(row.tier) = '' THEN null ELSE trim(row.tier) END,
    n.population_millions = CASE WHEN CASE WHEN row.population_millions IS NULL OR trim(row.population_millions) = '' THEN null ELSE trim(row.population_millions) END IS NULL THEN null ELSE toFloat(CASE WHEN row.population_millions IS NULL OR trim(row.population_millions) = '' THEN null ELSE trim(row.population_millions) END) END,
    n.major_hiring_sectors = CASE WHEN row.major_hiring_sectors IS NULL OR trim(row.major_hiring_sectors) = '' THEN null ELSE trim(row.major_hiring_sectors) END,
    n.typical_hiring_companies = CASE WHEN row.typical_hiring_companies IS NULL OR trim(row.typical_hiring_companies) = '' THEN null ELSE trim(row.typical_hiring_companies) END,
    n.annual_cost_of_living_min_inr = CASE WHEN CASE WHEN row.annual_cost_of_living_min_inr IS NULL OR trim(row.annual_cost_of_living_min_inr) = '' THEN null ELSE trim(row.annual_cost_of_living_min_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.annual_cost_of_living_min_inr IS NULL OR trim(row.annual_cost_of_living_min_inr) = '' THEN null ELSE trim(row.annual_cost_of_living_min_inr) END) END,
    n.annual_cost_of_living_mid_inr = CASE WHEN CASE WHEN row.annual_cost_of_living_mid_inr IS NULL OR trim(row.annual_cost_of_living_mid_inr) = '' THEN null ELSE trim(row.annual_cost_of_living_mid_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.annual_cost_of_living_mid_inr IS NULL OR trim(row.annual_cost_of_living_mid_inr) = '' THEN null ELSE trim(row.annual_cost_of_living_mid_inr) END) END,
    n.annual_cost_of_living_max_inr = CASE WHEN CASE WHEN row.annual_cost_of_living_max_inr IS NULL OR trim(row.annual_cost_of_living_max_inr) = '' THEN null ELSE trim(row.annual_cost_of_living_max_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.annual_cost_of_living_max_inr IS NULL OR trim(row.annual_cost_of_living_max_inr) = '' THEN null ELSE trim(row.annual_cost_of_living_max_inr) END) END,
    n.typical_rent_studio_inr = CASE WHEN CASE WHEN row.typical_rent_studio_inr IS NULL OR trim(row.typical_rent_studio_inr) = '' THEN null ELSE trim(row.typical_rent_studio_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_rent_studio_inr IS NULL OR trim(row.typical_rent_studio_inr) = '' THEN null ELSE trim(row.typical_rent_studio_inr) END) END,
    n.typical_rent_1bhk_inr = CASE WHEN CASE WHEN row.typical_rent_1bhk_inr IS NULL OR trim(row.typical_rent_1bhk_inr) = '' THEN null ELSE trim(row.typical_rent_1bhk_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_rent_1bhk_inr IS NULL OR trim(row.typical_rent_1bhk_inr) = '' THEN null ELSE trim(row.typical_rent_1bhk_inr) END) END,
    n.typical_rent_2bhk_inr = CASE WHEN CASE WHEN row.typical_rent_2bhk_inr IS NULL OR trim(row.typical_rent_2bhk_inr) = '' THEN null ELSE trim(row.typical_rent_2bhk_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_rent_2bhk_inr IS NULL OR trim(row.typical_rent_2bhk_inr) = '' THEN null ELSE trim(row.typical_rent_2bhk_inr) END) END,
    n.education_hubs = CASE WHEN row.education_hubs IS NULL OR trim(row.education_hubs) = '' THEN null ELSE trim(row.education_hubs) END,
    n.major_institutions = CASE WHEN row.major_institutions IS NULL OR trim(row.major_institutions) = '' THEN null ELSE trim(row.major_institutions) END,
    n.typical_public_transport_availability = CASE WHEN row.typical_public_transport_availability IS NULL OR trim(row.typical_public_transport_availability) = '' THEN null ELSE trim(row.typical_public_transport_availability) END,
    n.international_airport = CASE WHEN CASE WHEN row.international_airport IS NULL OR trim(row.international_airport) = '' THEN null ELSE trim(row.international_airport) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.international_airport IS NULL OR trim(row.international_airport) = '' THEN null ELSE trim(row.international_airport) END) END,
    n.typical_climate_type = CASE WHEN row.typical_climate_type IS NULL OR trim(row.typical_climate_type) = '' THEN null ELSE trim(row.typical_climate_type) END,
    n.language_of_daily_use = CASE WHEN row.language_of_daily_use IS NULL OR trim(row.language_of_daily_use) = '' THEN null ELSE trim(row.language_of_daily_use) END,
    n.typical_safety_indicator = CASE WHEN row.typical_safety_indicator IS NULL OR trim(row.typical_safety_indicator) = '' THEN null ELSE trim(row.typical_safety_indicator) END,
    n.pwd_infrastructure_rating = CASE WHEN row.pwd_infrastructure_rating IS NULL OR trim(row.pwd_infrastructure_rating) = '' THEN null ELSE trim(row.pwd_infrastructure_rating) END,
    n.language_transition_support = CASE WHEN row.language_transition_support IS NULL OR trim(row.language_transition_support) = '' THEN null ELSE trim(row.language_transition_support) END,
    n.study_hub_rating = CASE WHEN row.study_hub_rating IS NULL OR trim(row.study_hub_rating) = '' THEN null ELSE trim(row.study_hub_rating) END,
    n.metro_or_metropolitan = CASE WHEN CASE WHEN row.metro_or_metropolitan IS NULL OR trim(row.metro_or_metropolitan) = '' THEN null ELSE trim(row.metro_or_metropolitan) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.metro_or_metropolitan IS NULL OR trim(row.metro_or_metropolitan) = '' THEN null ELSE trim(row.metro_or_metropolitan) END) END,
    n.active_status = CASE WHEN CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END) END,
    n.registry_entity_id = 'ENT-CITY',
    n.updated_at = datetime();

// Licence
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/licence.csv' AS row
WITH row WHERE row.licence_code IS NOT NULL AND trim(row.licence_code) <> ''
MERGE (n:Licence {licence_code: trim(row.licence_code)})
SET
    n.licence_id = coalesce(CASE WHEN row.licence_id IS NULL OR trim(row.licence_id) = '' THEN null ELSE trim(row.licence_id) END, n.licence_id, randomUUID()),
    n.licence_code = trim(row.licence_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.short_name = CASE WHEN row.short_name IS NULL OR trim(row.short_name) = '' THEN null ELSE trim(row.short_name) END,
    n.issuing_body = CASE WHEN row.issuing_body IS NULL OR trim(row.issuing_body) = '' THEN null ELSE trim(row.issuing_body) END,
    n.licensing_authority_scope = CASE WHEN row.licensing_authority_scope IS NULL OR trim(row.licensing_authority_scope) = '' THEN null ELSE trim(row.licensing_authority_scope) END,
    n.issuance_prerequisites_education = CASE WHEN row.issuance_prerequisites_education IS NULL OR trim(row.issuance_prerequisites_education) = '' THEN null ELSE trim(row.issuance_prerequisites_education) END,
    n.issuance_prerequisites_training_hours = CASE WHEN CASE WHEN row.issuance_prerequisites_training_hours IS NULL OR trim(row.issuance_prerequisites_training_hours) = '' THEN null ELSE trim(row.issuance_prerequisites_training_hours) END IS NULL THEN null ELSE toInteger(CASE WHEN row.issuance_prerequisites_training_hours IS NULL OR trim(row.issuance_prerequisites_training_hours) = '' THEN null ELSE trim(row.issuance_prerequisites_training_hours) END) END,
    n.issuance_prerequisites_tests_passed = CASE WHEN row.issuance_prerequisites_tests_passed IS NULL OR trim(row.issuance_prerequisites_tests_passed) = '' THEN null ELSE trim(row.issuance_prerequisites_tests_passed) END,
    n.issuance_prerequisites_medical = CASE WHEN row.issuance_prerequisites_medical IS NULL OR trim(row.issuance_prerequisites_medical) = '' THEN null ELSE trim(row.issuance_prerequisites_medical) END,
    n.issuance_prerequisites_background_check = CASE WHEN CASE WHEN row.issuance_prerequisites_background_check IS NULL OR trim(row.issuance_prerequisites_background_check) = '' THEN null ELSE trim(row.issuance_prerequisites_background_check) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.issuance_prerequisites_background_check IS NULL OR trim(row.issuance_prerequisites_background_check) = '' THEN null ELSE trim(row.issuance_prerequisites_background_check) END) END,
    n.medical_certification_required = CASE WHEN CASE WHEN row.medical_certification_required IS NULL OR trim(row.medical_certification_required) = '' THEN null ELSE trim(row.medical_certification_required) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.medical_certification_required IS NULL OR trim(row.medical_certification_required) = '' THEN null ELSE trim(row.medical_certification_required) END) END,
    n.validity_period_years = CASE WHEN CASE WHEN row.validity_period_years IS NULL OR trim(row.validity_period_years) = '' THEN null ELSE trim(row.validity_period_years) END IS NULL THEN null ELSE toFloat(CASE WHEN row.validity_period_years IS NULL OR trim(row.validity_period_years) = '' THEN null ELSE trim(row.validity_period_years) END) END,
    n.renewable = CASE WHEN CASE WHEN row.renewable IS NULL OR trim(row.renewable) = '' THEN null ELSE trim(row.renewable) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.renewable IS NULL OR trim(row.renewable) = '' THEN null ELSE trim(row.renewable) END) END,
    n.renewal_frequency = CASE WHEN row.renewal_frequency IS NULL OR trim(row.renewal_frequency) = '' THEN null ELSE trim(row.renewal_frequency) END,
    n.renewal_requirements_continuing_education_hours = CASE WHEN CASE WHEN row.renewal_requirements_continuing_education_hours IS NULL OR trim(row.renewal_requirements_continuing_education_hours) = '' THEN null ELSE trim(row.renewal_requirements_continuing_education_hours) END IS NULL THEN null ELSE toInteger(CASE WHEN row.renewal_requirements_continuing_education_hours IS NULL OR trim(row.renewal_requirements_continuing_education_hours) = '' THEN null ELSE trim(row.renewal_requirements_continuing_education_hours) END) END,
    n.renewal_requirements_medical_recheck = CASE WHEN CASE WHEN row.renewal_requirements_medical_recheck IS NULL OR trim(row.renewal_requirements_medical_recheck) = '' THEN null ELSE trim(row.renewal_requirements_medical_recheck) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.renewal_requirements_medical_recheck IS NULL OR trim(row.renewal_requirements_medical_recheck) = '' THEN null ELSE trim(row.renewal_requirements_medical_recheck) END) END,
    n.renewal_requirements_fees_inr = CASE WHEN CASE WHEN row.renewal_requirements_fees_inr IS NULL OR trim(row.renewal_requirements_fees_inr) = '' THEN null ELSE trim(row.renewal_requirements_fees_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.renewal_requirements_fees_inr IS NULL OR trim(row.renewal_requirements_fees_inr) = '' THEN null ELSE trim(row.renewal_requirements_fees_inr) END) END,
    n.typical_issuance_fee_inr = CASE WHEN CASE WHEN row.typical_issuance_fee_inr IS NULL OR trim(row.typical_issuance_fee_inr) = '' THEN null ELSE trim(row.typical_issuance_fee_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_issuance_fee_inr IS NULL OR trim(row.typical_issuance_fee_inr) = '' THEN null ELSE trim(row.typical_issuance_fee_inr) END) END,
    n.revocation_grounds = CASE WHEN row.revocation_grounds IS NULL OR trim(row.revocation_grounds) = '' THEN null ELSE trim(row.revocation_grounds) END,
    n.prerequisite_training_hours = CASE WHEN CASE WHEN row.prerequisite_training_hours IS NULL OR trim(row.prerequisite_training_hours) = '' THEN null ELSE trim(row.prerequisite_training_hours) END IS NULL THEN null ELSE toInteger(CASE WHEN row.prerequisite_training_hours IS NULL OR trim(row.prerequisite_training_hours) = '' THEN null ELSE trim(row.prerequisite_training_hours) END) END,
    n.cross_jurisdictional_equivalence = CASE WHEN row.cross_jurisdictional_equivalence IS NULL OR trim(row.cross_jurisdictional_equivalence) = '' THEN null ELSE trim(row.cross_jurisdictional_equivalence) END,
    n.grades_or_types_available = CASE WHEN row.grades_or_types_available IS NULL OR trim(row.grades_or_types_available) = '' THEN null ELSE trim(row.grades_or_types_available) END,
    n.typical_holders_career_outcomes = CASE WHEN row.typical_holders_career_outcomes IS NULL OR trim(row.typical_holders_career_outcomes) = '' THEN null ELSE trim(row.typical_holders_career_outcomes) END,
    n.typical_issuance_success_rate_percent = CASE WHEN CASE WHEN row.typical_issuance_success_rate_percent IS NULL OR trim(row.typical_issuance_success_rate_percent) = '' THEN null ELSE trim(row.typical_issuance_success_rate_percent) END IS NULL THEN null ELSE toFloat(CASE WHEN row.typical_issuance_success_rate_percent IS NULL OR trim(row.typical_issuance_success_rate_percent) = '' THEN null ELSE trim(row.typical_issuance_success_rate_percent) END) END,
    n.active_status = CASE WHEN CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END) END,
    n.registry_entity_id = 'ENT-LICENCE',
    n.updated_at = datetime();

// Scholarship
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/scholarship.csv' AS row
WITH row WHERE row.scholarship_code IS NOT NULL AND trim(row.scholarship_code) <> ''
MERGE (n:Scholarship {scholarship_code: trim(row.scholarship_code)})
SET
    n.scholarship_id = coalesce(CASE WHEN row.scholarship_id IS NULL OR trim(row.scholarship_id) = '' THEN null ELSE trim(row.scholarship_id) END, n.scholarship_id, randomUUID()),
    n.scholarship_code = trim(row.scholarship_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.award_type = CASE WHEN row.award_type IS NULL OR trim(row.award_type) = '' THEN null ELSE trim(row.award_type) END,
    n.issuing_organisation = CASE WHEN row.issuing_organisation IS NULL OR trim(row.issuing_organisation) = '' THEN null ELSE trim(row.issuing_organisation) END,
    n.issuing_body_type = CASE WHEN row.issuing_body_type IS NULL OR trim(row.issuing_body_type) = '' THEN null ELSE trim(row.issuing_body_type) END,
    n.annual_amount_min_inr = CASE WHEN CASE WHEN row.annual_amount_min_inr IS NULL OR trim(row.annual_amount_min_inr) = '' THEN null ELSE trim(row.annual_amount_min_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.annual_amount_min_inr IS NULL OR trim(row.annual_amount_min_inr) = '' THEN null ELSE trim(row.annual_amount_min_inr) END) END,
    n.annual_amount_mid_inr = CASE WHEN CASE WHEN row.annual_amount_mid_inr IS NULL OR trim(row.annual_amount_mid_inr) = '' THEN null ELSE trim(row.annual_amount_mid_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.annual_amount_mid_inr IS NULL OR trim(row.annual_amount_mid_inr) = '' THEN null ELSE trim(row.annual_amount_mid_inr) END) END,
    n.annual_amount_max_inr = CASE WHEN CASE WHEN row.annual_amount_max_inr IS NULL OR trim(row.annual_amount_max_inr) = '' THEN null ELSE trim(row.annual_amount_max_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.annual_amount_max_inr IS NULL OR trim(row.annual_amount_max_inr) = '' THEN null ELSE trim(row.annual_amount_max_inr) END) END,
    n.tenure_years = CASE WHEN CASE WHEN row.tenure_years IS NULL OR trim(row.tenure_years) = '' THEN null ELSE trim(row.tenure_years) END IS NULL THEN null ELSE toFloat(CASE WHEN row.tenure_years IS NULL OR trim(row.tenure_years) = '' THEN null ELSE trim(row.tenure_years) END) END,
    n.eligibility_categories = CASE WHEN row.eligibility_categories IS NULL OR trim(row.eligibility_categories) = '' THEN null ELSE trim(row.eligibility_categories) END,
    n.eligibility_income_ceiling_inr = CASE WHEN CASE WHEN row.eligibility_income_ceiling_inr IS NULL OR trim(row.eligibility_income_ceiling_inr) = '' THEN null ELSE trim(row.eligibility_income_ceiling_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.eligibility_income_ceiling_inr IS NULL OR trim(row.eligibility_income_ceiling_inr) = '' THEN null ELSE trim(row.eligibility_income_ceiling_inr) END) END,
    n.eligibility_academic_criteria_min_class_10_percent = CASE WHEN CASE WHEN row.eligibility_academic_criteria_min_class_10_percent IS NULL OR trim(row.eligibility_academic_criteria_min_class_10_percent) = '' THEN null ELSE trim(row.eligibility_academic_criteria_min_class_10_percent) END IS NULL THEN null ELSE toFloat(CASE WHEN row.eligibility_academic_criteria_min_class_10_percent IS NULL OR trim(row.eligibility_academic_criteria_min_class_10_percent) = '' THEN null ELSE trim(row.eligibility_academic_criteria_min_class_10_percent) END) END,
    n.eligibility_academic_criteria_min_class_12_percent = CASE WHEN CASE WHEN row.eligibility_academic_criteria_min_class_12_percent IS NULL OR trim(row.eligibility_academic_criteria_min_class_12_percent) = '' THEN null ELSE trim(row.eligibility_academic_criteria_min_class_12_percent) END IS NULL THEN null ELSE toFloat(CASE WHEN row.eligibility_academic_criteria_min_class_12_percent IS NULL OR trim(row.eligibility_academic_criteria_min_class_12_percent) = '' THEN null ELSE trim(row.eligibility_academic_criteria_min_class_12_percent) END) END,
    n.eligibility_academic_criteria_min_ug_percent = CASE WHEN CASE WHEN row.eligibility_academic_criteria_min_ug_percent IS NULL OR trim(row.eligibility_academic_criteria_min_ug_percent) = '' THEN null ELSE trim(row.eligibility_academic_criteria_min_ug_percent) END IS NULL THEN null ELSE toFloat(CASE WHEN row.eligibility_academic_criteria_min_ug_percent IS NULL OR trim(row.eligibility_academic_criteria_min_ug_percent) = '' THEN null ELSE trim(row.eligibility_academic_criteria_min_ug_percent) END) END,
    n.eligibility_domicile_state = CASE WHEN row.eligibility_domicile_state IS NULL OR trim(row.eligibility_domicile_state) = '' THEN null ELSE trim(row.eligibility_domicile_state) END,
    n.eligibility_domicile_district = CASE WHEN row.eligibility_domicile_district IS NULL OR trim(row.eligibility_domicile_district) = '' THEN null ELSE trim(row.eligibility_domicile_district) END,
    n.special_circumstance_eligibility = CASE WHEN row.special_circumstance_eligibility IS NULL OR trim(row.special_circumstance_eligibility) = '' THEN null ELSE trim(row.special_circumstance_eligibility) END,
    n.applicable_streams = CASE WHEN row.applicable_streams IS NULL OR trim(row.applicable_streams) = '' THEN null ELSE trim(row.applicable_streams) END,
    n.applicable_institutions = CASE WHEN row.applicable_institutions IS NULL OR trim(row.applicable_institutions) = '' THEN null ELSE trim(row.applicable_institutions) END,
    n.applicable_stages = CASE WHEN row.applicable_stages IS NULL OR trim(row.applicable_stages) = '' THEN null ELSE trim(row.applicable_stages) END,
    n.number_of_awards_annual = CASE WHEN CASE WHEN row.number_of_awards_annual IS NULL OR trim(row.number_of_awards_annual) = '' THEN null ELSE trim(row.number_of_awards_annual) END IS NULL THEN null ELSE toInteger(CASE WHEN row.number_of_awards_annual IS NULL OR trim(row.number_of_awards_annual) = '' THEN null ELSE trim(row.number_of_awards_annual) END) END,
    n.application_process_summary = CASE WHEN row.application_process_summary IS NULL OR trim(row.application_process_summary) = '' THEN null ELSE trim(row.application_process_summary) END,
    n.application_deadlines = CASE WHEN row.application_deadlines IS NULL OR trim(row.application_deadlines) = '' THEN null ELSE trim(row.application_deadlines) END,
    n.required_documents = CASE WHEN row.required_documents IS NULL OR trim(row.required_documents) = '' THEN null ELSE trim(row.required_documents) END,
    n.selection_process = CASE WHEN row.selection_process IS NULL OR trim(row.selection_process) = '' THEN null ELSE trim(row.selection_process) END,
    n.stackable_with_other_scholarships = CASE WHEN CASE WHEN row.stackable_with_other_scholarships IS NULL OR trim(row.stackable_with_other_scholarships) = '' THEN null ELSE trim(row.stackable_with_other_scholarships) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.stackable_with_other_scholarships IS NULL OR trim(row.stackable_with_other_scholarships) = '' THEN null ELSE trim(row.stackable_with_other_scholarships) END) END,
    n.is_taxable = CASE WHEN CASE WHEN row.is_taxable IS NULL OR trim(row.is_taxable) = '' THEN null ELSE trim(row.is_taxable) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.is_taxable IS NULL OR trim(row.is_taxable) = '' THEN null ELSE trim(row.is_taxable) END) END,
    n.renewal_conditions = CASE WHEN row.renewal_conditions IS NULL OR trim(row.renewal_conditions) = '' THEN null ELSE trim(row.renewal_conditions) END,
    n.disbursal_frequency = CASE WHEN row.disbursal_frequency IS NULL OR trim(row.disbursal_frequency) = '' THEN null ELSE trim(row.disbursal_frequency) END,
    n.typical_success_rate_percent = CASE WHEN CASE WHEN row.typical_success_rate_percent IS NULL OR trim(row.typical_success_rate_percent) = '' THEN null ELSE trim(row.typical_success_rate_percent) END IS NULL THEN null ELSE toFloat(CASE WHEN row.typical_success_rate_percent IS NULL OR trim(row.typical_success_rate_percent) = '' THEN null ELSE trim(row.typical_success_rate_percent) END) END,
    n.official_portal_url = CASE WHEN row.official_portal_url IS NULL OR trim(row.official_portal_url) = '' THEN null ELSE trim(row.official_portal_url) END,
    n.contact_email = CASE WHEN row.contact_email IS NULL OR trim(row.contact_email) = '' THEN null ELSE trim(row.contact_email) END,
    n.last_year_awardees_count = CASE WHEN CASE WHEN row.last_year_awardees_count IS NULL OR trim(row.last_year_awardees_count) = '' THEN null ELSE trim(row.last_year_awardees_count) END IS NULL THEN null ELSE toInteger(CASE WHEN row.last_year_awardees_count IS NULL OR trim(row.last_year_awardees_count) = '' THEN null ELSE trim(row.last_year_awardees_count) END) END,
    n.funding_source = CASE WHEN row.funding_source IS NULL OR trim(row.funding_source) = '' THEN null ELSE trim(row.funding_source) END,
    n.disbursal_delay_typical_months = CASE WHEN CASE WHEN row.disbursal_delay_typical_months IS NULL OR trim(row.disbursal_delay_typical_months) = '' THEN null ELSE trim(row.disbursal_delay_typical_months) END IS NULL THEN null ELSE toInteger(CASE WHEN row.disbursal_delay_typical_months IS NULL OR trim(row.disbursal_delay_typical_months) = '' THEN null ELSE trim(row.disbursal_delay_typical_months) END) END,
    n.linked_to_specific_exams = CASE WHEN row.linked_to_specific_exams IS NULL OR trim(row.linked_to_specific_exams) = '' THEN null ELSE trim(row.linked_to_specific_exams) END,
    n.pipeline_source = CASE WHEN row.pipeline_source IS NULL OR trim(row.pipeline_source) = '' THEN null ELSE trim(row.pipeline_source) END,
    n.active_status = CASE WHEN CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END) END,
    n.registry_entity_id = 'ENT-SCHOLARSHIP',
    n.updated_at = datetime();

// EducationLoan
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/educationloan.csv' AS row
WITH row WHERE row.loan_code IS NOT NULL AND trim(row.loan_code) <> ''
MERGE (n:EducationLoan {loan_code: trim(row.loan_code)})
SET
    n.loan_id = coalesce(CASE WHEN row.loan_id IS NULL OR trim(row.loan_id) = '' THEN null ELSE trim(row.loan_id) END, n.loan_id, randomUUID()),
    n.loan_code = trim(row.loan_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.lender_type = CASE WHEN row.lender_type IS NULL OR trim(row.lender_type) = '' THEN null ELSE trim(row.lender_type) END,
    n.lender_name = CASE WHEN row.lender_name IS NULL OR trim(row.lender_name) = '' THEN null ELSE trim(row.lender_name) END,
    n.loan_amount_min_inr = CASE WHEN CASE WHEN row.loan_amount_min_inr IS NULL OR trim(row.loan_amount_min_inr) = '' THEN null ELSE trim(row.loan_amount_min_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.loan_amount_min_inr IS NULL OR trim(row.loan_amount_min_inr) = '' THEN null ELSE trim(row.loan_amount_min_inr) END) END,
    n.loan_amount_max_inr = CASE WHEN CASE WHEN row.loan_amount_max_inr IS NULL OR trim(row.loan_amount_max_inr) = '' THEN null ELSE trim(row.loan_amount_max_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.loan_amount_max_inr IS NULL OR trim(row.loan_amount_max_inr) = '' THEN null ELSE trim(row.loan_amount_max_inr) END) END,
    n.interest_rate_min_percent = CASE WHEN CASE WHEN row.interest_rate_min_percent IS NULL OR trim(row.interest_rate_min_percent) = '' THEN null ELSE trim(row.interest_rate_min_percent) END IS NULL THEN null ELSE toFloat(CASE WHEN row.interest_rate_min_percent IS NULL OR trim(row.interest_rate_min_percent) = '' THEN null ELSE trim(row.interest_rate_min_percent) END) END,
    n.interest_rate_mid_percent = CASE WHEN CASE WHEN row.interest_rate_mid_percent IS NULL OR trim(row.interest_rate_mid_percent) = '' THEN null ELSE trim(row.interest_rate_mid_percent) END IS NULL THEN null ELSE toFloat(CASE WHEN row.interest_rate_mid_percent IS NULL OR trim(row.interest_rate_mid_percent) = '' THEN null ELSE trim(row.interest_rate_mid_percent) END) END,
    n.interest_rate_max_percent = CASE WHEN CASE WHEN row.interest_rate_max_percent IS NULL OR trim(row.interest_rate_max_percent) = '' THEN null ELSE trim(row.interest_rate_max_percent) END IS NULL THEN null ELSE toFloat(CASE WHEN row.interest_rate_max_percent IS NULL OR trim(row.interest_rate_max_percent) = '' THEN null ELSE trim(row.interest_rate_max_percent) END) END,
    n.interest_rate_type = CASE WHEN row.interest_rate_type IS NULL OR trim(row.interest_rate_type) = '' THEN null ELSE trim(row.interest_rate_type) END,
    n.moratorium_period_years = CASE WHEN CASE WHEN row.moratorium_period_years IS NULL OR trim(row.moratorium_period_years) = '' THEN null ELSE trim(row.moratorium_period_years) END IS NULL THEN null ELSE toFloat(CASE WHEN row.moratorium_period_years IS NULL OR trim(row.moratorium_period_years) = '' THEN null ELSE trim(row.moratorium_period_years) END) END,
    n.simple_interest_during_moratorium = CASE WHEN CASE WHEN row.simple_interest_during_moratorium IS NULL OR trim(row.simple_interest_during_moratorium) = '' THEN null ELSE trim(row.simple_interest_during_moratorium) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.simple_interest_during_moratorium IS NULL OR trim(row.simple_interest_during_moratorium) = '' THEN null ELSE trim(row.simple_interest_during_moratorium) END) END,
    n.repayment_tenure_years = CASE WHEN CASE WHEN row.repayment_tenure_years IS NULL OR trim(row.repayment_tenure_years) = '' THEN null ELSE trim(row.repayment_tenure_years) END IS NULL THEN null ELSE toFloat(CASE WHEN row.repayment_tenure_years IS NULL OR trim(row.repayment_tenure_years) = '' THEN null ELSE trim(row.repayment_tenure_years) END) END,
    n.processing_fee_percent = CASE WHEN CASE WHEN row.processing_fee_percent IS NULL OR trim(row.processing_fee_percent) = '' THEN null ELSE trim(row.processing_fee_percent) END IS NULL THEN null ELSE toFloat(CASE WHEN row.processing_fee_percent IS NULL OR trim(row.processing_fee_percent) = '' THEN null ELSE trim(row.processing_fee_percent) END) END,
    n.prepayment_penalty_percent = CASE WHEN CASE WHEN row.prepayment_penalty_percent IS NULL OR trim(row.prepayment_penalty_percent) = '' THEN null ELSE trim(row.prepayment_penalty_percent) END IS NULL THEN null ELSE toFloat(CASE WHEN row.prepayment_penalty_percent IS NULL OR trim(row.prepayment_penalty_percent) = '' THEN null ELSE trim(row.prepayment_penalty_percent) END) END,
    n.collateral_required = CASE WHEN CASE WHEN row.collateral_required IS NULL OR trim(row.collateral_required) = '' THEN null ELSE trim(row.collateral_required) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.collateral_required IS NULL OR trim(row.collateral_required) = '' THEN null ELSE trim(row.collateral_required) END) END,
    n.collateral_types_accepted = CASE WHEN row.collateral_types_accepted IS NULL OR trim(row.collateral_types_accepted) = '' THEN null ELSE trim(row.collateral_types_accepted) END,
    n.collateral_threshold_inr = CASE WHEN CASE WHEN row.collateral_threshold_inr IS NULL OR trim(row.collateral_threshold_inr) = '' THEN null ELSE trim(row.collateral_threshold_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.collateral_threshold_inr IS NULL OR trim(row.collateral_threshold_inr) = '' THEN null ELSE trim(row.collateral_threshold_inr) END) END,
    n.co_applicant_required = CASE WHEN CASE WHEN row.co_applicant_required IS NULL OR trim(row.co_applicant_required) = '' THEN null ELSE trim(row.co_applicant_required) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.co_applicant_required IS NULL OR trim(row.co_applicant_required) = '' THEN null ELSE trim(row.co_applicant_required) END) END,
    n.co_applicant_options = CASE WHEN row.co_applicant_options IS NULL OR trim(row.co_applicant_options) = '' THEN null ELSE trim(row.co_applicant_options) END,
    n.covers_tuition = CASE WHEN CASE WHEN row.covers_tuition IS NULL OR trim(row.covers_tuition) = '' THEN null ELSE trim(row.covers_tuition) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.covers_tuition IS NULL OR trim(row.covers_tuition) = '' THEN null ELSE trim(row.covers_tuition) END) END,
    n.covers_hostel_mess = CASE WHEN CASE WHEN row.covers_hostel_mess IS NULL OR trim(row.covers_hostel_mess) = '' THEN null ELSE trim(row.covers_hostel_mess) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.covers_hostel_mess IS NULL OR trim(row.covers_hostel_mess) = '' THEN null ELSE trim(row.covers_hostel_mess) END) END,
    n.covers_examination_fees = CASE WHEN CASE WHEN row.covers_examination_fees IS NULL OR trim(row.covers_examination_fees) = '' THEN null ELSE trim(row.covers_examination_fees) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.covers_examination_fees IS NULL OR trim(row.covers_examination_fees) = '' THEN null ELSE trim(row.covers_examination_fees) END) END,
    n.covers_books_equipment = CASE WHEN CASE WHEN row.covers_books_equipment IS NULL OR trim(row.covers_books_equipment) = '' THEN null ELSE trim(row.covers_books_equipment) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.covers_books_equipment IS NULL OR trim(row.covers_books_equipment) = '' THEN null ELSE trim(row.covers_books_equipment) END) END,
    n.covers_travel = CASE WHEN CASE WHEN row.covers_travel IS NULL OR trim(row.covers_travel) = '' THEN null ELSE trim(row.covers_travel) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.covers_travel IS NULL OR trim(row.covers_travel) = '' THEN null ELSE trim(row.covers_travel) END) END,
    n.covers_international_study = CASE WHEN CASE WHEN row.covers_international_study IS NULL OR trim(row.covers_international_study) = '' THEN null ELSE trim(row.covers_international_study) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.covers_international_study IS NULL OR trim(row.covers_international_study) = '' THEN null ELSE trim(row.covers_international_study) END) END,
    n.pre_approved_institutions = CASE WHEN row.pre_approved_institutions IS NULL OR trim(row.pre_approved_institutions) = '' THEN null ELSE trim(row.pre_approved_institutions) END,
    n.eligible_streams = CASE WHEN row.eligible_streams IS NULL OR trim(row.eligible_streams) = '' THEN null ELSE trim(row.eligible_streams) END,
    n.eligibility_academic_min_percent = CASE WHEN CASE WHEN row.eligibility_academic_min_percent IS NULL OR trim(row.eligibility_academic_min_percent) = '' THEN null ELSE trim(row.eligibility_academic_min_percent) END IS NULL THEN null ELSE toFloat(CASE WHEN row.eligibility_academic_min_percent IS NULL OR trim(row.eligibility_academic_min_percent) = '' THEN null ELSE trim(row.eligibility_academic_min_percent) END) END,
    n.eligibility_income_min_inr = CASE WHEN CASE WHEN row.eligibility_income_min_inr IS NULL OR trim(row.eligibility_income_min_inr) = '' THEN null ELSE trim(row.eligibility_income_min_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.eligibility_income_min_inr IS NULL OR trim(row.eligibility_income_min_inr) = '' THEN null ELSE trim(row.eligibility_income_min_inr) END) END,
    n.eligibility_income_max_inr = CASE WHEN CASE WHEN row.eligibility_income_max_inr IS NULL OR trim(row.eligibility_income_max_inr) = '' THEN null ELSE trim(row.eligibility_income_max_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.eligibility_income_max_inr IS NULL OR trim(row.eligibility_income_max_inr) = '' THEN null ELSE trim(row.eligibility_income_max_inr) END) END,
    n.interest_subsidy_available = CASE WHEN CASE WHEN row.interest_subsidy_available IS NULL OR trim(row.interest_subsidy_available) = '' THEN null ELSE trim(row.interest_subsidy_available) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.interest_subsidy_available IS NULL OR trim(row.interest_subsidy_available) = '' THEN null ELSE trim(row.interest_subsidy_available) END) END,
    n.subsidy_scheme_name = CASE WHEN row.subsidy_scheme_name IS NULL OR trim(row.subsidy_scheme_name) = '' THEN null ELSE trim(row.subsidy_scheme_name) END,
    n.subsidy_conditions = CASE WHEN row.subsidy_conditions IS NULL OR trim(row.subsidy_conditions) = '' THEN null ELSE trim(row.subsidy_conditions) END,
    n.tax_benefits_section = CASE WHEN row.tax_benefits_section IS NULL OR trim(row.tax_benefits_section) = '' THEN null ELSE trim(row.tax_benefits_section) END,
    n.tax_benefits_details = CASE WHEN row.tax_benefits_details IS NULL OR trim(row.tax_benefits_details) = '' THEN null ELSE trim(row.tax_benefits_details) END,
    n.typical_disbursal_time_days = CASE WHEN CASE WHEN row.typical_disbursal_time_days IS NULL OR trim(row.typical_disbursal_time_days) = '' THEN null ELSE trim(row.typical_disbursal_time_days) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_disbursal_time_days IS NULL OR trim(row.typical_disbursal_time_days) = '' THEN null ELSE trim(row.typical_disbursal_time_days) END) END,
    n.required_documents = CASE WHEN row.required_documents IS NULL OR trim(row.required_documents) = '' THEN null ELSE trim(row.required_documents) END,
    n.application_process_summary = CASE WHEN row.application_process_summary IS NULL OR trim(row.application_process_summary) = '' THEN null ELSE trim(row.application_process_summary) END,
    n.official_portal_url = CASE WHEN row.official_portal_url IS NULL OR trim(row.official_portal_url) = '' THEN null ELSE trim(row.official_portal_url) END,
    n.contact_email = CASE WHEN row.contact_email IS NULL OR trim(row.contact_email) = '' THEN null ELSE trim(row.contact_email) END,
    n.active_status = CASE WHEN CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.active_status IS NULL OR trim(row.active_status) = '' THEN null ELSE trim(row.active_status) END) END,
    n.international_variants = CASE WHEN row.international_variants IS NULL OR trim(row.international_variants) = '' THEN null ELSE trim(row.international_variants) END,
    n.notes = CASE WHEN row.notes IS NULL OR trim(row.notes) = '' THEN null ELSE trim(row.notes) END,
    n.registry_entity_id = 'ENT-EDUCATION-LOAN',
    n.updated_at = datetime();

// Interest
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/interest.csv' AS row
WITH row WHERE row.interest_code IS NOT NULL AND trim(row.interest_code) <> ''
MERGE (n:Interest {interest_code: trim(row.interest_code)})
SET
    n.interest_id = coalesce(CASE WHEN row.interest_id IS NULL OR trim(row.interest_id) = '' THEN null ELSE trim(row.interest_id) END, n.interest_id, randomUUID()),
    n.interest_code = trim(row.interest_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.category = CASE WHEN row.category IS NULL OR trim(row.category) = '' THEN null ELSE trim(row.category) END,
    n.parent_interest = CASE WHEN row.parent_interest IS NULL OR trim(row.parent_interest) = '' THEN null ELSE trim(row.parent_interest) END,
    n.related_domains = CASE WHEN row.related_domains IS NULL OR trim(row.related_domains) = '' THEN null ELSE trim(row.related_domains) END,
    n.typical_expression_activities = CASE WHEN row.typical_expression_activities IS NULL OR trim(row.typical_expression_activities) = '' THEN null ELSE trim(row.typical_expression_activities) END,
    n.description = CASE WHEN row.description IS NULL OR trim(row.description) = '' THEN null ELSE trim(row.description) END,
    n.registry_entity_id = 'ENT-INTEREST',
    n.updated_at = datetime();

// Aptitude
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/aptitude.csv' AS row
WITH row WHERE row.aptitude_code IS NOT NULL AND trim(row.aptitude_code) <> ''
MERGE (n:Aptitude {aptitude_code: trim(row.aptitude_code)})
SET
    n.aptitude_id = coalesce(CASE WHEN row.aptitude_id IS NULL OR trim(row.aptitude_id) = '' THEN null ELSE trim(row.aptitude_id) END, n.aptitude_id, randomUUID()),
    n.aptitude_code = trim(row.aptitude_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.type = CASE WHEN row.type IS NULL OR trim(row.type) = '' THEN null ELSE trim(row.type) END,
    n.standard_measurement_scale = CASE WHEN row.standard_measurement_scale IS NULL OR trim(row.standard_measurement_scale) = '' THEN null ELSE trim(row.standard_measurement_scale) END,
    n.standard_assessment_methods = CASE WHEN row.standard_assessment_methods IS NULL OR trim(row.standard_assessment_methods) = '' THEN null ELSE trim(row.standard_assessment_methods) END,
    n.related_streams = CASE WHEN row.related_streams IS NULL OR trim(row.related_streams) = '' THEN null ELSE trim(row.related_streams) END,
    n.improvable_through_practice = CASE WHEN CASE WHEN row.improvable_through_practice IS NULL OR trim(row.improvable_through_practice) = '' THEN null ELSE trim(row.improvable_through_practice) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.improvable_through_practice IS NULL OR trim(row.improvable_through_practice) = '' THEN null ELSE trim(row.improvable_through_practice) END) END,
    n.related_career_outcomes = CASE WHEN row.related_career_outcomes IS NULL OR trim(row.related_career_outcomes) = '' THEN null ELSE trim(row.related_career_outcomes) END,
    n.parent_aptitude = CASE WHEN row.parent_aptitude IS NULL OR trim(row.parent_aptitude) = '' THEN null ELSE trim(row.parent_aptitude) END,
    n.description = CASE WHEN row.description IS NULL OR trim(row.description) = '' THEN null ELSE trim(row.description) END,
    n.registry_entity_id = 'ENT-APTITUDE',
    n.updated_at = datetime();

// Skill
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/skill.csv' AS row
WITH row WHERE row.skill_code IS NOT NULL AND trim(row.skill_code) <> ''
MERGE (n:Skill {skill_code: trim(row.skill_code)})
SET
    n.skill_id = coalesce(CASE WHEN row.skill_id IS NULL OR trim(row.skill_id) = '' THEN null ELSE trim(row.skill_id) END, n.skill_id, randomUUID()),
    n.skill_code = trim(row.skill_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.category = CASE WHEN row.category IS NULL OR trim(row.category) = '' THEN null ELSE trim(row.category) END,
    n.standard_proficiency_scale = CASE WHEN row.standard_proficiency_scale IS NULL OR trim(row.standard_proficiency_scale) = '' THEN null ELSE trim(row.standard_proficiency_scale) END,
    n.application_domain = CASE WHEN row.application_domain IS NULL OR trim(row.application_domain) = '' THEN null ELSE trim(row.application_domain) END,
    n.typical_time_to_develop_months = CASE WHEN CASE WHEN row.typical_time_to_develop_months IS NULL OR trim(row.typical_time_to_develop_months) = '' THEN null ELSE trim(row.typical_time_to_develop_months) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_time_to_develop_months IS NULL OR trim(row.typical_time_to_develop_months) = '' THEN null ELSE trim(row.typical_time_to_develop_months) END) END,
    n.prerequisites = CASE WHEN row.prerequisites IS NULL OR trim(row.prerequisites) = '' THEN null ELSE trim(row.prerequisites) END,
    n.typical_verification_methods = CASE WHEN row.typical_verification_methods IS NULL OR trim(row.typical_verification_methods) = '' THEN null ELSE trim(row.typical_verification_methods) END,
    n.related_streams = CASE WHEN row.related_streams IS NULL OR trim(row.related_streams) = '' THEN null ELSE trim(row.related_streams) END,
    n.related_career_outcomes = CASE WHEN row.related_career_outcomes IS NULL OR trim(row.related_career_outcomes) = '' THEN null ELSE trim(row.related_career_outcomes) END,
    n.is_transferable = CASE WHEN CASE WHEN row.is_transferable IS NULL OR trim(row.is_transferable) = '' THEN null ELSE trim(row.is_transferable) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.is_transferable IS NULL OR trim(row.is_transferable) = '' THEN null ELSE trim(row.is_transferable) END) END,
    n.description = CASE WHEN row.description IS NULL OR trim(row.description) = '' THEN null ELSE trim(row.description) END,
    n.registry_entity_id = 'ENT-SKILL',
    n.updated_at = datetime();

// PersonalityTrait
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/personalitytrait.csv' AS row
WITH row WHERE row.trait_code IS NOT NULL AND trim(row.trait_code) <> ''
MERGE (n:PersonalityTrait {trait_code: trim(row.trait_code)})
SET
    n.trait_id = coalesce(CASE WHEN row.trait_id IS NULL OR trim(row.trait_id) = '' THEN null ELSE trim(row.trait_id) END, n.trait_id, randomUUID()),
    n.trait_code = trim(row.trait_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.dimension = CASE WHEN row.dimension IS NULL OR trim(row.dimension) = '' THEN null ELSE trim(row.dimension) END,
    n.polarity_positive_pole = CASE WHEN row.polarity_positive_pole IS NULL OR trim(row.polarity_positive_pole) = '' THEN null ELSE trim(row.polarity_positive_pole) END,
    n.polarity_negative_pole = CASE WHEN row.polarity_negative_pole IS NULL OR trim(row.polarity_negative_pole) = '' THEN null ELSE trim(row.polarity_negative_pole) END,
    n.polarity_is_bipolar = CASE WHEN CASE WHEN row.polarity_is_bipolar IS NULL OR trim(row.polarity_is_bipolar) = '' THEN null ELSE trim(row.polarity_is_bipolar) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.polarity_is_bipolar IS NULL OR trim(row.polarity_is_bipolar) = '' THEN null ELSE trim(row.polarity_is_bipolar) END) END,
    n.related_careers = CASE WHEN row.related_careers IS NULL OR trim(row.related_careers) = '' THEN null ELSE trim(row.related_careers) END,
    n.standard_assessment_frameworks = CASE WHEN row.standard_assessment_frameworks IS NULL OR trim(row.standard_assessment_frameworks) = '' THEN null ELSE trim(row.standard_assessment_frameworks) END,
    n.description = CASE WHEN row.description IS NULL OR trim(row.description) = '' THEN null ELSE trim(row.description) END,
    n.parent_trait = CASE WHEN row.parent_trait IS NULL OR trim(row.parent_trait) = '' THEN null ELSE trim(row.parent_trait) END,
    n.registry_entity_id = 'ENT-PERSONALITY-TRAIT',
    n.updated_at = datetime();

// WorkPreference
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/workpreference.csv' AS row
WITH row WHERE row.preference_code IS NOT NULL AND trim(row.preference_code) <> ''
MERGE (n:WorkPreference {preference_code: trim(row.preference_code)})
SET
    n.preference_id = coalesce(CASE WHEN row.preference_id IS NULL OR trim(row.preference_id) = '' THEN null ELSE trim(row.preference_id) END, n.preference_id, randomUUID()),
    n.preference_code = trim(row.preference_code),
    n.preference_type = CASE WHEN row.preference_type IS NULL OR trim(row.preference_type) = '' THEN null ELSE trim(row.preference_type) END,
    n.possible_values = CASE WHEN row.possible_values IS NULL OR trim(row.possible_values) = '' THEN null ELSE trim(row.possible_values) END,
    n.career_relevance = CASE WHEN row.career_relevance IS NULL OR trim(row.career_relevance) = '' THEN null ELSE trim(row.career_relevance) END,
    n.description = CASE WHEN row.description IS NULL OR trim(row.description) = '' THEN null ELSE trim(row.description) END,
    n.assessment_source = CASE WHEN row.assessment_source IS NULL OR trim(row.assessment_source) = '' THEN null ELSE trim(row.assessment_source) END,
    n.parent_preference = CASE WHEN row.parent_preference IS NULL OR trim(row.parent_preference) = '' THEN null ELSE trim(row.parent_preference) END,
    n.flexibility_typical = CASE WHEN row.flexibility_typical IS NULL OR trim(row.flexibility_typical) = '' THEN null ELSE trim(row.flexibility_typical) END,
    n.registry_entity_id = 'ENT-WORK-PREFERENCE',
    n.updated_at = datetime();

// Activity
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/activity.csv' AS row
WITH row WHERE row.activity_code IS NOT NULL AND trim(row.activity_code) <> ''
MERGE (n:Activity {activity_code: trim(row.activity_code)})
SET
    n.activity_id = coalesce(CASE WHEN row.activity_id IS NULL OR trim(row.activity_id) = '' THEN null ELSE trim(row.activity_id) END, n.activity_id, randomUUID()),
    n.activity_code = trim(row.activity_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.category = CASE WHEN row.category IS NULL OR trim(row.category) = '' THEN null ELSE trim(row.category) END,
    n.stage_range = CASE WHEN row.stage_range IS NULL OR trim(row.stage_range) = '' THEN null ELSE trim(row.stage_range) END,
    n.typical_duration_months = CASE WHEN CASE WHEN row.typical_duration_months IS NULL OR trim(row.typical_duration_months) = '' THEN null ELSE trim(row.typical_duration_months) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_duration_months IS NULL OR trim(row.typical_duration_months) = '' THEN null ELSE trim(row.typical_duration_months) END) END,
    n.builds_skills = CASE WHEN row.builds_skills IS NULL OR trim(row.builds_skills) = '' THEN null ELSE trim(row.builds_skills) END,
    n.develops_traits = CASE WHEN row.develops_traits IS NULL OR trim(row.develops_traits) = '' THEN null ELSE trim(row.develops_traits) END,
    n.typical_cost_range_min_inr = CASE WHEN CASE WHEN row.typical_cost_range_min_inr IS NULL OR trim(row.typical_cost_range_min_inr) = '' THEN null ELSE trim(row.typical_cost_range_min_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_cost_range_min_inr IS NULL OR trim(row.typical_cost_range_min_inr) = '' THEN null ELSE trim(row.typical_cost_range_min_inr) END) END,
    n.typical_cost_range_max_inr = CASE WHEN CASE WHEN row.typical_cost_range_max_inr IS NULL OR trim(row.typical_cost_range_max_inr) = '' THEN null ELSE trim(row.typical_cost_range_max_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_cost_range_max_inr IS NULL OR trim(row.typical_cost_range_max_inr) = '' THEN null ELSE trim(row.typical_cost_range_max_inr) END) END,
    n.evidence_types_produced = CASE WHEN row.evidence_types_produced IS NULL OR trim(row.evidence_types_produced) = '' THEN null ELSE trim(row.evidence_types_produced) END,
    n.related_streams = CASE WHEN row.related_streams IS NULL OR trim(row.related_streams) = '' THEN null ELSE trim(row.related_streams) END,
    n.registry_entity_id = 'ENT-ACTIVITY',
    n.updated_at = datetime();

// Project
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/project.csv' AS row
WITH row WHERE row.project_code IS NOT NULL AND trim(row.project_code) <> ''
MERGE (n:Project {project_code: trim(row.project_code)})
SET
    n.project_id = coalesce(CASE WHEN row.project_id IS NULL OR trim(row.project_id) = '' THEN null ELSE trim(row.project_id) END, n.project_id, randomUUID()),
    n.project_code = trim(row.project_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.type = CASE WHEN row.type IS NULL OR trim(row.type) = '' THEN null ELSE trim(row.type) END,
    n.stage = CASE WHEN row.stage IS NULL OR trim(row.stage) = '' THEN null ELSE trim(row.stage) END,
    n.typical_duration_months = CASE WHEN CASE WHEN row.typical_duration_months IS NULL OR trim(row.typical_duration_months) = '' THEN null ELSE trim(row.typical_duration_months) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_duration_months IS NULL OR trim(row.typical_duration_months) = '' THEN null ELSE trim(row.typical_duration_months) END) END,
    n.typical_team_size_min = CASE WHEN CASE WHEN row.typical_team_size_min IS NULL OR trim(row.typical_team_size_min) = '' THEN null ELSE trim(row.typical_team_size_min) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_team_size_min IS NULL OR trim(row.typical_team_size_min) = '' THEN null ELSE trim(row.typical_team_size_min) END) END,
    n.typical_team_size_typical = CASE WHEN CASE WHEN row.typical_team_size_typical IS NULL OR trim(row.typical_team_size_typical) = '' THEN null ELSE trim(row.typical_team_size_typical) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_team_size_typical IS NULL OR trim(row.typical_team_size_typical) = '' THEN null ELSE trim(row.typical_team_size_typical) END) END,
    n.typical_team_size_max = CASE WHEN CASE WHEN row.typical_team_size_max IS NULL OR trim(row.typical_team_size_max) = '' THEN null ELSE trim(row.typical_team_size_max) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_team_size_max IS NULL OR trim(row.typical_team_size_max) = '' THEN null ELSE trim(row.typical_team_size_max) END) END,
    n.typical_technologies_used = CASE WHEN row.typical_technologies_used IS NULL OR trim(row.typical_technologies_used) = '' THEN null ELSE trim(row.typical_technologies_used) END,
    n.expected_deliverables = CASE WHEN row.expected_deliverables IS NULL OR trim(row.expected_deliverables) = '' THEN null ELSE trim(row.expected_deliverables) END,
    n.typical_outcomes_or_impact = CASE WHEN row.typical_outcomes_or_impact IS NULL OR trim(row.typical_outcomes_or_impact) = '' THEN null ELSE trim(row.typical_outcomes_or_impact) END,
    n.standard_verification_methods = CASE WHEN row.standard_verification_methods IS NULL OR trim(row.standard_verification_methods) = '' THEN null ELSE trim(row.standard_verification_methods) END,
    n.skills_typically_demonstrated = CASE WHEN row.skills_typically_demonstrated IS NULL OR trim(row.skills_typically_demonstrated) = '' THEN null ELSE trim(row.skills_typically_demonstrated) END,
    n.registry_entity_id = 'ENT-PROJECT',
    n.updated_at = datetime();

// Apprenticeship
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/apprenticeship.csv' AS row
WITH row WHERE row.apprenticeship_code IS NOT NULL AND trim(row.apprenticeship_code) <> ''
MERGE (n:Apprenticeship {apprenticeship_code: trim(row.apprenticeship_code)})
SET
    n.apprenticeship_id = coalesce(CASE WHEN row.apprenticeship_id IS NULL OR trim(row.apprenticeship_id) = '' THEN null ELSE trim(row.apprenticeship_id) END, n.apprenticeship_id, randomUUID()),
    n.apprenticeship_code = trim(row.apprenticeship_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.trade_or_role = CASE WHEN row.trade_or_role IS NULL OR trim(row.trade_or_role) = '' THEN null ELSE trim(row.trade_or_role) END,
    n.typical_duration_months = CASE WHEN CASE WHEN row.typical_duration_months IS NULL OR trim(row.typical_duration_months) = '' THEN null ELSE trim(row.typical_duration_months) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_duration_months IS NULL OR trim(row.typical_duration_months) = '' THEN null ELSE trim(row.typical_duration_months) END) END,
    n.typical_stipend_min_inr = CASE WHEN CASE WHEN row.typical_stipend_min_inr IS NULL OR trim(row.typical_stipend_min_inr) = '' THEN null ELSE trim(row.typical_stipend_min_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_stipend_min_inr IS NULL OR trim(row.typical_stipend_min_inr) = '' THEN null ELSE trim(row.typical_stipend_min_inr) END) END,
    n.typical_stipend_max_inr = CASE WHEN CASE WHEN row.typical_stipend_max_inr IS NULL OR trim(row.typical_stipend_max_inr) = '' THEN null ELSE trim(row.typical_stipend_max_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_stipend_max_inr IS NULL OR trim(row.typical_stipend_max_inr) = '' THEN null ELSE trim(row.typical_stipend_max_inr) END) END,
    n.governing_body = CASE WHEN row.governing_body IS NULL OR trim(row.governing_body) = '' THEN null ELSE trim(row.governing_body) END,
    n.certification_awarded_on_completion = CASE WHEN row.certification_awarded_on_completion IS NULL OR trim(row.certification_awarded_on_completion) = '' THEN null ELSE trim(row.certification_awarded_on_completion) END,
    n.applicable_stages = CASE WHEN row.applicable_stages IS NULL OR trim(row.applicable_stages) = '' THEN null ELSE trim(row.applicable_stages) END,
    n.applicable_streams = CASE WHEN row.applicable_streams IS NULL OR trim(row.applicable_streams) = '' THEN null ELSE trim(row.applicable_streams) END,
    n.typical_employers = CASE WHEN row.typical_employers IS NULL OR trim(row.typical_employers) = '' THEN null ELSE trim(row.typical_employers) END,
    n.structured_learning_hours = CASE WHEN CASE WHEN row.structured_learning_hours IS NULL OR trim(row.structured_learning_hours) = '' THEN null ELSE trim(row.structured_learning_hours) END IS NULL THEN null ELSE toInteger(CASE WHEN row.structured_learning_hours IS NULL OR trim(row.structured_learning_hours) = '' THEN null ELSE trim(row.structured_learning_hours) END) END,
    n.hands_on_hours = CASE WHEN CASE WHEN row.hands_on_hours IS NULL OR trim(row.hands_on_hours) = '' THEN null ELSE trim(row.hands_on_hours) END IS NULL THEN null ELSE toInteger(CASE WHEN row.hands_on_hours IS NULL OR trim(row.hands_on_hours) = '' THEN null ELSE trim(row.hands_on_hours) END) END,
    n.standard_verification_process = CASE WHEN row.standard_verification_process IS NULL OR trim(row.standard_verification_process) = '' THEN null ELSE trim(row.standard_verification_process) END,
    n.registry_entity_id = 'ENT-APPRENTICESHIP',
    n.updated_at = datetime();

// Certification
LOAD CSV WITH HEADERS FROM $csv_base_url + 'nodes/certification.csv' AS row
WITH row WHERE row.certification_code IS NOT NULL AND trim(row.certification_code) <> ''
MERGE (n:Certification {certification_code: trim(row.certification_code)})
SET
    n.certification_id = coalesce(CASE WHEN row.certification_id IS NULL OR trim(row.certification_id) = '' THEN null ELSE trim(row.certification_id) END, n.certification_id, randomUUID()),
    n.certification_code = trim(row.certification_code),
    n.name = CASE WHEN row.name IS NULL OR trim(row.name) = '' THEN null ELSE trim(row.name) END,
    n.issuing_body = CASE WHEN row.issuing_body IS NULL OR trim(row.issuing_body) = '' THEN null ELSE trim(row.issuing_body) END,
    n.type = CASE WHEN row.type IS NULL OR trim(row.type) = '' THEN null ELSE trim(row.type) END,
    n.typical_duration_hours = CASE WHEN CASE WHEN row.typical_duration_hours IS NULL OR trim(row.typical_duration_hours) = '' THEN null ELSE trim(row.typical_duration_hours) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_duration_hours IS NULL OR trim(row.typical_duration_hours) = '' THEN null ELSE trim(row.typical_duration_hours) END) END,
    n.validity_period_years = CASE WHEN CASE WHEN row.validity_period_years IS NULL OR trim(row.validity_period_years) = '' THEN null ELSE trim(row.validity_period_years) END IS NULL THEN null ELSE toFloat(CASE WHEN row.validity_period_years IS NULL OR trim(row.validity_period_years) = '' THEN null ELSE trim(row.validity_period_years) END) END,
    n.renewable = CASE WHEN CASE WHEN row.renewable IS NULL OR trim(row.renewable) = '' THEN null ELSE trim(row.renewable) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.renewable IS NULL OR trim(row.renewable) = '' THEN null ELSE trim(row.renewable) END) END,
    n.typical_cost_inr = CASE WHEN CASE WHEN row.typical_cost_inr IS NULL OR trim(row.typical_cost_inr) = '' THEN null ELSE trim(row.typical_cost_inr) END IS NULL THEN null ELSE toInteger(CASE WHEN row.typical_cost_inr IS NULL OR trim(row.typical_cost_inr) = '' THEN null ELSE trim(row.typical_cost_inr) END) END,
    n.applicable_career_outcomes = CASE WHEN row.applicable_career_outcomes IS NULL OR trim(row.applicable_career_outcomes) = '' THEN null ELSE trim(row.applicable_career_outcomes) END,
    n.stackable_with = CASE WHEN row.stackable_with IS NULL OR trim(row.stackable_with) = '' THEN null ELSE trim(row.stackable_with) END,
    n.prerequisites = CASE WHEN row.prerequisites IS NULL OR trim(row.prerequisites) = '' THEN null ELSE trim(row.prerequisites) END,
    n.assessment_method = CASE WHEN row.assessment_method IS NULL OR trim(row.assessment_method) = '' THEN null ELSE trim(row.assessment_method) END,
    n.industry_recognition_level = CASE WHEN row.industry_recognition_level IS NULL OR trim(row.industry_recognition_level) = '' THEN null ELSE trim(row.industry_recognition_level) END,
    n.verification_url_pattern = CASE WHEN row.verification_url_pattern IS NULL OR trim(row.verification_url_pattern) = '' THEN null ELSE trim(row.verification_url_pattern) END,
    n.typical_pass_rate_percent = CASE WHEN CASE WHEN row.typical_pass_rate_percent IS NULL OR trim(row.typical_pass_rate_percent) = '' THEN null ELSE trim(row.typical_pass_rate_percent) END IS NULL THEN null ELSE toFloat(CASE WHEN row.typical_pass_rate_percent IS NULL OR trim(row.typical_pass_rate_percent) = '' THEN null ELSE trim(row.typical_pass_rate_percent) END) END,
    n.international_recognition = CASE WHEN CASE WHEN row.international_recognition IS NULL OR trim(row.international_recognition) = '' THEN null ELSE trim(row.international_recognition) END IS NULL THEN null ELSE toBoolean(CASE WHEN row.international_recognition IS NULL OR trim(row.international_recognition) = '' THEN null ELSE trim(row.international_recognition) END) END,
    n.registry_entity_id = 'ENT-CERTIFICATION',
    n.updated_at = datetime();


// -----------------------------------------------------------------------------
// 07 Load Relationships
// -----------------------------------------------------------------------------

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


// -----------------------------------------------------------------------------
// 08 Smoke Queries
// -----------------------------------------------------------------------------

// Smoke-test queries for the generated SCC seed graph.
// These queries should return evidence rows after loading datasets/seed.

// Count core seed labels.
MATCH (f:Faculty {faculty_code: 'FAC-SCIENCE'})
MATCH (d:Domain {domain_code: 'DOM-ENGINEERING'})
MATCH (s:Stream {stream_code: 'STR-AEROSPACE-ENGINEERING'})
MATCH (c:CareerOutcome {outcome_code: 'CAREER-AEROSPACE-ENGINEER'})
RETURN f.name AS faculty, d.name AS domain, s.name AS stream, c.name AS career;

// Verify the main pathway traversal.
MATCH path =
  (:Faculty {faculty_code: 'FAC-SCIENCE'})
  -[:CONTAINS]->
  (:Domain {domain_code: 'DOM-ENGINEERING'})
  -[:CONTAINS]->
  (:Stream {stream_code: 'STR-AEROSPACE-ENGINEERING'})
  -[:LEADS_TO]->
  (:CareerOutcome {outcome_code: 'CAREER-AEROSPACE-ENGINEER'})
RETURN path;

// Verify test-required relationship extensions.
MATCH (:Licence {licence_code: 'LIC-DGCA-AMEL'})
  -[:UNLOCKS]->
  (career:CareerOutcome {outcome_code: 'CAREER-AEROSPACE-ENGINEER'})
RETURN career.name AS unlocked_career;

MATCH (:Degree {degree_code: 'DEG-BTECH-AERO'})
  -[:REQUIRES_EXAM]->
  (exam:EntranceExam {exam_code: 'EXAM-JEE-MAIN'})
RETURN exam.name AS required_exam;


// -----------------------------------------------------------------------------
// 09 Structural Validation
// -----------------------------------------------------------------------------

// These queries should return zero rows for violation checks, except the placeholder scholarship check.

// Structural integrity validation queries.
// Queries return rows only when violations are found.

// T44: Unreachable careers.
MATCH (c:CareerOutcome)
WHERE NOT ((:Stream)-[:LEADS_TO]->(c) OR (:Licence)-[:UNLOCKS]->(c))
RETURN c.name AS unreachable_career;

// T45: Prerequisite cycles.
MATCH path = (s)-[:PREREQUISITE_OF*]->(s)
RETURN path AS cycle_detected;

// T48: Orphaned entrance exams.
MATCH (e:EntranceExam)
WHERE NOT (:Stream)-[:HAS_ENTRANCE_EXAM]->(e)
  AND NOT (:Degree)-[:REQUIRES_EXAM]->(e)
  AND NOT (:CareerOutcome)-[:HAS_FOLLOW_ON_EXAM]->(e)
RETURN e.name AS orphaned_exam;

// T49: Scholarship reachability placeholder.
// Requires a representative test-student fixture before becoming executable.
