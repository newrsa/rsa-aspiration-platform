#!/usr/bin/env python3
"""Generate query capability cookbook artifacts for SCC acceptance coverage."""

from __future__ import annotations

from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
QUERY_OUTPUT = ROOT / "neo4j" / "queries" / "02_query_cookbook.cypher"
NOTEBOOK_OUTPUT = ROOT / "neo4j" / "notebooks" / "query_capability_cookbook.cypher"
MATRIX_OUTPUT = ROOT / "docs" / "architecture" / "query-capability-matrix.md"


QUERIES = [
    {
        "id": "QRY-PATHWAY-001",
        "category": "Path & Pathway",
        "question": "Which Science pathway leads to Aerospace Engineer?",
        "routing": "SCC",
        "entities": "Faculty, Domain, Stream, CareerOutcome",
        "relationships": "CONTAINS, LEADS_TO",
        "cypher": """MATCH path =
  (:Faculty {faculty_code: 'FAC-SCIENCE'})
  -[:CONTAINS]->
  (:Domain)
  -[:CONTAINS]->
  (:Stream)
  -[:LEADS_TO]->
  (:CareerOutcome {outcome_code: 'CAREER-AEROSPACE-ENGINEER'})
RETURN path;""",
    },
    {
        "id": "QRY-ELIGIBILITY-001",
        "category": "Eligibility & Subject",
        "question": "Which subject combination is required for Aerospace Engineering?",
        "routing": "SCC",
        "entities": "Stream, SubjectCombination",
        "relationships": "REQUIRES_SUBJECT_COMBINATION",
        "cypher": """MATCH (s:Stream {stream_code: 'STR-AEROSPACE-ENGINEERING'})
  -[:REQUIRES_SUBJECT_COMBINATION]->
  (combination:SubjectCombination)
RETURN s.name AS stream, combination.name AS required_subject_combination;""",
    },
    {
        "id": "QRY-ENTRANCE-EXAM-001",
        "category": "Entrance Exam",
        "question": "Which exams are connected to Aerospace Engineering or its degree?",
        "routing": "SCC",
        "entities": "Stream, Degree, EntranceExam",
        "relationships": "HAS_ENTRANCE_EXAM, AWARDS_DEGREE, REQUIRES_EXAM",
        "cypher": """MATCH (s:Stream {stream_code: 'STR-AEROSPACE-ENGINEERING'})
OPTIONAL MATCH (s)-[:HAS_ENTRANCE_EXAM]->(stream_exam:EntranceExam)
OPTIONAL MATCH (s)-[:AWARDS_DEGREE]->(degree:Degree)-[:REQUIRES_EXAM]->(degree_exam:EntranceExam)
RETURN
  s.name AS stream,
  collect(DISTINCT stream_exam.name) AS stream_exams,
  collect(DISTINCT degree_exam.name) AS degree_exams;""",
    },
    {
        "id": "QRY-CAREER-001",
        "category": "Career & Salary",
        "question": "Which careers are reachable from a stream?",
        "routing": "SCC",
        "entities": "Stream, CareerOutcome",
        "relationships": "LEADS_TO",
        "cypher": """MATCH (s:Stream {stream_code: 'STR-AEROSPACE-ENGINEERING'})
  -[:LEADS_TO]->
  (career:CareerOutcome)
RETURN s.name AS stream, career.name AS career;""",
    },
    {
        "id": "QRY-LICENCE-001",
        "category": "Career & Salary",
        "question": "Which careers are unlocked by a licence?",
        "routing": "SCC",
        "entities": "Licence, CareerOutcome",
        "relationships": "UNLOCKS",
        "cypher": """MATCH (licence:Licence {licence_code: 'LIC-DGCA-AMEL'})
  -[:UNLOCKS]->
  (career:CareerOutcome)
RETURN licence.name AS licence, career.name AS unlocked_career;""",
    },
    {
        "id": "QRY-INSTITUTION-001",
        "category": "College & Institution",
        "question": "Which institutions offer a stream?",
        "routing": "SCC",
        "entities": "Institution, Stream",
        "relationships": "OFFERS or equivalent stream offering pattern",
        "cypher": """// This query becomes active when Institution seed data is loaded.
MATCH (institution:Institution)-[:OFFERS]->(s:Stream)
RETURN institution.name AS institution, s.name AS stream
ORDER BY institution.name;""",
    },
    {
        "id": "QRY-GEOGRAPHY-001",
        "category": "Location & Geography",
        "question": "Which institutions are located in a city?",
        "routing": "SCC",
        "entities": "Institution, City",
        "relationships": "LOCATED_IN",
        "cypher": """// This query becomes active when Institution and City seed data are loaded.
MATCH (institution:Institution)-[:LOCATED_IN]->(city:City)
RETURN city.name AS city, collect(institution.name) AS institutions
ORDER BY city.name;""",
    },
    {
        "id": "QRY-FINANCIAL-AID-001",
        "category": "Financial Aid",
        "question": "Which scholarships apply to a stream?",
        "routing": "SCC",
        "entities": "Scholarship, Stream",
        "relationships": "APPLICABLE_TO",
        "cypher": """// This query becomes active when Scholarship seed data is loaded.
MATCH (scholarship:Scholarship)-[:APPLICABLE_TO]->(s:Stream)
RETURN s.name AS stream, collect(scholarship.name) AS scholarships
ORDER BY s.name;""",
    },
    {
        "id": "QRY-COMPETENCY-001",
        "category": "Digital Twin Matching",
        "question": "Which skills and aptitudes does a career require?",
        "routing": "SCC facts; Digital Twin performs user matching",
        "entities": "CareerOutcome, Skill, Aptitude",
        "relationships": "REQUIRES_SKILL, REQUIRES_APTITUDE",
        "cypher": """// SCC returns universal requirements. User-specific matching belongs to Digital Twin.
MATCH (career:CareerOutcome)
WHERE career.outcome_code = 'CAREER-AEROSPACE-ENGINEER'
OPTIONAL MATCH (career)-[:REQUIRES_SKILL]->(skill:Skill)
OPTIONAL MATCH (career)-[:REQUIRES_APTITUDE]->(aptitude:Aptitude)
RETURN
  career.name AS career,
  collect(DISTINCT skill.name) AS required_skills,
  collect(DISTINCT aptitude.name) AS required_aptitudes;""",
    },
    {
        "id": "QRY-VALIDATION-001",
        "category": "Structural Integrity",
        "question": "Are there unreachable careers?",
        "routing": "SCC validation",
        "entities": "Stream, Licence, CareerOutcome",
        "relationships": "LEADS_TO, UNLOCKS",
        "cypher": """MATCH (c:CareerOutcome)
WHERE NOT ((:Stream)-[:LEADS_TO]->(c) OR (:Licence)-[:UNLOCKS]->(c))
RETURN c.name AS unreachable_career;""",
    },
]


