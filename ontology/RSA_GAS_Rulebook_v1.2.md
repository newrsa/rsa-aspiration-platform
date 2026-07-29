# Global Aspiration Standard (GAS) — Rulebook
**Version:** 1.2
**Previous version:** 1.1
**Purpose:** Implementation contract between the SCC Ontology (v0.6) and its Neo4j implementation.
**For:** Sandeep (implementation), ontology team (data curation), reviewers (change management)
**Scope:** All SCC-family Universes (Science, Commerce, future exam-gated categories). Peer aspiration ontologies (Digital Twin, Sports/Performance, Hobby/Exploration) will need their own derived GAS — see §16.

---

## Changelog v1.1 → v1.2

Additions triggered by v0.6 ontology consolidation and Structural Integrity Test Set findings:

| # | Addition | Section | Origin |
|---|---|---|---|
| 1 | 5 Competency requirement relationships | §3.3h | Pranav concept entities absorbed in v0.6 |
| 2 | 3 Experience/Certification relationships | §3.3i | Pranav concept entities absorbed in v0.6 |
| 3 | Cross-jurisdictional Licence/Degree equivalence (EQUIVALENT_TO) | §3.3g | NK T27 stress test; was placeholder in v1.1 |
| 4 | Extended cycle detection to PREREQUISITE_OF | §9.5 | NK T45 stress test |
| 5 | Multi-inheritance conflict resolution rule | §11.6 | NK T46 stress test |
| 6 | Unreachable Scholarship audit query | §9.7 | NK T49 stress test |
| 7 | Digital Twin declared as peer ontology | §16.2 | v0.6 boundary decision |
| 8 | Concept entity discipline notes | §17 (NEW) | Pranav concept entities |

**Total new rules: 13.**
**Zero rules removed or modified from v1.1.**

---

## 1. Purpose and layer boundaries

GAS is the translation contract. It answers "how do we go from ontology description to Neo4j implementation" in a consistent, auditable way.

**Three layers in the RSA implementation stack:**

| Layer | Owner | Deliverable |
|---|---|---|
| Ontology (v0.6) | Ontology team (Nilesh, Pranav, Sandeep together) | Platform-neutral entity/relationship/property definitions |
| **GAS Rulebook (this document)** | Ontology team + Sandeep | Naming, ID, casing, versioning conventions |
| Implementation Guide | Sandeep | Cypher scripts, Neo4j schema constraints, load procedures (separate document) |

**Rule 0 — GAS is authoritative for translation, not design.** If GAS conflicts with ontology intent, ontology wins; GAS gets revised.

**Rule 0.1 — GAS applies to SCC-family ontologies only.** Peer ontologies (Digital Twin, Sports/Performance, Hobby/Exploration, STC, CTG, Life Decision Layer) need their own derived GAS. See §16.

