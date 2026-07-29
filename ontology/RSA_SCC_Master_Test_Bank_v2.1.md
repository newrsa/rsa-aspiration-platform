# RSA SCC Ontology — Master Test Bank v2.1
**Ontology tested against:** RSA_SCC_Ontology_v0.6 (Revised)
**Baseline:** v2.0 (tested against v0.5.2)
**Change from v2.0:** Verdicts refreshed; Digital Twin runtime questions reclassified as peer ontology handoffs; 12 structural gaps closed by v0.6 marked

**Sources merged (unchanged from v2.0):**
- Nilesh (RSA) — 535 in-scope + 73 Stage 2 = 608 questions
- Pranav — 600 questions
- Sandeep — 36 handoff cases

**After deduplication (unchanged from v2.0):** 949 unique test questions

---

## Verdict scheme

| Symbol | Meaning |
|---|---|
| ✅ | Pass — schema handles it; data pipeline delivers |
| ⚠️-S | Partial-Structural OK — schema in place, data pending |
| ⚠️-D | Partial — both schema and data pending |
| ❌ | Structural gap |
| ↔ | Peer ontology handoff (correct behaviour, not a gap) |

## Peer ontologies now formally declared (as of v0.6)

Questions marked ↔ route to one of these peers:

| Peer ontology | Owns |
|---|---|
| **Digital Twin (RSA product)** | User-specific matching, evidence, alignment results, recommendations |
| **K-12 Education Ontology** | Board equivalence, medium of instruction, school stages |
| **STC (Skills-to-Career)** | Career progression after first job, milestones, long-term skill journey |
| **CTG (Career Transition Graph)** | Skill-based pivots between careers |
| **Life Decision Layer** | Family circumstances, mental health, wellbeing |
| **Employer/Company Dataset** | Per-employer salary variance, culture, ESOPs |
| **Coaching Ecosystem** | Prep costs, materials, mock tests |
| **Sports/Performance Career Layer** | Sports as primary career |
| **Hobby/Exploration Layer** | Non-career skill/interest development |
| **Decision Engine** | Comparative decisions, ROI, "worth it" judgements |
| **Labour Market Analytics** | Future disruption risk, employment forecasts |
| **Research Ethics Layer** | Plagiarism, data fabrication, AI in research |

## Source attribution key (unchanged from v2.0)

| Tag | Origin |
|---|---|
| [RSA] | Nilesh (RSA) original bank |
| [PRV] | Pranav's 600-question bank |
| [SDP] | Sandeep's handoff cases |
| [RSA+PRV] | Duplicate found in both, merged |
| [RSA+SDP] | Duplicate found in both, merged |
| [PRV+SDP] | Duplicate found in both, merged |

---

## Headline result — v0.6

| Verdict | Count | % |
|---|---|---|
| ✅ Pass | 692 | 73% |
| ⚠️-S Partial-Structural | 194 | 20% |
| ❌ Structural gap | 12 | 1.3% |
| ↔ Peer ontology handoff | 51 | 5.4% |
| **Total** | **949** | **100%** |

**Change from v2.0 (v0.5.2):**
- Pass: 620 → 692 (+72)
- Partial-S: 269 → 194 (−75)
- Structural gap: 24 → 12 (−12)
- Peer handoff: 36 → 51 (+15)
- Zero regressions on the 620 previously passing questions.

---

## Category coverage

| # | Category | Total | v0.6 Pass | v0.6 Partial-S | v0.6 Gap | v0.6 Peer |
|---|---|---|---|---|---|---|
| 1 | Path & Pathway | 140 | 115 | 25 | 0 | 0 |
| 2 | Eligibility & Subject | 55 | 47 | 6 | 2 | 0 |
| 3 | Entrance Exam | 90 | 78 | 12 | 0 | 0 |
| 4 | College & Institution | 55 | 26 | 28 | 1 | 0 |
| 5 | Cost & Duration | 62 | 26 | 36 | 0 | 0 |
| 6 | Career & Salary | 55 | 44 | 6 | 2 | 3 |
| 7 | Accessibility & Medical | 55 | 40 | 13 | 2 | 0 |
| 8 | Digital Twin Matching | 74 | 60 | 8 | 0 | 6 |
| 9 | Decision & Timing | 55 | 47 | 5 | 0 | 3 |
| 10 | Location & Geography | 45 | 37 | 8 | 0 | 0 |
| 11 | Financial Aid | 58 | 43 | 14 | 1 | 0 |
| 12 | Application Logistics | 40 | 27 | 12 | 1 | 0 |
| 13 | Non-medical Eligibility | 45 | 35 | 10 | 0 | 0 |
| Stage 2 Set A | Adjacent | 25 | 11 | 9 | 0 | 5 |
| Stage 2 Set B | Wellbeing + Sandeep | 55 | 30 | 0 | 0 | 25 |
| Stage 2 Set C | Out-of-domain + Sandeep | 40 | 26 | 0 | 3 | 11 |
| **Subtotal Stage 1** | | 829 | 625 | 183 | 9 | 12 |
| **Subtotal Stage 2** | | 120 | 67 | 11 | 3 | 39 |
| **GRAND TOTAL** | | **949** | **692** | **194** | **12** | **51** |

