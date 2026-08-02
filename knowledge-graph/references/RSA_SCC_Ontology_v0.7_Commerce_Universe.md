# RSA SCC Ontology v0.7 — Commerce Universe Technical Specification

**Version:** 0.7  
**Status:** Consolidated Commerce baseline for technical-team review  
**Domain:** Structured Career Category (SCC) — Commerce Universe  
**Foundation:** RSA SCC Ontology v0.6 — Science Universe  
**Source data:** `Structured - Commerce.xlsx` and `RSA_Commerce_Normalized_Domain_Stream_Registry.xlsx`  
**Registry size:** 15 normalized domains and 47 normalized streams  
**Intended use:** Source specification for graph-schema design, Cypher generation, data-pipeline planning, chatbot reasoning and subsequent question-bank stress testing.

> **Source discipline:** Directly supported workbook content is marked **Direct source**. Reclassified career outcomes are marked **Normalized from career outcomes**. Structural additions needed to create an ontology are marked **Normalized inference** or **Provisional**. Unsupported details are not presented as validated facts.

---

## Table of Contents

1. Purpose and scope  
2. Architectural foundation inherited from Science v0.6  
3. Commerce design principles  
4. Ontology hierarchy  
5. Universal governance and evidence metadata  
6. Inherited SCC entities  
7. Commerce-specific entities  
8. Normalized Commerce Domain Registry  
9. Normalized Commerce Stream Registry  
10. Subject combinations and cross-faculty entry  
11. Examination and qualification architecture  
12. Career-outcome and business-ecosystem architecture  
13. Controlled vocabularies  
14. Relationship inventory  
15. Validation and reasoning rules  
16. Derived calculations  
17. Gap treatment and data-quality controls  
18. Deferrals and ontology boundaries  
19. Implementation sequence  
20. Confidence statement

---

## 1. Purpose and Scope

This specification extends the common RSA Structured Career Category ontology from the Science Universe into the Commerce Universe.

The Commerce ontology is not a copy of the Science ontology with renamed streams. Commerce requires additional treatment of:

- statutory and non-statutory professional qualifications;
- multi-level professional examinations;
- articleship and prescribed practical training;
- professional membership;
- regulated practice rights;
- professional bodies that may examine, regulate and confer membership;
- recruitment examinations distinct from admission examinations;
- business functions that span multiple careers;
- financial instruments and regulated advisory work;
- compliance obligations with effective dates;
- enterprise, freelance and independent-practice pathways;
- flexible entry from Science, Arts, Vocational and Open Schooling backgrounds.

The ontology captures **universal and policy-governed facts about Commerce pathways**. Individual observations, scores, recommendations and counselling decisions remain in the RSA Aspirant Digital Twin and product reasoning layer.

---

## 2. Architectural Foundation Inherited from Science v0.6

Commerce v0.7 retains the common SCC architecture and its core separation of concerns:

```text
Faculty / Knowledge Area
    → Domain
        → Stream
            → Education Stage
            → Subject and Subject Level
            → Subject Combination
            → Decision Point and Criterion
            → Admission / Recruitment / Professional Examination
            → Degree / Professional Qualification / Licence / Certification
            → Institution / Professional Body
            → Internship / Practical Training / Apprenticeship
            → Career Outcome
            → Salary Range / City / Employment Mode
```

The following Science v0.6 principles remain binding:

1. **Define once, reuse everywhere.**
2. **Path, not label.**
3. **Every time-varying fact must be refreshable and sourced.**
4. **Ranges, not unsupported point estimates.**
5. **Degree ≠ Licence ≠ Certification.**
6. **Concept ontology ≠ individual Digital Twin data.**
7. **Competency and experience are first-class concepts.**
8. **Eligibility and suitability must remain distinct.**
9. **Human-review escalation is required when policy or evidence is incomplete.**
10. **No recommendation may hide missing evidence or stale data.**

Commerce v0.7 adds:

11. **Professional Qualification ≠ Degree ≠ Certification.**
12. **Exam passed ≠ Membership granted ≠ Practice right conferred.**
13. **Recruitment examination ≠ admission examination.**
14. **Business function ≠ stream ≠ occupation.**
15. **Employment mode ≠ career domain.**
16. **Financial knowledge does not imply permission to provide regulated advice.**

---

## 3. Commerce Design Principles

### 3.1 Qualification-chain principle

Professional careers such as Chartered Accountancy, Company Secretaryship, Cost and Management Accountancy and Actuarial Science are represented as ordered qualification chains with levels, examinations, training, membership and practice consequences.

### 3.2 Statutory-right principle

Where a career includes statutory signing, certification, audit, representation or advisory rights, those rights must be modeled separately and linked to the relevant regulator or professional body.

### 3.3 Function-versus-career principle

Accounting, audit, tax, compliance, procurement, marketing and analytics may describe business functions. The ontology does not automatically treat each function label as an occupation or qualification.

### 3.4 Cross-entry principle

Commerce-related pathways can be entered from multiple school or degree backgrounds. The ontology must never assume that every Commerce career requires a Commerce faculty background unless the applicable programme or body explicitly requires it.

### 3.5 Mathematics-precision principle

“Commerce with Mathematics,” “Commerce without Mathematics,” “Applied Mathematics,” “Statistics” and programme-specific quantitative prerequisites must be represented independently.

### 3.6 Regulatory-temporality principle

Tax, securities, banking, insurance, corporate and insolvency rules change over time. Every regulatory relationship must support jurisdiction and effective dates.

### 3.7 Source-confidence principle

Generic workbook phrases such as “Awareness,” “Advanced Skills,” “Expertise” and repeated salary ranges are not treated as ontology-grade facts until decomposed and validated.

---

## 4. Ontology Hierarchy

```text
RSA SCC
└── Commerce Universe
    ├── Structure and Journey
    │   ├── Faculty / Knowledge Area
    │   ├── Domain
    │   ├── Stream
    │   ├── Education Stage
    │   ├── Subject
    │   ├── Subject Level
    │   └── Subject Combination
    │
    ├── Gateway and Qualification
    │   ├── Admission Pathway
    │   ├── Examination
    │   ├── Examination Series
    │   ├── Professional Qualification
    │   ├── Qualification Level
    │   ├── Degree
    │   ├── Certification
    │   ├── Licence
    │   ├── Professional Membership
    │   └── Practice Right
    │
    ├── Professional and Regulatory Ecosystem
    │   ├── Regulatory Body
    │   ├── Professional Body
    │   ├── Institution
    │   ├── Business Function
    │   ├── Compliance Obligation
    │   ├── Financial Instrument
    │   └── Enterprise Path
    │
    ├── Competency and Experience
    │   ├── Interest
    │   ├── Aptitude
    │   ├── Skill
    │   ├── Personality Trait
    │   ├── Work Preference
    │   ├── Activity
    │   ├── Project
    │   ├── Internship
    │   ├── Practical Training
    │   └── Apprenticeship
    │
    └── Outcomes
        ├── Career Outcome
        ├── Employment Mode
        ├── Salary Range
        ├── City
        └── Continuing Professional Development
```

---

## 5. Universal Governance and Evidence Metadata

Every entity carries the common v0.6 governance block:

| Property | Type | Purpose |
|---|---|---|
| `id` | UUID | Immutable internal identifier |
| `<entity>_code` | String | Stable reference code |
| `created_at` | DateTime | Creation timestamp |
| `updated_at` | DateTime | Last update timestamp |
| `created_by` | String | User or pipeline |
| `updated_by` | String | User or pipeline |
| `version` | String | Ontology version |
| `governance_status` | Enum | Draft / Validated / Published / Deprecated |
| `refresh_frequency` | Enum | Static / Annual / 2-Yearly / On-Event |
| `last_refreshed` | Date | Latest refresh date |
| `source` | String | Authoritative source or workbook source |
| `data_owner` | String | Responsible team |

Commerce v0.7 adds the following evidence properties to source-sensitive entities and relationships:

| Property | Type | Notes |
|---|---|---|
| `normalization_basis` | Enum | DirectSource / CareerOutcomeDerived / NormalizedInference / Provisional |
| `source_sheet` | String | Original workbook sheet |
| `source_label` | String | Original source wording |
| `confidence_level` | Enum | High / Medium / Low |
| `validation_notes` | Text | Outstanding issue |
| `effective_from` | Date | Rule or policy start |
| `effective_to` | Date | Rule or policy end |
| `jurisdiction` | String | National / State / Body / International |

---

## 6. Inherited SCC Entities

The following entities are inherited from Science v0.6 without structural duplication:

1. SCC Faculty  
2. Domain  
3. Stream  
4. Education Stage  
5. Subject  
6. Subject Level  
7. Subject Combination  
8. Decision Point  
9. Criterion  
10. Entrance Exam — generalized in Commerce as `Examination`  
11. Regulatory Body  
12. Degree  
13. Institution Type  
14. Institution  
15. Admission Pathway  
16. Syllabus Topic  
17. Subject Equivalence Rule  
18. Internship Type  
19. Career Outcome  
20. Salary Range  
21. City  
22. Licence  
23. Scholarship  
24. Education Loan  
25. Interest  
26. Aptitude  
27. Skill  
28. Personality Trait  
29. Work Preference  
30. Activity  
31. Project  
32. Apprenticeship  
33. Certification  

### 6.1 Required modifications to inherited entities

#### Stream

