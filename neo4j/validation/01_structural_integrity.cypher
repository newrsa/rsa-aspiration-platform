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
