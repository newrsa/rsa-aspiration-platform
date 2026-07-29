// RSA SCC Query Capability Cookbook
// Run after loading the seed dataset or production SCC data.

// -----------------------------------------------------------------------------
// QRY-PATHWAY-001 - Path & Pathway
// Question: Which Science pathway leads to Aerospace Engineer?
// Routing: SCC
// -----------------------------------------------------------------------------
MATCH path =
  (:Faculty {faculty_code: 'FAC-SCIENCE'})
  -[:CONTAINS]->
  (:Domain)
  -[:CONTAINS]->
  (:Stream)
  -[:LEADS_TO]->
  (:CareerOutcome {outcome_code: 'CAREER-AEROSPACE-ENGINEER'})
RETURN path;

// -----------------------------------------------------------------------------
// QRY-ELIGIBILITY-001 - Eligibility & Subject
// Question: Which subject combination is required for Aerospace Engineering?
// Routing: SCC
// -----------------------------------------------------------------------------
MATCH (s:Stream {stream_code: 'STR-AEROSPACE-ENGINEERING'})
  -[:REQUIRES_SUBJECT_COMBINATION]->
  (combination:SubjectCombination)
RETURN s.name AS stream, combination.name AS required_subject_combination;

// -----------------------------------------------------------------------------
// QRY-ENTRANCE-EXAM-001 - Entrance Exam
// Question: Which exams are connected to Aerospace Engineering or its degree?
// Routing: SCC
// -----------------------------------------------------------------------------
MATCH (s:Stream {stream_code: 'STR-AEROSPACE-ENGINEERING'})
OPTIONAL MATCH (s)-[:HAS_ENTRANCE_EXAM]->(stream_exam:EntranceExam)
OPTIONAL MATCH (s)-[:AWARDS_DEGREE]->(degree:Degree)-[:REQUIRES_EXAM]->(degree_exam:EntranceExam)
RETURN
  s.name AS stream,
  collect(DISTINCT stream_exam.name) AS stream_exams,
  collect(DISTINCT degree_exam.name) AS degree_exams;

// -----------------------------------------------------------------------------
// QRY-CAREER-001 - Career & Salary
// Question: Which careers are reachable from a stream?
// Routing: SCC
// -----------------------------------------------------------------------------
MATCH (s:Stream {stream_code: 'STR-AEROSPACE-ENGINEERING'})
  -[:LEADS_TO]->
  (career:CareerOutcome)
RETURN s.name AS stream, career.name AS career;

// -----------------------------------------------------------------------------
// QRY-LICENCE-001 - Career & Salary
// Question: Which careers are unlocked by a licence?
// Routing: SCC
// -----------------------------------------------------------------------------
MATCH (licence:Licence {licence_code: 'LIC-DGCA-AMEL'})
  -[:UNLOCKS]->
  (career:CareerOutcome)
RETURN licence.name AS licence, career.name AS unlocked_career;

// -----------------------------------------------------------------------------
// QRY-INSTITUTION-001 - College & Institution
// Question: Which institutions offer a stream?
// Routing: SCC
// -----------------------------------------------------------------------------
// This query becomes active when Institution seed data is loaded.
MATCH (institution:Institution)-[:OFFERS]->(s:Stream)
RETURN institution.name AS institution, s.name AS stream
ORDER BY institution.name;

// -----------------------------------------------------------------------------
// QRY-GEOGRAPHY-001 - Location & Geography
// Question: Which institutions are located in a city?
// Routing: SCC
// -----------------------------------------------------------------------------
// This query becomes active when Institution and City seed data are loaded.
MATCH (institution:Institution)-[:LOCATED_IN]->(city:City)
RETURN city.name AS city, collect(institution.name) AS institutions
ORDER BY city.name;

// -----------------------------------------------------------------------------
// QRY-FINANCIAL-AID-001 - Financial Aid
// Question: Which scholarships apply to a stream?
// Routing: SCC
// -----------------------------------------------------------------------------
// This query becomes active when Scholarship seed data is loaded.
MATCH (scholarship:Scholarship)-[:APPLICABLE_TO]->(s:Stream)
RETURN s.name AS stream, collect(scholarship.name) AS scholarships
ORDER BY s.name;

// -----------------------------------------------------------------------------
// QRY-COMPETENCY-001 - Digital Twin Matching
// Question: Which skills and aptitudes does a career require?
// Routing: SCC facts; Digital Twin performs user matching
// -----------------------------------------------------------------------------
// SCC returns universal requirements. User-specific matching belongs to Digital Twin.
MATCH (career:CareerOutcome)
WHERE career.outcome_code = 'CAREER-AEROSPACE-ENGINEER'
OPTIONAL MATCH (career)-[:REQUIRES_SKILL]->(skill:Skill)
OPTIONAL MATCH (career)-[:REQUIRES_APTITUDE]->(aptitude:Aptitude)
RETURN
  career.name AS career,
  collect(DISTINCT skill.name) AS required_skills,
  collect(DISTINCT aptitude.name) AS required_aptitudes;

// -----------------------------------------------------------------------------
// QRY-VALIDATION-001 - Structural Integrity
// Question: Are there unreachable careers?
// Routing: SCC validation
// -----------------------------------------------------------------------------
MATCH (c:CareerOutcome)
WHERE NOT ((:Stream)-[:LEADS_TO]->(c) OR (:Licence)-[:UNLOCKS]->(c))
RETURN c.name AS unreachable_career;