Add:

| Property | Type | Notes |
|---|---|---|
| `entity_nature` | Enum | AcademicDiscipline / ProfessionalQualificationStream / FunctionalStream / EmploymentStream / ResearchStream / EnterpriseStream / GovernmentRecruitmentStream / InterdisciplinaryStream |
| `commerce_mathematics_requirement` | Enum | Mandatory / AppliedMathAccepted / Preferred / NotRequired / ProgrammeSpecific |
| `cross_faculty_entry_allowed` | Boolean | Whether non-Commerce backgrounds can enter |
| `professional_qualification_reference` | Reference | Optional |
| `business_functions` | List (Reference) | Functions served |
| `employment_modes_available` | List (Reference) | Employment modes |
| `regulatory_intensity` | Enum | Low / Moderate / High / Statutory |
| `independent_practice_possible` | Boolean | Whether self-practice is possible |
| `source_confidence` | Enum | High / Medium / Low |

#### Examination

Generalize `Entrance Exam` with:

| Property | Type | Notes |
|---|---|---|
| `exam_purpose` | Enum | Admission / Recruitment / ProfessionalProgression / Licensing / Certification / MembershipEligibility |
| `exam_series` | Reference | Optional parent series |
| `qualification_level_unlocked` | Reference | Optional |
| `employment_outcomes_unlocked` | List | For recruitment exams |
| `membership_consequence` | Reference | Optional |
| `practice_right_consequence` | Reference | Optional |
| `training_prerequisite` | Reference | Optional |

#### Career Outcome

Add:

| Property | Type | Notes |
|---|---|---|
| `business_functions` | List (Reference) | Functions performed |
| `employment_modes` | List (Reference) | Employed / Practice / Freelance / Enterprise / Government |
| `regulated_advice_status` | Enum | NotApplicable / Unregulated / CertificationRequired / LicenceRequired / MembershipRequired |
| `signing_authority` | Boolean | Whether statutory signing may be available |
| `practice_rights` | List (Reference) | Applicable rights |
| `professional_memberships` | List (Reference) | Required or preferred memberships |
| `instrument_knowledge_required` | List (Reference) | Financial instruments |
| `compliance_obligations` | List (Reference) | Relevant obligations |

---

# GROUP G — COMMERCE-SPECIFIC ENTITIES

## 7.1 Professional Qualification

A structured professional pathway awarded or recognized by a professional or regulatory body.

| # | Property | Type | Notes |
|---|---|---|---|
| 1 | `professional_qualification_id` | UUID | Immutable |
| 2 | `qualification_code` | String | E.g., `PQL-CA-IN` |
| 3 | `name` | String | Full name |
| 4 | `short_name` | String | CA / CS / CMA / Actuarial |
| 5 | `qualification_type` | Enum | StatutoryProfessional / InternationalProfessional / IndustryProfessional / ProfessionalDesignation |
| 6 | `awarding_body` | Reference: Professional Body | Primary body |
| 7 | `regulating_body` | Reference: Regulatory Body | If separate |
| 8 | `statutory_status` | Boolean | Whether established/recognized by statute |
| 9 | `entry_stage` | Reference: Education Stage | Typical entry |
| 10 | `entry_requirements` | Structured JSON | Subjects, marks, age, exemptions |
| 11 | `qualification_levels` | List (Reference) | Ordered levels |
| 12 | `professional_exam_series` | Reference | Exam chain |
| 13 | `practical_training_required` | Boolean | Yes/no |
| 14 | `practical_training` | List (Reference) | Articleship or training |
| 15 | `membership_required_for_title` | Boolean | Whether title requires membership |
| 16 | `membership_options` | List (Reference) | Associate/Fellow/etc. |
| 17 | `practice_rights_available` | List (Reference) | Rights after eligibility |
| 18 | `completion_duration_min_months` | Integer | Minimum |
| 19 | `completion_duration_typical_months` | Integer | Typical |
| 20 | `attempt_policy` | Structured JSON | Limits or progression rules |
| 21 | `exemptions_available` | Boolean | Yes/no |
| 22 | `exemption_rules` | List (Reference) | Qualification/exam exemptions |
| 23 | `degree_equivalence_status` | String | Only when officially supported |
| 24 | `continuing_education_required` | Boolean | CPD requirement |
| 25 | `active_status` | Boolean | Active/inactive |
| G1-G12 | Governance block | Common metadata | — |

## 7.2 Qualification Level

A formal level within a Professional Qualification.

| # | Property | Type | Notes |
|---|---|---|---|
| 1 | `qualification_level_id` | UUID | Immutable |
| 2 | `level_code` | String | Stable code |
| 3 | `name` | String | Foundation / Intermediate / Executive / Final / Professional |
| 4 | `parent_qualification` | Reference | Professional Qualification |
| 5 | `sequence_order` | Integer | Progression order |
| 6 | `entry_requirements` | Structured JSON | Requirements |
| 7 | `examinations` | List (Reference) | Exams at level |
| 8 | `training_requirements` | List (Reference) | Training |
| 9 | `completion_award` | String | Award/status |
| 10 | `unlocks_next_level` | Reference | Optional |
| 11 | `exit_status_if_not_continued` | String | Recognized status only if supported |
| 12 | `active_status` | Boolean | — |
| G1-G12 | Governance block | Common metadata | — |

## 7.3 Professional Examination Series

An ordered set of professional examinations.

| # | Property | Type | Notes |
|---|---|---|---|
| 1 | `series_id` | UUID | Immutable |
| 2 | `series_code` | String | Stable code |
| 3 | `name` | String | E.g., CA examination series |
| 4 | `professional_qualification` | Reference | Parent qualification |
| 5 | `conducting_body` | Reference | Professional body |
| 6 | `levels` | List (Reference) | Qualification levels |
| 7 | `progression_rule` | Structured JSON | Order, exemptions, group rules |
| 8 | `attempt_rules` | Structured JSON | Attempt constraints |
| 9 | `training_interlocks` | Structured JSON | Training/exam dependencies |
| 10 | `membership_consequence` | Reference | Optional |
| 11 | `active_status` | Boolean | — |
| G1-G12 | Governance block | Common metadata | — |

## 7.4 Professional Body

An institution that may examine, certify, regulate, grant membership or maintain professional standards.

| # | Property | Type | Notes |
|---|---|---|---|
| 1 | `professional_body_id` | UUID | Immutable |
| 2 | `body_code` | String | Stable code |
| 3 | `name` | String | Official name |
| 4 | `acronym` | String | Common acronym |
| 5 | `body_type` | Enum | StatutoryInstitute / MembershipAssociation / StandardSettingBody / CertificationBody / InternationalBody |
| 6 | `jurisdiction` | String | Scope |
| 7 | `statutory_basis` | String | Only if applicable |
| 8 | `roles` | List (Enum) | Examining / Regulating / Membership / Licensing / CPD / Standards |
| 9 | `qualifications_awarded` | List (Reference) | — |
| 10 | `memberships_granted` | List (Reference) | — |
| 11 | `practice_rights_administered` | List (Reference) | — |
| 12 | `official_website` | String | URL |
| 13 | `active_status` | Boolean | — |
| G1-G12 | Governance block | Common metadata | — |

## 7.5 Practical Training

A prescribed, supervised professional experience distinct from an ordinary internship.

| # | Property | Type | Notes |
|---|---|---|---|
| 1 | `practical_training_id` | UUID | Immutable |
| 2 | `training_code` | String | Stable code |
| 3 | `name` | String | Articleship / management training / supervised experience |
| 4 | `training_type` | Enum | Articleship / IndustrialTraining / ManagementTraining / AuditTraining / ComplianceTraining / SupervisedProfessionalExperience |
| 5 | `parent_qualification` | Reference | Optional |
| 6 | `mandatory_status` | Enum | Mandatory / Conditional / Optional |
| 7 | `duration_min_months` | Integer | Minimum |
| 8 | `duration_typical_months` | Integer | Typical |
| 9 | `eligible_start_level` | Reference | Qualification level |
| 10 | `approved_training_organisation_required` | Boolean | — |
| 11 | `approved_supervisor_required` | Boolean | — |
| 12 | `registration_required` | Boolean | — |
| 13 | `stipend_min_inr` | BigInt | Annual refresh |
| 14 | `stipend_max_inr` | BigInt | Annual refresh |
| 15 | `leave_rules` | Structured JSON | — |
| 16 | `transfer_rules` | Structured JSON | — |
| 17 | `completion_evidence` | List | Certificate/report/log |
| 18 | `exemption_rules` | Structured JSON | — |
| 19 | `skills_developed` | List (Reference) | — |
| 20 | `active_status` | Boolean | — |
| G1-G12 | Governance block | Common metadata | — |

## 7.6 Professional Membership

A membership status granted by a Professional Body.

| # | Property | Type | Notes |
|---|---|---|---|
| 1 | `membership_id` | UUID | Immutable |
| 2 | `membership_code` | String | Stable code |
| 3 | `name` | String | Student / Associate / Fellow / Affiliate / Practice |
| 4 | `membership_type` | Enum | Student / Associate / Fellow / Affiliate / Practice |
| 5 | `granting_body` | Reference | Professional Body |
| 6 | `qualification_prerequisites` | List (Reference) | — |
| 7 | `training_prerequisites` | List (Reference) | — |
| 8 | `experience_prerequisites_months` | Integer | — |
| 9 | `application_requirements` | Structured JSON | — |
| 10 | `fees_inr` | BigInt | Annual |
| 11 | `renewable` | Boolean | — |
| 12 | `renewal_frequency` | Enum | — |
| 13 | `cpd_hours_required` | Integer | — |
| 14 | `title_usage_right` | String | Title permitted |
| 15 | `practice_rights_unlocked` | List (Reference) | — |
| 16 | `disciplinary_jurisdiction` | String | — |
| 17 | `active_status` | Boolean | — |
| G1-G12 | Governance block | Common metadata | — |

