# RSA SCC Ontology v1.0 — Law Universe Technical Specification

**Version:** 1.0  
**Foundation:** Science v0.6, Commerce v0.7, Humanities v0.8 and Management v0.9  
**Source:** `Structured- Law.xlsx`  
**Source Career Master:** 90 legal and legal-adjacent roles  
**Normalized Domains:** 22  
**Normalized Streams:** 90

## 1. Law Ontology Hierarchy

```text
RSA SCC
└── Law Universe
    ├── Structure and Legal Education Journey
    │   ├── Faculty / Knowledge Area
    │   ├── Domain
    │   ├── Stream
    │   ├── Education Stage
    │   ├── Subject
    │   ├── Subject Level
    │   ├── Subject Combination
    │   └── Integrated Degree Combination
    │
    ├── Admission, Qualification and Practice
    │   ├── Admission Pathway
    │   ├── Examination
    │   ├── Degree
    │   ├── Legal Qualification
    │   ├── Enrolment / Registration
    │   ├── Certificate of Practice
    │   ├── Licence / Permission
    │   ├── Professional Membership
    │   └── Practice Right
    │
    ├── Legal System and Jurisdiction
    │   ├── Jurisdiction
    │   ├── Court / Tribunal
    │   ├── Forum
    │   ├── Authority / Regulator
    │   ├── Legislation
    │   ├── Rule / Regulation
    │   ├── Legal Procedure
    │   └── Legal Remedy
    │
    ├── Legal Work and Matter Architecture
    │   ├── Legal Practice Area
    │   ├── Legal Matter
    │   ├── Client Type
    │   ├── Party Role
    │   ├── Legal Service
    │   ├── Legal Document
    │   ├── Evidence Type
    │   ├── Legal Research Method
    │   └── Compliance Obligation
    │
    ├── Legal Institution and Professional Ecosystem
    │   ├── Law School / Institution
    │   ├── Bar Council / Professional Body
    │   ├── Law Firm / Chambers
    │   ├── Corporate Legal Department
    │   ├── Legal Services Organisation
    │   ├── Legal Aid / NGO
    │   ├── Government Legal Office
    │   └── Legal Technology Provider
    │
    ├── Competency, Experience and Portfolio
    │   ├── Interest
    │   ├── Aptitude
    │   ├── Skill
    │   ├── Personality Trait
    │   ├── Work Preference
    │   ├── Activity
    │   ├── Project
    │   ├── Internship
    │   ├── Moot Court
    │   ├── Legal Clinic
    │   ├── Drafting Portfolio
    │   ├── Research Memorandum
    │   └── Supervised Legal Practice
    │
    ├── Technology and Future-Law Layer
    │   ├── Legal Technology Interface
    │   ├── AI-Assisted Legal Workflow
    │   ├── Contract Lifecycle Management
    │   ├── Legal Data / Analytics
    │   ├── Digital Evidence System
    │   ├── RegTech / Compliance Automation
    │   ├── ODR Platform
    │   └── AI Governance Control
    │
    └── Outcomes and Livelihood
        ├── Career Outcome
        ├── Employment Mode
        ├── Independent Practice
        ├── Legal Service Model
        ├── Legal Micro-Enterprise
        ├── Salary / Income Range
        ├── City / Jurisdiction
        └── Continuing Legal Education
```

## 2. Core Design Rules

1. Domain ≠ Stream ≠ Practice Area ≠ Career Outcome.
2. Law degree ≠ advocate enrolment ≠ AIBE certificate ≠ right to appear or practise.
3. Registration, membership, licence and certificate of practice must remain separate.
4. Admission examination ≠ recruitment examination ≠ professional practice examination.
5. A lawyer may work in non-court roles without the same practice permissions required for advocacy.
6. A legal-adjacent role may use legal knowledge without requiring an LLB; this must be explicit.
7. Court, tribunal, regulator and jurisdiction are first-class entities.
8. A legal rule must carry source, jurisdiction, effective dates and amendment status.
9. Legal Matter, Client, Document, Evidence and Procedure are distinct concepts.
10. Sectoral legal roles must link to the source-sector ontology.
11. AI-assisted work must preserve confidentiality, citation verification, professional responsibility and human accountability.
12. Flexible livelihood, remote work and micro-enterprise are employment/service models, not academic domains.
13. Eligibility and suitability remain separate; personal matching belongs to the RSA Aspirant Digital Twin.
14. The ontology provides career and education information, not legal advice.
15. Any statement about professional permission must be validated against the current competent authority.

## 3. Comparison with Earlier Ontologies


| Dimension | Science v0.6 | Commerce v0.7 | Humanities v0.8 | Management v0.9 | Law v1.0 |
| --- | --- | --- | --- | --- | --- |
| Common SCC foundation | Reused | Reused | Reused | Reused | Reused |
| Primary pathway logic | Technical/scientific progression | Qualification, membership and practice rights | Portfolio, culture and recognition | Functions, sectors and enterprise | Degree, enrolment/registration, exam/certification, practice permission and legal activity |
| Selection mechanisms | Entrance and licensing exams | Admission, recruitment and professional exams | Admissions, auditions, portfolios and eligibility tests | UG/PG admissions, certifications and recruitment | CLAT/AILET/CUET/institute admissions, judiciary/PSC recruitment, AIBE, professional registrations and sector certifications |
| Professional boundary | Licence and medical fitness | Membership and practice rights | Recognition and supervised practice | Role-specific licences and sector regulation | Advocate enrolment, AIBE certificate, ICSI/IBBI/patent-agent registration and sectoral permissions |
| Experience structure | Internship/project/apprenticeship | Articleship and practical training | Fieldwork, portfolio and supervised practice | Practicum, cases and live projects | Mooting, drafting, court exposure, chambers/law-firm internships, mediation, legal clinic, research and evidence portfolios |
| Outcome model | Technical/professional careers | Employment, practice and enterprise | Academic, creative, public and portfolio careers | Functional, sector, consulting and enterprise | Court practice, advisory, judiciary, compliance, policy, legal operations, legal tech, education and independent services |
| Cross-domain nature | Science/technology | Finance/business | Culture/media/social science | Sector/function/technology | Commerce, technology, governance, environment, health, media, social work, counselling and education |

## 4. Inherited SCC Entities

### 4.1 Reused common entities

- SCC Faculty
- Domain
- Stream
- Education Stage
- Subject
- Subject Level
- Subject Combination
- Decision Point
- Criterion
- Examination
- Regulatory Body
- Degree
- Institution Type
- Institution
- Admission Pathway
- Subject Equivalence Rule
- Internship Type
- Career Outcome
- Salary Range
- City
- Licence
- Scholarship
- Education Loan
- Interest
- Aptitude
- Skill
- Personality Trait
- Work Preference
- Activity
- Project
- Apprenticeship
- Certification

### 4.2 Reused from Commerce

- Professional Body
- Professional Membership
- Practice Right
- Compliance Obligation
- Enterprise Path
- Employment Mode
- Financial Instrument

### 4.3 Reused from Humanities

- Portfolio
- Work or Artefact
- Research Method
- Fieldwork and Community Engagement
- Supervised Practice
- Professional Recognition
- Publication and Media Format

### 4.4 Reused from Management

- Organisation Type
- Business Process
- Technology Interface
- Management Use Case
- Livelihood Service Model
- Business Model
- Client Segment
- Revenue Model
- Regional Resource Context

### 4.5 Required modifications to Stream

| Property | Type | Notes |
|---|---|---|
| `law_stream_nature` | Enum | Practice / JudicialService / Advisory / Regulatory / LegalOperations / LegalTechnology / Academic / Adjacent |
| `legal_education_requirement` | Enum | MandatoryLLB / LLBPreferred / LegalKnowledgeUseful / NotRequired |
| `practice_permission_required` | Boolean | — |
| `practice_rights` | List (Reference) | — |
| `jurisdictions` | List (Reference) | — |
| `forums` | List (Reference) | — |
| `practice_areas` | List (Reference) | — |
| `sector_links` | List (Reference) | — |
| `legal_documents` | List (Reference) | — |
| `evidence_types` | List (Reference) | — |
| `technology_interfaces` | List (Reference) | — |
| `career_outcomes` | List (Reference) | — |

### 4.6 Required modifications to Career Outcome

| Property | Type | Notes |
|---|---|---|
| `legal_education_requirement` | Enum | — |
| `bar_enrolment_required` | Boolean | — |
| `aibe_or_equivalent_required` | Boolean | — |
| `registration_or_membership` | List (Reference) | — |
| `practice_rights` | List (Reference) | — |
| `forums_of_work` | List (Reference) | — |
| `client_types` | List (Reference) | — |
| `legal_services` | List (Reference) | — |
| `employment_modes` | List (Reference) | — |
| `confidentiality_intensity` | Enum | Low / Moderate / High / Critical |
| `professional_liability_intensity` | Enum | Low / Moderate / High / Critical |
| `technology_interfaces` | List (Reference) | — |

# GROUP J — LAW-SPECIFIC ENTITIES

## 5.1 Legal Qualification

A formal legal education or professional qualification supporting legal work.

| Property | Type | Notes |
|---|---|---|
| `legal_qualification_id` | UUID | — |
| `qualification_code` | String | — |
| `name` | String | Integrated LLB, 3-year LLB, LLM, diploma, etc. |
| `qualification_type` | Enum | AcademicDegree / ProfessionalCourse / Postgraduate / Doctoral / Certificate |
| `awarding_institution` | Reference | Institution |
| `recognising_authority` | Reference | Regulatory/Professional Body |
| `entry_requirements` | Structured JSON | — |
| `duration_months` | Integer | — |
| `practice_eligibility_consequence` | List (Reference) | — |
| `career_outcomes` | List (Reference) | — |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | — |

## 5.2 Enrolment or Registration

A formal registration required for a professional role.

| Property | Type | Notes |
|---|---|---|
| `registration_id` | UUID | — |
| `registration_code` | String | — |
| `name` | String | State Bar enrolment, patent-agent registration, IBBI registration |
| `registration_type` | Enum | BarEnrolment / ProfessionalRegistration / GovernmentAppointment / SectoralRegistration |
| `granting_authority` | Reference | — |
| `qualification_requirements` | List (Reference) | — |
| `examination_requirements` | List (Reference) | — |
| `experience_requirements` | Structured JSON | — |
| `jurisdiction` | Reference | — |
| `validity_period` | String | — |
| `renewal_or_cpe` | Structured JSON | — |
| `practice_rights_unlocked` | List (Reference) | — |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | — |

## 5.3 Certificate of Practice

A certificate confirming eligibility to perform specified professional legal activities.

| Property | Type | Notes |
|---|---|---|
| `certificate_of_practice_id` | UUID | — |
| `cop_code` | String | — |
| `name` | String | — |
| `issuing_authority` | Reference | — |
| `registration_prerequisite` | Reference | — |
| `examination_prerequisite` | Reference | — |
| `permitted_activities` | List | — |
| `jurisdiction` | Reference | — |
| `validity_or_status` | String | — |
| `continuing_obligations` | List | — |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | — |

## 5.4 Jurisdiction

A legal territory or authority scope.

| Property | Type | Notes |
|---|---|---|
| `jurisdiction_id` | UUID | — |
| `jurisdiction_code` | String | — |
| `name` | String | India, State, International, Sectoral |
| `jurisdiction_type` | Enum | National / State / Local / International / Sectoral / Institutional |
| `parent_jurisdiction` | Reference | Optional |
| `courts_and_forums` | List (Reference) | — |
| `authorities` | List (Reference) | — |
| `applicable_legislation` | List (Reference) | — |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | — |

## 5.5 Court, Tribunal or Forum

A venue where legal matters are adjudicated, heard or resolved.

| Property | Type | Notes |
|---|---|---|
| `forum_id` | UUID | — |
| `forum_code` | String | — |
| `name` | String | — |
| `forum_type` | Enum | Court / Tribunal / Commission / Arbitration / Mediation / ODR / Administrative |
| `jurisdiction` | Reference | — |
| `subject_matter_scope` | List (Reference) | Legal Practice Area |
| `entry_or_appearance_rules` | Structured JSON | — |
| `procedural_rules` | List (Reference) | — |
| `career_outcomes` | List (Reference) | — |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | — |

## 5.6 Legislation and Legal Rule

A statute, rule, regulation, notification, order or binding legal instrument.

