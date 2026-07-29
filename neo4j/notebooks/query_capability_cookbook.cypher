// RSA SCC Query Capability Cookbook Notebook
// Open in Neo4j Browser after running manual_seed_smoke_test.cypher.


// -----------------------------------------------------------------------------
// 01. QRY-PATHWAY-001 - Path & Pathway
// -----------------------------------------------------------------------------
// Business question: Which Science pathway leads to Aerospace Engineer?
// Required entities: Faculty, Domain, Stream, CareerOutcome
// Required relationships: CONTAINS, LEADS_TO
// Peer routing: SCC

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
// 02. QRY-ELIGIBILITY-001 - Eligibility & Subject
// -----------------------------------------------------------------------------
// Business question: Which subject combination is required for Aerospace Engineering?
// Required entities: Stream, SubjectCombination
// Required relationships: REQUIRES_SUBJECT_COMBINATION
// Peer routing: SCC

MATCH (s:Stream {stream_code: 'STR-AEROSPACE-ENGINEERING'})
  -[:REQUIRES_SUBJECT_COMBINATION]->
  (combination:SubjectCombination)
RETURN s.name AS stream, combination.name AS required_subject_combination;


// -----------------------------------------------------------------------------
// 03. QRY-ENTRANCE-EXAM-001 - Entrance Exam
// -----------------------------------------------------------------------------
// Business question: Which exams are connected to Aerospace Engineering or its degree?
// Required entities: Stream, Degree, EntranceExam
// Required relationships: HAS_ENTRANCE_EXAM, AWARDS_DEGREE, REQUIRES_EXAM
// Peer routing: SCC

MATCH (s:Stream {stream_code: 'STR-AEROSPACE-ENGINEERING'})
OPTIONAL MATCH (s)-[:HAS_ENTRANCE_EXAM]->(stream_exam:EntranceExam)
OPTIONAL MATCH (s)-[:AWARDS_DEGREE]->(degree:Degree)-[:REQUIRES_EXAM]->(degree_exam:EntranceExam)
RETURN
  s.name AS stream,
  collect(DISTINCT stream_exam.name) AS stream_exams,
  collect(DISTINCT degree_exam.name) AS degree_exams;


// -----------------------------------------------------------------------------
// 04. QRY-CAREER-001 - Career & Salary
// -----------------------------------------------------------------------------
// Business question: Which careers are reachable from a stream?
// Required entities: Stream, CareerOutcome
// Required relationships: LEADS_TO
// Peer routing: SCC

MATCH (s:Stream {stream_code: 'STR-AEROSPACE-ENGINEERING'})
  -[:LEADS_TO]->
  (career:CareerOutcome)
RETURN s.name AS stream, career.name AS career;


// -----------------------------------------------------------------------------
// 05. QRY-LICENCE-001 - Career & Salary
// -----------------------------------------------------------------------------
// Business question: Which careers are unlocked by a licence?
// Required entities: Licence, CareerOutcome
// Required relationships: UNLOCKS
// Peer routing: SCC

MATCH (licence:Licence {licence_code: 'LIC-DGCA-AMEL'})
  -[:UNLOCKS]->
  (career:CareerOutcome)
RETURN licence.name AS licence, career.name AS unlocked_career;


// -----------------------------------------------------------------------------
// 06. QRY-INSTITUTION-001 - College & Institution
// -----------------------------------------------------------------------------
// Business question: Which institutions offer scholarships for Science pathways?
// Required entities: Institution, Scholarship, Stream
// Required relationships: OFFERED_BY, APPLICABLE_TO
// Peer routing: SCC

MATCH (scholarship:Scholarship)
  -[:OFFERED_BY]->
  (institution:Institution)
MATCH (scholarship)-[:APPLICABLE_TO]->(s:Stream)
RETURN
  institution.name AS institution,
  scholarship.name AS scholarship,
  s.name AS applicable_stream
ORDER BY institution.name, scholarship.name;


// -----------------------------------------------------------------------------
// 07. QRY-GEOGRAPHY-001 - Location & Geography
// -----------------------------------------------------------------------------
// Business question: Which institutions are located in a city?
// Required entities: Institution, City
// Required relationships: LOCATED_IN
// Peer routing: SCC

MATCH (institution:Institution)-[:LOCATED_IN]->(city:City)
RETURN city.name AS city, collect(institution.name) AS institutions
ORDER BY city.name;


// -----------------------------------------------------------------------------
// 08. QRY-FINANCIAL-AID-001 - Financial Aid
// -----------------------------------------------------------------------------
// Business question: Which scholarships apply to a stream?
// Required entities: Scholarship, Stream
// Required relationships: APPLICABLE_TO
// Peer routing: SCC

MATCH (scholarship:Scholarship)-[:APPLICABLE_TO]->(s:Stream)
RETURN s.name AS stream, collect(scholarship.name) AS scholarships
ORDER BY s.name;


// -----------------------------------------------------------------------------
// 09. QRY-COMPETENCY-001 - Digital Twin Matching
// -----------------------------------------------------------------------------
// Business question: Which skills and aptitudes does a career require?
// Required entities: CareerOutcome, Skill, Aptitude
// Required relationships: REQUIRES_SKILL, REQUIRES_APTITUDE
// Peer routing: SCC facts; Digital Twin performs user matching

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
// 10. QRY-VALIDATION-001 - Structural Integrity
// -----------------------------------------------------------------------------
// Business question: Are there unreachable careers?
// Required entities: Stream, Licence, CareerOutcome
// Required relationships: LEADS_TO, UNLOCKS
// Peer routing: SCC validation

MATCH (c:CareerOutcome)
WHERE NOT ((:Stream)-[:LEADS_TO]->(c) OR (:Licence)-[:UNLOCKS]->(c))
RETURN c.name AS unreachable_career;