## 7.7 Practice Right

A statutory, regulatory or body-governed authority to perform specified professional acts.

| # | Property | Type | Notes |
|---|---|---|---|
| 1 | `practice_right_id` | UUID | Immutable |
| 2 | `practice_right_code` | String | Stable code |
| 3 | `name` | String | E.g., audit/signing/advisory right |
| 4 | `right_type` | Enum | Audit / Certification / Representation / Compliance / Advisory / IndependentPractice / SigningAuthority |
| 5 | `granting_authority` | Reference | Regulator or professional body |
| 6 | `required_qualification` | Reference | — |
| 7 | `required_membership` | Reference | — |
| 8 | `required_licence` | Reference | Optional |
| 9 | `required_experience_months` | Integer | — |
| 10 | `jurisdiction` | String | — |
| 11 | `permitted_activities` | List (String) | — |
| 12 | `restricted_activities` | List (String) | — |
| 13 | `validity_period` | String | — |
| 14 | `renewal_requirements` | Structured JSON | — |
| 15 | `revocation_grounds` | List (String) | — |
| 16 | `active_status` | Boolean | — |
| G1-G12 | Governance block | Common metadata | — |

## 7.8 Business Function

A durable organizational function served by one or more streams and career outcomes.

| # | Property | Type | Notes |
|---|---|---|---|
| 1 | `business_function_id` | UUID | Immutable |
| 2 | `function_code` | String | Stable code |
| 3 | `name` | String | Accounting / Audit / Tax / Treasury / Compliance / etc. |
| 4 | `function_category` | Enum | Finance / Governance / Operations / Marketing / Analytics / Enterprise |
| 5 | `description` | Text | — |
| 6 | `related_streams` | List (Reference) | — |
| 7 | `career_outcomes` | List (Reference) | — |
| 8 | `skills_required` | List (Reference) | — |
| 9 | `compliance_obligations` | List (Reference) | — |
| 10 | `financial_instruments_used` | List (Reference) | — |
| 11 | `active_status` | Boolean | — |
| G1-G12 | Governance block | Common metadata | — |

## 7.9 Financial Instrument

A financial product or instrument that forms part of a stream’s knowledge or work context.

| # | Property | Type | Notes |
|---|---|---|---|
| 1 | `instrument_id` | UUID | Immutable |
| 2 | `instrument_code` | String | Stable code |
| 3 | `name` | String | Equity / Debt / Mutual Fund / Derivative / Insurance / etc. |
| 4 | `instrument_category` | Enum | Equity / Debt / Fund / Derivative / Insurance / Pension / Loan / Commodity / Currency / Alternative |
| 5 | `risk_level` | Enum | Low / Moderate / High / VeryHigh / Variable |
| 6 | `regulating_body` | Reference | Where applicable |
| 7 | `knowledge_streams` | List (Reference) | Streams requiring knowledge |
| 8 | `career_outcomes_using` | List (Reference) | — |
| 9 | `advisory_restrictions` | Text | Avoids conflating knowledge with advice authority |
| 10 | `active_status` | Boolean | — |
| G1-G12 | Governance block | Common metadata | — |

## 7.10 Compliance Obligation

A dated regulatory, statutory or institutional obligation relevant to a business function or career.

| # | Property | Type | Notes |
|---|---|---|---|
| 1 | `obligation_id` | UUID | Immutable |
| 2 | `obligation_code` | String | Stable code |
| 3 | `name` | String | Obligation name |
| 4 | `obligation_type` | Enum | Tax / CorporateFiling / FinancialReporting / Audit / Securities / Banking / Insurance / Trade / DataTechnology |
| 5 | `governing_authority` | Reference | — |
| 6 | `applicable_entity_types` | List | Company / firm / individual / institution |
| 7 | `responsible_business_functions` | List (Reference) | — |
| 8 | `responsible_career_outcomes` | List (Reference) | — |
| 9 | `frequency` | Enum | EventBased / Monthly / Quarterly / Annual / Continuous |
| 10 | `mandatory_status` | Enum | Statutory / Regulatory / Contractual / Voluntary |
| 11 | `required_knowledge` | List (Reference) | Subjects/skills |
| 12 | `effective_from` | Date | — |
| 13 | `effective_to` | Date | — |
| 14 | `source_url` | String | Authoritative source |
| 15 | `active_status` | Boolean | — |
| G1-G12 | Governance block | Common metadata | — |

## 7.11 Enterprise Path

A structured route into entrepreneurship or independent commercial activity.

| # | Property | Type | Notes |
|---|---|---|---|
| 1 | `enterprise_path_id` | UUID | Immutable |
| 2 | `enterprise_path_code` | String | Stable code |
| 3 | `name` | String | Sole proprietorship / partnership / consultancy / digital enterprise |
| 4 | `enterprise_type` | Enum | SoleProprietorship / Partnership / Company / ProfessionalPractice / Consultancy / Agency / DigitalEnterprise / Franchise / SocialEnterprise / FreelanceBusiness |
| 5 | `related_streams` | List (Reference) | — |
| 6 | `related_career_outcomes` | List (Reference) | — |
| 7 | `minimum_qualification` | Reference | Optional |
| 8 | `practice_right_required` | Reference | Optional |
| 9 | `registrations_required` | List | — |
| 10 | `licences_required` | List (Reference) | — |
| 11 | `typical_initial_investment_min_inr` | BigInt | Annual |
| 12 | `typical_initial_investment_max_inr` | BigInt | Annual |
| 13 | `revenue_models` | List | — |
| 14 | `operating_risks` | List | — |
| 15 | `digital_feasibility` | Enum | High / Moderate / Low |
| 16 | `scalability` | Enum | High / Moderate / Low / Variable |
| 17 | `active_status` | Boolean | — |
| G1-G12 | Governance block | Common metadata | — |

## 7.12 Employment Mode

A mode through which a career outcome is practised.

| # | Property | Type | Notes |
|---|---|---|---|
| 1 | `employment_mode_id` | UUID | Immutable |
| 2 | `employment_mode_code` | String | Stable code |
| 3 | `name` | String | Employment / Government / Freelance / Practice / Enterprise / Consulting |
| 4 | `mode_type` | Enum | SalariedPrivate / SalariedPublic / IndependentPractice / Freelance / Consulting / Entrepreneurial / AcademicResearch |
| 5 | `qualification_constraints` | List (Reference) | — |
| 6 | `membership_constraints` | List (Reference) | — |
| 7 | `practice_right_constraints` | List (Reference) | — |
| 8 | `income_variability` | Enum | Stable / Variable / HighlyVariable |
| 9 | `work_acquisition_method` | List | Recruitment / clients / platform / tender / network |
| 10 | `active_status` | Boolean | — |
| G1-G12 | Governance block | Common metadata | — |

---

## 8. Normalized Commerce Domain Registry

| Domain Code | Normalized Domain | Nature | Definition | Source Basis | Status | Confidence |
| --- | --- | --- | --- | --- | --- | --- |
| COM-DOM-ACC | Accounting, Audit & Assurance | Core Commerce | Accounting, financial reporting, audit and assurance pathways. | Accounting & Auditing; CA Pathway; CMA Pathway; Specialized Accounting | Validated | High |
| COM-DOM-TAX | Taxation | Compliance | Domestic and international taxation, tax advisory and tax compliance pathways. | Taxation category; CA Pathway; Specialized Accounting | Normalized | Medium |
| COM-DOM-GOV | Corporate Governance, Law & Compliance | Governance/Compliance | Corporate secretarial practice, legal compliance and governance pathways. | Corporate Law & Governance; CS Pathway | Validated | High |
| COM-DOM-BFS | Banking & Financial Services | Service/Finance | Banking operations, credit, lending and institutional financial-service pathways. | Banking & Financial Services; Banking Pathway | Validated | High |
| COM-DOM-FIN | Finance, Investment & Wealth | Analytical/Finance | Investment analysis, financial planning, wealth management and portfolio pathways. | Finance & Investment; Wealth Mgmt; CFA/CFP/NISM exams | Normalized | High |
| COM-DOM-MKT | Financial Markets & Trading | Analytical/Risk | Equity research, trading, derivatives, portfolio strategy and algorithmic-market pathways. | Financial Markets; Stock Market Advanced | Validated | High |
| COM-DOM-INS | Insurance, Risk & Actuarial Science | Analytical/Risk | Insurance analysis, actuarial practice and quantitative risk pathways. | Insurance & Risk Management; Actuarial | Validated | High |
| COM-DOM-ECO | Economics, Policy & Research | Analytical/Research | Economics, policy analysis, applied economic research and related analytical pathways. | Economics & Research; Economics Pathway | Validated | High |
| COM-DOM-ANA | Business, Financial & Commerce Analytics | Analytical/Digital | Business analytics, financial data analytics, BI and MIS pathways. | Data Analytics (Commerce); Data Analytics; Business Analytics | Validated | High |
| COM-DOM-FT | FinTech & Digital Finance | Tech/Finance | Digital payments, digital lending, blockchain compliance and InsurTech pathways. | FinTech & Digital Finance; FinTech; FinTech Advanced | Validated | High |
| COM-DOM-ECM | E-Commerce & Digital Business | Business/Tech | Marketplace, D2C, online business and e-commerce operations pathways. | E-Commerce & Digital Business; E-Commerce; E-Commerce Advanced | Validated | High |
| COM-DOM-MAR | Marketing, Advertising & Brand Communication | Business/Creative | Digital marketing, advertising, branding, media and public-relations pathways. | Digital Marketing; Advertising & Branding | Normalized | High |
| COM-DOM-OPS | Business Operations, Logistics & Trade | Operations | Procurement, inventory, logistics, export-import and vendor-management pathways. | Logistics & Supply Chain; Industry Operations | Normalized | High |
| COM-DOM-ENT | Entrepreneurship, Freelance & Independent Commerce | Enterprise | Digital enterprise, independent consulting and global freelance commerce pathways. | Business & Entrepreneurship; Global Freelance Careers; E-Commerce | Normalized | Medium |
| COM-DOM-PUB | Public Sector & Government Commerce Roles | Government | Commerce-linked public-sector, regulatory, banking and government examination pathways. | Public Sector & Govt Roles; Banking Pathway; Economics Pathway | Provisional | Medium |