| Property | Type | Notes |
|---|---|---|
| `legal_rule_id` | UUID | — |
| `rule_code` | String | — |
| `title` | String | — |
| `rule_type` | Enum | Constitution / Act / Rule / Regulation / Notification / Order / Guideline / Treaty |
| `jurisdiction` | Reference | — |
| `issuing_authority` | Reference | — |
| `effective_from` | Date | — |
| `effective_to` | Date | — |
| `amendment_status` | Enum | Current / Amended / Repealed / Proposed / UnderReview |
| `practice_areas` | List (Reference) | — |
| `compliance_obligations` | List (Reference) | — |
| `official_source` | String | — |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | — |

## 5.7 Legal Practice Area

A stable area of legal doctrine, procedure or professional work.

| Property | Type | Notes |
|---|---|---|
| `practice_area_id` | UUID | — |
| `practice_area_code` | String | — |
| `name` | String | Civil, criminal, corporate, IP, tax, etc. |
| `practice_area_type` | Enum | Litigation / Advisory / Transactional / Regulatory / Policy / Academic / Support |
| `jurisdictions` | List (Reference) | — |
| `forums` | List (Reference) | — |
| `legal_rules` | List (Reference) | — |
| `documents` | List (Reference) | — |
| `skills` | List (Reference) | — |
| `career_outcomes` | List (Reference) | — |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | — |

## 5.8 Legal Matter

A legal issue, case, transaction, compliance task or advisory engagement.

| Property | Type | Notes |
|---|---|---|
| `matter_id` | UUID | Concept-level matter type; personal matters excluded |
| `matter_code` | String | — |
| `name` | String | — |
| `matter_type` | Enum | Dispute / Transaction / Advisory / Compliance / Investigation / Policy / Registration |
| `practice_area` | Reference | — |
| `forum_or_authority` | Reference | — |
| `client_types` | List (Reference) | — |
| `party_roles` | List (Reference) | — |
| `documents_required` | List (Reference) | — |
| `evidence_types` | List (Reference) | — |
| `procedures` | List (Reference) | — |
| `legal_services` | List (Reference) | — |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | — |

## 5.9 Legal Service

A defined professional or adjacent service.

| Property | Type | Notes |
|---|---|---|
| `legal_service_id` | UUID | — |
| `service_code` | String | — |
| `name` | String | Litigation, drafting, review, research, mediation, filing, training |
| `service_type` | Enum | Representation / Advisory / Drafting / Research / Compliance / Mediation / Filing / Education / Support |
| `practice_right_required` | Reference | Optional |
| `registration_required` | Reference | Optional |
| `eligible_career_outcomes` | List (Reference) | — |
| `client_types` | List (Reference) | — |
| `deliverables` | List (Reference) | Legal Document/Artefact |
| `delivery_modes` | List | InPerson / Remote / Hybrid |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | — |

## 5.10 Legal Document

A document created, filed, reviewed or interpreted in legal work.

| Property | Type | Notes |
|---|---|---|
| `document_id` | UUID | — |
| `document_code` | String | — |
| `name` | String | Contract, notice, petition, opinion, policy brief, filing |
| `document_type` | Enum | Pleading / Contract / Notice / Opinion / Filing / EvidenceRecord / ComplianceRecord / Policy / Educational |
| `practice_areas` | List (Reference) | — |
| `matter_types` | List (Reference) | — |
| `drafting_skills` | List (Reference) | — |
| `filing_or_execution_rules` | Structured JSON | — |
| `confidentiality_level` | Enum | Public / Internal / Confidential / Privileged / Restricted |
| `verification_requirements` | List | — |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | — |

## 5.11 Evidence Type

A category of evidence or evidentiary material.

| Property | Type | Notes |
|---|---|---|
| `evidence_type_id` | UUID | — |
| `evidence_code` | String | — |
| `name` | String | Documentary, oral, digital, forensic, expert |
| `evidence_category` | Enum | Documentary / Oral / Digital / Physical / Forensic / Expert / Circumstantial |
| `authentication_requirements` | List | — |
| `chain_of_custody_required` | Boolean | — |
| `applicable_forums` | List (Reference) | — |
| `skills_required` | List (Reference) | — |
| `technology_interfaces` | List (Reference) | — |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | — |

## 5.12 Legal Procedure

A formal process governing a legal matter.

| Property | Type | Notes |
|---|---|---|
| `procedure_id` | UUID | — |
| `procedure_code` | String | — |
| `name` | String | Filing, service, hearing, discovery, appeal, mediation |
| `procedure_type` | Enum | PreFiling / Filing / Hearing / Evidence / Interim / Appeal / Enforcement / Settlement |
| `forum` | Reference | — |
| `legal_rule` | Reference | — |
| `sequence_order` | Integer | — |
| `documents` | List (Reference) | — |
| `time_limits` | Structured JSON | — |
| `eligible_professionals` | List (Reference) | — |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | — |

## 5.13 Legal Research Method

A method used to identify, interpret and validate law.

| Property | Type | Notes |
|---|---|---|
| `research_method_id` | UUID | — |
| `method_code` | String | — |
| `name` | String | Doctrinal, comparative, empirical, legislative, case-law |
| `method_type` | Enum | Doctrinal / Comparative / Empirical / Historical / Policy / Regulatory / Computational |
| `source_types` | List | Statute, case, regulation, commentary, database |
| `citation_standard` | String | — |
| `verification_steps` | List | — |
| `AI_use_controls` | List | — |
| `applicable_streams` | List (Reference) | — |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | — |

## 5.14 Moot Court and Legal Clinic

A structured experiential-learning environment.

| Property | Type | Notes |
|---|---|---|
| `experience_id` | UUID | — |
| `experience_code` | String | — |
| `name` | String | Moot, legal aid clinic, negotiation, mediation clinic |
| `experience_type` | Enum | Moot / TrialAdvocacy / LegalAidClinic / MediationClinic / DraftingClinic / PolicyClinic |
| `applicable_streams` | List (Reference) | — |
| `skills_developed` | List (Reference) | — |
| `artefacts_produced` | List (Reference) | — |
| `supervision_required` | Boolean | — |
| `credit_eligible` | Boolean | — |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | — |

## 5.15 Supervised Legal Practice

A supervised practical experience in chambers, law firms, courts, legal departments or legal services organisations.

| Property | Type | Notes |
|---|---|---|
| `supervised_practice_id` | UUID | — |
| `practice_code` | String | — |
| `name` | String | — |
| `host_type` | Enum | Chambers / LawFirm / Court / Corporate / NGO / Government / LegalAid |
| `supervisor_role` | String | — |
| `duration_hours` | Integer | — |
| `practice_areas` | List (Reference) | — |
| `activities` | List | — |
| `artefacts` | List (Reference) | — |
| `confidentiality_controls` | List | — |
| `evaluation_method` | String | — |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | — |

## 5.16 Legal Technology Interface

A technology system used in legal work.

| Property | Type | Notes |
|---|---|---|
| `legal_technology_id` | UUID | — |
| `technology_code` | String | — |
| `name` | String | Research AI, CLM, e-discovery, ODR, RegTech, legal analytics |
| `technology_type` | Enum | Research / Drafting / CLM / Workflow / Analytics / Evidence / ODR / RegTech / Knowledge |
| `legal_use_cases` | List (Reference) | — |
| `practice_areas` | List (Reference) | — |
| `skills_required` | List (Reference) | — |
| `confidentiality_risk` | Enum | Low / Moderate / High / Critical |
| `verification_controls` | List | — |
| `human_accountability` | Enum | Moderate / High / Critical |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | — |

## 5.17 Legal Service Model

A flexible, freelance, agency or micro-enterprise model for legal or legal-adjacent services.

| Property | Type | Notes |
|---|---|---|
| `service_model_id` | UUID | — |
| `model_code` | String | — |
| `name` | String | Documentation studio, translation, RTI, training, virtual assistance |
| `service_type` | Enum | Practice / Adjacent / Education / Compliance / Documentation / Technology |
| `legal_education_requirement` | Enum | Mandatory / Preferred / Useful / NotRequired |
| `practice_permission_required` | Boolean | — |
| `minimum_skills` | List (Reference) | — |
| `client_segments` | List (Reference) | — |
| `delivery_mode` | Enum | InPerson / Remote / Hybrid |
| `investment_level` | Enum | VeryLow / Low / Medium / High |
| `revenue_models` | List (Reference) | — |
| `risk_and_ethics_controls` | List | — |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | — |

## 6. Normalized Law Domain Registry


| Domain Code | Normalized Domain | Nature | Definition | Career Master Stream Count |
| --- | --- | --- | --- | --- |
| LAW-DOM-LIT | Litigation, Advocacy & Court Practice | Core Legal Practice | Civil, criminal, commercial, constitutional and tribunal advocacy pathways. | 5 |
| LAW-DOM-JUD | Judiciary, Prosecution & Government Legal Service | Public/Judicial | Judicial service, prosecution, government legal officer, defence and public legal administration. | 5 |
| LAW-DOM-CORP | Corporate, Commercial, Contracts & In-House Law | Corporate/Commercial | Corporate advisory, M&A, contracts, in-house counsel and commercial legal work. | 12 |
| LAW-DOM-GOV | Corporate Governance, Secretarial & Compliance | Governance/Compliance | Corporate governance, secretarial practice, compliance management and board advisory. | 4 |
| LAW-DOM-TAX | Tax, Fiscal & Economic Regulation | Tax/Economic | Direct and indirect tax, fiscal law, economic regulation and related advisory. | 0 |
| LAW-DOM-FIN | Banking, Securities, Insurance, FinTech & Financial Crime | Finance/Regulatory | BFSI law, securities, insurance, fintech, AML, fraud and financial-crime compliance. | 8 |
| LAW-DOM-IBC | Insolvency, Restructuring & Distressed Assets | Corporate/Regulated | IBC, insolvency resolution, liquidation, restructuring and distressed-asset pathways. | 2 |
| LAW-DOM-IP | Intellectual Property, Innovation & Creative Economy Law | IP/Creative | Patents, trademarks, copyright, media, entertainment, art, design and creator-economy law. | 2 |
| LAW-DOM-TECH | Technology, Privacy, Cyber, AI & Digital Governance | Technology/Regulatory | Cyber law, data protection, AI governance, digital identity, platform and emerging-technology law. | 8 |
| LAW-DOM-ADR | ADR, Mediation, Arbitration & ODR | Dispute Resolution | Arbitration, mediation, negotiation, online dispute resolution and settlement systems. | 2 |
| LAW-DOM-INT | International, Trade, Immigration, Transport & Space Law | International/Sectoral | International law, trade, immigration, shipping, aviation, space, drones and cross-border regulation. | 5 |
| LAW-DOM-PUB | Constitutional, Administrative, Human Rights & Public Interest Law | Public Interest | Constitutional law, civil liberties, PIL, rights advocacy, public administration and legal empowerment. | 4 |
| LAW-DOM-ENV | Environmental, Climate, Land, Forest & Resource Law | Environment/Resource | Environmental, ESG, climate, forest, water, land and natural-resource governance. | 0 |
| LAW-DOM-CRIM | Criminal Justice, Forensics, Investigation & Evidence | Criminal/Forensic | Criminal law, criminology, investigation support, white-collar enforcement, digital evidence and forensics. | 4 |
| LAW-DOM-FAM | Family, Child, Elder, Succession & Private Client Law | Private Client | Family law, child rights, elder rights, succession, estate and personal legal transitions. | 1 |
| LAW-DOM-PROP | Property, Real Estate, Infrastructure & Public Contracts | Property/Infrastructure | Property, real estate, infrastructure projects, procurement and public-contract law. | 1 |
| LAW-DOM-LAB | Labour, Employment, Workplace & Social Compliance | Labour/Social | Employment law, labour compliance, workplace conflict, POSH and social-law pathways. | 0 |
| LAW-DOM-SEC | Sectoral Regulation: Health, Pharma, Food, Energy & Consumer | Sectoral Regulation | Healthcare, pharma, food, energy, consumer, legal metrology and other regulated-sector law. | 5 |
| LAW-DOM-OPS | Legal Operations, Knowledge, Analytics & Services Industry | Legal Services/Operations | Legal operations, LPO/ALSP, knowledge management, legal analytics, process and service delivery. | 3 |
| LAW-DOM-EDU | Legal Education, Research, Publishing & Public Legal Literacy | Education/Knowledge | Legal academia, research, curriculum, publishing, content, training and literacy. | 3 |
| LAW-DOM-ADJ | Adjacent Legal Support, Administration & Flexible Livelihoods | Adjacent/Flexible | Paralegal, documentation, translation, RTI, virtual assistance, legal administration and flexible legal services. | 15 |
| LAW-DOM-ENT | Legal Entrepreneurship, Consulting & Independent Services | Enterprise | Legal micro-enterprises, documentation studios, compliance services, digital products and independent consulting. | 1 |

### Domain normalization decisions