def write_query_file(path: Path) -> None:
    lines = [
        "// RSA SCC Query Capability Cookbook",
        "// Run after loading the seed dataset or production SCC data.",
        "",
    ]
    for query in QUERIES:
        lines.extend(
            [
                "// -----------------------------------------------------------------------------",
                f"// {query['id']} - {query['category']}",
                f"// Question: {query['question']}",
                f"// Routing: {query['routing']}",
                "// -----------------------------------------------------------------------------",
                query["cypher"].strip(),
                "",
            ]
        )
    path.write_text("\n".join(lines).rstrip() + "\n", encoding="utf-8")


def write_notebook(path: Path) -> None:
    lines = [
        "// RSA SCC Query Capability Cookbook Notebook",
        "// Open in Neo4j Browser after running manual_seed_smoke_test.cypher.",
        "",
    ]
    for index, query in enumerate(QUERIES, start=1):
        lines.extend(
            [
                "",
                "// -----------------------------------------------------------------------------",
                f"// {index:02d}. {query['id']} - {query['category']}",
                "// -----------------------------------------------------------------------------",
                f"// Business question: {query['question']}",
                f"// Required entities: {query['entities']}",
                f"// Required relationships: {query['relationships']}",
                f"// Peer routing: {query['routing']}",
                "",
                query["cypher"].strip(),
                "",
            ]
        )
    path.write_text("\n".join(lines).rstrip() + "\n", encoding="utf-8")


def write_matrix(path: Path) -> None:
    lines = [
        "# Query Capability Matrix",
        "",
        "Status: generated draft",
        "",
        "This matrix maps representative Master Test Bank categories to SCC traversal patterns.",
        "It is intentionally category-level until the full 949-question bank is available as structured rows.",
        "",
        "| Query ID | Category | Business Question | Routing | Entities | Relationships |",
        "| --- | --- | --- | --- | --- | --- |",
    ]
    for query in QUERIES:
        lines.append(
            f"| `{query['id']}` | {query['category']} | {query['question']} | "
            f"{query['routing']} | {query['entities']} | {query['relationships']} |"
        )
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> None:
    QUERY_OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    NOTEBOOK_OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    MATRIX_OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    write_query_file(QUERY_OUTPUT)
    write_notebook(NOTEBOOK_OUTPUT)
    write_matrix(MATRIX_OUTPUT)
    print(f"Generated {len(QUERIES)} query cookbook entries.")


if __name__ == "__main__":
    main()