### Domain modeling notes

- `COM-DOM-ECO` is multi-faculty and may connect to Commerce, Arts/Social Sciences and Science/Mathematics.
- `COM-DOM-FT`, `COM-DOM-ANA` and `COM-DOM-ECM` are explicitly interdisciplinary.
- `COM-DOM-PUB` is provisional because the workbook does not provide specific government services, examinations or pathway details.
- Taxation is separated from Accounting because it has distinct compliance, law and effective-date requirements.
- Financial Markets is separated from Finance and Wealth because trading, instrument knowledge and market regulation form a distinct pathway cluster.
- Entrepreneurship and freelance activity are represented as a domain only where a coherent learning pathway exists; employment mode remains separately modeled.

---

## 9. Normalized Commerce Stream Registry


### 9.1 Accounting, Audit & Assurance (`COM-DOM-ACC`)

| Stream Code | Normalized Stream | Parent Domain | Entity Nature | Path Type | Career Outcomes from Source | Source Basis | Normalization Basis | Confidence | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| COM-STR-CA | Chartered Accountancy | COM-DOM-ACC | Professional Qualification | Core | Chartered Accountant; Auditor; Tax Consultant; CFO | CA Pathway | Direct source | High | Keep qualification, exam series, articleship and practice rights separate. |
| COM-STR-CMA | Cost & Management Accountancy | COM-DOM-ACC | Professional Qualification | Core | Cost Accountant; Financial Controller; Pricing Analyst | CMA Pathway | Direct source | High | Formal practical training and professional membership required. |
| COM-STR-FA | Financial Accounting & Reporting | COM-DOM-ACC | Academic/Professional Stream | Core | Financial Accountant; Reporting Analyst; Accounts Executive | Accounting & Auditing category; CA/CMA subject layers | Normalized inference | Medium | Source supports accounting domain but does not provide a dedicated pathway sheet. |
| COM-STR-AUD | Audit & Assurance | COM-DOM-ACC | Professional Practice Stream | Specialized | Auditor; Internal Auditor; Assurance Associate | CA Pathway | Normalized from career outcomes | High | Statutory and internal audit should be separated at outcome/practice-right level. |
| COM-STR-FORACC | Forensic Accounting | COM-DOM-ACC | Specialized Stream | Niche | Forensic Accountant; Fraud Analyst | Specialized Accounting; CA Pathway | Normalized from career outcomes | High | Requires investigation and data-analysis relationships. |
| COM-STR-INSOLV | Insolvency & Restructuring | COM-DOM-ACC | Professional Practice Stream | Niche | Insolvency Professional; Restructuring Analyst | Specialized Accounting | Normalized from career outcomes | Medium | Regulated professional status must be modeled separately. |

### 9.2 Taxation (`COM-DOM-TAX`)

| Stream Code | Normalized Stream | Parent Domain | Entity Nature | Path Type | Career Outcomes from Source | Source Basis | Normalization Basis | Confidence | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| COM-STR-DTAX | Direct Taxation | COM-DOM-TAX | Compliance Stream | Specialized | Tax Consultant; Direct Tax Analyst | Taxation category; CA Pathway | Normalized inference | Medium | Dedicated source sheet absent. |
| COM-STR-IDTAX | Indirect Taxation & GST | COM-DOM-TAX | Compliance Stream | Specialized | GST Consultant; Indirect Tax Analyst | Taxation category; CA Pathway | Normalized inference | Medium | Dedicated source sheet absent. |
| COM-STR-INTTAX | International Tax & Transfer Pricing | COM-DOM-TAX | Specialized Stream | Niche | International Tax Consultant; Transfer Pricing Analyst | Specialized Accounting | Normalized from career outcomes | High | International tax and transfer pricing should remain distinct specialisations. |

### 9.3 Corporate Governance, Law & Compliance (`COM-DOM-GOV`)

| Stream Code | Normalized Stream | Parent Domain | Entity Nature | Path Type | Career Outcomes from Source | Source Basis | Normalization Basis | Confidence | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| COM-STR-CS | Company Secretaryship | COM-DOM-GOV | Professional Qualification | Core | Company Secretary; Compliance Officer; Legal Advisor | CS Pathway | Direct source | High | Professional qualification, membership and practice right must be distinct. |
| COM-STR-COMP | Corporate Compliance & Governance | COM-DOM-GOV | Governance Stream | Specialized | Compliance Officer; Governance Analyst | CS Pathway; Corporate Law & Governance category | Normalized from career outcomes | High | Broader than the CS qualification itself. |

### 9.4 Banking & Financial Services (`COM-DOM-BFS`)

| Stream Code | Normalized Stream | Parent Domain | Entity Nature | Path Type | Career Outcomes from Source | Source Basis | Normalization Basis | Confidence | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| COM-STR-BANK | Banking Operations | COM-DOM-BFS | Employment Stream | Core | Bank PO; Branch Manager; Banking Operations Officer | Banking Pathway | Direct source | High | IBPS/SBI are recruitment exams, not academic entrance exams. |
| COM-STR-CREDIT | Credit, Lending & Underwriting | COM-DOM-BFS | Functional Stream | Specialized | Credit Analyst; Lending Analyst; Underwriter | Banking Pathway; FinTech Advanced | Normalized from career outcomes | High | Links banking and digital lending domains. |

### 9.5 Finance, Investment & Wealth (`COM-DOM-FIN`)

| Stream Code | Normalized Stream | Parent Domain | Entity Nature | Path Type | Career Outcomes from Source | Source Basis | Normalization Basis | Confidence | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| COM-STR-WM | Wealth Management | COM-DOM-FIN | Professional/Employment Stream | Core | Wealth Manager; Investment Advisor; Portfolio Manager | Wealth Mgmt | Direct source | High | Advice-related roles may require certifications and regulatory eligibility. |
| COM-STR-FP | Financial Planning | COM-DOM-FIN | Professional Stream | Specialized | Financial Planner; Personal Finance Advisor | Wealth Mgmt; CFP Certification | Normalized inference | High | CFP is a certification, not the stream itself. |
| COM-STR-INV | Investment Analysis | COM-DOM-FIN | Analytical Stream | Specialized | Investment Analyst; Finance Analyst | Finance & Investment category; CFA Level 1 | Normalized inference | Medium | Dedicated pathway sheet absent. |

### 9.6 Financial Markets & Trading (`COM-DOM-MKT`)

| Stream Code | Normalized Stream | Parent Domain | Entity Nature | Path Type | Career Outcomes from Source | Source Basis | Normalization Basis | Confidence | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| COM-STR-EQRES | Equity Research | COM-DOM-MKT | Analytical Stream | Specialized | Equity Research Analyst | Stock Market Advanced | Normalized from career outcomes | High | Separate from trading and portfolio management. |
| COM-STR-TRD | Trading & Derivatives | COM-DOM-MKT | Markets Stream | Niche | Derivatives Trader; Market Trader | Stock Market Advanced | Normalized from career outcomes | High | Instrument knowledge should be attached through Financial Instrument entities. |
| COM-STR-PORT | Portfolio Strategy | COM-DOM-MKT | Markets Stream | Specialized | Portfolio Strategist; Portfolio Analyst | Stock Market Advanced; Wealth Mgmt | Normalized from career outcomes | High | Portfolio Manager remains a career outcome/licensed role where applicable. |
| COM-STR-ALGO | Algorithmic Trading Analytics | COM-DOM-MKT | Tech/Markets Stream | Emerging | Algo Trading Analyst; Quantitative Market Analyst | Stock Market Advanced | Normalized from career outcomes | High | Cross-domain link to analytics and technology required. |

### 9.7 Insurance, Risk & Actuarial Science (`COM-DOM-INS`)