- Legal practice areas are separated from career titles.
- Court practice is separated from non-practice legal and legal-adjacent work.
- Corporate Governance and Company Secretary practice link to the Commerce ontology.
- Financial, insolvency and market-regulation roles link to Commerce.
- AI, privacy, cyber and digital-governance roles link to Science/Technology and Humanities ethics.
- Legal operations and services-industry roles are separated from substantive legal practice.
- Flexible, education and micro-enterprise roles remain service or employment models.
- Sectoral law connects to the relevant sector ontology rather than duplicating sector knowledge.
- Public-interest, environmental and social-law careers preserve field and community contexts.
- A low or no individual licence requirement does not remove confidentiality, ethics or data-protection obligations.

## 7. Normalized Law Stream Registry



### 7.1 Litigation, Advocacy & Court Practice (`LAW-DOM-LIT`)

| Stream Code | Normalized Stream | Entity Nature | Source Cluster | Source Sub-Cluster | Legal Education Needed | Minimum Entry Stage | Recommended Pathway | Core Degrees / Certifications |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| LAW-STR-LIT-ADVOLITI | Advocate / Litigator | Professional Practice Stream | Core Legal Practice | Civil, criminal, commercial litigation | Mandatory LLB + Bar enrolment | After 12th or graduation | 5-year integrated LLB after 12th or 3-year LLB after graduation; enrol with State Bar Council; clear AIBE | BA/BBA/BCom/BSc LLB or 3-year LLB |
| LAW-STR-LIT-EDISCDOCUREVI | E-Discovery / Document Review Specialist | Interdisciplinary Technology-Law Stream | Legal Technology | Litigation support, investigations | LLB helpful; not always mandatory | After graduation | LLB/forensics/IT; e-discovery platforms; document review | LLB/BA/BCom/BTech; Relativity/Nuix optional |
| LAW-STR-LIT-TAXLAWY | Tax Lawyer | Legal Domain Stream | Tax & Fiscal Law | Direct and indirect tax litigation/advisory | LLB useful/required for legal practice; CA/CS route also strong | After graduation | LLB/CA/CS; tax internships; tribunal exposure | LLB/CA/CS/MCom; LLM Tax optional |
| LAW-STR-LIT-NCLTNCLAPRAC | NCLT / NCLAT Practitioner | Professional Practice Stream | Tribunal Practice | Company, insolvency, competition matters | LLB + Bar enrolment for advocate; CS/CA/CMA can appear in specified matters | After professional qualification | LLB/CS/CA/CMA; company law and IBC expertise | LLB/CS/CA/CMA |
| LAW-STR-LIT-LITIFINAANAL | Litigation Finance Analyst | Legal Domain Stream | Finance & Legal Services | Case funding, risk assessment | LLB/finance useful | After graduation | Law/finance; litigation risk modelling; due diligence | LLB/MBA/CFA optional |

### 7.2 Judiciary, Prosecution & Government Legal Service (`LAW-DOM-JUD`)

| Stream Code | Normalized Stream | Entity Nature | Source Cluster | Source Sub-Cluster | Legal Education Needed | Minimum Entry Stage | Recommended Pathway | Core Degrees / Certifications |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| LAW-STR-JUD-JUDIOFFICIVIJUDG | Judicial Officer / Civil Judge | Public/Judicial Service Stream | Judiciary & Public Law | Subordinate judiciary | Mandatory LLB | After graduation/LLB | LLB; prepare for State Judicial Service Examination | LLB; some states require advocate experience for higher judicial service |
| LAW-STR-JUD-PUBLPROSASSIPUBL | Public Prosecutor / Assistant Public Prosecutor | Public/Judicial Service Stream | Judiciary & Public Law | Criminal prosecution | Mandatory LLB | After LLB/practice | LLB; enrolment/practice as required by state; APP/PP recruitment | LLB; Bar enrolment often required; experience varies by state |
| LAW-STR-JUD-LAWCLERJUDICLER | Law Clerk / Judicial Clerk | Public/Judicial Service Stream | Judiciary & Public Law | Judge's research support | LLB generally required | After LLB | LLB with strong research and writing; court internships | LLB/LLM desirable |
| LAW-STR-JUD-PATEAGEN | Patent Agent | Public/Judicial Service Stream | IP & Innovation | Patent drafting/prosecution | Technical degree mandatory; LLB not mandatory | After graduation in science/engineering | Science/engineering degree; Patent Agent Exam; patent drafting training | BSc/MSc/BTech/MTech/PhD as eligible; patent agent exam |
| LAW-STR-JUD-DEFESERVLEGAOFFI | Defence Services Legal Officer / JAG | Public/Judicial Service Stream | Government & Defence Law | Military law and defence legal service | LLB required | After LLB | LLB; meet defence recruitment eligibility; SSB/interview | LLB recognized by BCI; eligibility as notified |

### 7.3 Corporate, Commercial, Contracts & In-House Law (`LAW-DOM-CORP`)

| Stream Code | Normalized Stream | Entity Nature | Source Cluster | Source Sub-Cluster | Legal Education Needed | Minimum Entry Stage | Recommended Pathway | Core Degrees / Certifications |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| LAW-STR-CORP-CORPLAWY | Corporate Lawyer | Professional Practice Stream | Core Legal Practice | Corporate advisory, M&A, contracts | Mandatory LLB | After 12th or graduation | LLB with corporate law electives; internships in law firms/companies | LLB; optional LLM/CS/NISM modules |
| LAW-STR-CORP-INHOUSLEGACOUN | In-house Legal Counsel | Legal Domain Stream | Corporate & Institutional | Internal legal advisory | LLB usually mandatory | After LLB | LLB; internships in companies; contract and compliance skills | LLB; CS/MBA optional |
| LAW-STR-CORP-CONTLIFEMANASPEC | Contract Lifecycle Management Specialist | Legal Operations Stream | Legal Operations | Contract automation and operations | LLB useful, not always mandatory | After graduation | Law/commerce degree; CLM tools; contract drafting | LLB/BCom/MBA; CLM certifications |
| LAW-STR-CORP-MEDIENTELAWY | Media & Entertainment Lawyer | Interdisciplinary Technology-Law Stream | Creative Economy Law | Film, OTT, music, publishing, sports contracts | LLB generally required | After 12th/graduation | LLB with IP/media law; internships with media houses/law firms | LLB; IP/media law certificate optional |
| LAW-STR-CORP-INFRPROJLAWY | Infrastructure / Projects Lawyer | Legal Domain Stream | Corporate & Public Contracts | PPP, EPC, concession, energy projects | LLB generally required | After LLB | LLB; infrastructure contracts and project finance | LLB; MBA/finance optional |
| LAW-STR-CORP-LABOEMPLLAWY | Labour & Employment Lawyer | Legal Domain Stream | Corporate & Social Law | Employment contracts, disputes, HR compliance | LLB for practice; HR/compliance routes exist | After LLB/graduation | LLB or HR law path; labour codes and IR exposure | LLB/MHRM/HR certifications |
| LAW-STR-CORP-LEGADESILEGAUX | Legal Design / Legal UX Specialist | Interdisciplinary Technology-Law Stream | Legal Technology & Design | Plain-language contracts, legal journeys | LLB not mandatory; law + design ideal | After graduation | Law/design/UX; service design; legal communication | LLB/BDes/UX certifications optional |
| LAW-STR-CORP-SMARCONTBLOCLEGA | Smart Contract / Blockchain Legal Specialist | Interdisciplinary Technology-Law Stream | Technology & Finance Law | Blockchain, tokenization, digital assets | LLB preferred; tech/finance route possible | After graduation/LLB | LLB/tech/finance; blockchain basics; fintech regulation | LLB/BTech/MBA; blockchain cert optional |
| LAW-STR-CORP-LEGADATAANAL | Legal Data Analyst | Interdisciplinary Technology-Law Stream | Legal Analytics | Case, contract, compliance and claims analytics | LLB not mandatory; legal domain useful | After graduation | Data analytics + law/domain knowledge; Excel/SQL/BI | BA/BCom/BTech/LLB + analytics certs |
| LAW-STR-CORP-PHARREGULEGASPEC | Pharma Regulatory & Legal Specialist | Legal Domain Stream | Sectoral Compliance | Drugs, clinical trials, pharma contracts | Law/pharma/science route | After graduation | Pharmacy/science/law; CDSCO and pharma regulation | BPharm/MPharm/LLB/MSc; regulatory affairs certs |
| LAW-STR-CORP-MARISHIPLAWY | Maritime / Shipping Lawyer | Legal Domain Stream | International & Transport Law | Shipping contracts, admiralty, logistics | LLB generally required | After LLB | LLB; maritime law; shipping industry exposure | LLB/LLM Maritime Law optional |
| LAW-STR-CORP-LEGATRANMULTLEGA | Legal Translation / Multilingual Legal Specialist | Legal Domain Stream | Adjacent Legal Profession | Translation of contracts, judgments, evidence | Law and language expertise useful | After 12th/graduation | Language degree + legal terminology; translation tools | BA/MA Languages/LLB optional; translation certs |

### 7.4 Corporate Governance, Secretarial & Compliance (`LAW-DOM-GOV`)

| Stream Code | Normalized Stream | Entity Nature | Source Cluster | Source Sub-Cluster | Legal Education Needed | Minimum Entry Stage | Recommended Pathway | Core Degrees / Certifications |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| LAW-STR-GOV-COMPSECRWITHLAW | Company Secretary with Law Specialization | Legal Domain Stream | Corporate Governance | Board, secretarial, compliance | CS qualification; LLB strongly useful | After 12th | CSEET after 12th; CS Executive/Professional; optional LLB | ICSI CS; LLB optional/valuable |
| LAW-STR-GOV-COMPOFFI | Compliance Officer | Legal Domain Stream | Compliance & Governance | General corporate compliance | LLB/CS/MBA useful; depends sector | After graduation | Law/commerce/management degree; compliance certifications | LLB/CS/MBA; NISM/AML/GRC certifications |
| LAW-STR-GOV-NGOLEGACOMPOFFI | NGO Legal & Compliance Officer | Legal Domain Stream | Social Sector Law | FCRA, trusts, societies, governance | LLB/CS useful | After graduation | Law/CS/social sector; NGO compliance and donor contracts | LLB/CS/MSW optional |
| LAW-STR-GOV-CSRIMPACOMPSPEC | CSR & Impact Compliance Specialist | Legal Domain Stream | Corporate Governance & Social Impact | CSR law, impact reporting, grants | LLB/CS/MBA useful | After graduation | Law/CS/MBA/social work; CSR rules and impact measurement | LLB/CS/MBA/MSW optional |

### 7.5 Tax, Fiscal & Economic Regulation (`LAW-DOM-TAX`)

_No Career Master stream currently assigned; the domain is retained from supporting workbook layers._

### 7.6 Banking, Securities, Insurance, FinTech & Financial Crime (`LAW-DOM-FIN`)

| Stream Code | Normalized Stream | Entity Nature | Source Cluster | Source Sub-Cluster | Legal Education Needed | Minimum Entry Stage | Recommended Pathway | Core Degrees / Certifications |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| LAW-STR-FIN-REGUAFFASPEC | Regulatory Affairs Specialist | Interdisciplinary Technology-Law Stream | Sectoral Regulation | Pharma, telecom, fintech, energy, education | LLB useful; sector degree also valuable | After graduation | Law/sector degree; regulatory certifications; compliance internships | LLB/BPharm/BTech/MBA as sector-specific |
| LAW-STR-FIN-BANKFINALAWY | Banking & Finance Lawyer | Legal Domain Stream | Corporate & Finance | Lending, project finance, fintech | LLB generally required | After LLB | LLB; finance and securities internships; banking law | LLB; CS/CA/CFA/NISM useful |
| LAW-STR-FIN-FINTPAYMLAWY | FinTech / Payments Lawyer | Interdisciplinary Technology-Law Stream | Technology & Finance Law | Digital lending, UPI, crypto, payments | LLB preferred; compliance/finance routes exist | After graduation/LLB | LLB/CS/MBA + fintech regulations; product/legal internships | LLB; NISM/fintech certifications optional |
| LAW-STR-FIN-SECULAWYCAPIMARK | Securities Lawyer / Capital Markets Counsel | Legal Domain Stream | Corporate & Finance | IPO, listing, funds, securities regulation | LLB generally required | After LLB | LLB; securities law internships; finance literacy | LLB; CS/NISM useful |
| LAW-STR-FIN-INVEFUNDLAWY | Investment Funds Lawyer | Interdisciplinary Technology-Law Stream | Corporate & Finance | AIF, mutual funds, VC, private equity | LLB generally required | After LLB | LLB; fund documentation and securities regulation | LLB; CS/NISM/CFA optional |
| LAW-STR-FIN-INSULAWYCLAICOUN | Insurance Lawyer / Claims Counsel | Interdisciplinary Technology-Law Stream | Sectoral Law | Insurance disputes, policy wording, claims | LLB preferred/required for legal roles | After LLB/graduation | LLB; insurance law; claims and IRDAI exposure | LLB; insurance certifications optional |
| LAW-STR-FIN-SANCAMLCOMPSPEC | Sanctions / AML Compliance Specialist | Legal Domain Stream | Financial Crime Compliance | AML, KYC, sanctions, fraud risk | LLB/finance useful; not mandatory | After graduation | Law/commerce/finance; AML/KYC certifications; banking/fintech exposure | LLB/BCom/MBA; AML certifications optional |
| LAW-STR-FIN-WHITCOLLCRIMLAWY | White Collar Crime Lawyer | Legal Domain Stream | Criminal & Corporate Enforcement | Fraud, corruption, economic offences | LLB + Bar enrolment for practice | After LLB | LLB; criminal/economic offences; investigation exposure | LLB; forensic accounting useful |

