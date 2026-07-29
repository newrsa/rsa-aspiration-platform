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