| Stream Code | Normalized Stream | Parent Domain | Entity Nature | Path Type | Career Outcomes from Source | Source Basis | Normalization Basis | Confidence | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| COM-STR-ACT | Actuarial Science | COM-DOM-INS | Professional Qualification Stream | Advanced-systems | Actuary; Risk Analyst; Insurance Analyst | Actuarial | Direct source | High | Multi-level professional exam series and work-experience requirements. |
| COM-STR-INSRISK | Insurance & Risk Analysis | COM-DOM-INS | Analytical Stream | Specialized | Insurance Analyst; Risk Analyst | Insurance & Risk Management category; Actuarial | Normalized inference | Medium | Dedicated non-actuarial insurance pathway sheet absent. |

### 9.8 Economics, Policy & Research (`COM-DOM-ECO`)

| Stream Code | Normalized Stream | Parent Domain | Entity Nature | Path Type | Career Outcomes from Source | Source Basis | Normalization Basis | Confidence | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| COM-STR-ECO | Economics | COM-DOM-ECO | Academic Discipline | Core | Economist; Policy Analyst; Data Analyst | Economics Pathway | Direct source | High | Economics may also belong to Arts/Social Sciences; mark as multi-faculty. |
| COM-STR-POL | Economic Policy & Applied Research | COM-DOM-ECO | Research Stream | Specialized | Policy Analyst; Economic Researcher | Economics Pathway | Normalized from career outcomes | High | Research methods and public-policy links required. |

### 9.9 Business, Financial & Commerce Analytics (`COM-DOM-ANA`)

| Stream Code | Normalized Stream | Parent Domain | Entity Nature | Path Type | Career Outcomes from Source | Source Basis | Normalization Basis | Confidence | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| COM-STR-FDA | Financial Data Analytics | COM-DOM-ANA | Analytical/Digital Stream | Core | Financial Data Analyst; Data Analyst; BI Analyst | Data Analytics | Direct source | High | Do not conflate with generic Data Science. |
| COM-STR-BA | Business Analytics | COM-DOM-ANA | Analytical/Digital Stream | Core | Business Analyst; Revenue Analyst; Pricing Analyst; CRM Analyst | Business Analytics | Direct source | High | Career outcomes should be separated from the academic/skill pathway. |
| COM-STR-BI | Business Intelligence & MIS | COM-DOM-ANA | Analytical/Digital Stream | Specialized | BI Analyst; MIS Analyst | Data Analytics; Business Analytics | Normalized from career outcomes | High | Requires tools and data-visualisation skill mappings. |

### 9.10 FinTech & Digital Finance (`COM-DOM-FT`)

| Stream Code | Normalized Stream | Parent Domain | Entity Nature | Path Type | Career Outcomes from Source | Source Basis | Normalization Basis | Confidence | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| COM-STR-FT | FinTech | COM-DOM-FT | Interdisciplinary Stream | Emerging | FinTech Analyst; Product Manager; Digital Payments Specialist | FinTech | Direct source | High | Umbrella stream; advanced substreams should be children. |
| COM-STR-PAY | Digital Payments | COM-DOM-FT | Digital Finance Stream | Emerging | Payments Specialist; Digital Payments Analyst | FinTech; FinTech Advanced | Normalized from career outcomes | High | Distinct from the umbrella FinTech stream. |
| COM-STR-DLEND | Digital Lending | COM-DOM-FT | Digital Finance Stream | Emerging | Digital Lending Analyst | FinTech Advanced | Normalized from career outcomes | High | Credit/lending is cross-linked to Banking. |
| COM-STR-BCC | Blockchain & Crypto Compliance | COM-DOM-FT | Digital Compliance Stream | Edge-case | Blockchain Analyst; Crypto Compliance Analyst | FinTech Advanced | Normalized from career outcomes | High | Should not be modeled as investment advice. |
| COM-STR-INST | InsurTech | COM-DOM-FT | Interdisciplinary Stream | Emerging | InsurTech Specialist | FinTech Advanced | Normalized from career outcomes | High | Cross-domain link to Insurance & Risk. |

### 9.11 E-Commerce & Digital Business (`COM-DOM-ECM`)

| Stream Code | Normalized Stream | Parent Domain | Entity Nature | Path Type | Career Outcomes from Source | Source Basis | Normalization Basis | Confidence | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| COM-STR-ECOM | E-Commerce Management | COM-DOM-ECM | Digital Business Stream | Core | E-Commerce Manager; Marketplace Specialist | E-Commerce | Direct source | High | Umbrella stream for online commerce operations. |
| COM-STR-MKTPL | Marketplace Operations | COM-DOM-ECM | Digital Operations Stream | Specialized | Marketplace Manager; Catalog Specialist | E-Commerce; E-Commerce Advanced | Normalized from career outcomes | High | Catalog, seller and platform operations belong here. |
| COM-STR-D2C | D2C & Online Entrepreneurship | COM-DOM-ECM | Enterprise Stream | Emerging | D2C Brand Manager; Dropshipping Entrepreneur; Online Business Owner | E-Commerce Advanced; E-Commerce | Normalized from career outcomes | High | Links to Enterprise Path. |
| COM-STR-ESUP | E-Commerce Supply Chain | COM-DOM-ECM | Digital Operations Stream | Specialized | E-Commerce Supply Chain Analyst | E-Commerce Advanced | Normalized from career outcomes | High | Cross-domain link to Logistics. |

### 9.12 Marketing, Advertising & Brand Communication (`COM-DOM-MAR`)

| Stream Code | Normalized Stream | Parent Domain | Entity Nature | Path Type | Career Outcomes from Source | Source Basis | Normalization Basis | Confidence | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| COM-STR-DM | Digital Marketing | COM-DOM-MAR | Digital Marketing Stream | Core | Digital Marketing Specialist; SEO Analyst; Social Media Manager; Performance Marketer | Digital Marketing | Direct source | High | Specialisations should become child streams or career outcomes. |
| COM-STR-BRAND | Advertising & Brand Management | COM-DOM-MAR | Creative/Business Stream | Core | Brand Manager; Advertising Executive; Marketing Analyst | Advertising & Branding | Direct source | High | Branding and advertising can share a domain but need outcome separation. |
| COM-STR-MEDIA | Media Planning & Public Relations | COM-DOM-MAR | Communication Stream | Specialized | Media Planner; PR Specialist; Content Strategist | Advertising & Branding; Digital Marketing | Normalized from career outcomes | High | Multi-faculty link to communication/media studies. |

### 9.13 Business Operations, Logistics & Trade (`COM-DOM-OPS`)

| Stream Code | Normalized Stream | Parent Domain | Entity Nature | Path Type | Career Outcomes from Source | Source Basis | Normalization Basis | Confidence | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| COM-STR-PROC | Procurement & Vendor Management | COM-DOM-OPS | Operations Stream | Specialized | Procurement Manager; Vendor Manager | Industry Operations | Normalized from career outcomes | High | Business-function stream. |
| COM-STR-LOG | Inventory, Logistics & Supply Chain | COM-DOM-OPS | Operations Stream | Core | Inventory Controller; Logistics Analyst | Industry Operations; Logistics & Supply Chain category | Normalized from career outcomes | High | Dedicated pathway data needs expansion. |
| COM-STR-EXIM | Export-Import & International Trade Operations | COM-DOM-OPS | Trade Operations Stream | Specialized | Export-Import Specialist | Industry Operations | Normalized from career outcomes | High | Requires customs, trade documentation and compliance concepts. |

### 9.14 Entrepreneurship, Freelance & Independent Commerce (`COM-DOM-ENT`)

| Stream Code | Normalized Stream | Parent Domain | Entity Nature | Path Type | Career Outcomes from Source | Source Basis | Normalization Basis | Confidence | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| COM-STR-FREEL | Commerce Freelancing & Remote Advisory | COM-DOM-ENT | Independent Work Stream | Emerging | Remote Bookkeeper; Freelance Financial Consultant; Online Business Consultant | Global Freelance Careers | Direct source normalized | High | Global Freelance Careers is an employment mode; normalized into a stream plus outcomes. |
| COM-STR-CREATOR | Creator Economy & Digital Business Management | COM-DOM-ENT | Digital Enterprise Stream | Emerging | Creator Economy Manager; Affiliate Marketer | Global Freelance Careers; Digital Marketing | Normalized from career outcomes | Medium | Source supports roles but not a full pathway. |
| COM-STR-ENT | Commerce Entrepreneurship & Enterprise Management | COM-DOM-ENT | Enterprise Stream | Core | Entrepreneur; Business Owner; Consultant | Business & Entrepreneurship category; E-Commerce | Normalized inference | Medium | Needs enterprise-type and regulatory-registration entities. |

### 9.15 Public Sector & Government Commerce Roles (`COM-DOM-PUB`)

| Stream Code | Normalized Stream | Parent Domain | Entity Nature | Path Type | Career Outcomes from Source | Source Basis | Normalization Basis | Confidence | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| COM-STR-PUBBANK | Public-Sector Banking & Finance Recruitment | COM-DOM-PUB | Government Recruitment Stream | Core | Bank PO; Public-Sector Banking Officer | Banking Pathway; Public Sector & Govt Roles category | Normalized inference | Medium | Recruitment pathway, not an academic stream. |
| COM-STR-PUBPOL | Government Economic & Statistical Services | COM-DOM-PUB | Government Recruitment Stream | Specialized | Government Economist; Statistical/Economic Officer | Economics Pathway; Public Sector & Govt Roles category | Normalized inference | Low | Specific services/exams are not present in the source workbook. |