### 7.7 Insolvency, Restructuring & Distressed Assets (`LAW-DOM-IBC`)

| Stream Code | Normalized Stream | Entity Nature | Source Cluster | Source Sub-Cluster | Legal Education Needed | Minimum Entry Stage | Recommended Pathway | Core Degrees / Certifications |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| LAW-STR-IBC-INSOPROF | Insolvency Professional | Legal Domain Stream | Insolvency & Restructuring | IBC resolution and liquidation | Specific professional eligibility; LLB/CA/CS/CMA routes | After professional qualification/experience | LLB/CA/CS/CMA/MBA + experience; IBBI route/PGIP | Eligible professional qualification + IBBI requirements; PGIP route |
| LAW-STR-IBC-RESOPROFSUPPANAL | Resolution Professional Support Analyst | Legal Operations Stream | Insolvency & Restructuring | IBC operations support | LLB/CA/CS useful | After graduation | Law/commerce/finance; IBC process training | LLB/BCom/CA/CS/CMA/MBA optional |

### 7.8 Intellectual Property, Innovation & Creative Economy Law (`LAW-DOM-IP`)

| Stream Code | Normalized Stream | Entity Nature | Source Cluster | Source Sub-Cluster | Legal Education Needed | Minimum Entry Stage | Recommended Pathway | Core Degrees / Certifications |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| LAW-STR-IP-INTEPROPLAWY | Intellectual Property Lawyer | Legal Domain Stream | IP & Innovation | Patents, trademarks, copyright, designs | LLB needed for legal practice; patent agent has separate rules | After 12th/graduation | LLB; science/engineering useful for patents; IP internships | LLB; technical degree for patent agent; IP diplomas |
| LAW-STR-IP-TRADATTOBRANPROT | Trademark Attorney / Brand Protection Specialist | Legal Domain Stream | IP & Innovation | Trademark filing, opposition, enforcement | LLB for attorney; non-law brand protection roles exist | After graduation/LLB | LLB or brand/IP operations path; trademark search and prosecution | LLB; IP diploma optional |

### 7.9 Technology, Privacy, Cyber, AI & Digital Governance (`LAW-DOM-TECH`)

| Stream Code | Normalized Stream | Entity Nature | Source Cluster | Source Sub-Cluster | Legal Education Needed | Minimum Entry Stage | Recommended Pathway | Core Degrees / Certifications |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| LAW-STR-TECH-DATAPROTOFFIPRIV | Data Protection Officer / Privacy Counsel | Interdisciplinary Technology-Law Stream | Technology Law | Privacy and data protection | LLB preferred for counsel; tech/privacy backgrounds accepted | After graduation/LLB | LLB/CS/IT + privacy certification; DPDP Act expertise | LLB; CIPP/E/CIPM optional; cybersecurity basics |
| LAW-STR-TECH-CYBELAWSPEC | Cyber Law Specialist | Interdisciplinary Technology-Law Stream | Technology Law | Cybercrime, cybersecurity law | LLB preferred/needed for legal representation | After 12th/graduation | LLB + cyber law diploma/certification; digital evidence skills | LLB; cyber law/forensics certifications |
| LAW-STR-TECH-AIGOVEAIPOLI | AI Governance / AI Policy Lawyer | Interdisciplinary Technology-Law Stream | Technology Law | AI regulation, ethics, governance | LLB useful; policy/tech route possible | After graduation/LLB | LLB/public policy/tech; AI ethics and risk frameworks | LLB/LLM/Public Policy; AI governance certificates |
| LAW-STR-TECH-LEGATECHPRODMANA | Legal Tech Product Manager | Interdisciplinary Technology-Law Stream | Legal Technology | SaaS, workflow, System/legal ops products | LLB not mandatory but strong advantage | After graduation | Law/CS/management + product management + legal workflow knowledge | LLB/MBA/BTech optional; product certifications |
| LAW-STR-TECH-ONLIDISPRESOPLAT | Online Dispute Resolution Platform Specialist | Legal Operations Stream | ADR & Legal Tech | ODR process, platform operations | LLB/mediation useful but not mandatory | After graduation | Law/ADR/operations/tech; ODR platform workflows | LLB/BA/MBA; mediation training optional |
| LAW-STR-TECH-LEGAAIPROMENGI | Legal AI Prompt Engineer / Workflow Designer | Interdisciplinary Technology-Law Stream | Legal Technology & AI | Prompting, automation, legal copilots | LLB highly useful; not mandatory for technical roles | After graduation | Law + AI tools + workflow automation; prompt testing and evaluation | LLB/BTech/BA + AI/no-code certifications |
| LAW-STR-TECH-DIGIPUBLINFRLAW | Digital Public Infrastructure Law Specialist | Interdisciplinary Technology-Law Stream | Technology & Governance | Aadhaar, UPI, ONDC, digital identity, public platforms | LLB/public policy/tech route | After graduation | Law/policy/technology; privacy, procurement, platform governance | LLB/MPP/BTech optional |
| LAW-STR-TECH-LEGAENTRLEGASERV | Legal Entrepreneur / Legal Services Startup Founder | Legal Knowledge/Education Stream | Entrepreneurship | Law firm, legal tech, legal education, document services | Depends on service; LLB needed for legal practice | After 12th/graduation/LLB | LLB for practice-based venture; business/product skills for legal tech/education | LLB/MBA/BTech as per venture |

### 7.10 ADR, Mediation, Arbitration & ODR (`LAW-DOM-ADR`)

| Stream Code | Normalized Stream | Entity Nature | Source Cluster | Source Sub-Cluster | Legal Education Needed | Minimum Entry Stage | Recommended Pathway | Core Degrees / Certifications |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| LAW-STR-ADR-ARBICOUN | Arbitration Counsel | Legal Domain Stream | Dispute Resolution | Domestic and international arbitration | LLB required for counsel role | After LLB/practice | LLB; arbitration internships; commercial law expertise | LLB; LLM/CIArb/ICA training optional |
| LAW-STR-ADR-MEDICONC | Mediator / Conciliator | Legal Domain Stream | Dispute Resolution | Mediation, family/community/business disputes | LLB useful but not always mandatory; court-linked roles vary | After graduation/LLB | Mediation training; psychology/communication; law basics | LLB/psychology/social work plus mediation certification |

### 7.11 International, Trade, Immigration, Transport & Space Law (`LAW-DOM-INT`)

| Stream Code | Normalized Stream | Entity Nature | Source Cluster | Source Sub-Cluster | Legal Education Needed | Minimum Entry Stage | Recommended Pathway | Core Degrees / Certifications |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| LAW-STR-INT-INTETRADLAWY | International Trade Lawyer | Legal Domain Stream | International & Trade Law | WTO, customs, trade remedies | LLB preferred; LLM valuable | After graduation/LLB | LLB + international trade/economics; LLM optional | LLB/LLM; economics/trade certifications |
| LAW-STR-INT-IMMILAWYGLOBMOBI | Immigration Lawyer / Global Mobility Advisor | Legal Domain Stream | International & People Mobility | Visas, citizenship, work permits | LLB required for legal practice; consultants vary by jurisdiction | After graduation/LLB | LLB or immigration consulting route; country-specific rules | LLB; global immigration certifications optional |
| LAW-STR-INT-AVIALAWY | Aviation Lawyer | Interdisciplinary Technology-Law Stream | International & Transport Law | Airline, airport, drone, leasing law | LLB generally required | After LLB | LLB; aviation regulation, finance/leasing exposure | LLB/LLM Air & Space Law optional |
| LAW-STR-INT-SPACLAWSATEPOLI | Space Law & Satellite Policy Specialist | Legal Domain Stream | Futuristic Sectoral Law | Satellites, space commerce, liability | LLB/policy/tech route | After graduation/LLB | Law/public policy/aerospace; space policy and telecom regulation | LLB/LLM Air & Space Law/BTech Aerospace optional |
| LAW-STR-INT-INTEORGALEGAOFFI | International Organization Legal Officer | Legal Domain Stream | International Law | UN, development banks, treaty bodies | LLB/LLM strongly preferred; experience required | After LLB/LLM/experience | LLB + LLM/international law; internships/fellowships; languages | LLB/LLM; international relations; language skills |

### 7.12 Constitutional, Administrative, Human Rights & Public Interest Law (`LAW-DOM-PUB`)

| Stream Code | Normalized Stream | Entity Nature | Source Cluster | Source Sub-Cluster | Legal Education Needed | Minimum Entry Stage | Recommended Pathway | Core Degrees / Certifications |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| LAW-STR-PUB-HUMARIGHLAWY | Human Rights Lawyer | Legal Domain Stream | Public Interest Law | Civil liberties, PIL, rights advocacy | LLB required for court practice; advocacy roles may not | After 12th/graduation | LLB/public policy/social work; NGO internships; litigation exposure | LLB/LLM Human Rights optional |
| LAW-STR-PUB-ENVILAWYESGCOUN | Environmental Lawyer / ESG Counsel | Legal Domain Stream | Public Interest & Corporate | Environmental law, climate, ESG | LLB for legal practice; ESG roles may include non-law routes | After 12th/graduation | LLB/environmental studies; ESG certifications; NGT exposure | LLB/LLM Environmental Law; ESG certs optional |
| LAW-STR-PUB-LEGAAIDCOOR | Legal Aid Coordinator | Interdisciplinary Technology-Law Stream | Public Interest & Administration | Access to justice, clinics, outreach | LLB/social work useful | After graduation/LLB | Law/social work/public administration; legal services clinics | LLB/MSW/BA; legal aid training |
| LAW-STR-PUB-LEGAETHIPROFRESP | Legal Ethics & Professional Responsibility Officer | Legal Domain Stream | Governance & Ethics | Professional conduct, conflicts, confidentiality | LLB/ethics/compliance useful | After LLB/experience | LLB + compliance/ethics; law firm/corporate governance exposure | LLB/CS/GRC certifications optional |

### 7.13 Environmental, Climate, Land, Forest & Resource Law (`LAW-DOM-ENV`)

_No Career Master stream currently assigned; the domain is retained from supporting workbook layers._

### 7.14 Criminal Justice, Forensics, Investigation & Evidence (`LAW-DOM-CRIM`)

| Stream Code | Normalized Stream | Entity Nature | Source Cluster | Source Sub-Cluster | Legal Education Needed | Minimum Entry Stage | Recommended Pathway | Core Degrees / Certifications |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| LAW-STR-CRIM-FORELEGACONS | Forensic Legal Consultant | Legal Domain Stream | Criminal Justice & Forensics | Evidence, forensic reports, expert support | LLB useful; forensic degree often needed | After 12th/graduation | Forensic science/criminology + law basics; or LLB + forensic certification | BSc/MSc Forensic Science, LLB optional |
| LAW-STR-CRIM-CRIMCRIMJUSTRESE | Criminologist / Criminal Justice Researcher | Legal Knowledge/Education Stream | Criminal Justice & Policy | Crime research, correctional policy | LLB not mandatory; useful | After graduation | Criminology/sociology/law/public policy; research methods | BA/MA Criminology, LLB/LLM optional |
| LAW-STR-CRIM-POLILEGAADVIINVE | Police Legal Advisor / Investigation Law Specialist | Public/Judicial Service Stream | Criminal Justice & Government | Investigation support, legal vetting | LLB usually required | After LLB | LLB; criminal procedure/evidence; government recruitment/consulting | LLB; criminology optional |
| LAW-STR-CRIM-DIGIEVIDSPEC | Digital Evidence Specialist | Interdisciplinary Technology-Law Stream | Technology Law & Forensics | Electronic records, admissibility, chain of custody | LLB/forensic/IT route possible | After graduation | IT/forensics/law; Evidence Act and cyber forensics | LLB/BTech/BSc Forensics; certifications optional |