---

# SECTION A — STAGE 1 IN-SCOPE QUESTIONS (13 CATEGORIES)

## CATEGORY 1 — Path & Pathway (140 questions)

**Verdict summary:** 115 Pass (+7 from v0.5.2), 25 Partial-S, 0 Structural gap (down from 2)

**Wins in v0.6:**
- Q189 stream_duration_category → ✅ (Phase 2 field absorbed)
- Q195 sports careers → ↔ Sports/Performance Career Layer (peer)
- Q210 dropout_rate → ✅ (Phase 2 field absorbed)
- Q219 capstone project → ✅ (Project entity absorbs)
- Q228, Q229 AI/automation replacing engineers → ↔ Labour Market Analytics (peer, correct routing)

Sub-sections unchanged in structure — Q001-Q155 as documented in v2.0.

## CATEGORY 2 — Eligibility & Subject (55 questions)

**Verdict summary:** 47 Pass, 6 Partial-S, 2 Structural gap (unchanged)

Remaining 2 gaps (both deferred):
- Gap 2.A — Open schooling pathways to JEE/NEET (Q118 [PRV]) — K-12 crosswalk work
- Gap 2.B — International Board equivalence (Q34 NK stress) — SubjectEquivalenceRule population

## CATEGORY 3 — Entrance Exam (90 questions)

**Verdict summary:** 78 Pass (+10), 12 Partial-S, 0 Structural gap (down from 2)

**Wins in v0.6:**
- Q250 score/percentile/rank distinction → ✅ (scoring_types_available field absorbed)
- Q346 GATE sub-paper variants → ✅ (sub_paper_variants field absorbed)

The 12 Partial-S remaining are still per-exam data pipelines (NTA notifications, syllabus updates) — no schema work, just pipeline population.

## CATEGORY 4 — College & Institution (55 questions)

**Verdict summary:** 26 Pass (+5), 28 Partial-S, 1 Structural gap (down from 2)

**Wins in v0.6:**
- Q275 placement claims genuine → ✅ (placement_verification_status absorbed)

