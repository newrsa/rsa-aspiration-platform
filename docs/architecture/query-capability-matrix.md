# Query Capability Matrix

Status: generated draft

This matrix maps representative Master Test Bank categories to SCC traversal patterns.
It is intentionally category-level until the full 949-question bank is available as structured rows.

| Query ID | Category | Business Question | Routing | Entities | Relationships |
| --- | --- | --- | --- | --- | --- |
| `QRY-PATHWAY-001` | Path & Pathway | Which Science pathway leads to Aerospace Engineer? | SCC | Faculty, Domain, Stream, CareerOutcome | CONTAINS, LEADS_TO |
| `QRY-ELIGIBILITY-001` | Eligibility & Subject | Which subject combination is required for Aerospace Engineering? | SCC | Stream, SubjectCombination | REQUIRES_SUBJECT_COMBINATION |
| `QRY-ENTRANCE-EXAM-001` | Entrance Exam | Which exams are connected to Aerospace Engineering or its degree? | SCC | Stream, Degree, EntranceExam | HAS_ENTRANCE_EXAM, AWARDS_DEGREE, REQUIRES_EXAM |
| `QRY-CAREER-001` | Career & Salary | Which careers are reachable from a stream? | SCC | Stream, CareerOutcome | LEADS_TO |
| `QRY-LICENCE-001` | Career & Salary | Which careers are unlocked by a licence? | SCC | Licence, CareerOutcome | UNLOCKS |
| `QRY-INSTITUTION-001` | College & Institution | Which institutions offer scholarships for Science pathways? | SCC | Institution, Scholarship, Stream | OFFERED_BY, APPLICABLE_TO |
| `QRY-GEOGRAPHY-001` | Location & Geography | Which institutions are located in a city? | SCC | Institution, City | LOCATED_IN |
| `QRY-FINANCIAL-AID-001` | Financial Aid | Which scholarships apply to a stream? | SCC | Scholarship, Stream | APPLICABLE_TO |
| `QRY-COMPETENCY-001` | Digital Twin Matching | Which skills and aptitudes does a career require? | SCC facts; Digital Twin performs user matching | CareerOutcome, Skill, Aptitude | REQUIRES_SKILL, REQUIRES_APTITUDE |
| `QRY-VALIDATION-001` | Structural Integrity | Are there unreachable careers? | SCC validation | Stream, Licence, CareerOutcome | LEADS_TO, UNLOCKS |