### 7.15 Family, Child, Elder, Succession & Private Client Law (`LAW-DOM-FAM`)

| Stream Code | Normalized Stream | Entity Nature | Source Cluster | Source Sub-Cluster | Legal Education Needed | Minimum Entry Stage | Recommended Pathway | Core Degrees / Certifications |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| LAW-STR-FAM-FAMILAWY | Family Lawyer | Legal Domain Stream | Private Client Law | Marriage, divorce, custody, succession | LLB + Bar enrolment for practice | After LLB | LLB; family court internships; mediation skills | LLB; mediation training optional |

### 7.16 Property, Real Estate, Infrastructure & Public Contracts (`LAW-DOM-PROP`)

| Stream Code | Normalized Stream | Entity Nature | Source Cluster | Source Sub-Cluster | Legal Education Needed | Minimum Entry Stage | Recommended Pathway | Core Degrees / Certifications |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| LAW-STR-PROP-REALESTALAWY | Real Estate Lawyer | Legal Domain Stream | Property & Infrastructure | Title, conveyancing, RERA, disputes | LLB for legal practice | After LLB | LLB; property law; title search practice; RERA exposure | LLB; real estate certificates optional |

### 7.17 Labour, Employment, Workplace & Social Compliance (`LAW-DOM-LAB`)

_No Career Master stream currently assigned; the domain is retained from supporting workbook layers._

### 7.18 Sectoral Regulation: Health, Pharma, Food, Energy & Consumer (`LAW-DOM-SEC`)

| Stream Code | Normalized Stream | Entity Nature | Source Cluster | Source Sub-Cluster | Legal Education Needed | Minimum Entry Stage | Recommended Pathway | Core Degrees / Certifications |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| LAW-STR-SEC-CONSPROTLAWY | Consumer Protection Lawyer | Legal Domain Stream | Civil & Regulatory | Consumer disputes, product liability | LLB for representation | After LLB | LLB; consumer law; drafting and court exposure | LLB |
| LAW-STR-SEC-ENERLAWY | Energy Lawyer | Legal Domain Stream | Sectoral Law | Power, renewables, oil/gas, energy transition | LLB generally required | After LLB | LLB; energy regulation; environmental and project finance exposure | LLB/LLM Energy Law optional |
| LAW-STR-SEC-HEALLAWYMEDILAW | Healthcare Lawyer / Medical Law Consultant | Legal Domain Stream | Sectoral Law | Hospitals, medico-legal, health regulation | LLB preferred; medical/legal interdisciplinary | After graduation/LLB | LLB/healthcare management/medical background; health regulations | LLB/MHA/MBBS optional depending role |
| LAW-STR-SEC-LEGAMETRPRODCOMP | Legal Metrology / Product Compliance Consultant | Legal Domain Stream | Sectoral Compliance | Labels, packaging, weights/measures | Law/compliance useful; technical knowledge needed | After graduation | Law/commerce/science; product rules; compliance audits | LLB/BSc/BCom; sector certificates optional |
| LAW-STR-SEC-FOODLAWFSSACOMP | Food Law / FSSAI Compliance Specialist | Interdisciplinary Technology-Law Stream | Sectoral Compliance | Food safety, labeling, licensing | Law/food tech useful | After 12th/graduation | Food technology/law/compliance; FSSAI rules; audit exposure | BSc Food Tech/LLB/BCom; FSSAI trainings optional |

### 7.19 Legal Operations, Knowledge, Analytics & Services Industry (`LAW-DOM-OPS`)

| Stream Code | Normalized Stream | Entity Nature | Source Cluster | Source Sub-Cluster | Legal Education Needed | Minimum Entry Stage | Recommended Pathway | Core Degrees / Certifications |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| LAW-STR-OPS-LEGAOPERMANA | Legal Operations Manager | Legal Operations Stream | Legal Operations | Budgeting, vendor, process, analytics | LLB useful but not mandatory | After graduation/experience | Law/business/operations; legal project management; analytics | LLB/MBA/Lean/Six Sigma optional |
| LAW-STR-OPS-LEGAPUBLLAWBOOK | Legal Publisher / Law Book Editor | Interdisciplinary Technology-Law Stream | Adjacent Legal Profession | Publishing, journals, legal databases | LLB/English useful | After graduation | Law/English/publishing; editorial and citation skills | LLB/BA/MA English; publishing cert optional |
| LAW-STR-OPS-LAWFIRMKNOWMANA | Law Firm Knowledge Management Specialist | Interdisciplinary Technology-Law Stream | Legal Operations | Precedents, research systems, training | LLB preferred | After LLB/graduation | LLB/library science/knowledge management; taxonomy skills | LLB/MLIS/knowledge management cert optional |

### 7.20 Legal Education, Research, Publishing & Public Legal Literacy (`LAW-DOM-EDU`)

| Stream Code | Normalized Stream | Entity Nature | Source Cluster | Source Sub-Cluster | Legal Education Needed | Minimum Entry Stage | Recommended Pathway | Core Degrees / Certifications |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| LAW-STR-EDU-LEGAACADLAWPROF | Legal Academic / Law Professor | Legal Knowledge/Education Stream | Legal Education & Research | Teaching and research | LLM/NET/PhD generally required | After LLB/LLM | LLB + LLM; UGC NET/JRF; PhD for universities | LLM, UGC NET, PhD |
| LAW-STR-EDU-LEGARESERESEASSO | Legal Researcher / Research Associate | Legal Knowledge/Education Stream | Legal Education & Research | Research support | LLB preferred; not always mandatory for policy/legal research | After graduation | BA/LLB/LLM; research methodology; writing portfolio | LLB/LLM/MA Public Policy optional |
| LAW-STR-EDU-LEGACONTWRITEDIT | Legal Content Writer / Editor | Interdisciplinary Technology-Law Stream | Adjacent Legal Profession | Blogs, explainers, manuals, course content | LLB useful but not mandatory | After 12th/graduation | English/law/humanities; SEO and legal research | LLB/BA English/Journalism optional |

### 7.21 Adjacent Legal Support, Administration & Flexible Livelihoods (`LAW-DOM-ADJ`)

| Stream Code | Normalized Stream | Entity Nature | Source Cluster | Source Sub-Cluster | Legal Education Needed | Minimum Entry Stage | Recommended Pathway | Core Degrees / Certifications |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| LAW-STR-ADJ-LEGAPROCOUTSANAL | Legal Process Outsourcing Analyst | Legal Operations Stream | Legal Services Industry | Offshore legal support | LLB useful/preferred | After graduation | LLB/BCom/BA; contract/document review training | LLB or domain degree |
| LAW-STR-ADJ-SPORLAWY | Sports Lawyer | Legal Domain Stream | Creative Economy Law | Athlete, league, sponsorship, disputes | LLB preferred/required for legal advisory | After 12th/graduation | LLB + sports management/contract law exposure | LLB; sports management optional |
| LAW-STR-ADJ-LEGIASSIPOLIDRAF | Legislative Assistant / Policy Drafter | Public/Judicial Service Stream | Government & Policy | Law-making and legislative drafting | LLB/public policy useful | After graduation | Law/political science/public policy; legislative internships | LLB/MA Public Policy/Political Science |
| LAW-STR-ADJ-CIVISERVWITHLAW | Civil Services with Law Background | Public/Judicial Service Stream | Government & Policy | UPSC/MPSC/State services | LLB not mandatory; advantageous | After graduation | Any graduation; LLB useful; UPSC/State PSC preparation | Graduation; LLB optional |
| LAW-STR-ADJ-COMPLAWLAWY | Competition Law Lawyer | Legal Domain Stream | Corporate & Economic Regulation | Antitrust, merger control, abuse of dominance | LLB preferred/required for legal practice | After LLB | LLB; economics and market analysis; CCI case exposure | LLB/LLM; economics useful |
| LAW-STR-ADJ-LEGAJOUR | Legal Journalist | Interdisciplinary Technology-Law Stream | Adjacent Legal Profession | Law reporting, explainers, court journalism | LLB helpful but not mandatory | After 12th/graduation | Journalism/English/political science/law; court beat exposure | BA Journalism/English/LLB optional |
| LAW-STR-ADJ-COURREPOLEGATRAN | Court Reporter / Legal Transcription Specialist | Legal Domain Stream | Adjacent Legal Profession | Proceedings documentation, transcription | LLB not mandatory | After 10th/12th | Stenography, language, legal terminology, transcription tools | 12th + stenography/transcription training; law basics helpful |
| LAW-STR-ADJ-PARA | Paralegal | Legal Knowledge/Education Stream | Legal Support | Research, filing, client coordination | LLB not mandatory; diploma helpful | After 12th | Paralegal diploma/BA/LLB exposure; court and office training | 12th/degree + paralegal certificate; LLB optional |
| LAW-STR-ADJ-EDUCLAWSPEC | Education Law Specialist | Legal Knowledge/Education Stream | Sectoral Law | Universities, schools, accreditation, student rights | LLB preferred | After LLB/graduation | LLB/education policy; regulatory and institutional exposure | LLB/BEd/MA Education Policy optional |
| LAW-STR-ADJ-LEGARECRTALESPEC | Legal Recruiter / Talent Specialist for Law Firms | Legal Operations Stream | Legal Services Industry | Recruitment, campus relations, lateral hiring | LLB/HR useful but not mandatory | After graduation | HR/business/law; legal market knowledge | BBA/MBA HR/LLB optional |
| LAW-STR-ADJ-COURTRIBADMI | Court / Tribunal Administrator | Legal Operations Stream | Legal Administration | Court management, registry operations | LLB/public administration useful | After 12th/graduation | Public administration/law; government recruitment; e-courts skills | Graduation/LLB optional; computer skills |
| LAW-STR-ADJ-NOTA | Notary | Legal Domain Stream | Legal Services | Authentication, affidavits, documents | Advocate/legal professional eligibility required under rules | After LLB/practice experience | LLB; advocate practice; apply under Notaries Act/Rules | LLB + practice experience as prescribed |
| LAW-STR-ADJ-OATHCOMMCOMMFOR | Oath Commissioner / Commissioner for Affidavits | Legal Domain Stream | Legal Services | Affidavit attestation | Usually advocate/appointment based | After LLB/practice | LLB; advocate enrolment; local court/government appointment | LLB + advocate enrolment usually |
| LAW-STR-ADJ-ALTELEGASERVPROV | Alternative Legal Services Provider Manager | Legal Operations Stream | Legal Services Industry | Managed legal services, GCC legal delivery | LLB/business/operations useful | After graduation | Law/operations/project management; legal process design | LLB/MBA/Lean/Six Sigma optional |
| LAW-STR-ADJ-LEGAARCHCOURRECO | Legal Archivist / Court Records & Law Library Specialist | Legal Domain Stream | Knowledge & Public Records | Law libraries, archival records, legal heritage | LLB not mandatory; library science useful | After graduation | Library science/history/law; metadata and digitization skills | MLIS/History/LLB optional |

### 7.22 Legal Entrepreneurship, Consulting & Independent Services (`LAW-DOM-ENT`)

| Stream Code | Normalized Stream | Entity Nature | Source Cluster | Source Sub-Cluster | Legal Education Needed | Minimum Entry Stage | Recommended Pathway | Core Degrees / Certifications |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| LAW-STR-ENT-LEGARISKCONS | Legal Risk Consultant | Legal Domain Stream | Advisory & Risk | Enterprise legal risk mapping | LLB/CS/MBA useful | After graduation | Law/business/risk; compliance frameworks; consulting skills | LLB/MBA/CS/GRC certificates optional |

### Registry interpretation

- The 90 Career Master roles are preserved as normalized baseline Streams because each row contains a distinct legal education requirement and pathway.
- During implementation, role-labelled Streams should be reviewed and may be split into:
  - Legal Practice Area;
  - Legal Service;
  - Career Outcome;
  - Practice Right;
  - Forum/Jurisdiction;
  - Sector link.
- “Lawyer,” “consultant,” “advisor,” “analyst” and “manager” labels do not by themselves establish practice rights.
- Emerging and flexible careers remain source-backed outcomes or service models until formal pathways are validated.

## 8. Legal Education and Pathway Architecture

### 8.1 Primary routes

