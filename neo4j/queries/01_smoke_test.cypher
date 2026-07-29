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