### Stream interpretation rules

- A listed career outcome is not automatically treated as the stream itself.
- Professional qualifications retain their own qualification, examination, training and membership structures.
- Streams marked **Normalized inference** require expert or authoritative-source validation before publication.
- `COM-STR-PUBPOL` remains low confidence because the workbook does not identify specific government services or examinations.
- Salary values from the source workbook are not loaded into Salary Range records because the repeated `₹4–25+ LPA` value is not sufficiently specific.

---

## 10. Subject Combinations and Cross-Faculty Entry

### 10.1 Canonical Commerce combinations

```text
COM-SCB-AEB
Accountancy + Economics + Business Studies

COM-SCB-AEM
Accountancy + Economics + Mathematics

COM-SCB-AEAM
Accountancy + Economics + Applied Mathematics

COM-SCB-ABI
Accountancy + Business Studies + Informatics Practices

COM-SCB-AEE
Accountancy + Economics + Entrepreneurship

COM-SCB-COM-NOMATH
Commerce combination without Mathematics

COM-SCB-MIXED
Programme-specific mixed Commerce-Humanities/Science/Vocational combination
```

### 10.2 Subject requirement model

A programme or qualification must declare each subject requirement as:

| Field | Values |
|---|---|
| `requirement_type` | Mandatory / Preferred / AcceptedAlternative / NotRequired |
| `subject` | Reference: Subject |
| `subject_level` | Reference: Subject Level |
| `minimum_score` | Decimal or null |
| `accepted_equivalents` | List: Subject Equivalence Rule |
| `applies_to` | Stream / Degree / Professional Qualification / Examination / Institution Programme |
| `effective_period` | From–to dates |
| `source` | Authoritative source |

### 10.3 Cross-faculty pathways

Required admission-pathway values:

- Commerce to Commerce
- Science to Commerce
- Arts/Humanities to Commerce
- Vocational to Commerce
- Open Schooling to Commerce
- Any Graduate to Professional Qualification
- Any Graduate to Finance/Analytics
- Programme-Specific Cross-Entry
- Bridge-Course Entry
- Lateral Entry
- Experience/RPL Entry — deferred pending common NEP credit layer

### 10.4 Non-assumption rule

The ontology must not infer that:

- Commerce without Mathematics blocks all finance or analytics pathways;
- Commerce is mandatory for every professional qualification;
- a school subject combination alone proves eligibility;
- a degree title automatically grants regulated practice rights.

---

## 11. Examination and Qualification Architecture

### 11.1 Unified Examination taxonomy

```text
Examination
├── Admission Examination
├── Recruitment Examination
├── Professional Progression Examination
├── Licensing Examination
├── Certification Examination
└── Membership Eligibility Examination
```

### 11.2 Example classification from source workbook

| Source item | Normalized exam purpose | Primary target |
|---|---|---|
| CA Foundation / Intermediate / Final | Professional Progression | Chartered Accountancy |
| CSEET / CS Executive / Professional | Professional Progression | Company Secretaryship |
| CMA Foundation / Intermediate / Final | Professional Progression | Cost & Management Accountancy |
| Actuarial examinations | Professional Progression | Actuarial Science |
| IBPS PO / SBI PO | Recruitment | Public-sector banking outcomes |
| CUET UG/PG | Admission | Degree programmes |
| NISM examinations/certifications | Certification or Regulatory Eligibility | Markets/wealth outcomes |
| CFP examination | Certification | Financial planning |
| CFA Level I | Professional Progression / Professional Designation | Investment analysis |

> Final exam classification must be verified against the responsible body’s current rules before publication.

### 11.3 Qualification-state sequence

```text
Eligible
  → Registered
  → Level Attempted
  → Level Passed
  → Training Started
  → Training Completed
  → Qualification Completed
  → Membership Applied
  → Membership Granted
  → Practice Eligibility Assessed
  → Practice Right Granted
```

Not every qualification uses every state.

### 11.4 Exemption rule entity pattern

```yaml
ExemptionRule:
  exemption_rule_code: string
  source_qualification: reference
  target_exam_or_level: reference
  exemption_scope: paper | group | level | training
  conditions: structured
  effective_from: date
  effective_to: date
  source: authoritative
  confidence: high | medium | low
```

---

## 12. Career-Outcome and Business-Ecosystem Architecture

### 12.1 Business-function registry starter set

```text
Accounting
Financial Reporting
Audit
Assurance
Direct Tax
Indirect Tax
International Tax
Corporate Secretarial
Corporate Compliance
Governance
Banking Operations
Credit
Lending
Underwriting
Treasury
Investment Analysis
Wealth Management
Financial Planning
Equity Research
Trading
Portfolio Strategy
Insurance
Risk Management
Actuarial Analysis
Economic Research
Public Policy Analysis
Business Analytics
Financial Data Analytics
Business Intelligence
Digital Payments
Digital Lending
Blockchain Compliance
E-Commerce Operations
Marketplace Operations
Digital Marketing
Brand Management
Media Planning
Public Relations
Procurement
Vendor Management
Inventory
Logistics
Export-Import
Entrepreneurship
Independent Advisory
```

### 12.2 Employment modes

```text
Salaried Private Employment
Salaried Public Employment
Government Recruitment
Independent Professional Practice
Freelancing
Consulting
Entrepreneurship
Digital Enterprise
Academic and Research
Hybrid / Portfolio Career
```

### 12.3 Outcome-modeling rule

A role such as `Portfolio Manager`, `Investment Adviser`, `Auditor`, `Insolvency Professional` or `Company Secretary in Practice` must carry:

- qualification requirements;
- examination requirements;
- membership requirements;
- licence or registration requirements;
- practice rights;
- jurisdiction;
- source and effective dates.

### 12.4 AI and automation

The workbook uses phrases such as “AI-augmented” and “AI-integrated.” These are retained as source signals, not as validated forecasts.

Model them through:

- `future_disruption_risk`;
- `automation_exposure`;
- `human_judgement_intensity`;
- `regulatory_accountability_intensity`;
- `data_tool_dependency`;
- `AI_assistance_typical`;
- source, year and confidence.

---

## 13. Controlled Vocabularies

### 13.1 CommerceEntityNature

`AcademicDiscipline` | `ProfessionalQualificationStream` | `ProfessionalPracticeStream` | `FunctionalStream` | `EmploymentStream` | `ResearchStream` | `AnalyticalDigitalStream` | `DigitalFinanceStream` | `DigitalBusinessStream` | `EnterpriseStream` | `GovernmentRecruitmentStream` | `InterdisciplinaryStream`

### 13.2 ExaminationPurpose

`Admission` | `Recruitment` | `ProfessionalProgression` | `Licensing` | `Certification` | `MembershipEligibility`

### 13.3 ProfessionalQualificationType

`StatutoryProfessional` | `InternationalProfessional` | `IndustryProfessional` | `ProfessionalDesignation`

### 13.4 ProfessionalBodyType

`StatutoryInstitute` | `MembershipAssociation` | `StandardSettingBody` | `CertificationBody` | `InternationalBody`

### 13.5 ProfessionalBodyRole

`Examining` | `Regulating` | `Membership` | `Licensing` | `PracticeOversight` | `ContinuingEducation` | `StandardSetting`

### 13.6 PracticalTrainingType

`Articleship` | `IndustrialTraining` | `ManagementTraining` | `AuditTraining` | `ComplianceTraining` | `SupervisedProfessionalExperience`

### 13.7 MembershipType

`Student` | `Associate` | `Fellow` | `Affiliate` | `Practice`

### 13.8 PracticeRightType

`Audit` | `Certification` | `Representation` | `Compliance` | `Advisory` | `IndependentPractice` | `SigningAuthority`

### 13.9 BusinessFunctionCategory

`Finance` | `Governance` | `Compliance` | `Operations` | `Marketing` | `Analytics` | `Enterprise` | `Research`

### 13.10 EmploymentModeType

`SalariedPrivate` | `SalariedPublic` | `GovernmentRecruitment` | `IndependentPractice` | `Freelance` | `Consulting` | `Entrepreneurial` | `AcademicResearch` | `HybridPortfolio`

### 13.11 InstrumentCategory

`Equity` | `Debt` | `Fund` | `Derivative` | `Insurance` | `Pension` | `Loan` | `Commodity` | `Currency` | `Alternative`

### 13.12 ComplianceObligationType

`Tax` | `CorporateFiling` | `FinancialReporting` | `Audit` | `Securities` | `Banking` | `Insurance` | `Trade` | `DataTechnology`

### 13.13 MathematicsRequirement

`Mandatory` | `AppliedMathAccepted` | `Preferred` | `NotRequired` | `ProgrammeSpecific`

### 13.14 NormalizationBasis

`DirectSource` | `CareerOutcomeDerived` | `NormalizedInference` | `Provisional`

### 13.15 ConfidenceLevel

`High` | `Medium` | `Low`

All common Science v0.6 controlled vocabularies remain applicable unless overridden.

---

## 14. Relationship Inventory

### 14.1 Inherited relationships

All common Science v0.6 structural, eligibility, learning, governance, location, financial, competency and experience relationships remain available.

### 14.2 Commerce-specific relationships