```text
After Class 12
    → 5-year Integrated LLB
    → enrolment/registration as applicable
    → AIBE/certificate of practice where applicable
    → practice or non-practice career outcome

After Graduation
    → 3-year LLB
    → enrolment/registration as applicable
    → AIBE/certificate of practice where applicable
    → practice or non-practice career outcome

LLB/Other Degree
    → LLM / diploma / certification / sector qualification
    → specialised advisory, research, policy, compliance or academic pathway

Non-LLB Route
    → legal-adjacent, policy, operations, analytics, technology, content or support pathway
    → role-specific legal-knowledge and ethics checks
```

### 8.2 Integrated combinations

- BA LLB
- BBA LLB
- B.Com LLB
- B.Sc LLB
- Other recognised integrated combinations
- LLB + Company Secretary
- LLB + Finance/Compliance
- LLB + Technology/Cyber
- LLB + Public Policy
- LLB + Social Work/Counselling
- LLB + Environmental Studies
- LLB + Media/Publishing
- LLB + Data/Analytics

## 9. Examination, Enrolment and Practice Architecture

### 9.1 Examination-purpose taxonomy

`UGAdmission` | `PGAdmission` | `JudicialRecruitment` | `GovernmentRecruitment` | `ProfessionalPractice` | `ProfessionalRegistration` | `Certification`

### 9.2 Source examination routes


| Exam / Route | Level | Purpose | Eligibility Snapshot | Relevant Careers | Regulatory / Conducting Body | Preparation Starts Best From | License / Outcome | Source URL |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| CLAT UG | After 12th | Admission to 5-year UG law programmes at participating NLUs | 10+2 or equivalent; official site lists minimum marks and no upper age limit | Integrated LLB, law careers, legal policy | Consortium of NLUs | Class 11 or early Class 12 | Admission route, not practice license | https://consortiumofnlus.ac.in/clat-2026/ug-eligibility.html |
| CLAT PG | After LLB | Admission to LLM programmes at participating NLUs | LLB/equivalent; official site lists minimum marks and no upper age limit | LLM, academia, research, specialization | Consortium of NLUs | Final year LLB | Admission route, not practice license | https://consortiumofnlus.ac.in/clat-2026/pg-eligibility.html |
| AIBE | After LLB / final-stage as per current rules | Certificate of Practice for advocates in India | Law graduate/enrolled/final semester conditions as notified | Advocate, litigation, court practice | Bar Council of India | Final year LLB / post-enrolment | Certificate of Practice for court practice | https://www.allindiabarexamination.com/ |
| AILET | After 12th / after LLB | Admission to NLU Delhi UG/PG law programmes | As notified by NLU Delhi | Integrated LLB, LLM | National Law University Delhi | Class 11/12 or final LLB | Admission route | https://nationallawuniversitydelhi.in/ |
| MH-CET Law | After 12th / graduation | Admission to 5-year and 3-year law courses in Maharashtra | As notified by CET Cell Maharashtra | 5-year/3-year LLB | State Common Entrance Test Cell, Maharashtra | Class 11/12 or graduation final year | Admission route | https://cetcell.mahacet.org/ |
| CUET Law / University Law Entrances | After 12th/graduation | Admission to law or allied programmes in participating universities | As notified by NTA/universities | BA LLB/LLB/legal studies programmes | NTA/universities | Class 12/graduation | Admission route | https://nta.ac.in/ |
| State Judicial Service Exams | After LLB | Recruitment to subordinate judiciary | LLB; state-specific age/experience/language rules | Civil Judge/Judicial Magistrate | State High Courts/PSC | During LLB final years or after LLB | Judicial appointment | Official state High Court/PSC portals |
| UGC NET Law | After LLM | Eligibility for assistant professor/JRF pathway | Master's degree as per UGC rules | Academia, research, PhD | UGC/NTA | During LLM | Academic eligibility, not practice license | https://ugcnet.nta.ac.in/ |
| CSEET / CS Executive / CS Professional | After 12th / graduation | Company Secretary qualification | After 10+2 route or direct entry route as prescribed | CS, governance, compliance, NCLT support | ICSI | Class 12 or graduation | ICSI membership/practice route | https://www.icsi.edu/WebModules/AboutUs/Courses/CS_Course_01042014.htm |
| IBBI Limited Insolvency Examination / PGIP | After eligible professional qualification or PGIP route | Insolvency Professional registration route | Eligibility as per IBBI/IP regulations/PGIP route | Insolvency Professional | IBBI / IICA for PGIP | After professional experience or PGIP admission | IBBI registration as IP | https://ibbi.gov.in/insolvency-professional |
| NISM-Series-XV Research Analyst | Graduate/professional | Knowledge benchmark for SEBI research analyst roles | As per NISM/SEBI norms; certificate validity as notified | Securities research, investment compliance, legal-finance roles | NISM/SEBI | During graduation or after | Certification, supports regulated role | https://www.nism.ac.in/research-analyst-certification-examination/ |
| Cyber / Digital Forensics Certifications | After 12th/graduation | Cyber law and digital evidence skill layer | Varies by certifying body | Cyber law, digital evidence, incident response | CERT-In ecosystem/private certifying bodies | Any stage with IT interest | Skill certification, not legal practice license | https://www.cert-in.org.in/ |

### 9.3 Source licence and registration matrix

| License / Permission Type | When Required | Careers Affected | Authority / Body | System Compliance Field | Renewal / Continuing Obligation | Source URL |
| --- | --- | --- | --- | --- | --- | --- |
| State Bar Council Enrolment | To be enrolled as an advocate after LLB | Advocate, litigation, court/tribunal practice | State Bar Councils under BCI framework | bar_enrolment_status | State Bar Council rules; verification requirements | https://www.barcouncilofindia.org/ |
| AIBE Certificate of Practice | To practice law in courts after enrolment | Advocate, litigators, court-facing lawyers | Bar Council of India | aibe_cop_status | As per BCI/AIBE rules and notifications | https://www.barcouncilofindia.org/info/aibe-info |
| Professional CS Membership / Certificate of Practice | To practice as Company Secretary in practice | Company Secretary, PCS, governance professional | ICSI | icsi_membership_status | ICSI rules, CPE and practice requirements | https://www.icsi.edu/WebModules/AboutUs/Courses/CS_Course_01042014.htm |
| IBBI Insolvency Professional Registration | To act as Insolvency Professional under IBC | Insolvency Professional, RP/liquidator roles | IBBI and IPAs | ibbi_registration_status | CPE, compliance, disciplinary framework | https://ibbi.gov.in/insolvency-professional |
| Patent Agent Registration | To act as patent agent before Indian Patent Office | Patent Agent, patent prosecution specialist | Indian Patent Office / CGPDTM | patent_agent_status | Renewal/maintenance as applicable | https://ipindia.gov.in/ |
| Government Appointment / Service Rules | For judicial, prosecution, court staff, JAG, government roles | Judge, prosecutor, court admin, JAG, legal officer | High Courts, PSCs, UPSC, Defence authorities | govt_appointment_status | Service conduct rules | Official recruiting authority portals |
| Sectoral Entity Permission / Licensing | Where regulated activity is by company/entity rather than individual | Fintech, insurance, pharma, food, legal metrology, data, energy | RBI/SEBI/IRDAI/FSSAI/CDSCO/CERC etc. | sector_license_dependency | Entity compliance filings and renewals | Official sector regulator portals |
| No Individual Legal License | For non-practice adjacent roles | Legal content, product, legal ops, paralegal, journalism, data analyst | Not applicable; employer/client policy applies | license_not_required_flag | Ethics, confidentiality, data protection obligations | Varies by employer/client |

### 9.4 Practice-readiness sequence

```text
Recognised legal education completed
    → State/professional enrolment or registration
    → required professional examination passed
    → certificate of practice / licence active
    → forum and activity permission verified
    → permitted legal service
```

Not every legal career requires every step.

## 10. Legal Skills and Evidence Architecture

### 10.1 Source skill taxonomy


| Skill Domain | Skill | Linked Clusters | Level | System Assessment Type | Evidence / Portfolio Artifact |
| --- | --- | --- | --- | --- | --- |
| Legal Core | Legal research and citation | All legal clusters | Foundation to advanced | Research task/case note | Case note, memo, citation exercise |
| Legal Core | Drafting pleadings and legal notices | Litigation, criminal, civil, consumer, family | Intermediate | Drafting test | Notice, plaint, petition draft |
| Legal Core | Contract drafting and redlining | Corporate, finance, IP, media, infrastructure | Intermediate-Advanced | Contract task | Redlined agreement, clause matrix |
| Advocacy | Oral advocacy and courtroom procedure | Litigation, judiciary, prosecution | Intermediate-Advanced | Moot/court simulation | Moot memorial, oral feedback |
| Compliance | Compliance calendar and regulatory tracking | Compliance, CS, corporate, sectoral | Foundation-Advanced | Tracker review | Compliance calendar |
| Technology | AI-assisted legal research verification | Legal tech, research, litigation, corporate | Emerging | AI output audit | Prompt log + verified citations |
| Technology | CLM and legal workflow design | Legal ops, corporate, ALSP, System | Emerging | Workflow design | Process map, CLM fields |
| Data | Excel/SQL/BI legal analytics | Legal analytics, risk, compliance, litigation finance | Emerging | Dashboard/project | Legal dashboard, data dictionary |
| Cyber/Forensics | Digital evidence and chain of custody | Cyber, criminal, white collar, forensics | Specialized | Evidence simulation | Hash log, chain-of-custody memo |
| Policy | Legislative and policy drafting | Policy, government, AI governance, DPI | Intermediate | Policy brief | Bill summary, consultation response |
| Human Skills | Negotiation and mediation | ADR, corporate, family, labour | Foundation-Advanced | Role-play/simulation | Settlement agreement, negotiation reflection |
| Business | Commercial awareness | Corporate, finance, tax, startup, in-house | Foundation-Advanced | Case study | Business/legal risk memo |
| Language | Plain legal English and multilingual clarity | Publishing, legal content, legal design, practice | Foundation-Advanced | Writing/editing task | Plain-language rewrite |
| Ethics | Confidentiality, conflicts and professional responsibility | All legal and legal-adjacent roles | Foundation-Advanced | Scenario test | Ethics scenario response |
| Future Sector | AI governance, privacy and platform regulation | AI, privacy, fintech, DPI, legal tech | Emerging-Advanced | Risk framework task | AI risk assessment, DPIA |

### 10.2 Evidence and portfolio types

- Case note
- Legal research memorandum
- Citation exercise
- Legal notice
- Pleading or petition draft
- Contract redline
- Clause matrix
- Moot memorial
- Oral advocacy feedback
- Compliance calendar
- Policy brief
- Consultation response
- Settlement agreement
- Negotiation reflection
- Legal risk memorandum
- Plain-language legal rewrite
- Ethics analysis
- AI-output verification log
- Legal dashboard
- Chain-of-custody memorandum
- AI risk assessment
- Data protection impact assessment

Personal evidence belongs to the Digital Twin.

## 11. Technology and Future-Law Architecture

### 11.1 Source future-law layers


| Future Layer | Description | Affected Career Clusters | System Capability Needed | Risk / Opportunity | Recommended Skill Stack | Time Horizon |
| --- | --- | --- | --- | --- | --- | --- |
| Generative AI in Legal Research | AI-assisted research, summarization, drafting and precedent retrieval | Litigation, corporate, academia, legal ops | AI tool profile, prompt/evaluation portfolio, confidentiality controls | Efficiency gain; hallucination and confidentiality risk | Legal reasoning + AI verification + citation discipline | Now-2030 |
| Contract Automation & CLM | Automated drafting, clause libraries, approvals, risk scoring | Corporate, in-house, legal ops, LPO | Contract metadata schema, clause skills, CLM tool mapping | Routine drafting commoditized; contract strategy grows | Contracts + process design + metadata + negotiation | Now-2030 |
| AI Governance & Algorithmic Accountability | Rules, audits and risk frameworks for AI systems | Tech law, policy, privacy, corporate compliance | AI governance tags, model risk taxonomy, policy portfolio | New high-value legal-policy roles | AI basics + ethics + privacy + regulatory writing | 2026-2035 |
| Digital Evidence & Deepfake Forensics | Evidence authenticity, chain of custody, synthetic media disputes | Criminal law, cyber law, white collar, forensics | Digital evidence skills and lab/forensics credential fields | Demand rises due to synthetic media | Evidence law + cyber forensics + expert communication | Now-2035 |
| Online Dispute Resolution | Platform-based settlement, mediation and small-claim dispute resolution | ADR, consumer, e-commerce, fintech | ODR readiness, mediator empanelment, platform skills | Scales access to justice; due process questions | Mediation + platform ops + data protection | Now-2030 |
| RegTech & Compliance Automation | Automated regulatory monitoring, reporting and alerts | Compliance, finance, corporate governance, sectoral law | Regulatory taxonomy, compliance calendar, audit logs | Compliance roles become analytics-driven | Regulation + dashboards + risk scoring | Now-2030 |
| Legal Data & Predictive Analytics | Data-driven litigation risk, contract risk and spend analytics | Legal ops, litigation finance, corporate | Data skill tags, dashboard portfolio, analytics projects | Better decision-making; bias and overreliance risk | Excel/SQL/BI + legal taxonomy + statistics | Now-2035 |
| Smart Contracts and Tokenized Assets | Legal architecture for code-based transactions and digital assets | Blockchain, fintech, securities, international trade | Code-literacy flag, blockchain compliance tags | New markets; regulatory uncertainty | Contracts + coding literacy + financial regulation | 2026-2035 |
| Digital Public Infrastructure Governance | Law for DPI platforms, consent layers and public digital systems | Policy, privacy, technology, public law | DPI interest tags, privacy and platform governance skills | India-specific global leadership opportunity | Public law + privacy + product thinking | Now-2035 |
| Space, Drone and Autonomous Systems Law | Commercial space, drones, autonomous mobility and liability | Space, aviation, defence, insurance, AI law | Future-sector tags, science literacy, regulation mapping | High future growth, niche early mover advantage | International law + tech + liability + contracts | 2026-2040 |