**1 remaining gap:**
- Gap 4.A — Hostel details (previously known; deferred as college-specific per Nilesh's rule)

## CATEGORY 5 — Cost & Duration (62 questions)

**Verdict summary:** 26 Pass, 36 Partial-S, 0 Structural gap (unchanged)

No v0.6 wins here — costs are already schema-complete; partials are pipeline population.

## CATEGORY 6 — Career & Salary (55 questions)

**Verdict summary:** 44 Pass (+2), 6 Partial-S, 2 Structural gap (unchanged), 3 Peer handoff

**Wins in v0.6:**
- Q382 career_ceiling_indicator → ✅ (Phase 2 field absorbed)
- Q527 family_status_restrictions → ✅ (Phase 2 field absorbed)

**Reclassifications:**
- Q392, Q393 "Will AI replace software/mechanical engineers?" → ↔ Labour Market Analytics peer (was ❌ in v2.0; correctly routed in v2.1)
- Q381 "Salary trajectory at 15 years?" → ↔ STC peer

**2 remaining gaps:**
- Gap 6.A — Complex comparative salary analysis (Decision Engine adjacent)
- Gap 6.B — Bonus structure variance across sectors (Employer Dataset adjacent)

## CATEGORY 7 — Accessibility & Medical Fitness (55 questions)

**Verdict summary:** 40 Pass, 13 Partial-S, 2 Structural gap (unchanged)

No v0.6 change — accessibility fields were already complete in v0.5.2.

**2 remaining gaps:**
- Gap 7.A — Specific psychiatric criteria for defence careers (AFMB data pending)
- Gap 7.B — Introversion/teamwork/communication mindset framing (belongs to Digital Twin peer)

## CATEGORY 8 — Digital Twin Matching (74 questions)

**Verdict summary:** 60 Pass (+6), 8 Partial-S, 0 Structural gap (down from 5), 6 Peer handoff

**Wins in v0.6:**
- Q503-Q508 aptitude concept questions → ✅ (Aptitude entity absorbs)
- Q519 cybersecurity + Certification → ✅ (Certification entity enriches)

**Reclassifications (5 questions moved from ❌ to ↔ Digital Twin peer):**
- Q509 [NK T37] Contradictory Evidence resolution → ↔ Digital Twin peer
- Q510 [NK T38] Expired Certification personal state → ↔ Digital Twin peer (concept-level in ontology; personal state in Digital Twin)
- Q511 [NK T39] Unverified skill claim → ↔ Digital Twin peer
- Q512 [NK T40] Blank Slate query response → ↔ Digital Twin peer
- Q513 [NK T46] Multi-Inheritance conflict → ✅ (discipline note documented; ontology-level resolvable)

**Additional reclassifications:**
- Q499 [PRV Q4] "How can student determine Science suitability?" → **partial reframing**. Ontology answers "what does Science require universally?" ✅. Digital Twin answers "does THIS student match?" ↔.

**All 5 previously-open Category 8 structural gaps are now closed or correctly routed.**

## CATEGORY 9 — Decision & Timing (55 questions)

**Verdict summary:** 47 Pass (+2), 5 Partial-S, 0 Structural gap (down from 2), 3 Peer handoff

**Reclassifications:**
- Q587 research problem identification → ↔ STC peer (from Partial-S)
- Q589, Q590 PhD topic/supervisor change → ↔ STC + Wellbeing peer (from Partial-S)

## CATEGORY 10 — Location & Geography (45 questions)

**Verdict summary:** 37 Pass, 8 Partial-S, 0 Structural gap (unchanged)

No v0.6 change — location was already complete.

## CATEGORY 11 — Financial Aid (58 questions)

**Verdict summary:** 43 Pass (+2), 14 Partial-S, 1 Structural gap (unchanged)

**Wins in v0.6:**
- Q679 PhD stipend as Scholarship with Stipend award_type → ✅ (discipline note documented)

**1 remaining gap:**
- Gap 11.A — Unreachable Scholarship audit query (GAS v1.2 audit work)

## CATEGORY 12 — Application Logistics (40 questions)

**Verdict summary:** 27 Pass (+2), 12 Partial-S, 1 Structural gap (unchanged)

**Wins in v0.6:**
- Q346 [existing] sub_paper_variants → ✅

**1 remaining gap:**
- Gap 12.A — Real-time application status tracking (external service integration; not schema)

## CATEGORY 13 — Non-medical Eligibility (45 questions)

**Verdict summary:** 35 Pass (+2), 10 Partial-S, 0 Structural gap (down from 1)

**Wins in v0.6:**
- Q527 family_status_restrictions → ✅
- Q778 [NK T31] OCI status + NDA vs NIT DASA quota → ✅ (citizenship_criteria handles)
- Q779 [NK T43] Revoked Medical Registration → ✅ (Licence.revocation_grounds handles)

---

# SECTION B — STAGE 2 (PEER ONTOLOGY ROUTING)

## STAGE 2 SET A — Adjacent (peer ontology handoffs) (25 questions)

**Verdict summary v0.6:** 11 Handoff clean, 9 Handoff needs work, 5 Handoff missing, 0 boundary drift

**Improvements from v0.5.2:**
- Digital Twin now a formally declared peer ontology → 2 previously-drifted questions now route cleanly
- Sports/Performance Career Layer now a formally declared peer → Q195-type questions route cleanly

## STAGE 2 SET B — Wellbeing + Sandeep Handoffs (55 questions)

**Verdict summary v0.6:** 30 route correctly to wellbeing / Life Decision Layer, 25 Sandeep handoffs routed correctly

Set B behaviour is largely unchanged in v0.6 — wellbeing questions still (correctly) route to Routing Tag Layer (26 tags) and out to Life Decision Layer, family layer, or medical helpline.

Sandeep's 30 handoff additions all route correctly:
- SDP-1 to SDP-6 (research supervision, PhD topic change) → STC + wellbeing
- SDP-7, SDP-8 (unpaid internship, backlogs) → Life Decision + Financial Aid
- SDP-9 to SDP-16 (peer influence, prestige, interest conflict) → Life Decision
- SDP-17 to SDP-22 (comparative decisions) → Decision Engine + Life Decision
- SDP-23 to SDP-30 (wellbeing-adjacent) → wellbeing routing

## STAGE 2 SET C — Out-of-domain + Sandeep Handoffs (40 questions)

**Verdict summary v0.6:** 26 Pass (Clean decline), 3 Structural gap (unchanged as they belong to peer), 11 Sandeep handoffs routed correctly

**Promotions to Stage 1 in v0.6:**
- SDP-C8 [Q572 PRV] "Identify exploitative internship?" → PROMOTED to Category 4 via internship_verification_status
- SDP-C10 [Q557 PRV] "Are placement claims genuine?" → PROMOTED to Category 4 via placement_verification_status

**3 remaining gaps in Set C (all correctly deferred to peer):**
- Research Ethics questions (Q595-Q600 [PRV]) → Research Ethics peer ontology (future)
- Predatory journal identification (Q594 [PRV]) → Research Ethics + LLM

---

# SECTION C — CONSOLIDATED FINDINGS FROM v0.6 RUN

## What v0.6 closed from v2.0's backlog

**12 structural gaps CLOSED in v0.6:**

| # | Gap | How closed |
|---|---|---|
| 1 | stream_duration_category | Phase 2 field absorbed |
| 2 | historical_dropout_rate_percent | Phase 2 field absorbed |
| 3 | sub_paper_variants on Entrance Exam | Phase 2 field absorbed |
| 4 | career_ceiling_indicator | Phase 2 field absorbed |
| 5 | family_status_restrictions | Phase 2 field absorbed |
| 6 | scoring_types_available on Entrance Exam | Phase 2 field absorbed |
| 7 | placement_verification_status on Institution | Phase 2 field absorbed |
| 8 | internship_verification_status on Internship Type | Phase 2 field absorbed |
| 9 | capstone_project_required | Project entity absorbs |
| 10 | certification_validity_expiry | Certification.validity_period_years field |
| 11 | Portfolio composition guidance | Activity + Project entities carry |
| 12 | Aptitude assessment framework | Aptitude entity with standard_assessment_methods |

## What v0.6 reclassified from ❌ to ↔ Peer handoff

**5 questions correctly routed to Digital Twin peer (was ❌ structural gap in v0.5.2):**

- Q509 Contradictory Evidence resolution [NK T37]
- Q510 Expired Certification personal state [NK T38] (partially — concept in ontology, state in DT)
- Q511 Unverified skill claim weighting [NK T39]
- Q512 Blank Slate query response [NK T40]
- Q499 Individual student suitability determination [PRV Q4]

## 12 remaining gaps in v0.6 — all correctly deferred

**5 gaps need v0.7+ ontology work:**
- Multi-Universe entity handling (waits for Commerce)
- International Board equivalence (SubjectEquivalenceRule population)
- Cross-institution/jurisdiction Licence recognition (GAS v1.2 placeholder)
- Multi-inheritance rule refinement (discipline note)
- Regulator peer group hierarchy (PEER_OF pattern beyond HAS_STATE_UNIT)

**4 gaps belong to peer ontologies (not SCC):**
- future_disruption_risk on Career Outcome → Labour Market Analytics peer
- Research advisory questions → STC peer
- Skill-vs-degree valuation → STC peer
- Temporal conflict enforcement → Decision Engine peer

**3 gaps are discipline notes / audit queries (GAS v1.2 work, not schema):**
- Unreachable Scholarship detector
- Dangling Career audit
- Infinite prerequisite loop check

---

# SECTION D — WHAT THE MASTER BANK v2.1 PROVES

**v0.6 achieves cleaner architectural boundaries under 4-source multi-perspective testing.**

- **73% Pass rate** across 949 unique questions (up from 65% in v0.5.2)
- **12 structural gaps** (down from 24)
- **Zero regressions** on previously passing questions
- **12 peer ontologies formally declared** — questions correctly route away rather than lingering as partial
- **Concept vs runtime separation** — universal facts stay in ontology; user matching goes to Digital Twin (future)

**No architectural changes required for v0.6.** All 12 remaining items are:
- v0.7+ ontology work (Commerce, international, peer group regulator)
- Peer ontology work (Labour Market Analytics, STC, CTG, Digital Twin, etc.)
- GAS v1.2 audit query work (Sandeep's implementation deliverable)

---

*End of Master Test Bank v2.1 — v0.6 regression.*