| # | Relationship | Source | Target | Key properties |
|---|---|---|---|---|
| 1 | `HAS_PROFESSIONAL_QUALIFICATION` | Stream | Professional Qualification | primary |
| 2 | `HAS_QUALIFICATION_LEVEL` | Professional Qualification | Qualification Level | sequence_order |
| 3 | `HAS_EXAM_SERIES` | Professional Qualification | Professional Examination Series | — |
| 4 | `HAS_EXAM_LEVEL` | Professional Examination Series | Examination | sequence_order |
| 5 | `PRECEDES_LEVEL` | Qualification Level | Qualification Level | conditions |
| 6 | `AWARDED_BY` | Professional Qualification | Professional Body | — |
| 7 | `REGULATED_BY` | Professional Qualification | Regulatory Body | jurisdiction |
| 8 | `REQUIRES_PRACTICAL_TRAINING` | Professional Qualification | Practical Training | mandatory |
| 9 | `REQUIRES_TRAINING_AT_LEVEL` | Qualification Level | Practical Training | start/end conditions |
| 10 | `GRANTS_MEMBERSHIP` | Professional Body | Professional Membership | — |
| 11 | `REQUIRES_MEMBERSHIP` | Career Outcome | Professional Membership | requirement_type |
| 12 | `UNLOCKS_PRACTICE_RIGHT` | Professional Membership | Practice Right | conditions |
| 13 | `REQUIRES_PRACTICE_RIGHT` | Career Outcome | Practice Right | mandatory |
| 14 | `ADMINISTERED_BY` | Practice Right | Professional Body | jurisdiction |
| 15 | `OPERATES_IN_FUNCTION` | Career Outcome | Business Function | primary |
| 16 | `PREPARES_FOR_FUNCTION` | Stream | Business Function | strength |
| 17 | `USES_INSTRUMENT` | Business Function | Financial Instrument | usage_type |
| 18 | `REQUIRES_INSTRUMENT_KNOWLEDGE` | Career Outcome | Financial Instrument | proficiency |
| 19 | `SUBJECT_TO_OBLIGATION` | Business Function | Compliance Obligation | applicability |
| 20 | `RESPONSIBLE_FOR_OBLIGATION` | Career Outcome | Compliance Obligation | responsibility |
| 21 | `AVAILABLE_VIA_MODE` | Career Outcome | Employment Mode | typicality |
| 22 | `ENABLES_ENTERPRISE_PATH` | Stream | Enterprise Path | readiness |
| 23 | `PRACTISED_AS` | Career Outcome | Enterprise Path | conditions |
| 24 | `EXEMPTS_FROM` | Qualification / Degree / Examination | Examination / Qualification Level / Practical Training | scope, effective dates |
| 25 | `CROSS_FACULTY_ENTRY_TO` | Faculty / Degree | Stream / Professional Qualification | bridge requirements |
| 26 | `RECRUITS_TO` | Examination | Career Outcome | employer class |
| 27 | `PROGRESSES_TO_MEMBERSHIP` | Professional Qualification | Professional Membership | completion conditions |
| 28 | `REQUIRES_CPD` | Professional Membership | Certification / Activity | hours, cycle |
| 29 | `ALTERNATIVE_TO` | Stream | Stream | reason |
| 30 | `CROSS_DOMAIN_WITH` | Stream | Domain / Stream | relationship_type |

---

## 15. Validation and Reasoning Rules

### 15.1 Core validation rules

**COM-VAL-001 — Domain membership**  
Every Commerce Stream must have exactly one primary Domain and may have multiple additional Domains.

**COM-VAL-002 — Stream versus outcome**  
A Stream name cannot be identical to a Career Outcome unless the same label legitimately represents both and the entities have separate IDs.

**COM-VAL-003 — Qualification separation**  
Professional Qualification records cannot be loaded as Degree or ordinary Certification records.

**COM-VAL-004 — Exam-purpose requirement**  
Every Examination must declare `exam_purpose`.

**COM-VAL-005 — Recruitment exam restriction**  
A Recruitment Examination cannot be used as an academic admission prerequisite unless a separately sourced rule says so.

**COM-VAL-006 — Membership separation**  
Passing the final examination cannot automatically create a Professional Membership record.

**COM-VAL-007 — Practice-right separation**  
A completed qualification or membership cannot automatically imply every Practice Right.

**COM-VAL-008 — Training distinction**  
Articleship or body-prescribed training cannot be represented only as Internship Type.

**COM-VAL-009 — Mathematics specificity**  
Eligibility must not use a generic Boolean “Math required” where Applied Mathematics or programme-specific alternatives exist.

**COM-VAL-010 — Cross-faculty eligibility**  
The system must evaluate current official rules instead of assuming Commerce background is mandatory.

**COM-VAL-011 — Salary evidence**  
The source workbook’s repeated salary range must be stored as an unvalidated source note, not as a published Salary Range.

**COM-VAL-012 — Regulatory dates**  
Every compliance, membership, examination and practice-right rule that can change must include effective dates and authoritative source.

**COM-VAL-013 — Advice safety**  
Knowledge of a Financial Instrument must not be converted into personalized financial advice or represented as authorization to advise.

**COM-VAL-014 — Source-confidence exposure**  
Chatbot responses using Medium or Low confidence records must disclose uncertainty or route for validation.

### 15.2 Eligibility reasoning sequence

```text
1. Identify target Stream / Professional Qualification / Career Outcome.
2. Identify applicable jurisdiction and current date.
3. Evaluate school-subject requirements and accepted equivalences.
4. Evaluate degree or qualification prerequisites.
5. Evaluate examination purpose and progression stage.
6. Evaluate exemptions.
7. Evaluate prescribed practical training.
8. Evaluate membership requirements.
9. Evaluate licence/registration/practice-right requirements.
10. Separate eligibility result from suitability result.
11. Return missing evidence, next action and authoritative source.
```

### 15.3 Alternative-path reasoning

When a pathway is blocked, alternatives may be generated through:

- related stream;
- adjacent business function;
- non-practice employment outcome;
- certification route;
- degree route;
- cross-faculty bridge;
- internship or project skill-development route;
- government recruitment route;
- entrepreneurship route;
- human-counsellor escalation.

---

## 16. Derived Calculations

### 16.1 Professional qualification completion estimate

```text
Estimated Completion Time =
    sum(examination-stage preparation and waiting periods)
  + prescribed training duration
  + expected re-attempt delay
  + membership processing time
```

All components must be sourced or clearly identified as assumptions.

### 16.2 Total pathway cost

```text
Total Pathway Cost =
    examination fees
  + registration fees
  + tuition/coaching cost, if selected
  + training-related costs
  + certification fees
  + membership fees
  + licence/practice fees
  + living and travel costs
  - scholarships
  - stipends
```

### 16.3 Practice-readiness state

```text
Practice Ready =
    qualification complete
  AND mandatory training complete
  AND required membership active
  AND required licence/registration active
  AND applicable practice right active
```

### 16.4 Career-readiness score

The ontology supplies raw requirement facts only:

```text
Career Readiness Inputs =
    academic eligibility
  + professional level completion
  + skills
  + practical training
  + certification
  + membership/licence status
  + work evidence
```

Per-user scoring belongs to the Digital Twin and recommendation layer.

### 16.5 Regulatory confidence

```text
Regulatory Confidence =
    source authority weight
  × freshness factor
  × validation status
  × jurisdiction match
```

---

## 17. Gap Treatment and Data-Quality Controls


| Gap ID | Gap | Priority | Evidence from Workbook | Required Ontology Action |
| --- | --- | --- | --- | --- |
| GAP-COM-001 | Professional qualification hierarchy | Critical | CA/CS/CMA/Actuarial pathways are multi-level professional qualification series, not single entrance exams. | Add ProfessionalQualification, QualificationLevel and ProfessionalExamSeries entities. |
| GAP-COM-002 | Professional body vs regulator | Critical | ICAI/ICSI/ICMAI and international bodies may examine, regulate, grant membership and confer practice rights. | Add ProfessionalBody and role-specific relationships. |
| GAP-COM-003 | Articleship and prescribed training | Critical | Generic internship cannot represent regulated practical training. | Add PracticalTraining with duration, supervisor, approved organisation, stipend and transfer rules. |
| GAP-COM-004 | Membership and practice rights | Critical | Passing exams does not always equal membership or legal authority to practise/sign. | Add ProfessionalMembership and PracticeRight. |
| GAP-COM-005 | Recruitment exam classification | High | IBPS/SBI PO are employment recruitment exams, not academic entrance exams. | Add ExamPurpose: Admission / Recruitment / Licensing / Professional Progression. |
| GAP-COM-006 | Career outcomes blank or embedded | High | Several pathway sheets leave Career Outcomes blank and place roles only in Relevant Careers. | Normalize roles into CareerOutcome registry. |
| GAP-COM-007 | Uniform salary placeholders | High | ₹4–25+ LPA is repeated across unrelated careers and cannot be treated as validated salary evidence. | Mark source salary as unvalidated; populate later by outcome, experience, city and year. |
| GAP-COM-008 | Generic stage content | High | Terms such as Awareness, Advanced Skills and Expertise are not ontology-grade concepts. | Replace with typed DecisionPoint, Criterion, Subject, Skill, Activity and Evidence relations. |
| GAP-COM-009 | Mathematics dependence | High | Commerce with/without Mathematics and Applied Mathematics acceptance are not represented. | Add subject-combination and programme-specific mathematics requirement rules. |
| GAP-COM-010 | Cross-stream entry | High | Science/Arts graduates may enter economics, analytics, finance and professional qualifications. | Add FacultyAgnostic and CrossFacultyAdmissionPathway rules. |
| GAP-COM-011 | Business function vs stream | High | Accounting, marketing, procurement and compliance are functions; source mixes them with qualifications and careers. | Retain BusinessFunction as separate concept linked to streams and outcomes. |
| GAP-COM-012 | Financial instruments | Medium | Markets and wealth careers need instrument-level knowledge relationships. | Add FinancialInstrument taxonomy. |
| GAP-COM-013 | Entrepreneurship and freelance mode | Medium | Global Freelance Careers is an employment mode rather than one academic stream. | Add EnterprisePath and EmploymentMode; retain specific skill pathways separately. |
| GAP-COM-014 | Regulatory compliance obligations | Medium | Tax, corporate, securities, banking and insurance roles depend on dated obligations. | Add ComplianceObligation with authority, applicability and effective dates. |
| GAP-COM-015 | Incomplete public-sector pathways | Medium | Public Sector & Govt Roles is a category without specific services, exams or pathways. | Keep provisional until source data is expanded. |
| GAP-COM-016 | NEP flexibility | High | Fixed Commerce labels do not capture multidisciplinary major/minor/elective and vocational combinations. | Reuse planned NEP curriculum-credit extensions across Science and Commerce. |