### 11.2 AI-use rule

Every AI-assisted legal workflow must preserve:

- competent human review;
- verified legal authority and citations;
- confidentiality and privilege controls;
- conflict checks;
- jurisdiction and effective-date validation;
- audit trail;
- disclosure where required;
- professional responsibility.

## 12. Flexible Legal Livelihood and Enterprise Architecture

### 12.1 Flexible legal livelihoods


| Career | Nature of Work | Remote Viability | Freelance Potential | Flexible Hours | Career Break Friendly | Income Potential | Bar Council Enrollment Required | AI Collaboration Level | Home Office Possible |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Legal Drafting Consultant | Contracts, notices, agreements drafting | High | High | Yes | Yes | Medium to High | Sometimes | High | Yes |
| Legal Translator | Translation of legal documents | High | High | Yes | Yes | Medium | No | Medium | Yes |
| RTI Consultant | RTI filing and advisory | Medium | High | Yes | Yes | Medium | No | Low | Yes |
| POSH Awareness Trainer | Training organizations on POSH compliance | Medium | Medium | Yes | Yes | High | No | Medium | Yes |
| Online Legal Tutor | Teaching CLAT/Judiciary/Law subjects | High | High | Yes | Yes | Medium to High | No | High | Yes |
| Virtual Legal Assistant | Remote legal process support | High | High | Yes | Yes | Medium | No | High | Yes |

### 12.2 Law and counselling pathways

| Career | Integration Area | Typical Work | Work Mode | License Requirement | Human Interaction Dependency | Future Scope |
| --- | --- | --- | --- | --- | --- | --- |
| Family Mediation Facilitator | Law + Counselling | Dispute resolution and settlements | Hybrid | Mediation Certification Preferred | High | High |
| Workplace Conflict Resolution Advisor | Law + HR | Employee conflict management | Hybrid | No | High | High |
| Child Rights Support Professional | Law + Social Work | Legal and emotional support systems | Field + Office | No | High | High |
| Community Legal Literacy Trainer | Law + Education | Legal awareness programs | Online/Offline | No | High | High |

### 12.3 Law and education pathways

| Career | Nature | Audience | Work Mode | Passive Income Potential | Digital Presence Helpful | Scalability |
| --- | --- | --- | --- | --- | --- | --- |
| CLAT Mentor | Entrance coaching | Students | Online/Offline | Medium | Yes | High |
| Judiciary Exam Trainer | Competitive exam coaching | Graduates | Hybrid | Medium | Yes | High |
| Legal Content Creator | Educational legal content | Public | Online | High | Yes | Very High |
| Legal Curriculum Designer | Academic design | Institutions | Remote | Medium | No | Medium |

### 12.4 Law and digital-economy pathways

| Career | Digital Integration | Freelance Scope | AI Augmentation | Work Location | Future Readiness |
| --- | --- | --- | --- | --- | --- |
| Startup Legal Consultant | Startup ecosystem | High | Medium | Hybrid | High |
| Influencer Contract Advisor | Creator economy | High | Medium | Remote | High |
| Digital Privacy Consultant | Data governance | Medium | High | Remote | Very High |
| AI Governance Documentation Specialist | AI compliance | High | High | Remote | Very High |
| Legal Tech Onboarding Consultant | Legal SaaS | Medium | High | Remote | High |

### 12.5 Legal micro-entrepreneurship

| Business Model | Description | Initial Investment | Scalability | Remote Possible | Ideal Background |
| --- | --- | --- | --- | --- | --- |
| Legal Documentation Studio | Drafting and filing services | Low | Medium | Yes | LLB / Documentation Experience |
| Online Legal Template Store | Selling legal templates online | Low | High | Yes | Legal Drafting |
| Compliance Filing Service | GST, labor, and legal filings | Low | High | Partial | Law + Compliance |
| Legal Education Channel | YouTube/course-based legal teaching | Low | Very High | Yes | Law + Teaching |
| Local Governance Advisory | Advisory for societies and local bodies | Medium | Medium | Partial | Public Law |
| Multilingual Legal Services | Regional legal drafting and translation | Low | High | Yes | Law + Languages |

### Service-model safety rule

A service model must state:

- whether an LLB is required;
- whether advocate enrolment is required;
- whether a certificate or registration is required;
- whether the service constitutes legal practice;
- who may sign, file, represent or advise;
- applicable jurisdiction;
- confidentiality and professional-liability controls.

## 13. Emerging, Niche and Interdisciplinary Law Careers


| Career | Primary Integration Area | Typical Work | Future Potential | AI Resistance | Independent Practice Potential | Remote/Flexible Possible | Regional Relevance | Suggested Background |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Heritage Law Consultant | Law + Heritage | Heritage property and monument compliance | High | High | Medium | Partial | Urban/Cultural Regions | Law + Heritage Studies |
| Art & Antiquities Documentation Advisor | Law + Art | Ownership and export documentation | Medium | Medium | High | Yes | Urban | Law + Art/Culture |
| Cultural Rights Researcher | Law + Sociology | Indigenous and cultural rights research | High | High | Medium | Yes | Rural/Tribal | Law + Social Sciences |
| Environmental Impact Documentation Specialist | Law + Environment | EIA and sustainability documentation | High | Medium | High | Partial | Industrial/Rural | Law + Environmental Studies |
| Forest Rights Facilitation Consultant | Law + Rural Governance | Forest rights claims and tribal facilitation | High | High | Medium | Partial | Tribal/Rural | Law + Social Work |
| Water Governance Advisor | Law + Public Policy | Water governance and policy advisory | High | High | Medium | Partial | Rural/Urban | Law + Public Policy |
| AI Ethics Auditor | Law + AI | AI compliance and ethics review | Very High | High | High | Yes | Global | Law + AI Governance |
| Smart Contract Documentation Consultant | Law + Blockchain | Blockchain agreement interpretation | High | Medium | High | Yes | Global | Law + Fintech |
| Legal Knowledge Engineer | Law + AI Systems | Legal data structuring and ontology | Very High | Medium | High | Yes | Global | Law + Data Systems |
| Legal Prompt Designer | Law + Generative AI | Prompt systems for legal AI workflows | Very High | Medium | High | Yes | Global | Law + AI Tools |
| Digital Evidence Preservation Specialist | Law + Cyber | Digital evidence documentation | High | High | Medium | Partial | Urban | Law + Cyber Studies |
| Influencer Compliance Strategist | Law + Creator Economy | Creator contracts and disclosures | Very High | Medium | High | Yes | Urban/Digital | Law + Media |
| OTT & Media Compliance Analyst | Law + Media | Content compliance and censorship review | High | Medium | Medium | Hybrid | Urban | Law + Media Studies |
| Podcast / YouTube Legal Consultant | Law + Digital Media | Advisory for creators and channels | High | Medium | High | Yes | Digital | Law + Media |
| Meme/IP Rights Analyst | Law + Digital IP | Copyright and derivative work analysis | Medium | Medium | High | Yes | Digital | Law + IP |
| Divorce Transition Facilitator | Law + Counselling | Settlement and transition support | High | High | High | Hybrid | Urban | Law + Counselling |
| Elder Rights Advisor | Law + Gerontology | Rights and succession advisory | High | High | Medium | Partial | Urban/Rural | Law + Social Welfare |
| Child Online Safety Consultant | Law + Child Protection | Online child safety frameworks | Very High | High | Medium | Hybrid | Schools/Digital | Law + Cyber |
| Constitutional Literacy Educator | Law + Education | Constitution awareness programs | High | High | High | Yes | Pan-India | Law + Education |
| Mock Trial Program Designer | Law + Education | Designing legal simulation programs | High | High | Medium | Hybrid | Educational Institutions | Law + Education |
| Legal Gamification Designer | Law + EdTech | Legal learning simulations and games | Very High | Medium | High | Yes | Digital | Law + Game Design |
| Legislative Language Simplification Specialist | Law + Language | Simplifying legal language | Very High | High | High | Yes | Multilingual India | Law + Linguistics |
| Legal Audiobook Producer | Law + Publishing | Audio-based legal learning | High | Medium | High | Yes | Digital | Law + Media Production |
| Regional Language Compliance Writer | Law + Vernacular Content | Regional legal content drafting | Very High | High | High | Yes | Regional India | Law + Languages |
| Panchayat Governance Consultant | Law + Local Governance | Village governance advisory | High | High | Medium | Partial | Rural | Law + Governance |
| Election Process Documentation Specialist | Law + Elections | Election process and observer documentation | Medium | High | Medium | Partial | Government | Law + Political Science |
| Public Policy Drafting Associate | Law + Policy | Drafting governance and policy documents | Very High | High | Medium | Hybrid | Government/NGO | Law + Public Policy |
| Hospital Consent Documentation Specialist | Law + Healthcare | Medical consent and legal documentation | High | Medium | Medium | Partial | Healthcare | Law + Medical Administration |
| Bioethics & Medical Law Coordinator | Law + Bioethics | Healthcare ethics and compliance | Very High | High | Medium | Hybrid | Healthcare | Law + Bioethics |
| Temple/Trust Governance Advisor | Law + Religious Institutions | Trust governance and compliance | High | High | High | Partial | Religious Institutions | Law + Trust Management |
| Waqf / Religious Endowment Documentation Specialist | Law + Religious Governance | Religious endowment documentation | Medium | High | Medium | Partial | Community Institutions | Law + Governance |
| AI Courtroom Interface Trainer | Law + AI Systems | Training legal professionals on AI systems | Very High | Medium | High | Yes | Global | Law + AI |
| Virtual Reality Legal Simulation Designer | Law + VR/EdTech | Immersive legal simulations | Very High | Medium | High | Yes | Digital | Law + XR |
| Legal Metaverse Policy Consultant | Law + Virtual Worlds | Governance for virtual ecosystems | Future-Oriented | Medium | High | Yes | Global | Law + Digital Governance |
| Cross-Border Digital Identity Advisor | Law + Digital Identity | Identity and compliance systems | Very High | High | High | Yes | Global | Law + Cyber Policy |
| Algorithm Accountability Researcher | Law + AI Ethics | AI fairness and accountability analysis | Very High | High | Medium | Yes | Global | Law + AI Ethics |
| Legal Data Visualization Specialist | Law + Analytics | Visual legal analytics and reporting | High | Medium | High | Yes | Digital | Law + Data Visualization |
| Drone Regulation Consultant | Law + Aviation | Drone compliance and permissions | High | High | Medium | Partial | Urban/Industrial | Law + Aviation |
| Autonomous Vehicle Liability Analyst | Law + Mobility Tech | Liability systems for autonomous mobility | Very High | High | Medium | Hybrid | Urban | Law + AI Mobility |

### Normalization rule

These rows are preserved as Career Outcomes. They do not automatically establish:

- a recognised academic programme;
- a professional licence;
- a statutory practice right;
- current market demand;
- independent-practice permission.

## 14. Controlled Vocabularies

### 14.1 LawStreamNature
`Practice` | `JudicialService` | `Advisory` | `Regulatory` | `LegalOperations` | `LegalTechnology` | `Academic` | `Adjacent`

### 14.2 LegalEducationRequirement
`MandatoryLLB` | `LLBPreferred` | `LegalKnowledgeUseful` | `NotRequired`

### 14.3 RegistrationType
`BarEnrolment` | `ProfessionalRegistration` | `GovernmentAppointment` | `SectoralRegistration`

