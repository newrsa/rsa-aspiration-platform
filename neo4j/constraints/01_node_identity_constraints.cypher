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