**Rule 0.2 (NEW in v1.2) — Concept vs Runtime separation.** Ontology holds concept entities (Aptitude, Skill, Certification as universal categories). Product-layer entities (a specific user's Observation, EvidenceItem, AlignmentResult) belong to peer ontologies (Digital Twin). GAS enforces this separation via naming discipline — concept entities named as generic categories; runtime entities forbidden in SCC.

---

## 2. Identifier conventions

### 2.1 Every entity has TWO identifiers

**Internal ID (system-generated, immutable):**
- Format: UUID v4 (36 characters, lowercase, hyphens)
- Example: `550e8400-e29b-41d4-a716-446655440000`
- Purpose: Neo4j internal referencing, API contracts, cross-system linking
- Property name: `id` (lowercase)

**Reference Code (human-readable, immutable):**
- Format: `<ENTITY_TYPE_PREFIX>-<DESCRIPTIVE_TOKEN>` — UPPERCASE, hyphenated
- Example: `INST-IITB`, `LIC-CPL`, `APT-NUMERICAL`, `CERT-AWS-CP`
- Property name: `<entity>_code`

**Rule 2.1a — Entity type prefixes (extended in v1.2):**

Previous v1.1 prefixes (retained):

| Entity | Prefix | Example |
|---|---|---|
| SCC Faculty | `FAC` | `FAC-SCIENCE` |
| Domain | `DOM` | `DOM-ENGINEERING` |
| Stream | `STR` | `STR-CS-ENG` |
| Education Stage | `EDU` | `EDU-JC1` |
| Subject | `SUB` | `SUB-PHYSICS` |
| Subject Level | `SLV` | `SLV-PHYSICS-JC1` |
| Subject Combination | `SCB` | `SCB-PCM` |
| Decision Point | `DCP` | `DCP-CHOOSE-PCM` |
| Criterion | `CRT` | `CRT-JEE-CUTOFF` |
| Entrance Exam | `EXAM` | `EXAM-JEE-MAIN` |
| Regulatory Body | `REG` | `REG-NTA` |
| Degree | `DEG` | `DEG-BTECH-CS` |
| Institution Type | `ITY` | `ITY-IIT` |
| Institution | `INST` | `INST-IITB` |
| Internship Type | `INT` | `INT-TECH-SUMMER` |
| Career Outcome | `CAR` | `CAR-SW-ENGINEER` |
| Salary Range | `SAL` | `SAL-SW-ENG-ENTRY` |
| Admission Pathway | `PATH` | `PATH-SPORTS` |
| Syllabus Topic | `SYL` | `SYL-JEE-MATH-CALC` |
| Subject Equivalence Rule | `SER` | `SER-APPMATH-MATH` |
| City | `CITY` | `CITY-PUN-MH` |
| Scholarship | `SCH` | `SCH-INSPIRE-SHE` |
| Education Loan | `LOAN` | `LOAN-SBI-SCHOLAR` |
| Licence | `LIC` | `LIC-CPL` |

**NEW v1.2 prefixes for concept entities added in v0.6:**

| Entity | Prefix | Example |
|---|---|---|
| Interest | `INT` (context-disambiguated from Internship via full property naming) or `INTR` | `INTR-SPACE` |
| Aptitude | `APT` | `APT-NUMERICAL-REASONING` |
| Skill | `SKL` | `SKL-PYTHON-PROGRAMMING` |
| PersonalityTrait | `TRT` | `TRT-INTROVERSION` |
| WorkPreference | `WPF` | `WPF-REMOTE-WORK` |
| Activity | `ACT` | `ACT-ROBOTICS-CLUB` |
| Project | `PRJ` | `PRJ-CAPSTONE-ENG` |
| Apprenticeship | `APP` | `APP-ELECTRICIAN-3YR` |
| Certification | `CERT` | `CERT-AWS-CP` |

**Naming disambiguation note:** `INT` used to reference both Internship Type and Interest. To avoid collision, either use `INTR` for Interest (recommended), or context-disambiguate via full property name.

**Recommendation:** Use `INTR` for Interest; retain `INT` for Internship Type.

**Rule 2.1b — Reference Code descriptive tokens:**
- Use uppercase, hyphens (never underscores or spaces)
- Use abbreviations only when widely understood (`CS`, `MBBS`, `IITB`)
- Location-scoped entities include state code: `CITY-PUN-MH`, `CITY-BLR-KA`
- Per-state Regulatory Bodies include state code: `REG-BAR-MH`, `REG-MED-KA`
- Maximum length: 30 characters

**Rule 2.1c — Placeholder IDs in ontology documents:**
The v0.6 ontology uses placeholder IDs like `APT-NUMERICAL-REASONING`. These become the actual Reference Codes at implementation.

---

## 3. Naming conventions

### 3.1 Node labels (Neo4j)

**Rule 3.1a — PascalCase, singular, no spaces or underscores.**

Previous mapping (v1.1) retained. New v0.6 concept entities:

| Ontology entity | Neo4j label |
|---|---|
| Interest | `Interest` |
| Aptitude | `Aptitude` |
| Skill | `Skill` |
| PersonalityTrait | `PersonalityTrait` |
| WorkPreference | `WorkPreference` |
| Activity | `Activity` |
| Project | `Project` |
| Apprenticeship | `Apprenticeship` |
| Certification | `Certification` |

**Rule 3.1b — Every node carries the Universe label as secondary.**

**Rule 3.1c — Multi-Universe entities carry all applicable Universe labels.** (See §11.5)

**Rule 3.1d (NEW in v1.2) — Concept entities are inherently Multi-Universe.** Aptitudes, Skills, Interests, Traits, WorkPreferences, Activities, Projects, Apprenticeships, and Certifications transcend Universes. Label them as `:MultiUniverse` by default. Example: `(:Skill:MultiUniverse {name:"Python"})`. Consumer platforms determine per-Universe applicability at query time.

### 3.2 Property names

Unchanged from v1.1. snake_case, lowercase, singular unless list.

### 3.3 Relationship types

Sections 3.3a–3.3f unchanged from v1.1. Additions below.

### 3.3g Cross-Jurisdictional Equivalence (formalised in v1.2 — was placeholder)

**Rule 3.3g-1 — Use `EQUIVALENT_TO` relationship for cross-jurisdictional Licence and Degree recognition.**

Direction: source jurisdiction → target jurisdiction. Example:

```
(:Licence {code:"LIC-CPL-INDIA-DGCA"})-[:EQUIVALENT_TO {
  target_jurisdiction: "USA",
  recognition_authority: "FAA",
  conversion_requirements: "FAA CPL conversion exam + English proficiency",
  effective_from: date("2018-01-01"),
  bilateral_agreement: true
}]->(:Licence {code:"LIC-CPL-USA-FAA"})
```

**Rule 3.3g-2 — Relationship properties on EQUIVALENT_TO:**

| Property | Type | Purpose |
|---|---|---|
| `target_jurisdiction` | String | Geographic scope (country, region) |
| `recognition_authority` | String | Recognising regulator |
| `conversion_requirements` | String (JSON allowed) | What the holder must do to convert |
| `effective_from` | Date | When recognition began |
| `effective_to` | Date (nullable) | When recognition expires (if applicable) |
| `bilateral_agreement` | Boolean | Whether the reverse is automatically recognised |
| `restrictions` | List | Any restrictions on the equivalence |

**Rule 3.3g-3 — Same pattern applies to Degrees:**

```
(:Degree {code:"DEG-MBBS-INDIA"})-[:EQUIVALENT_TO {
  target_jurisdiction: "UK",
  recognition_authority: "GMC",
  conversion_requirements: "PLAB test + IELTS + provisional registration",
  bilateral_agreement: false
}]->(:Degree {code:"DEG-MBBS-UK-EQUIVALENT"})
```

**Rule 3.3g-4 — EQUIVALENT_TO is distinct from SubjectEquivalenceRule.**
- `SubjectEquivalenceRule` = cross-board subject equivalence (IB Math HL ≡ Indian Class 12 Math)
- `EQUIVALENT_TO` = cross-jurisdictional professional credential recognition

### 3.3h Competency Requirement Relationships (NEW in v1.2)

**Rule 3.3h-1 — Streams and Career Outcomes reference concept entities via named requirement relationships.**

Direction: source (requirer) → target (concept). Example:

```
(:Stream {code:"STR-CS-ENG"})-[:REQUIRES_APTITUDE {
  requirement_type: "MANDATORY",
  minimum_threshold: "70th percentile"
}]->(:Aptitude {code:"APT-NUMERICAL-REASONING"})
```

**Rule 3.3h-2 — Five relationships in this family:**

| Relationship | Source | Target | Purpose |
|---|---|---|---|
| REQUIRES_APTITUDE | Stream / Career Outcome | Aptitude | Universal aptitude requirement |
| REQUIRES_SKILL | Stream / Career Outcome | Skill | Universal skill requirement |
| ALIGNS_WITH_INTEREST | Stream / Career Outcome | Interest | Career universally aligns with interest |
| FAVOURED_BY_TRAIT | Career Outcome | PersonalityTrait | Trait universally advantageous |
| INFLUENCED_BY_PREFERENCE | Stream / Career Outcome | WorkPreference | Career universally influenced by preference |

**Rule 3.3h-3 — All 5 relationships MUST carry `requirement_type` property using RequirementType enum:**

Values: `MANDATORY` | `PREFERENTIAL` | `DEVELOPMENTAL` | `CONTEXTUAL`

**Rule 3.3h-4 — Additional optional properties per relationship:**

| Property | Type | Applies to |
|---|---|---|
| `minimum_threshold` | String | REQUIRES_APTITUDE, REQUIRES_SKILL |
| `advantage_direction` | String enum: HIGH_ADVANTAGE / LOW_ADVANTAGE | FAVOURED_BY_TRAIT |
| `alignment_strength` | Float 0.0-1.0 | ALIGNS_WITH_INTEREST |
| `evidence_notes` | String | All 5 |

### 3.3i Experience → Concept Relationships (NEW in v1.2)

**Rule 3.3i-1 — Experience concept entities develop/validate Skills and Aptitudes via named relationships.**

Direction: experience → competency concept. Example:

```
(:Activity {code:"ACT-ROBOTICS-CLUB"})-[:DEVELOPS_SKILL {
  proficiency_gain: "Intermediate",
  typical_duration_months: 12
}]->(:Skill {code:"SKL-EMBEDDED-SYSTEMS"})
```

**Rule 3.3i-2 — Three relationships in this family:**

| Relationship | Source | Target | Purpose |
|---|---|---|---|
| DEVELOPS_SKILL | Activity / Project / Apprenticeship / Certification | Skill | Experience universally develops skill |
| VALIDATES_COMPETENCY | Certification | Skill / Aptitude | Certification universally validates competency |
| CONTRIBUTES_TO | Certification / Apprenticeship | Career Outcome | Experience universally contributes to career readiness |

**Rule 3.3i-3 — Optional properties:**

| Property | Type | Applies to |
|---|---|---|
| `proficiency_gain` | String enum | DEVELOPS_SKILL |
| `typical_duration_months` | Integer | DEVELOPS_SKILL |
| `certification_validity_expiry` | Boolean | VALIDATES_COMPETENCY (concept-level; individual user's expiry state is Digital Twin) |
| `contribution_weight` | Float 0.0-1.0 | CONTRIBUTES_TO |

### 3.3j Skill Prerequisite Chains (NEW in v1.2)

**Rule 3.3j-1 — Use `PREREQUISITE_OF` for skill dependency chains at concept level.**

```
(:Skill {code:"SKL-PYTHON-BASICS"})-[:PREREQUISITE_OF]->(:Skill {code:"SKL-ML-FUNDAMENTALS"})
```

**Rule 3.3j-2 — Cycle detection required (§9.5 extended).**

---

## 4. Cardinality expression

Unchanged from v1.1.

---

## 5. Structured field conventions

Unchanged from v1.1.

---

## 6. Refresh mechanics

Unchanged from v1.1.

**Rule 6.6 (NEW in v1.2) — Concept entities have Static refresh_frequency by default.**

Concept entities (Aptitude, Skill, Interest, Trait, WorkPreference, Activity, Project, Apprenticeship, Certification) rarely change at the concept level. When Python is a Skill, it stays a Skill. Individual instance changes (a user's Python proficiency) belong to Digital Twin runtime.

Exception: Certifications may be Annual refresh (industry_recognition_level, typical_cost_inr change).

---

## 7. Governance status codes

Unchanged from v1.1.

---

## 8. Governance properties

Unchanged from v1.1. Same 12 governance properties on every entity.

**Rule 8.2 (NEW in v1.2) — Concept entities have simpler data_owner:**
Concept entities typically have `data_owner: "ontology_team"` since they are curated once. Runtime entities (in Digital Twin peer ontology) have per-user data_owner.

---

## 9. Integrity audit queries

Rules 9.1–9.4 unchanged from v1.1.

**Rule 9.5 (extended in v1.2) — Cycle detection for PRECEDES and PREREQUISITE_OF.**

Extend previous cycle detection to include PREREQUISITE_OF:

```cypher
// Detect cycles in PREREQUISITE_OF chains
MATCH path = (s)-[:PREREQUISITE_OF*]->(s)
RETURN path AS cycle_detected, [n IN nodes(path) | n.name] AS involved_entities
```

Any result — critical error, must fix. Applies to Skill and SyllabusTopic PREREQUISITE_OF chains.

**Rule 9.6 (from v1.1) — Hierarchical regulator integrity.** Unchanged.

**Rule 9.7 (NEW in v1.2) — Unreachable Scholarship detector.**

For every Scholarship, verify at least one path exists to a valid student profile:

```cypher
// Detect Scholarships with unreachably restrictive eligibility
MATCH (s:Scholarship)
WHERE s.governance_status = 'Published'
WITH s, s.eligibility_categories AS cats, s.special_circumstance_eligibility AS special
WHERE size(cats) = 0 AND special IS NOT NULL AND size(special) > 3
RETURN s.name AS potentially_unreachable, cats, special
```

Threshold heuristic — Scholarship with >3 special circumstance requirements AND 0 general categories is flagged for manual review. Origin: NK Structural Integrity Test T49.

**Rule 9.8 (NEW in v1.2) — Dangling concept entity detector.**

Concept entities (Aptitude, Skill, etc.) should be referenced by at least one Stream or Career Outcome. Otherwise they are unused and should be reviewed:

```cypher
MATCH (c:Aptitude|Skill|Interest|PersonalityTrait|WorkPreference)
WHERE NOT ((:Stream)-[:REQUIRES_APTITUDE|REQUIRES_SKILL|ALIGNS_WITH_INTEREST|FAVOURED_BY_TRAIT|INFLUENCED_BY_PREFERENCE]->(c))
  AND NOT ((:CareerOutcome)-[:REQUIRES_APTITUDE|REQUIRES_SKILL|ALIGNS_WITH_INTEREST|FAVOURED_BY_TRAIT|INFLUENCED_BY_PREFERENCE]->(c))
RETURN c.name AS unused_concept
```

Result → review for either data population gap or concept deprecation.

**Rule 9.9 (NEW in v1.2) — Weekly integrity audit report schedule confirmed.** All rules 9.1–9.8 run weekly; findings reviewed monthly.

---

## 10. Versioning

Unchanged from v1.1.

---

## 11. Cross-Universe rules

Rules 11.1–11.5 unchanged from v1.1.

### 11.6 Multi-inheritance Conflict Resolution (NEW in v1.2)

Origin: NK Structural Integrity Test T46.

**Scenario:** A Stream that legitimately belongs to two Domains with conflicting requirements. Example: Data Science under both Engineering and Data Analytics Domains, where Engineering emphasises math-heavy skills and Data Analytics emphasises statistics-heavy skills.

**Rule 11.6-1 — Multi-inheritance is allowed for Streams.**

A Stream can have multiple `CONTAINED_IN` relationships to parent Domains:

```
(:Stream {code:"STR-DATA-SCIENCE"})-[:CONTAINED_IN {primary: true}]->(:Domain {code:"DOM-ENGINEERING"})
(:Stream {code:"STR-DATA-SCIENCE"})-[:CONTAINED_IN {primary: false}]->(:Domain {code:"DOM-DATA-ANALYTICS"})
```

**Rule 11.6-2 — Primary parent Domain designated via `primary: true` relationship property.**

When conflicting inherited concepts exist, the primary Domain wins by default.

**Rule 11.6-3 — Explicit override at Stream level always trumps inheritance.**

If a Stream explicitly declares REQUIRES_APTITUDE, that overrides any inherited default from parent Domains.

**Rule 11.6-4 — Requirements from secondary parents merge additively, not conflictingly.**

If Engineering Domain requires Aptitude A, and Data Analytics Domain requires Aptitude B, a Stream inheriting from both requires BOTH (union, not intersection). If both require the same Aptitude at different thresholds, primary parent's threshold applies.

**Rule 11.6-5 — Audit query for conflicting inheritance:**

```cypher
MATCH (s:Stream)-[:CONTAINED_IN]->(d1:Domain)
MATCH (s:Stream)-[:CONTAINED_IN]->(d2:Domain)
WHERE id(d1) < id(d2)
MATCH (d1)-[r1:REQUIRES_APTITUDE]->(a:Aptitude)
MATCH (d2)-[r2:REQUIRES_APTITUDE]->(a:Aptitude)
WHERE r1.requirement_type <> r2.requirement_type
RETURN s.name, a.name, r1.requirement_type AS primary_type, r2.requirement_type AS secondary_type
```

Result → resolve per Rule 11.6-2 (primary wins).

---

## 12. Data types and constraints

Unchanged from v1.1.

---

## 13. Neo4j-specific implementation notes

Unchanged from v1.1. Implementation-level detail remains in the separate Implementation Guide.

---

## 14. Rulebook change management

Unchanged from v1.1.

**Rule 14.5 (NEW in v1.2) — Concept entity additions require documented universality check.**

Before adding a new concept entity (like a new type of Aptitude), verify:
1. Is this concept universal (exists independent of any user or platform)?
2. Is it recognised in some standard framework (Big Five for Traits, industry certifications for Certifications)?
3. Does removing it lose descriptive power the ontology needs?

If unclear on any, defer.

---

## 15. Quick reference — worked example for CS Engineering with concept entities (updated v1.2)

Applying all GAS rules to a Stream with concept relationships:

```cypher
// Create the Stream
CREATE (s:Stream:ScienceUniverse {
  id: "550e8400-e29b-41d4-a716-446655440000",
  stream_code: "STR-CS-ENG",
  name: "Computer Science Engineering",
  path_type: "Core",
  domain_ref: "DOM-ENGINEERING",
  primary_faculty: "FAC-SCIENCE",
  ug_degree: "DEG-BTECH-CS",
  ug_duration_years: 4,
  version: "0.6",
  governance_status: "PUBLISHED",
  refresh_frequency: "ANNUAL",
  data_owner: "ontology_team"
  // ... additional properties
})

// Create concept entity relationships
MATCH (s:Stream {stream_code: "STR-CS-ENG"})
MATCH (a:Aptitude {aptitude_code: "APT-LOGICAL-REASONING"})
CREATE (s)-[:REQUIRES_APTITUDE {
  requirement_type: "MANDATORY",
  minimum_threshold: "70th percentile"
}]->(a)

MATCH (s:Stream {stream_code: "STR-CS-ENG"})
MATCH (sk:Skill {skill_code: "SKL-PYTHON-PROGRAMMING"})
CREATE (s)-[:REQUIRES_SKILL {
  requirement_type: "PREFERENTIAL",
  minimum_threshold: "Intermediate"
}]->(sk)

MATCH (s:Stream {stream_code: "STR-CS-ENG"})
MATCH (i:Interest {interest_code: "INTR-TECHNOLOGY"})
CREATE (s)-[:ALIGNS_WITH_INTEREST {
  alignment_strength: 0.9
}]->(i)
```

---

## 16. Scope boundary and derived GAS for peer ontologies

### 16.1 GAS scope statement

**Rule 16.1-1 — GAS v1.2 is authoritative for the SCC family of ontologies only.**

SCC ontologies share three structural assumptions:
1. Career paths are **structured** (defined, sequential)
2. Progression is **gated** (via exams, licences, degrees, or certification)
3. Entities are **hierarchical** (Faculty → Domain → Stream)

**Universes inside SCC (using this GAS):**
- Science Universe (v0.6 complete)
- Commerce Universe (v0.7, in build by Pranav)
- Law Universe (future)
- Civil Services (future)

### 16.2 Peer ontologies with different structural assumptions (UPDATED in v1.2)

**These need their own derived GAS, not this GAS as-is:**

**Digital Twin (RSA product-owned, NEW in v1.2 declaration)** — user-specific runtime data
- Structural difference: represents individual users with per-user Observations, Evidence, Alignment results
- Structural conflict: entities are per-user, not universal; refresh cadence is real-time not annual
- Recommendation: **Digital Twin GAS derived from this GAS** — reuse governance, versioning, casing. Replace static concept entities with runtime user entities. Add real-time refresh mechanics.

**Sports / Performance Career Layer** — achievement-based, not exam-gated
- Structural difference: no Entrance Exam entity fits; progression is portfolio + selection
- Recommendation: Sports GAS derived from this GAS

**Hobby / Exploration Layer** — non-career, non-gated
- Structural difference: no Career Outcome entity fits
- Recommendation: Hobby GAS derived from this GAS

**STC (Skills-to-Career)** — career progression after first job
- Structural difference: focuses on skill journey, not education path
- Recommendation: STC GAS derived from this GAS

**CTG (Career Transition Graph)** — cross-career pivots
- Structural difference: entities are careers, relationships are pivots
- Recommendation: CTG GAS derived from this GAS

**Labour Market Analytics** — future disruption risk, employment forecasts
- Structural difference: statistical projections vs static career facts
- Recommendation: Labour Market GAS derived from this GAS

**Research Ethics Layer** — plagiarism, data fabrication, AI in research
- Structural difference: policy/ethics framework, not career structure
- Recommendation: Research Ethics GAS derived from this GAS

### 16.3 GAS derivation guidance for peer ontologies

**Rule 16.3-1 — Peer ontology GAS should:**
1. Explicitly declare which SCC GAS rules are inherited unchanged
2. Explicitly declare which rules are replaced (with rationale)
3. Explicitly declare which rules are added (with rationale)

**Rule 16.3-2 — Multi-Universe entity rules (§11.5) apply across peer ontologies too.**

Example: An Aptitude concept entity is shared across SCC and Digital Twin (SCC defines it universally; Digital Twin references it when recording a user's aptitude test result).

### 16.4 What happens if a peer ontology has fundamentally incompatible structure

If an ontology cannot inherit even 50% of SCC GAS rules, it should:
1. Not derive from SCC GAS
2. Draft its own GAS independently
3. Document the interoperability contract with SCC (how entities cross-reference at query time)

Example: Life Decision Layer may fit this — it deals with family circumstances and mental health signals, not careers at all.

### 16.5 When to update this section

Update §16 whenever a new peer ontology is:
1. Approved for build
2. Its GAS derivation approach is decided
3. Any interoperability constraints are agreed

---

## 17. Concept Entity Discipline Notes (NEW in v1.2)

**Rule 17.1 — Concept entities describe universal categories, not user instances.**

Wrong: An Aptitude entity storing "User123's numerical reasoning score of 78th percentile."
Right: An Aptitude entity describing "Numerical Reasoning as a category, with standard measurement scales and typical assessment methods."

User scores go to Digital Twin runtime layer. Ontology stays universal.

**Rule 17.2 — Concept entities are inherently Multi-Universe.**

Aptitudes, Skills, Traits, Interests transcend Universes. Label as `:MultiUniverse` (per Rule 3.1d).

**Rule 17.3 — Concept entities have Static refresh frequency by default.**

Exceptions: Certification (industry_recognition_level shifts occasionally), Skill (new skills emerge — e.g., "Prompt Engineering" is newer). Mark these as Annual refresh, document reason.

**Rule 17.4 — Concept entities' data curation is centralised.**

Single ontology team owner. No per-Universe forks. If Commerce Universe needs a new Aptitude concept, it goes into the shared Aptitude registry, not a Commerce-specific one.

**Rule 17.5 — Concept entity ontology must reference authoritative frameworks where possible.**

- PersonalityTrait references Big Five, HEXACO, or Values framework
- Aptitude references DAT, GATB, or industry-standard aptitude batteries
- Skill references O*NET or industry skill taxonomies where applicable
- Certification references issuing body's own catalogue

If an entity cannot be traced to an authoritative external framework, document the rationale for creating it de novo.

**Rule 17.6 — Concept entity Reference Codes use standard terminology.**

`APT-NUMERICAL-REASONING` not `APT-MATH-BRAIN`. If the concept has a standard name, use it.

---

## 18. Summary — key implementation contracts (updated for v1.2)

| # | Rule | Section |
|---|---|---|
| 1 | UUID + Reference Code as dual identifier | §2 |
| 2 | PascalCase for node labels, snake_case for properties, UPPERCASE for relationships | §3 |
| 3 | Currency in INR paise integer; units suffixed in property names | §3.2, §12.2 |
| 4 | 12 governance properties on every entity | §8 |
| 5 | Refresh runs transactional; static properties never pipeline-updated | §6 |
| 6 | Governance status: Draft → Validated → Published → Deprecated (no delete) | §7 |
| 7 | Universe as secondary label; cross-Universe queries explicit | §11 |
| 8 | Semantic versioning; property never deleted between versions | §10 |
| 9 | JSON-encoded strings for structured fields | §5 |
| 10 | Integrity audits scheduled weekly | §9 |
| 11 | Sequential dependencies use PRECEDES relationship pattern | §3.3e |
| 12 | Hierarchical regulators use HAS_STATE_UNIT relationship pattern | §3.3f |
| 13 | Multi-Universe entities carry all applicable Universe labels | §11.5 |
| 14 | Peer ontologies derive their own GAS from this GAS | §16 |
| 15 **(NEW v1.2)** | Cross-jurisdictional Licence/Degree via EQUIVALENT_TO | §3.3g |
| 16 **(NEW v1.2)** | Competency requirements use REQUIRES_APTITUDE / REQUIRES_SKILL / ALIGNS_WITH_INTEREST / FAVOURED_BY_TRAIT / INFLUENCED_BY_PREFERENCE | §3.3h |
| 17 **(NEW v1.2)** | Experience develops competency via DEVELOPS_SKILL / VALIDATES_COMPETENCY / CONTRIBUTES_TO | §3.3i |
| 18 **(NEW v1.2)** | Skill prerequisite chains via PREREQUISITE_OF with cycle detection | §3.3j, §9.5 |
| 19 **(NEW v1.2)** | Multi-inheritance conflict: primary parent wins; requirements union additively | §11.6 |
| 20 **(NEW v1.2)** | Unreachable Scholarship detector as scheduled audit | §9.7 |
| 21 **(NEW v1.2)** | Dangling concept entity detector as scheduled audit | §9.8 |
| 22 **(NEW v1.2)** | Concept entities are Multi-Universe, Static refresh, ontology team-owned | §17 |
| 23 **(NEW v1.2)** | Digital Twin declared as peer ontology (RSA product-owned) | §16.2 |

---

## What Sandeep needs to do next

1. Adopt GAS v1.2 as the implementation contract
2. Update Cypher schema initialisation to add 8 new relationships (§3.3g, §3.3h, §3.3i, §3.3j)
3. Add 4 new audit query cronjobs (§9.5 extended, §9.7, §9.8)
4. Add concept entity constraints (§17)
5. Ensure all concept entities load with `:MultiUniverse` label
6. Ensure INTR-* / APT-* / SKL-* / TRT-* / WPF-* / ACT-* / PRJ-* / APP-* / CERT-* prefix disambiguation

**Once complete, v0.6 ontology + GAS v1.2 + Sandeep's Cypher (separate Implementation Guide) = ready for data load, extensible for Commerce Universe (v0.7) and future Universes without breaking changes.**

*End of GAS Rulebook v1.2.*