### 17.1 Gap disposition

- Critical gaps are resolved structurally in this v0.7 specification through new entity definitions.
- High-priority gaps are represented through modified inherited entities and validation rules.
- Medium gaps are scaffolded but require authoritative data loading.
- Provisional public-sector pathways remain unpublished until specific exams, services and eligibility rules are sourced.

### 17.2 Generic-stage normalization

The following source phrases are not loaded as standalone ontology facts:

- Awareness
- Basic Exposure
- Stream Decision
- Skill Building
- Advanced Skills
- Expertise
- Serious Preparation
- Professional Entry

They must be decomposed into:

- Education Stage;
- Decision Point;
- Criterion;
- Subject or Subject Level;
- Skill;
- Activity;
- Project;
- Examination Preparation Activity;
- Evidence Item in the Digital Twin.

### 17.3 Salary control

The repeated source range `₹4–25+ LPA` is retained only in source provenance. Published salary records require:

- career outcome;
- experience bucket;
- geography;
- employment mode;
- data year;
- source;
- min/median/max;
- verification status.

---

## 18. Deferrals and Ontology Boundaries

### 18.1 Deferred for authoritative-source expansion

- exact CA, CS, CMA and Actuarial level structures and current rules;
- professional-body membership fees and CPD cycles;
- practice-right details by jurisdiction;
- NISM, CFP, CFA and other certification/exam classifications;
- government economic and statistical services;
- detailed financial instrument taxonomy;
- current tax and compliance obligations;
- programme-specific Mathematics and Applied Mathematics acceptance;
- institution-level Commerce programme offerings and cut-offs;
- validated salary and placement data;
- employer-specific roles;
- international qualification equivalence.

### 18.2 Excluded from SCC ontology

- individual student evidence;
- personal suitability scores;
- personal investment recommendations;
- individual tax or legal advice;
- employer-specific job vacancy data;
- personal financial capacity calculations;
- mental-health and family-circumstance reasoning;
- personalized recommendation and escalation records.

These belong to peer ontologies or product layers.

---

## 19. Implementation Sequence

### Phase 1 — Core registry loading

1. Load Commerce Faculty/Universe.
2. Load 15 Domains.
3. Load 47 Streams.
4. Preserve source labels and normalization basis.
5. Validate primary-domain relationships.

### Phase 2 — Qualification and exam structure

1. Professional Body.
2. Professional Qualification.
3. Qualification Level.
4. Professional Examination Series.
5. Examination purpose classification.
6. Exemption rules.
7. Practical Training.

### Phase 3 — Membership and regulated practice

1. Professional Membership.
2. Licence/registration.
3. Practice Right.
4. Continuing professional development.
5. Effective-date governance.

### Phase 4 — Business ecosystem

1. Business Function.
2. Career Outcome.
3. Employment Mode.
4. Enterprise Path.
5. Financial Instrument.
6. Compliance Obligation.

### Phase 5 — Common SCC enrichment

1. Subjects and subject combinations.
2. Cross-faculty pathways.
3. Institutions and programmes.
4. Scholarships and education loans.
5. Competencies and experiences.
6. Salary and city records.

### Phase 6 — Testing

Stress test against questions covering:

- Commerce with and without Mathematics;
- entry from Science and Arts;
- professional exam sequence;
- exemptions;
- failed attempts and re-entry;
- articleship and training;
- membership versus qualification;
- practice rights;
- recruitment versus admission examinations;
- degree versus professional qualification;
- employment versus independent practice;
- financial instruments and advice restrictions;
- entrepreneurship and freelance careers;
- cost, duration and affordability;
- AI/automation and regulatory change.

---

## 20. Confidence Statement

### Strong areas

- Clear reuse of the Science v0.6 SCC foundation.
- Normalized separation of 15 Domains and 47 Streams.
- Explicit treatment of professional qualifications and examination chains.
- Separation of qualification, training, membership and practice rights.
- Separation of recruitment, admission and professional examinations.
- Clear distinction between business functions, career outcomes and employment modes.
- Source confidence and normalization provenance are retained.

### Areas requiring authoritative data

- current professional-body rules;
- current examination structures and exemptions;
- programme-specific eligibility;
- statutory and regulatory practice rights;
- exact training durations and conditions;
- validated costs and salaries;
- current government recruitment pathways;
- compliance obligations and financial-market regulations.

### Readiness assessment

| Area | Status |
|---|---|
| Conceptual architecture | Ready for technical review |
| Domain and Stream registry | Ready as normalized baseline |
| Commerce-specific entity model | Ready for Cypher-schema design |
| Authoritative professional-rule data | Requires sourcing and validation |
| Career-outcome data | Partial |
| Salary and labour-market data | Not publication-ready |
| Production chatbot use | Not yet ready |
| Question-bank stress testing | Ready after initial data population |

> **Final position:** RSA SCC Ontology v0.7 provides a coherent Commerce Universe built on the Science v0.6 foundation. It is a technical baseline, not yet an authoritative rulebook. Publication and production use require professional-body, regulator, institution and current-policy data validation.

---

## Appendix A — Normalization Rules


| Rule | Normalization principle |
| --- | --- |
| NR-01 | A Domain is a durable knowledge/professional/business-function area containing multiple streams. |
| NR-02 | A Stream is a coherent learnable or qualifying pathway; it is not merely a job title. |
| NR-03 | A Career Outcome is an occupation or role reached from one or more streams. |
| NR-04 | A Professional Qualification is not modeled as a Degree or ordinary Certification. |
| NR-05 | Professional exam levels are stages in a qualification series, not independent careers. |
| NR-06 | Recruitment exams are separated from admission, licensing and professional-progression exams. |
| NR-07 | Business functions such as Audit, Compliance, Procurement and Marketing may connect multiple streams and outcomes. |
| NR-08 | Employment modes such as Freelance, Entrepreneurial, Government and Private Practice are not standalone career domains unless a distinct learnable pathway exists. |
| NR-09 | Source-derived labels are preserved in source mapping; normalized names are used in the registry. |
| NR-10 | Any expansion not explicitly supported by a pathway sheet is marked Normalized inference or Provisional. |

---

## Appendix B — Recommended Reference-Code Patterns

```text
COM-DOM-<DOMAIN>
COM-STR-<STREAM>
COM-SCB-<SUBJECT-COMBINATION>
PQL-<QUALIFICATION>-<JURISDICTION>
QLV-<QUALIFICATION>-<LEVEL>
PES-<QUALIFICATION>-<SERIES>
EXM-<BODY>-<EXAM>
PBD-<PROFESSIONAL-BODY>
PTR-<TRAINING>
PMB-<MEMBERSHIP>
PRR-<PRACTICE-RIGHT>
BFN-<BUSINESS-FUNCTION>
FIN-<FINANCIAL-INSTRUMENT>
COB-<COMPLIANCE-OBLIGATION>
ENT-<ENTERPRISE-PATH>
EMD-<EMPLOYMENT-MODE>
CAR-<CAREER-OUTCOME>
```

---

## Appendix C — Minimal Cypher-Oriented Node Labels

```text
:SCCFaculty
:Domain
:Stream
:EducationStage
:Subject
:SubjectLevel
:SubjectCombination
:DecisionPoint
:Criterion
:Examination
:RegulatoryBody
:ProfessionalBody
:ProfessionalQualification
:QualificationLevel
:ProfessionalExaminationSeries
:Degree
:Certification
:Licence
:ProfessionalMembership
:PracticeRight
:InstitutionType
:Institution
:AdmissionPathway
:SyllabusTopic
:SubjectEquivalenceRule
:InternshipType
:PracticalTraining
:Apprenticeship
:Activity
:Project
:Interest
:Aptitude
:Skill
:PersonalityTrait
:WorkPreference
:BusinessFunction
:FinancialInstrument
:ComplianceObligation
:EnterprisePath
:EmploymentMode
:CareerOutcome
:SalaryRange
:City
:Scholarship
:EducationLoan
```

*End of RSA SCC Ontology v0.7 — Commerce Universe Technical Specification.*