### 14.4 ForumType
`Court` | `Tribunal` | `Commission` | `Arbitration` | `Mediation` | `ODR` | `Administrative`

### 14.5 LegalRuleType
`Constitution` | `Act` | `Rule` | `Regulation` | `Notification` | `Order` | `Guideline` | `Treaty`

### 14.6 PracticeAreaType
`Litigation` | `Advisory` | `Transactional` | `Regulatory` | `Policy` | `Academic` | `Support`

### 14.7 MatterType
`Dispute` | `Transaction` | `Advisory` | `Compliance` | `Investigation` | `Policy` | `Registration`

### 14.8 LegalServiceType
`Representation` | `Advisory` | `Drafting` | `Research` | `Compliance` | `Mediation` | `Filing` | `Education` | `Support`

### 14.9 EvidenceCategory
`Documentary` | `Oral` | `Digital` | `Physical` | `Forensic` | `Expert` | `Circumstantial`

### 14.10 LegalTechnologyType
`Research` | `Drafting` | `CLM` | `Workflow` | `Analytics` | `Evidence` | `ODR` | `RegTech` | `Knowledge`

### 14.11 EmploymentMode
`LawFirm` | `Chambers` | `InHouse` | `Government` | `JudicialService` | `NGO` | `Academic` | `LegalOperations` | `Freelance` | `IndependentPractice` | `Enterprise` | `Hybrid`

### 14.12 ConfidentialityLevel
`Public` | `Internal` | `Confidential` | `Privileged` | `Restricted`

## 15. Relationship Inventory

| Relationship | Source | Target | Key properties |
|---|---|---|---|
| `HAS_LEGAL_QUALIFICATION` | Stream/Career Outcome | Legal Qualification | requirement_type |
| `REQUIRES_REGISTRATION` | Career Outcome/Service | Enrolment or Registration | mandatory |
| `REQUIRES_COP` | Career Outcome/Service | Certificate of Practice | mandatory |
| `UNLOCKS_PRACTICE_RIGHT` | Registration/COP | Practice Right | jurisdiction |
| `APPLIES_IN_JURISDICTION` | Rule/Forum/Outcome | Jurisdiction | — |
| `HEARD_BY` | Legal Matter | Court/Tribunal/Forum | — |
| `GOVERNED_BY` | Matter/Procedure/Obligation | Legislation/Legal Rule | effective period |
| `BELONGS_TO_PRACTICE_AREA` | Stream/Matter/Service | Legal Practice Area | primary |
| `PROVIDES_SERVICE` | Career Outcome | Legal Service | permission status |
| `USES_DOCUMENT` | Matter/Service/Procedure | Legal Document | purpose |
| `USES_EVIDENCE` | Matter/Procedure | Evidence Type | admissibility |
| `FOLLOWS_PROCEDURE` | Legal Matter | Legal Procedure | sequence |
| `RESEARCHES_WITH` | Stream/Project | Legal Research Method | — |
| `PRACTISES_BEFORE` | Career Outcome | Forum | permission |
| `SERVES_CLIENT_TYPE` | Career Outcome/Service | Client Type | — |
| `REQUIRES_MOOT_OR_CLINIC` | Degree/Stream | Moot Court/Legal Clinic | mandatory |
| `REQUIRES_SUPERVISED_PRACTICE` | Stream/Career Outcome | Supervised Legal Practice | duration |
| `USES_LEGAL_TECHNOLOGY` | Outcome/Service | Legal Technology Interface | proficiency |
| `ENABLES_SERVICE_MODEL` | Skill/Stream | Legal Service Model | readiness |
| `CROSS_DOMAIN_WITH` | Stream | External Domain/Stream | relationship_type |
| `ALTERNATIVE_TO` | Stream | Stream | reason |

## 16. Validation and Reasoning Rules

**LAW-VAL-001 — Qualification separation**  
LLB, enrolment, AIBE/certificate, registration and practice right must remain separate.

**LAW-VAL-002 — Court-practice permission**  
The system must verify current practice permission before describing a role as court practice.

**LAW-VAL-003 — Adjacent-role clarity**  
A non-LLB or non-enrolled role must not be described as an advocate or legal practitioner.

**LAW-VAL-004 — Jurisdiction requirement**  
Legal rules and permissions must include jurisdiction and effective dates.

**LAW-VAL-005 — Forum specificity**  
Appearance and filing rights must be evaluated for the relevant forum.

**LAW-VAL-006 — Sectoral regulation**  
Sectoral legal roles must link to current regulator and source-sector obligations.

**LAW-VAL-007 — Legal advice boundary**  
The ontology and chatbot may explain careers and pathways but must not substitute for legal advice.

**LAW-VAL-008 — AI verification**  
AI-generated legal research or drafting must be verified by a competent person.

**LAW-VAL-009 — Confidentiality**  
Technology and flexible-work pathways must state confidentiality controls.

**LAW-VAL-010 — Emerging-career caution**  
Emerging careers must not be presented as regulated professions without evidence.

**LAW-VAL-011 — Professional title**  
Use of protected titles must follow current authority rules.

**LAW-VAL-012 — Experience threshold**  
Judicial, senior counsel, specialist and leadership outcomes must include experience requirements.

**LAW-VAL-013 — Salary evidence**  
Income must distinguish law-firm salary, chamber income, independent fees, government pay and freelance/service revenue.

**LAW-VAL-014 — Cross-ontology links**  
Finance, technology, environment, health, media and governance roles must link to source-domain knowledge.

**LAW-VAL-015 — Source freshness**  
Admission, exam, enrolment, registration and licence data must be refreshed from official sources.

## 17. Normalization Gaps

| Gap | Priority | Treatment |
|---|---|---|
| Career, practice area and service mixed | Critical | Separate entities and relationships |
| LLB treated as sufficient for all legal practice | Critical | Add enrolment, exam, COP and practice-right chain |
| Regulated and non-regulated roles mixed | Critical | Add explicit permission fields |
| Court, tribunal and regulator not first-class | Critical | Add Forum, Jurisdiction and Authority entities |
| Flexible livelihoods may cross practice boundaries | Critical | Add service-model safety rules |
| Legal documents and evidence represented only as skills | High | Add Legal Document and Evidence Type |
| AI roles lack professional-responsibility controls | High | Add verification, confidentiality and accountability |
| Sectoral law duplicates external domains | High | Add cross-ontology links |
| Salary and demand data require validation | High | Enforce source/year/geography |
| Emerging careers lack recognised pathways | High | Preserve as outcomes with confidence |
| Education and training roles mixed with practice | Medium | Separate Knowledge/Education domain |
| Micro-enterprise investments are approximate | Medium | Store as sourced ranges with confidence |
| Institution and state-wise data incomplete | Medium | Defer authoritative loading |
| NEP credit, multiple entry/exit and multidisciplinary layer absent | High | Link common NEP curriculum-credit extension |

## 18. Derived Calculations

### 18.1 Practice readiness
```text
Practice Ready =
    recognised legal qualification
  AND required enrolment/registration active
  AND required examination passed
  AND certificate/licence active
  AND forum permission verified
```

### 18.2 Legal-career readiness
```text
Career Readiness =
    education eligibility
  + domain knowledge
  + legal skills
  + supervised experience
  + portfolio evidence
  + registration/practice status
```

### 18.3 Legal-service-model readiness
```text
Service Model Readiness =
    legal education requirement satisfied
  + practice permission verified
  + service skills
  + client and document workflow
  + confidentiality controls
  + business setup
```

### 18.4 Legal-AI readiness
```text
Legal AI Readiness =
    legal domain competence
  + technology skill
  + citation verification
  + confidentiality control
  + human accountability
```

## 19. Deferrals and Boundaries

### Requires authoritative validation

- current law-course recognition;
- CLAT/AILET/CUET and institution rules;
- State Bar enrolment and AIBE requirements;
- judicial-service eligibility by state;
- ICSI, IBBI and patent-agent requirements;
- sectoral licensing;
- current legislation and amendment status;
- court and tribunal appearance rules;
- salary, chamber-income and freelance data;
- international practice and recognition.

### Excluded from SCC ontology

- personal legal matters;
- confidential client data;
- legal opinions;
- personalized legal advice;
- case strategy;
- privileged documents;
- employer vacancies;
- personal portfolio files;
- recommendation and suitability scores.

## 20. Implementation Sequence

### Phase 1
1. Load {len(domains)} Domains.
2. Load {len(stream_rows)} normalized baseline Streams.
3. Preserve source cluster and sub-cluster.
4. Review role-labelled Streams for split into Practice Area and Career Outcome.

### Phase 2
1. Legal Qualification.
2. Registration/Enrolment.
3. Certificate of Practice.
4. Practice Right.
5. Jurisdiction.
6. Forum.

### Phase 3
1. Legislation and Legal Rule.
2. Practice Area.
3. Legal Matter.
4. Legal Service.
5. Legal Document.
6. Evidence Type.
7. Legal Procedure.

### Phase 4
1. Legal Research Method.
2. Moot Court and Legal Clinic.
3. Supervised Legal Practice.
4. Portfolio and artefacts.

### Phase 5
1. Legal Technology Interface.
2. AI workflow controls.
3. Legal operations and analytics.
4. ODR and RegTech.

### Phase 6
1. Legal Service Model.
2. Flexible livelihood and micro-enterprise.
3. Client segments and revenue models.
4. Cross-domain links.

### Phase 7 — Stress testing
Test:
- LLB versus practice permission;
- 5-year versus 3-year LLB;
- litigation versus non-practice roles;
- judiciary and government service;
- CS/IBBI/patent-agent pathways;
- law plus technology, counselling, education and media;
- flexible and remote livelihoods;
- legal micro-enterprise;
- AI use and confidentiality;
- sectoral regulation;
- career alternatives and backup paths.

## 21. Confidence Statement

| Area | Status |
|---|---|
| Common SCC compatibility | Strong |
| Domain normalization | Ready |
| Career Master stream baseline | Ready |
| Practice-right architecture | Strong conceptual baseline |
| Court/forum and legal-matter model | Ready for technical review |
| Flexible livelihood model | Strong conceptual baseline |
| AI/future-law model | Strong conceptual baseline |
| Current legal rules and permissions | Requires official validation |
| Salary and labour-market data | Not publication-ready |
| Production chatbot use | Not yet ready |
| Stress-test readiness | Ready after initial population |

> **Final position:** Law v1.0 extends the common SCC ontology with jurisdiction, forum, legal rule, practice area, legal matter, document, evidence, procedure, registration and practice-right structures. It distinguishes legal education from professional permission and separates legal practice from legal-adjacent careers and flexible service models.

---

## Appendix A — Reference Code Patterns

```text
LAW-DOM-<DOMAIN>
LAW-STR-<STREAM>
LAW-QUA-<QUALIFICATION>
LAW-REG-<REGISTRATION>
LAW-COP-<CERTIFICATE-OF-PRACTICE>
LAW-JUR-<JURISDICTION>
LAW-FOR-<FORUM>
LAW-RUL-<LEGAL-RULE>
LAW-PRA-<PRACTICE-AREA>
LAW-MAT-<LEGAL-MATTER>
LAW-SER-<LEGAL-SERVICE>
LAW-DOC-<LEGAL-DOCUMENT>
LAW-EVD-<EVIDENCE-TYPE>
LAW-PRC-<LEGAL-PROCEDURE>
LAW-RMT-<RESEARCH-METHOD>
LAW-EXP-<MOOT-CLINIC-PRACTICE>
LAW-TEC-<LEGAL-TECHNOLOGY>
LAW-LIV-<SERVICE-MODEL>
CAR-LAW-<CAREER-OUTCOME>
```

## Appendix B — Minimal Cypher-Oriented Node Labels

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
:Degree
:Certification
:Licence
:InstitutionType
:Institution
:AdmissionPathway
:Interest
:Aptitude
:Skill
:PersonalityTrait
:WorkPreference
:Activity
:Project
:InternshipType
:Portfolio
:WorkArtefact
:EmploymentMode
:EnterprisePath
:CareerOutcome
:SalaryRange
:City
:Scholarship
:EducationLoan
:LegalQualification
:EnrolmentRegistration
:CertificateOfPractice
:PracticeRight
:Jurisdiction
:CourtTribunalForum
:LegislationLegalRule
:LegalPracticeArea
:LegalMatter
:LegalService
:LegalDocument
:EvidenceType
:LegalProcedure
:LegalResearchMethod
:MootCourtLegalClinic
:SupervisedLegalPractice
:LegalTechnologyInterface
:LegalServiceModel
```

*End of RSA SCC Ontology v1.0 — Law Universe Technical Specification.*
