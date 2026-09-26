# RSA SCC Ontology v0.8 — Humanities Universe Technical Specification

**Version:** 0.8  
**Foundation:** RSA SCC Ontology v0.6 — Science Universe and v0.7 — Commerce Universe  
**Source registry:** 160 Humanities career/pathway records  
**Source:** `Structured- Arts_Humanities.xlsx`

## 1. Humanities Ontology Hierarchy

```text
RSA SCC
└── Humanities Universe
    ├── Structure and Learning Journey
    │   ├── Faculty / Knowledge Area
    │   ├── Domain
    │   ├── Stream
    │   ├── Education Stage
    │   ├── Subject
    │   ├── Subject Level
    │   ├── Subject Combination
    │   └── Multidisciplinary Combination
    │
    ├── Admission, Selection and Recognition
    │   ├── Admission Pathway
    │   ├── Examination
    │   ├── Competitive Examination
    │   ├── Audition and Portfolio Selection
    │   ├── Degree
    │   ├── Certification
    │   ├── Language Proficiency
    │   ├── Professional Recognition
    │   └── Subject Equivalence Rule
    │
    ├── Knowledge, Culture and Research
    │   ├── Research Method
    │   ├── Fieldwork and Community Engagement
    │   ├── Cultural Knowledge System
    │   ├── Heritage Asset and Collection
    │   ├── Institution
    │   └── Regulatory / Professional Body
    │
    ├── Creative and Portfolio Practice
    │   ├── Creative Practice
    │   ├── Portfolio
    │   ├── Work or Artefact
    │   ├── Publication and Media Format
    │   ├── Performance
    │   ├── Exhibition
    │   └── Supervised Practice
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
    │   ├── Apprenticeship
    │   └── Certification
    │
    └── Outcomes and Livelihood
        ├── Career Outcome
        ├── Employment Mode
        ├── Enterprise Path
        ├── Salary Range
        ├── City / Region
        ├── Audience / Community
        └── Continuing Professional Development
```

## 2. Core Design Rules

1. Domain ≠ Stream ≠ Career Outcome.
2. Academic discipline ≠ professional recognition ≠ permission to practise.
3. Competitive examination ≠ admission examination ≠ eligibility test.
4. Portfolio, audition and practical demonstration are first-class selection mechanisms.
5. Creative Practice ≠ one performance or artwork; the latter is a Work or Artefact.
6. Career labels such as professor, curator, journalist, psychologist, writer or performer are Career Outcomes, not automatically Streams.
7. Freelance, self-employment, hybrid and entrepreneurial are Employment Modes, not Domains.
8. Humanities pathways may begin from any school stream unless a programme explicitly restricts entry.
9. Language ability must be represented by Language Proficiency, not inferred from subject enrolment alone.
10. Psychology, special education, counselling and teaching pathways require explicit recognition and supervised-practice checks.
11. IKS, folk, tribal and community knowledge require ethical attribution, community context and source governance.
12. AI-era Humanities roles must preserve their Humanities base and technology interface as separate relations.
13. Eligibility and suitability remain separate; personal matching belongs to the RSA Aspirant Digital Twin.
14. Source-derived careers are preserved, while inferred ontology structure is marked as normalized.
15. NEP-aligned multidisciplinary combinations, credits and community engagement should connect through the common curriculum-credit layer.

## 3. Comparison with Science and Commerce Ontologies


| Dimension | Science v0.6 | Commerce v0.7 | Humanities v0.8 normalization |
| --- | --- | --- | --- |
| Common SCC foundation | Faculty, Domain, Stream, Education Stage, Subject, Exam, Degree, Institution, Outcome, Competency, Experience, Finance | Reused unchanged | Reused unchanged |
| Primary complexity | Scientific/technical progression, licensing, medical fitness | Professional qualifications, membership, practice rights, business functions | Portfolio evidence, creative practice, language proficiency, supervised practice, cultural/heritage knowledge |
| Selection mechanisms | Entrance examinations and eligibility | Admission, recruitment and professional progression exams | Admission exams, auditions, portfolios, interviews, competitive exams and language proficiency |
| Regulated pathways | Medicine, aviation, defence and licences | CA/CS/CMA/actuarial memberships and practice rights | Psychology/special education recognition, teaching eligibility and supervised practice |
| Experience model | Internship, project, apprenticeship | Articleship, practical training and enterprise pathways | Fieldwork, studio practice, performance, publication, exhibition, supervised practicum and community engagement |
| Outcome model | Employment and professional roles | Employment, practice, advisory, enterprise and government roles | Academic, public-service, social, creative, freelance, cultural and portfolio careers |
| Cross-domain nature | Science–technology intersections | Commerce–technology and regulatory intersections | Humanities–AI, language technology, media, public policy, culture, design and social impact |
| NEP relevance | Multidisciplinary flexibility requires extension | Major/minor, credit and vocational mobility require extension | IKS, Indian languages, arts, community engagement and multidisciplinary humanities require explicit first-class support |

## 4. Inherited SCC Entities

The Humanities ontology reuses the common entities established in Science v0.6:

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
- Syllabus Topic
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

The following Commerce v0.7 concepts are reused where relevant:

- Professional Body
- Practical Training
- Professional Membership
- Practice Right
- Enterprise Path
- Employment Mode
- Compliance Obligation

### 4.1 Required modifications to inherited entities

#### Stream

Add:

| Property | Type | Notes |
|---|---|---|
| `humanities_stream_nature` | Enum | Academic / Applied / CreativePractice / Professional / Competitive / KnowledgeIndustry / LanguageService / InterdisciplinaryDigital |
| `portfolio_requirement` | Enum | Mandatory / StronglyPreferred / Helpful / NotTypical / ProgrammeSpecific |
| `audition_requirement` | Enum | Mandatory / Possible / NotTypical / ProgrammeSpecific |
| `fieldwork_requirement` | Enum | Mandatory / Preferred / Optional / NotTypical |
| `supervised_practice_requirement` | Enum | Mandatory / Conditional / Optional / NotApplicable |
| `language_proficiency_requirements` | List (Reference) | — |
| `research_methods` | List (Reference) | — |
| `creative_practices` | List (Reference) | — |
| `cultural_knowledge_systems` | List (Reference) | — |
| `cross_faculty_entry_allowed` | Boolean | Default true unless sourced otherwise |
| `technology_interfaces` | List | AI, GIS, archives, media, UX, localization |
| `career_outcomes` | List (Reference) | — |

#### Examination

Add/retain:

| Property | Type | Notes |
|---|---|---|
| `exam_purpose` | Enum | Admission / CompetitiveRecruitment / TeacherEligibility / AcademicEligibility / ProfessionalRecognition / LanguageCertification |
| `portfolio_component` | Boolean | — |
| `audition_component` | Boolean | — |
| `writing_component` | Boolean | — |
| `interview_component` | Boolean | — |
| `subject_choice_dependency` | Structured JSON | Particularly for university-wise entrance eligibility |
| `recognition_consequence` | Reference | Professional Recognition |

#### Career Outcome

Add:

| Property | Type | Notes |
|---|---|---|
| `portfolio_dependency` | Enum | High / Moderate / Low / NotTypical |
| `public_visibility` | Enum | High / Moderate / Low |
| `audience_or_community` | List | — |
| `publication_or_media_formats` | List (Reference) | — |
| `fieldwork_intensity` | Enum | High / Moderate / Low / None |
| `creative_practice_required` | Reference | — |
| `professional_recognition_required` | Reference | — |
| `supervised_practice_required` | Reference | — |
| `language_proficiency_required` | List (Reference) | — |
| `employment_modes` | List (Reference) | Salaried, freelance, public service, academic, portfolio, enterprise |
| `technology_interfaces` | List | — |


# GROUP H — HUMANITIES-SPECIFIC ENTITIES

## 5.1 Creative Practice

A structured creative discipline or practice developed through repeated training, critique and public presentation.

| Property | Type | Notes |
|---|---|---|
| `creative_practice_id` | UUID | Immutable identifier |
| `practice_code` | String | Stable code |
| `name` | String | Music, dance, theatre, painting, illustration, craft, etc. |
| `practice_type` | Enum | Performing / Visual / Literary / Applied / Folk / Devotional / Digital / Interdisciplinary |
| `tradition_or_school` | String | Gharana, style, school or tradition where applicable |
| `training_modes` | List | Institutional / Guru-shishya / Workshop / Self-directed / Community |
| `typical_start_stage` | Reference | Education Stage |
| `proficiency_levels` | List | Foundation to advanced |
| `performance_or_exhibition_required` | Boolean | — |
| `portfolio_required` | Boolean | — |
| `certification_options` | List (Reference) | Certification |
| `career_outcomes` | List (Reference) | Career Outcome |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | Common metadata |

## 5.2 Portfolio

A structured body of evidence used for admission, selection, employment, commissioning or professional credibility.

| Property | Type | Notes |
|---|---|---|
| `portfolio_id` | UUID | Concept-level portfolio type; personal instances belong to Digital Twin |
| `portfolio_code` | String | Stable code |
| `name` | String | Writing / Research / Creative / Performance / Translation / Media / Teaching |
| `portfolio_type` | Enum | Writing / Research / Creative / Performance / Media / Translation / Teaching / Digital / Mixed |
| `required_artifact_types` | List (Reference) | Work or Artefact |
| `minimum_artifact_count` | Integer | When formally required |
| `selection_contexts` | List | Admission / Audition / Employment / Freelance / Grant / Exhibition |
| `verification_methods` | List | Published link / certificate / institutional validation / live demonstration |
| `evaluation_criteria` | List (Reference) | Portfolio Criterion |
| `applicable_streams` | List (Reference) | — |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | Common metadata |

## 5.3 Work or Artefact

A reusable concept for a created, researched, performed or published output.

| Property | Type | Notes |
|---|---|---|
| `artefact_id` | UUID | — |
| `artefact_code` | String | — |
| `name` | String | — |
| `artefact_type` | Enum | Essay / ResearchPaper / Translation / Script / Artwork / Performance / Recording / Exhibition / Map / ArchiveRecord / Podcast / Publication / DigitalProject |
| `medium` | String | Text, audio, video, stage, physical, digital |
| `skills_demonstrated` | List (Reference) | Skill |
| `verification_method` | Enum | Published / InstitutionVerified / PublicPerformance / ExpertReviewed / SelfReported |
| `copyright_or_rights_note` | Text | — |
| `applicable_portfolios` | List (Reference) | — |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | Common metadata |

## 5.4 Audition and Portfolio Selection

A selection process based on live performance, practical demonstration, portfolio, interview or combined assessment.

| Property | Type | Notes |
|---|---|---|
| `selection_id` | UUID | — |
| `selection_code` | String | — |
| `name` | String | — |
| `selection_type` | Enum | Audition / Portfolio / PracticalTest / Interview / WritingTest / Combined |
| `conducting_institution` | Reference | Institution |
| `applicable_programmes` | List | Stream / Degree / Certification |
| `components` | Structured JSON | Sequence and weights |
| `portfolio_requirements` | Reference | Portfolio |
| `audition_repertoire` | Structured JSON | Where relevant |
| `evaluation_criteria` | List (Reference) | Criterion |
| `preparation_stage` | Reference | Education Stage |
| `effective_period` | Date range | — |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | Common metadata |

## 5.5 Language Proficiency

A structured level of competence in a language.

| Property | Type | Notes |
|---|---|---|
| `language_proficiency_id` | UUID | — |
| `proficiency_code` | String | — |
| `language` | Reference: Subject/Language | — |
| `framework` | String | CEFR or body-specific |
| `level` | String | A1–C2 or equivalent |
| `components` | List | Reading / Writing / Listening / Speaking / Translation |
| `assessment_body` | Reference | Institution/Professional Body |
| `certification` | Reference | Certification |
| `validity_period` | String | If applicable |
| `career_outcomes` | List (Reference) | — |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | Common metadata |

## 5.6 Research Method

A method used in humanities and social-science inquiry.

| Property | Type | Notes |
|---|---|---|
| `research_method_id` | UUID | — |
| `method_code` | String | — |
| `name` | String | Archival, ethnographic, survey, textual, oral history, discourse, GIS, digital humanities |
| `method_family` | Enum | Qualitative / Quantitative / Mixed / Textual / Historical / Spatial / Digital / PracticeBased |
| `ethical_review_required` | Boolean | — |
| `fieldwork_required` | Boolean | — |
| `tools_used` | List | — |
| `skills_required` | List (Reference) | — |
| `applicable_streams` | List (Reference) | — |
| `evidence_outputs` | List (Reference) | Work/Artefact |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | Common metadata |

## 5.7 Fieldwork and Community Engagement

A supervised activity conducted in communities, organisations, cultural sites or field settings.

| Property | Type | Notes |
|---|---|---|
| `fieldwork_id` | UUID | — |
| `fieldwork_code` | String | — |
| `name` | String | — |
| `fieldwork_type` | Enum | SocialWork / Ethnography / Heritage / Archaeology / Geography / Community / Media / Development |
| `applicable_streams` | List (Reference) | — |
| `host_organisation_type` | String | — |
| `duration_hours` | Integer | — |
| `supervision_required` | Boolean | — |
| `ethical_protocols` | List | — |
| `evidence_produced` | List (Reference) | Artefact |
| `skills_developed` | List (Reference) | — |
| `credit_eligible` | Boolean | For NEP/common curriculum layer |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | Common metadata |

## 5.8 Supervised Practice

A formally supervised practicum required in counselling, psychology, social work, education or allied professional pathways.

| Property | Type | Notes |
|---|---|---|
| `supervised_practice_id` | UUID | — |
| `practice_code` | String | — |
| `name` | String | — |
| `practice_type` | Enum | Counselling / Clinical / SocialWork / Teaching / SpecialEducation / CareerGuidance |
| `parent_stream` | Reference | — |
| `required_stage` | Reference | Education Stage |
| `minimum_hours` | Integer | — |
| `approved_supervisor_required` | Boolean | — |
| `approved_institution_required` | Boolean | — |
| `case_or_activity_requirements` | Structured JSON | — |
| `ethical_requirements` | List | — |
| `completion_evidence` | List | — |
| `registration_consequence` | Reference | Professional Recognition |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | Common metadata |

## 5.9 Professional Recognition

A recognition, registration or eligibility status relevant to regulated or semi-regulated Humanities careers.

| Property | Type | Notes |
|---|---|---|
| `recognition_id` | UUID | — |
| `recognition_code` | String | — |
| `name` | String | Teacher eligibility, professional registration, recognised programme status |
| `recognition_type` | Enum | Registration / Eligibility / Accreditation / RecognisedProgramme / PracticePermission |
| `granting_body` | Reference | Regulatory or professional body |
| `qualification_requirements` | List (Reference) | — |
| `supervised_practice_requirements` | List (Reference) | — |
| `examination_requirements` | List (Reference) | — |
| `jurisdiction` | String | — |
| `validity_period` | String | — |
| `renewal_requirements` | Structured JSON | — |
| `permitted_activities` | List | — |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | Common metadata |

## 5.10 Cultural Knowledge System

A structured cultural, folk, indigenous or Indian knowledge tradition.

| Property | Type | Notes |
|---|---|---|
| `knowledge_system_id` | UUID | — |
| `knowledge_system_code` | String | — |
| `name` | String | — |
| `knowledge_type` | Enum | IKS / Folk / Tribal / Classical / Regional / Religious / Craft / Oral |
| `community_or_tradition` | String | — |
| `geographic_context` | List (Reference) | City/Region |
| `languages` | List (Reference) | — |
| `transmission_modes` | List | Oral / Textual / Apprenticeship / Institutional / Performance |
| `related_streams` | List (Reference) | — |
| `heritage_assets` | List (Reference) | — |
| `ethical_access_notes` | Text | Community rights and attribution |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | Common metadata |

## 5.11 Heritage Asset and Collection

A cultural, historical, archival, artistic, archaeological or digital heritage object/site/collection.

| Property | Type | Notes |
|---|---|---|
| `heritage_asset_id` | UUID | — |
| `asset_code` | String | — |
| `name` | String | — |
| `asset_type` | Enum | Site / Monument / Object / Manuscript / Record / Artwork / OralHistory / DigitalCollection / PerformanceTradition |
| `custodian` | Reference | Institution/Community |
| `location` | Reference | City/Region |
| `preservation_status` | Enum | Stable / AtRisk / UnderConservation / Digitised / Restricted |
| `access_conditions` | Structured JSON | — |
| `documentation_methods` | List (Reference) | Research Method |
| `career_functions` | List | Curation, conservation, interpretation, archival management |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | Common metadata |

## 5.12 Publication and Media Format

A format through which Humanities work is published, distributed or performed.

| Property | Type | Notes |
|---|---|---|
| `format_id` | UUID | — |
| `format_code` | String | — |
| `name` | String | Book, journal, podcast, documentary, exhibition, OTT subtitle, digital archive |
| `format_type` | Enum | Print / DigitalText / Audio / Video / Live / Exhibition / Interactive / Archive |
| `production_workflow` | List (Reference) | Business/Knowledge functions |
| `required_skills` | List (Reference) | — |
| `distribution_channels` | List | — |
| `rights_model` | String | — |
| `related_streams` | List (Reference) | — |
| `career_outcomes` | List (Reference) | — |
| `active_status` | Boolean | — |
| G1–G12 | Governance block | Common metadata |


## 6. Normalized Humanities Domain Registry

| Domain Code | Normalized Domain | Nature | Definition | Source Coverage |
| --- | --- | --- | --- | --- |
| HUM-DOM-LANG | Languages, Literature & Linguistics | Language/Humanities | Literature, Indian and classical languages, linguistics, language scholarship and language-based knowledge careers. | 9 |
| HUM-DOM-HHA | History, Archaeology, Archives & Heritage | Historical/Cultural | Historical research, archaeology, archival practice, conservation documentation, heritage interpretation and tourism. | 8 |
| HUM-DOM-GOV | Political Science, Governance, International Relations & Public Administration | Governance/Public Service | Political studies, public policy, public administration, international relations and competitive public-service pathways. | 6 |
| HUM-DOM-SOC | Sociology, Social Work, Development & Human-Centred Practice | Social/Development | Sociology, social work, development, gender, rural studies, CSR, community engagement and human-centred services. | 8 |
| HUM-DOM-PSY | Psychology & Behavioural Sciences | Behavioural/Professional | Psychology, counselling, psychometrics, behavioural science and specialised psychology pathways. | 8 |
| HUM-DOM-GEO | Geography, Environment, Urban Studies & Human Ecology | Spatial/Environmental | Geography, GIS, urban studies, environmental humanities, disaster studies and society-environment pathways. | 5 |
| HUM-DOM-PHI | Philosophy, Ethics, Religion & Medical Humanities | Conceptual/Ethical | Philosophy, applied ethics, religious studies, medical humanities and AI-era ethics. | 4 |
| HUM-DOM-EDU | Education, Teaching, Counselling & Academic Practice | Education/Professional | School teaching, higher education, curriculum, inclusive education, educational content and career counselling. | 8 |
| HUM-DOM-MED | Journalism, Media, Communication & Digital Culture | Media/Communication | Journalism, broadcast, audio, documentary, PR, advertising writing, verification and digital culture. | 11 |
| HUM-DOM-PERF | Performing Arts & Performance Practice | Creative/Performance | Music, dance, theatre, devotional, folk and instrumental performance pathways. | 7 |
| HUM-DOM-VIS | Visual, Fine, Traditional & Applied Arts | Creative/Visual | Fine arts, illustration, traditional and craft arts, expressive arts and art education. | 7 |
| HUM-DOM-TRANS | Translation, Interpretation & Localization | Language Service | Translation, interpretation, subtitling, dubbing, localization, language training and trust-and-safety language work. | 10 |
| HUM-DOM-PUB | Publishing, Editorial, Writing & Knowledge Industry | Publishing/Knowledge | Editorial, academic, educational, digital, audio, heritage and regional-language publishing, writing and knowledge curation. | 47 |
| HUM-DOM-CULT | Museums, Culture Management & Public Humanities | Cultural Ecosystem | Museums, galleries, curation, cultural documentation, public humanities and cultural entrepreneurship. | 6 |
| HUM-DOM-DH | Digital Humanities, AI & Human-Centred Technology | Interdisciplinary/Digital | Digital humanities, AI ethics, conversational systems, UX/narrative writing, language data and cultural technology. | 10 |
| HUM-DOM-IKS | Indian Knowledge Systems, Indic, Folk & Indigenous Studies | IKS/Cultural | Indian knowledge systems, Indic thought, tribal and folk studies, heritage interpretation and indigenous knowledge pathways. | 6 |

### Domain normalization decisions

- Competitive public-service careers are retained under Governance rather than treated as an independent academic domain.
- Freelance, hybrid, entrepreneurial and self-employment labels are normalized as Employment Modes.
- Publishing records are consolidated into one knowledge-industry domain despite appearing in several source categories.
- Translation and localization are separated from general language study because they form professional language-service pathways.
- Performing and visual arts are separated because their practice, portfolio and selection structures differ.
- Digital Humanities and AI roles form an interdisciplinary domain connected to language, philosophy, psychology, media, history and publishing.
- IKS, Indic, folk and indigenous pathways receive a separate domain because the workbook explicitly contains NEP-2020 and cultural-knowledge content.
- Psychology remains a Humanities domain but requires stronger professional-recognition boundaries than most academic disciplines.

## 7. Normalized Humanities Stream Registry



### 7.1 Languages, Literature & Linguistics (`HUM-DOM-LANG`)

| Stream Code | Normalized Stream | Entity Nature | Source Career Types | Outcome Count | Career Outcomes Preserved from Workbook |
| --- | --- | --- | --- | --- | --- |
| HUM-STR-LANG-CLASLANGANDINDO | Classical Languages and Indology | Academic/Applied Stream | Niche | 1 | Sanskrit Studies & Indology |
| HUM-STR-LANG-ENGLLITE | English Literature | Academic/Applied Stream | Traditional | 1 | English Literature Academic / Professor |
| HUM-STR-LANG-INDIANDREGILANG | Indian and Regional Languages | Academic/Applied Stream | Traditional | 2 | Marathi / Regional Language Scholar; Hindi Language & Literature Career |
| HUM-STR-LANG-LANGANDCULTCOMM | Language and Cultural Communication | Academic/Applied Stream | Hybrid | 1 | Manuscriptologist |
| HUM-STR-LANG-LINGANDLANGSCIE | Linguistics and Language Science | Academic/Applied Stream | New-age | 1 | Linguist / Language Scientist |
| HUM-STR-LANG-SUBTDUBBANDMEDI | Subtitling, Dubbing and Media Localization | Academic/Applied Stream | New-age | 1 | Subtitling & Dubbing Script Specialist |
| HUM-STR-LANG-TRANANDINTE | Translation and Interpretation | Academic/Applied Stream | Practical | 1 | Translator / Interpreter |
| HUM-STR-LANG-WRITANDDOCU | Writing and Documentation | Academic/Applied Stream | New-age | 1 | Technical / Documentation Writer |

### 7.2 History, Archaeology, Archives & Heritage (`HUM-DOM-HHA`)

| Stream Code | Normalized Stream | Entity Nature | Source Career Types | Outcome Count | Career Outcomes Preserved from Workbook |
| --- | --- | --- | --- | --- | --- |
| HUM-STR-HHA-ARCH | Archaeology | Academic/Applied Stream | Niche | 1 | Archaeologist |
| HUM-STR-HHA-ARCHANDRECOMANA | Archives and Records Management | Academic/Applied Stream | Niche | 1 | Archivist |
| HUM-STR-HHA-CONSDOCU | Conservation Documentation | Academic/Applied Stream | Niche | 1 | Conservation Documentation Assistant |
| HUM-STR-HHA-HERIINTEANDTOUR | Heritage Interpretation and Tourism | Academic/Applied Stream | Practical | 1 | Heritage Walk / Cultural Tourism Professional |
| HUM-STR-HHA-HERISTUD | Heritage Studies | Academic/Applied Stream | Hybrid | 1 | Museum Educator |
| HUM-STR-HHA-HISTANDHISTRESE | History and Historical Research | Academic/Applied Stream | Traditional | 1 | Historian / History Professor |
| HUM-STR-HHA-MUSEANDMUSESTUD | Museology and Museum Studies | Academic/Applied Stream | Niche | 1 | Museum Curator |
| HUM-STR-HHA-SPECANDPUBLHIST | Specialised and Public History | Academic/Applied Stream | Niche | 1 | Epigraphist / Numismatist |

### 7.3 Political Science, Governance, International Relations & Public Administration (`HUM-DOM-GOV`)

| Stream Code | Normalized Stream | Entity Nature | Source Career Types | Outcome Count | Career Outcomes Preserved from Workbook |
| --- | --- | --- | --- | --- | --- |
| HUM-STR-GOV-INTERELA | International Relations | Academic/Applied Stream | Traditional/New-age | 1 | International Relations Specialist |
| HUM-STR-GOV-NATICIVISERVPATH | National Civil Services Pathway | Competitive/Public-Service Pathway | Competitive | 1 | Civil Services - IAS/IPS/IFS/IRS via UPSC CSE |
| HUM-STR-GOV-POLISCIEANDPOLI | Political Science and Political Analysis | Academic/Applied Stream | New-age | 1 | Political Analyst |
| HUM-STR-GOV-PUBLADMI | Public Administration | Academic/Applied Stream | Traditional | 1 | Public Administration Academic / Researcher |
| HUM-STR-GOV-PUBLPOLI | Public Policy | Academic/Applied Stream | New-age | 1 | Public Policy Researcher |
| HUM-STR-GOV-STATCIVISERVPATH | State Civil Services Pathway | Competitive/Public-Service Pathway | Competitive | 1 | State Civil Services / MPSC-type Careers |

### 7.4 Sociology, Social Work, Development & Human-Centred Practice (`HUM-DOM-SOC`)

| Stream Code | Normalized Stream | Entity Nature | Source Career Types | Outcome Count | Career Outcomes Preserved from Workbook |
| --- | --- | --- | --- | --- | --- |
| HUM-STR-SOC-CSRANDSOCIIMPA | CSR and Social Impact | Academic/Applied Stream | New-age | 1 | CSR Social Impact Associate |
| HUM-STR-SOC-COMMENGAPRAC | Community Engagement Practice | Academic/Applied Stream | Hybrid | 1 | Community Manager |
| HUM-STR-SOC-DEVESTUD | Development Studies | Academic/Applied Stream | New-age | 1 | Development Sector Professional |
| HUM-STR-SOC-GENDANDINCLSTUD | Gender and Inclusion Studies | Academic/Applied Stream | Niche | 1 | Gender Studies Researcher |
| HUM-STR-SOC-PUBLENGA | Public Engagement | Academic/Applied Stream | Traditional Job | 1 | Public Engagement Specialist |
| HUM-STR-SOC-RURADEVE | Rural Development | Academic/Applied Stream | Practical | 1 | Rural Development Professional |
| HUM-STR-SOC-SOCIWORK | Social Work | Academic/Applied Stream | Practical | 1 | Social Worker / MSW Professional |
| HUM-STR-SOC-SOCI | Sociology | Academic/Applied Stream | Traditional | 1 | Sociologist / Sociology Professor |

### 7.5 Psychology & Behavioural Sciences (`HUM-DOM-PSY`)

| Stream Code | Normalized Stream | Entity Nature | Source Career Types | Outcome Count | Career Outcomes Preserved from Workbook |
| --- | --- | --- | --- | --- | --- |
| HUM-STR-PSY-BEHASCIE | Behavioural Science | Academic/Professional Stream | New-age | 1 | Behavioural Science Researcher |
| HUM-STR-PSY-CLINPSYCPATH | Clinical Psychology Pathway | Academic/Professional Stream | Professional | 1 | Clinical Psychologist |
| HUM-STR-PSY-COUNPSYC | Counselling Psychology | Academic/Professional Stream | Professional | 1 | Counselling Psychologist |
| HUM-STR-PSY-EDUCPSYC | Educational Psychology | Academic/Professional Stream | Practical | 1 | School Psychologist / School Counsellor |
| HUM-STR-PSY-FOREPSYC | Forensic Psychology | Academic/Professional Stream | Niche | 1 | Forensic Psychology Assistant / Researcher |
| HUM-STR-PSY-ORGAPSYC | Organisational Psychology | Academic/Professional Stream | Open to Arts | 1 | Organizational Psychologist |
| HUM-STR-PSY-PSYCANDASSE | Psychometrics and Assessment | Academic/Professional Stream | AI-era | 1 | Psychometric Test Developer |
| HUM-STR-PSY-SPORPSYC | Sports Psychology | Academic/Professional Stream | Niche | 1 | Sports Psychologist |

### 7.6 Geography, Environment, Urban Studies & Human Ecology (`HUM-DOM-GEO`)

| Stream Code | Normalized Stream | Entity Nature | Source Career Types | Outcome Count | Career Outcomes Preserved from Workbook |
| --- | --- | --- | --- | --- | --- |
| HUM-STR-GEO-DISAANDHUMASTUD | Disaster and Humanitarian Studies | Academic/Applied Stream | Practical | 1 | Disaster Management Professional - Social Side |
| HUM-STR-GEO-ENVIHUMA | Environmental Humanities | Academic/Applied Stream | Niche | 1 | Environmental Humanities Researcher |
| HUM-STR-GEO-GISANDSPATHUMA | GIS and Spatial Humanities | Academic/Applied Stream | New-age | 1 | GIS Analyst - Humanities Route |
| HUM-STR-GEO-GEOG | Geography | Academic/Applied Stream | Traditional | 1 | Geographer / Geography Professor |
| HUM-STR-GEO-URBASTUD | Urban Studies | Academic/Applied Stream | New-age | 1 | Urban Studies Researcher |

### 7.7 Philosophy, Ethics, Religion & Medical Humanities (`HUM-DOM-PHI`)

| Stream Code | Normalized Stream | Entity Nature | Source Career Types | Outcome Count | Career Outcomes Preserved from Workbook |
| --- | --- | --- | --- | --- | --- |
| HUM-STR-PHI-APPLETHIANDAI | Applied Ethics and AI Governance | Academic/Applied Stream | AI-era | 1 | Ethics & AI Policy Analyst |
| HUM-STR-PHI-MEDIANDHEALHUMA | Medical and Health Humanities | Academic/Applied Stream | Niche | 1 | Bioethics / Medical Humanities Associate |
| HUM-STR-PHI-PHIL | Philosophy | Academic/Applied Stream | Traditional | 1 | Philosophy Professor / Researcher |
| HUM-STR-PHI-RELISTUD | Religious Studies | Academic/Applied Stream | Niche | 1 | Religious Studies / Comparative Religion Scholar |

### 7.8 Education, Teaching, Counselling & Academic Practice (`HUM-DOM-EDU`)

| Stream Code | Normalized Stream | Entity Nature | Source Career Types | Outcome Count | Career Outcomes Preserved from Workbook |
| --- | --- | --- | --- | --- | --- |
| HUM-STR-EDU-CAREGUIDANDCOUN | Career Guidance and Counselling | Academic/Applied Stream | New-age | 1 | Career Counsellor - Humanities Route |
| HUM-STR-EDU-CURRANDLEARDESI | Curriculum and Learning Design | Academic/Applied Stream | New-age | 1 | Curriculum Developer - Humanities |
| HUM-STR-EDU-EDUCCONTANDKNOW | Educational Content and Knowledge Design | Academic/Applied Stream | Practical | 1 | Educational Content Writer - Arts Subjects |
| HUM-STR-EDU-HIGHEDUCANDACAD | Higher Education and Academic Careers | Academic/Applied Stream | Traditional | 1 | College Professor - Humanities |
| HUM-STR-EDU-INCLANDSPECEDUC | Inclusive and Special Education | Academic/Applied Stream | Professional | 1 | Special Educator - Non-medical Route |
| HUM-STR-EDU-LIFESKILFACI | Life-Skills Facilitation | Academic/Applied Stream | Entrepreneurial | 1 | Life Skills Trainer |
| HUM-STR-EDU-MENTANDLEARSUPP | Mentoring and Learner Support | Academic/Applied Stream | Traditional Job | 1 | Student Success Mentor |
| HUM-STR-EDU-SCHOTEAC | School Teaching | Academic/Applied Stream | Traditional | 1 | School Teacher - Arts Subjects |

### 7.9 Journalism, Media, Communication & Digital Culture (`HUM-DOM-MED`)

| Stream Code | Normalized Stream | Entity Nature | Source Career Types | Outcome Count | Career Outcomes Preserved from Workbook |
| --- | --- | --- | --- | --- | --- |
| HUM-STR-MED-ADVEANDCREACOPY | Advertising and Creative Copy | Academic/Applied Stream | Creative | 1 | Advertising Copywriter |
| HUM-STR-MED-AUDIPODCANDRADI | Audio, Podcast and Radio | Academic/Applied Stream | New-age | 1 | Podcast Producer / Audio Storyteller |
| HUM-STR-MED-BROAMEDI | Broadcast Media | Academic/Applied Stream | Practical | 1 | Broadcast Journalist / News Anchor |
| HUM-STR-MED-CONTINDU | Content Industry | Academic/Applied Stream | Self-Employment / Entrepreneurial | 1 | YouTube Educator |
| HUM-STR-MED-CREAWRIT | Creative Writing | Academic/Applied Stream | Hybrid | 1 | Script Writer |
| HUM-STR-MED-DIGICULTSTUD | Digital Culture Studies | Academic/Applied Stream | Self-Employment / Entrepreneurial | 1 | Podcast Creator |
| HUM-STR-MED-DIGIMEDIANDCONT | Digital Media and Content | Academic/Applied Stream | New-age | 1 | Social Media Content Strategist - Arts Route |
| HUM-STR-MED-FILMDOCUANDSCRE | Film, Documentary and Screen Research | Academic/Applied Stream | Niche | 1 | Documentary Researcher |
| HUM-STR-MED-JOUR | Journalism | Academic/Applied Stream | Traditional/New-age | 1 | Journalist - Print/Digital |
| HUM-STR-MED-MEDIVERIANDFACT | Media Verification and Fact-Checking | Academic/Applied Stream | AI-era | 1 | Fact-checker / Verification Specialist |
| HUM-STR-MED-PUBLRELAANDSTRA | Public Relations and Strategic Communication | Academic/Applied Stream | Open to Arts | 1 | Public Relations Content Specialist |

### 7.10 Performing Arts & Performance Practice (`HUM-DOM-PERF`)

| Stream Code | Normalized Stream | Entity Nature | Source Career Types | Outcome Count | Career Outcomes Preserved from Workbook |
| --- | --- | --- | --- | --- | --- |
| HUM-STR-PERF-DANCPRAC | Dance Practice | Creative Practice Stream | Creative | 1 | Dance Performer / Choreographer |
| HUM-STR-PERF-DEVOANDSACRARTS | Devotional and Sacred Arts | Creative Practice Stream | Self-Employment / Entrepreneurial | 1 | Kirtankar |
| HUM-STR-PERF-FOLKPERFARTS | Folk Performing Arts | Creative Practice Stream | Niche / Portfolio Career | 1 | Powada/Shahiri Artist |
| HUM-STR-PERF-INSTMUSI | Instrumental Music | Creative Practice Stream | Niche / Portfolio Career, Self-Employment / Entrepreneurial | 2 | Guitarist; Flute Artist |
| HUM-STR-PERF-MUSIPRAC | Music Practice | Creative Practice Stream | Creative/Traditional | 1 | Classical Music Performer |
| HUM-STR-PERF-THEAANDPERF | Theatre and Performance | Creative Practice Stream | Creative | 1 | Theatre Artist / Actor |

### 7.11 Visual, Fine, Traditional & Applied Arts (`HUM-DOM-VIS`)

| Stream Code | Normalized Stream | Entity Nature | Source Career Types | Outcome Count | Career Outcomes Preserved from Workbook |
| --- | --- | --- | --- | --- | --- |
| HUM-STR-VIS-ARTEDUC | Art Education | Creative Practice Stream | Practical | 1 | Art Teacher / Visual Arts Educator |
| HUM-STR-VIS-CRAFANDMATEARTS | Craft and Material Arts | Creative Practice Stream | Self-Employment / Entrepreneurial | 1 | Handicraft Entrepreneur |
| HUM-STR-VIS-EXPRANDTHERARTS | Expressive and Therapeutic Arts | Creative Practice Stream | Niche | 1 | Art Therapist Assistant / Expressive Arts Facilitator |
| HUM-STR-VIS-FINEARTSPRAC | Fine Arts Practice | Creative Practice Stream | Creative | 1 | Fine Artist |
| HUM-STR-VIS-ILLUANDVISUCOMM | Illustration and Visual Communication | Creative Practice Stream | New-age | 1 | Illustrator - Cultural/Educational Content |
| HUM-STR-VIS-TRADVISUARTS | Traditional Visual Arts | Creative Practice Stream | Niche / Portfolio Career, Self-Employment / Entrepreneurial | 2 | Warli Art Specialist; Madhubani Artist |

### 7.12 Translation, Interpretation & Localization (`HUM-DOM-TRANS`)

| Stream Code | Normalized Stream | Entity Nature | Source Career Types | Outcome Count | Career Outcomes Preserved from Workbook |
| --- | --- | --- | --- | --- | --- |
| HUM-STR-TRANS-ASIALANGSTUD | Asian Language Studies | Language Service Stream | Niche/New-age | 1 | Japanese/Korean Language + Culture Specialist |
| HUM-STR-TRANS-DIGIMEDIANDCONT | Digital Media and Content | Language Service Stream | Freelance | 1 | Subtitling Specialist |
| HUM-STR-TRANS-FORELANGSTUD | Foreign Language Studies | Language Service Stream | Practical | 1 | Foreign Language Expert |
| HUM-STR-TRANS-LANGSERV | Language Services | Language Service Stream | Freelance, Hybrid, Professional Service | 3 | Translator; Literary Translator; Interpreter |
| HUM-STR-TRANS-LANGTEACANDTRAI | Language Teaching and Training | Language Service Stream | Practical | 1 | English Language Trainer |
| HUM-STR-TRANS-LANGTECH | Language Technology | Language Service Stream | Hybrid | 1 | Localization Specialist |
| HUM-STR-TRANS-LANGTRUSANDSAFE | Language Trust and Safety | Language Service Stream | New-age | 1 | Content Moderator - Language & Culture |
| HUM-STR-TRANS-LOCA | Localization | Language Service Stream | AI-era | 1 | Localization Quality Analyst |

### 7.13 Publishing, Editorial, Writing & Knowledge Industry (`HUM-DOM-PUB`)

| Stream Code | Normalized Stream | Entity Nature | Source Career Types | Outcome Count | Career Outcomes Preserved from Workbook |
| --- | --- | --- | --- | --- | --- |
| HUM-STR-PUB-AIASSICONTAND | AI-Assisted Content and Editorial Review | Knowledge Industry Stream | AI-era | 1 | Prompt Writer / AI Content Evaluator - Humanities |
| HUM-STR-PUB-AIERAPUBLAND | AI-Era Publishing and Editorial QA | Knowledge Industry Stream | Hybrid, Hybrid/Freelance, Hybrid/Research-based | 6 | AI-Assisted Editor; Human Content Reviewer; Knowledge Curator; Editorial Prompt Specialist; AI Training Content Reviewer; Multilingual Dataset Editor |
| HUM-STR-PUB-ACADANDSCHOPUBL | Academic and Scholarly Publishing | Knowledge Industry Stream | Portfolio/Entrepreneurial, Traditional/Hybrid | 3 | Academic Editor; Journal Editor; Research Digest Creator |
| HUM-STR-PUB-AUDIPUBL | Audio Publishing | Knowledge Industry Stream | Freelance/Hybrid | 1 | Audiobook Script Editor |
| HUM-STR-PUB-CHILSANDEDUC | Children's and Educational Publishing | Knowledge Industry Stream | Hybrid/Entrepreneurial | 1 | Children’s Literature Specialist |
| HUM-STR-PUB-DIGIPUBL | Digital Publishing | Knowledge Industry Stream | Entrepreneurial, Freelance/Hybrid, Hybrid, Niche/Hybrid | 7 | Content Curator; Kindle Publisher; Digital Magazine Creator; Newsletter Publisher; Ebook Formatter; Book Metadata Specialist; Publishing Platform Manager |
| HUM-STR-PUB-EDITPRAC | Editorial Practice | Knowledge Industry Stream | Freelance/Hybrid, Niche/Hybrid, Traditional Job, Traditional/Hybrid | 7 | Book Editor; Copy Editor; Proofreader; Acquisition Editor; Commissioning Editor; Literary Scout; Manuscript Evaluator |
| HUM-STR-PUB-EDUCPUBL | Educational Publishing | Knowledge Industry Stream | Entrepreneurial, Entrepreneurial/Hybrid | 2 | Educational Notes Publisher; Humanities Course Publisher |
| HUM-STR-PUB-HERIANDCULTPUBL | Heritage and Cultural Publishing | Knowledge Industry Stream | Entrepreneurial/Research-based, Research-based | 2 | Archive Editor; Cultural Documentation Publisher |
| HUM-STR-PUB-KNOWCURAANDINFO | Knowledge Curation and Information Work | Knowledge Industry Stream | New-age | 1 | Knowledge Manager / Research Curator |
| HUM-STR-PUB-LITECRITANDREVI | Literary Criticism and Reviewing | Knowledge Industry Stream | Freelance/Portfolio, Niche/Freelance, Portfolio/Entrepreneurial, Research-based/Portfolio | 4 | Literary Critic; Book Reviewer; Sensitivity Reader; Anthology Curator |
| HUM-STR-PUB-PRINONDEMAPUBL | Print-on-Demand Publishing | Knowledge Industry Stream | Entrepreneurial | 1 | POD Publishing Consultant |
| HUM-STR-PUB-PUBL | Publishing | Knowledge Industry Stream | Niche, Traditional | 2 | Book Editor; Literary Agent / Publishing Coordinator |
| HUM-STR-PUB-PUBLENTR | Publishing Entrepreneurship | Knowledge Industry Stream | Entrepreneurial | 2 | Independent Publisher; Literary Magazine Founder |
| HUM-STR-PUB-PUBLOPER | Publishing Operations | Knowledge Industry Stream | Entry-level Traditional, Traditional Job | 3 | Publishing Coordinator; Managing Editor; Editorial Assistant |
| HUM-STR-PUB-REGILANGPUBL | Regional Language Publishing | Knowledge Industry Stream | Entrepreneurial | 1 | Regional Language Publisher |
| HUM-STR-PUB-SCREANDNARRDEVE | Screenwriting and Narrative Development | Knowledge Industry Stream | Creative/New-age | 1 | Scriptwriter - Film/OTT/Theatre |
| HUM-STR-PUB-UXANDPRODWRIT | UX and Product Writing | Knowledge Industry Stream | AI-era | 1 | UX Writer / Content Designer |
| HUM-STR-PUB-WRITANDDOCU | Writing and Documentation | Knowledge Industry Stream | Creative | 1 | Creative Writer / Author |

### 7.14 Museums, Culture Management & Public Humanities (`HUM-DOM-CULT`)

| Stream Code | Normalized Stream | Entity Nature | Source Career Types | Outcome Count | Career Outcomes Preserved from Workbook |
| --- | --- | --- | --- | --- | --- |
| HUM-STR-CULT-CULTCURA | Cultural Curation | Academic/Applied Stream | Niche | 1 | Festival Curator |
| HUM-STR-CULT-CULTENTR | Cultural Entrepreneurship | Academic/Applied Stream | Entrepreneurial | 1 | Cultural Entrepreneur |
| HUM-STR-CULT-CULTANDORALHIST | Cultural and Oral-History Documentation | Academic/Applied Stream | Niche | 1 | Oral History Documenter |
| HUM-STR-CULT-CULTANDARTSMANA | Culture and Arts Management | Academic/Applied Stream | Practical | 1 | Cultural Programme Coordinator |
| HUM-STR-CULT-GALLPRAC | Gallery Practice | Academic/Applied Stream | Practical | 1 | Art Gallery Coordinator |
| HUM-STR-CULT-PUBLHUMA | Public Humanities | Academic/Applied Stream | New-age | 1 | Independent Researcher / Public Humanities Creator |

### 7.15 Digital Humanities, AI & Human-Centred Technology (`HUM-DOM-DH`)

| Stream Code | Normalized Stream | Entity Nature | Source Career Types | Outcome Count | Career Outcomes Preserved from Workbook |
| --- | --- | --- | --- | --- | --- |
| HUM-STR-DH-AICOMM | AI Communication | Interdisciplinary Digital Stream | Hybrid | 1 | Prompt Designer |
| HUM-STR-DH-AIETHIANDGOVE | AI Ethics and Governance | Interdisciplinary Digital Stream | Research-based | 1 | AI Ethics Researcher |
| HUM-STR-DH-CONVAIANDHUMA | Conversational AI and Human Interaction | Interdisciplinary Digital Stream | Hybrid | 1 | Conversational AI Trainer |
| HUM-STR-DH-DIGIHUMA | Digital Humanities | Interdisciplinary Digital Stream | Research-based | 1 | Digital Humanities Researcher |
| HUM-STR-DH-DIGISTOR | Digital Storytelling | Interdisciplinary Digital Stream | Entrepreneurial | 1 | Podcast Storyteller |
| HUM-STR-DH-HUMACENTUXCOMM | Human-Centred UX Communication | Interdisciplinary Digital Stream | Hybrid | 1 | Narrative UX Writer |
| HUM-STR-DH-MEDITHOUANDSOCI | Media, Thought and Society | Interdisciplinary Digital Stream | Hybrid | 1 | Opinion Columnist |
| HUM-STR-DH-PUBL | Publishing | Interdisciplinary Digital Stream | Freelance | 1 | Ghost Writer |
| HUM-STR-DH-WRITANDNARRSYST | Writing and Narrative Systems | Interdisciplinary Digital Stream | Freelance, Portfolio Career | 2 | Blog Writer; Long-form Essayist |

### 7.16 Indian Knowledge Systems, Indic, Folk & Indigenous Studies (`HUM-DOM-IKS`)

| Stream Code | Normalized Stream | Entity Nature | Source Career Types | Outcome Count | Career Outcomes Preserved from Workbook |
| --- | --- | --- | --- | --- | --- |
| HUM-STR-IKS-ANCIANDINDISTUD | Ancient and Indic Studies | Academic/Applied Stream | Traditional Job | 1 | Epigraphy Assistant |
| HUM-STR-IKS-CULTSTUD | Cultural Studies | Academic/Applied Stream | Niche / Portfolio Career | 1 | Folk Culture Researcher |
| HUM-STR-IKS-INDIKNOWSYST | Indian Knowledge Systems | Academic/Applied Stream | Research-based | 2 | IKS Researcher; Vedic Studies Scholar |
| HUM-STR-IKS-INDIHERISTUD | Indic Heritage Studies | Academic/Applied Stream | Research-based | 1 | Oral Tradition Archivist |
| HUM-STR-IKS-TEMPANDSACRHERI | Temple and Sacred Heritage Interpretation | Academic/Applied Stream | Self-Employment | 1 | Temple Heritage Interpreter |

### Stream normalization rules

- The 160 workbook records are preserved as Career Outcomes or pathway outcomes.
- A stream is created only when the source represents a coherent learning, practice or qualifying pathway.
- Academic titles such as Professor and Researcher remain Career Outcomes connected to an academic stream.
- Creative titles such as Dancer, Composer, Artist, Illustrator and Performer remain outcomes connected to a Creative Practice.
- Public-service titles are outcomes unlocked through Competitive Examinations.
- “AI-era,” “New-age,” “Hybrid,” “Freelance” and similar labels are attributes, not ontology levels.
- Portfolio careers may connect to multiple Streams and Employment Modes.

## 8. Education Stages, Subjects and Multidisciplinary Entry

### 8.1 Humanities stage model

```text
Class 8–9
    → exposure, reading, arts, debate, languages, society and place

Class 10
    → stream and subject exploration

Class 11–12
    → subject combination, entrance awareness, portfolio and performance preparation

UG Exploration
    → foundational discipline, clubs, volunteering, fieldwork and portfolio evidence

UG Specialisation
    → electives, research methods, internships, language levels and digital tools

UG Exit / Career Branching
    → employment, competitive exams, teacher education, PG, creative practice or enterprise

PG / Professional Depth
    → advanced study, supervised practice, NET/SET, professional recognition or specialist portfolio

Post-PG
    → research, academic career, recognised practice, public service, creative or portfolio career
```

### 8.2 Canonical subject clusters

- Language and Literature
- History and Heritage
- Political Science and Governance
- Sociology and Social Inquiry
- Psychology and Behaviour
- Geography and Spatial Studies
- Philosophy and Ethics
- Fine and Performing Arts
- Media and Communication
- Research Methods
- Digital Humanities and AI
- Indian Knowledge Systems
- Vocational/Creative Practice

### 8.3 Multidisciplinary combinations

Examples to support:

- Psychology + Biology
- Psychology + Education
- History + Archaeology
- History + Digital Humanities
- Political Science + Economics
- Geography + GIS
- Sociology + Data Analysis
- Philosophy + AI Ethics
- Literature + Publishing
- Language + Localization Technology
- Media + Political Communication
- Fine Arts + Art Education
- Music/Dance + Cultural Management
- IKS + Heritage Studies
- Social Work + Public Health
- Humanities + Design/UX

### 8.4 Cross-faculty entry rule

Humanities entry should be `OpenAcrossFaculties` by default unless programme-specific rules establish otherwise.

## 9. Examination, Selection and Recognition Architecture

### 9.1 Selection taxonomy

```text
Selection Process
├── University Admission Examination
├── Postgraduate Admission Examination
├── Academic Eligibility Examination
├── Competitive Public-Service Examination
├── Teacher Eligibility Examination
├── Professional Recognition Selection
├── Audition
├── Portfolio Review
├── Practical Test
├── Interview
└── Combined Selection
```

### 9.2 Source exam classification

| Source Selection | Normalized Purpose | Main Pathways |
|---|---|---|
| CUET UG | Admission | BA/BA Hons and participating programmes |
| CUET PG | Admission | MA and PG programmes |
| UGC-NET / SET | Academic Eligibility | Assistant Professor, JRF and research pathways |
| UPSC Civil Services | Competitive Recruitment | National civil services |
| State PSC / MPSC-type exams | Competitive Recruitment | State services |
| B.Ed. entrance / CET | Admission | Teacher education |
| CTET / State TET | Teacher Eligibility | School teaching |
| RCI-recognized programme selection | Professional Recognition Pathway | Psychology/special education where applicable |
| NID / NIFT selections | Design-adjacent Admission | Selected creative/communication pathways |
| FTII / SRFTI selections | Admission + practical/interview | Film and media |
| Audition and portfolio | Creative Admission | Music, dance, theatre and fine arts |
| Foreign-language certifications | Language Certification | Translation, interpretation and localization |
| MSW / development institute tests | Admission | Social work and development studies |

### 9.3 Recognition-state sequence

```text
Academic Eligibility
    → Programme Admission
    → Required Degree Completed
    → Supervised Practice Completed
    → Eligibility Examination / Registration
    → Professional Recognition Active
    → Permitted Career Activities
```

The sequence applies only where a pathway is formally regulated or recognized.

## 10. Portfolio, Research and Creative-Practice Architecture

### 10.1 Portfolio types

- Writing Portfolio
- Research Portfolio
- Fieldwork Portfolio
- Creative Visual Portfolio
- Performance Portfolio
- Translation and Localization Portfolio
- Digital Media Portfolio
- Teaching Portfolio
- Psychology Exposure Portfolio
- GIS and Mapping Portfolio
- AI-Era Humanities Portfolio

### 10.2 Research methods starter registry

- Archival Research
- Textual and Literary Analysis
- Historical Method
- Oral History
- Ethnography
- Survey Research
- Interview and Focus Group
- Case Study
- Discourse Analysis
- Content Analysis
- Policy Analysis
- Psychometric Assessment
- Spatial/GIS Method
- Digital Humanities Method
- Practice-Based Research
- Participatory and Community Research

### 10.3 Evidence rule

Personal evidence belongs to the Digital Twin. The ontology defines:

- accepted artefact types;
- evaluation criteria;
- verification methods;
- required portfolio composition;
- selection context;
- expiry or freshness where relevant.

## 11. Cultural, IKS and Heritage Architecture

### 11.1 Cultural knowledge categories

- Indian Knowledge Systems
- Sanskrit and Indic Studies
- Folk and Indigenous Arts
- Tribal Studies
- Oral Traditions
- Regional Knowledge
- Devotional and Sacred Arts
- Craft Traditions
- Classical Performance Traditions
- Community Heritage
- Yoga Philosophy and Indic Thought

### 11.2 Ethical governance rules

1. Community knowledge must not be treated as ownerless data.
2. Source community, tradition and region must be recorded.
3. Restricted or sacred knowledge requires access conditions.
4. Commercial use must preserve attribution and rights information.
5. AI training or digitization use must be separately governed.
6. Community validation should be available for contested descriptions.

## 12. Humanities–Technology Architecture

Technology is modeled as an interface, not as replacement of the Humanities base.

| Humanities Base | Technology Interface | Example Outcomes |
|---|---|---|
| Philosophy/Ethics | Artificial Intelligence | AI Ethics Researcher |
| Language/Communication | Generative AI | Prompt Designer, AI Communication Specialist |
| Literature/Communication | UX and Product Design | Narrative UX Writer |
| History/Literature | Digital Archives and Tools | Digital Humanities Researcher |
| Cultural Studies | Localization and AI | Cultural AI Consultant |
| Translation | Software Localization | Localization Specialist |
| Linguistics | Machine Learning / NLP | Language Annotator, Conversational AI Trainer |
| Humanities Research | Knowledge Systems | Knowledge Curator |
| History/Archives | Digital Preservation | Digital Archive Specialist |
| Psychology/Linguistics | Conversational Systems | Human-AI Interaction roles |

## 13. Controlled Vocabularies

### 13.1 HumanitiesStreamNature
`Academic` | `Applied` | `CreativePractice` | `Professional` | `Competitive` | `KnowledgeIndustry` | `LanguageService` | `InterdisciplinaryDigital`

### 13.2 SelectionType
`AdmissionExam` | `CompetitiveExam` | `AcademicEligibilityExam` | `TeacherEligibilityExam` | `Audition` | `Portfolio` | `PracticalTest` | `Interview` | `WritingTest` | `Combined`

### 13.3 PortfolioType
`Writing` | `Research` | `Creative` | `Performance` | `Media` | `Translation` | `Teaching` | `Digital` | `Mixed`

### 13.4 CreativePracticeType
`Performing` | `Visual` | `Literary` | `Applied` | `Folk` | `Devotional` | `Digital` | `Interdisciplinary`

### 13.5 ResearchMethodFamily
`Qualitative` | `Quantitative` | `Mixed` | `Textual` | `Historical` | `Spatial` | `Digital` | `PracticeBased`

### 13.6 FieldworkType
`SocialWork` | `Ethnography` | `Heritage` | `Archaeology` | `Geography` | `Community` | `Media` | `Development`

### 13.7 ProfessionalRecognitionType
`Registration` | `Eligibility` | `Accreditation` | `RecognisedProgramme` | `PracticePermission`

### 13.8 CulturalKnowledgeType
`IKS` | `Folk` | `Tribal` | `Classical` | `Regional` | `Religious` | `Craft` | `Oral`

### 13.9 ArtefactType
`Essay` | `ResearchPaper` | `Translation` | `Script` | `Artwork` | `Performance` | `Recording` | `Exhibition` | `Map` | `ArchiveRecord` | `Podcast` | `Publication` | `DigitalProject`

### 13.10 EmploymentMode
`SalariedPrivate` | `SalariedPublic` | `Academic` | `CompetitivePublicService` | `Freelance` | `Consulting` | `SelfEmployment` | `CreativePractice` | `Entrepreneurial` | `HybridPortfolio`

### 13.11 CareerMaturity
`Established` | `StableEvolving` | `Growing` | `Emerging` | `Niche` | `Experimental`

### 13.12 PortfolioRequirement
`Mandatory` | `StronglyPreferred` | `Helpful` | `NotTypical` | `ProgrammeSpecific`

## 14. Relationship Inventory

### 14.1 Inherited relationships

All common Science and relevant Commerce relationships remain available.

### 14.2 Humanities-specific relationships

| Relationship | Source | Target | Key properties |
|---|---|---|---|
| `HAS_CREATIVE_PRACTICE` | Stream | Creative Practice | requirement_type |
| `REQUIRES_PORTFOLIO` | Stream/Selection/Career Outcome | Portfolio | mandatory, stage |
| `CONTAINS_ARTEFACT_TYPE` | Portfolio | Work or Artefact | minimum_count |
| `DEMONSTRATES_SKILL` | Work or Artefact | Skill | proficiency |
| `SELECTED_THROUGH` | Stream/Degree | Audition and Portfolio Selection | — |
| `REQUIRES_LANGUAGE_PROFICIENCY` | Stream/Career Outcome | Language Proficiency | minimum_level |
| `USES_RESEARCH_METHOD` | Stream/Project/Career Outcome | Research Method | requirement_type |
| `HAS_FIELDWORK` | Stream | Fieldwork and Community Engagement | mandatory |
| `REQUIRES_SUPERVISED_PRACTICE` | Stream/Career Outcome | Supervised Practice | hours |
| `LEADS_TO_RECOGNITION` | Degree/Exam/Supervised Practice | Professional Recognition | conditions |
| `REQUIRES_RECOGNITION` | Career Outcome | Professional Recognition | mandatory |
| `STUDIES_KNOWLEDGE_SYSTEM` | Stream | Cultural Knowledge System | depth |
| `DOCUMENTS_ASSET` | Research Method/Project | Heritage Asset and Collection | method |
| `CURATES_ASSET` | Career Outcome | Heritage Asset and Collection | role |
| `PUBLISHED_AS` | Work or Artefact | Publication and Media Format | — |
| `PERFORMED_IN` | Creative Practice | Publication and Media Format | venue/format |
| `SERVES_COMMUNITY` | Career Outcome/Fieldwork | Audience or Community | relationship_type |
| `INTERFACES_WITH_TECHNOLOGY` | Stream/Career Outcome | Technology Domain | interface_type |
| `PRESERVES_TRADITION` | Creative Practice/Career Outcome | Cultural Knowledge System | — |
| `ALTERNATIVE_TO` | Stream | Stream | reason |
| `CROSS_DOMAIN_WITH` | Stream | Domain/Stream | relationship_type |

## 15. Validation and Reasoning Rules

**HUM-VAL-001 — Outcome separation**  
A career title from the workbook must not automatically become a Stream.

**HUM-VAL-002 — Employment-mode normalization**  
Freelance, hybrid, entrepreneurial, portfolio and self-employment labels must be stored as Employment Modes.

**HUM-VAL-003 — Portfolio evidence**  
Portfolio-dependent recommendations must state the expected artefact types and evaluation context.

**HUM-VAL-004 — Audition specificity**  
Music, dance, theatre and fine-arts admissions must use programme-specific audition or portfolio rules.

**HUM-VAL-005 — Recognition safety**  
Psychology, counselling, special education and teaching outcomes must verify current recognition, programme and supervised-practice requirements.

**HUM-VAL-006 — Academic title safety**  
Professor, Assistant Professor, JRF and similar outcomes require current academic eligibility rules.

**HUM-VAL-007 — Competitive-exam distinction**  
UPSC/PSC outcomes must not be modeled as academic degree pathways.

**HUM-VAL-008 — Language proficiency**  
A language degree or school subject cannot substitute automatically for certified proficiency where certification is required.

**HUM-VAL-009 — IKS/community governance**  
Community knowledge records must contain attribution, location/context and ethical access notes.

**HUM-VAL-010 — AI role grounding**  
Every AI-era Humanities role must connect to a Humanities base, technology interface, required skills and evidence portfolio.

**HUM-VAL-011 — Cross-faculty openness**  
Humanities pathways are open across school streams unless current programme rules say otherwise.

**HUM-VAL-012 — Source freshness**  
Entrance, recognition, institution and examination rules must contain effective dates and authoritative sources.

**HUM-VAL-013 — Selection composition**  
Combined selection processes must retain component order and weight where published.

**HUM-VAL-014 — Creative certification caution**  
Arts certification may support progression but does not automatically prove employment eligibility or university equivalence.

**HUM-VAL-015 — Salary evidence**  
Income claims must distinguish salaried, freelance, commissioned, performance, royalty, consulting and enterprise models.

## 16. Data-Quality and Normalization Gaps

| Gap | Priority | Treatment |
|---|---|---|
| 160 careers mixed with streams and pathways | Critical | Normalized into streams plus Career Outcomes |
| Freelance/entrepreneurial/hybrid labels treated as career types | Critical | Moved to Employment Mode |
| Psychology and recognition requirements generalized | Critical | Added Professional Recognition and Supervised Practice |
| Creative selection lacks formal structure | Critical | Added Audition and Portfolio Selection |
| Portfolio evidence is text-only | High | Added Portfolio and Work/Artefact |
| Academic and competitive examinations are mixed | High | Added Examination Purpose taxonomy |
| Language certification and actual proficiency are mixed | High | Added Language Proficiency |
| IKS/folk knowledge lacks community governance | High | Added Cultural Knowledge System and ethical rules |
| Research and fieldwork are properties rather than entities | High | Added Research Method and Fieldwork |
| Technology careers risk losing Humanities foundation | High | Added explicit Humanities-base and technology-interface relationships |
| Institution recognition is incomplete | High | Require current authoritative validation |
| Salary/income data is not systematic | Medium | Defer until employment-mode-specific evidence is available |
| International mobility is generic | Medium | Require qualification, language and jurisdiction rules |
| Publishing records are over-represented relative to other categories | Medium | Consolidated within one domain while preserving all outcomes |
| NEP credit, major/minor and ABC structure is absent | High | Connect to shared NEP curriculum-credit ontology extension |

## 17. Derived Calculations

### 17.1 Portfolio readiness

```text
Portfolio Readiness =
    required artefact types completed
  × verification quality
  × relevance to target selection
  × recency factor
```

Personal scoring belongs to the Digital Twin.

### 17.2 Academic career readiness

```text
Academic Career Readiness =
    required PG qualification
  + academic eligibility examination status
  + research methods
  + publication/research evidence
  + teaching experience
```

### 17.3 Recognised-practice readiness

```text
Recognised Practice Ready =
    recognised qualification complete
  AND supervised practice complete
  AND required examination passed
  AND registration/recognition active
```

### 17.4 Creative career readiness

```text
Creative Career Readiness =
    practice proficiency
  + portfolio quality
  + performance/exhibition evidence
  + network/market access
  + employment-mode fit
```

### 17.5 Public-service readiness

```text
Public-Service Readiness =
    examination eligibility
  + attempt/age compliance
  + syllabus preparation evidence
  + mock performance
  + financial/time sustainability
```

## 18. Deferrals and Boundaries

### 18.1 Requires authoritative validation

- university-wise CUET subject eligibility;
- current UGC-NET/SET rules;
- UPSC and state-PSC rules;
- teacher-education and TET eligibility;
- psychology and special-education recognition;
- institution recognition and programme availability;
- foreign-language certification frameworks;
- performing-arts certification equivalence;
- current admissions, auditions and portfolio requirements;
- salary and freelance-income data;
- international qualification recognition.

### 18.2 Excluded from SCC ontology

- personal counselling records;
- personal mental-health data;
- personal portfolio files;
- personal creative works;
- personal political beliefs;
- personalized legal, psychological or therapeutic advice;
- employer vacancies;
- recommendation scores;
- personal suitability and escalation records.

These belong to the Digital Twin or peer product layers.

## 19. Implementation Sequence

### Phase 1 — Core normalization
1. Load 16 Domains.
2. Load normalized Streams.
3. Load all 160 source careers as Career Outcomes.
4. Preserve source category, subcategory and career type.

### Phase 2 — Admission and recognition
1. Examination purposes.
2. Audition and Portfolio Selection.
3. Language Proficiency.
4. Professional Recognition.
5. Supervised Practice.

### Phase 3 — Research, creative and cultural layers
1. Research Method.
2. Fieldwork and Community Engagement.
3. Creative Practice.
4. Portfolio.
5. Work or Artefact.
6. Cultural Knowledge System.
7. Heritage Asset and Collection.
8. Publication and Media Format.

### Phase 4 — Institutions and pathways
1. Degrees and certifications.
2. Institutions and recognised programmes.
3. Cross-faculty admission.
4. Scholarships and costs.
5. NEP major/minor, credit and community-engagement links.

### Phase 5 — Competency and livelihood
1. Skills, interests, aptitudes and traits.
2. Employment Modes.
3. Enterprise Paths.
4. Salary and income models.
5. City/region and international mobility.

### Phase 6 — Stress testing
Test questions on:
- Humanities after Science or Commerce;
- subject choice and CUET eligibility;
- professor and research careers;
- UPSC/PSC pathways;
- psychology and counselling recognition;
- teaching and TET eligibility;
- portfolio and audition careers;
- freelance and self-employment;
- language certification;
- publishing and editorial work;
- IKS, folk and tribal careers;
- AI ethics, digital humanities and language technology;
- cost, duration, alternatives and backup pathways.

## 20. Confidence Statement

| Area | Status |
|---|---|
| Common SCC compatibility | Strong |
| Domain normalization | Ready |
| Stream normalization | Ready as baseline |
| Preservation of 160 source careers | Complete |
| Portfolio and creative-practice model | Ready for technical review |
| Psychology/teaching recognition data | Requires authoritative sourcing |
| Institution and exam data | Partial |
| NEP/IKS representation | Strong conceptual foundation |
| Salary and labour-market data | Not publication-ready |
| Production chatbot use | Not yet ready |
| Stress-test readiness | Ready after initial data population |

> **Final position:** Humanities v0.8 is normalized on the same SCC foundation as Science and Commerce, but adds the portfolio, creative-practice, cultural-knowledge, language-proficiency, research, fieldwork and recognition structures required for Humanities careers.

---

## Appendix A — Reference Code Patterns

```text
HUM-DOM-<DOMAIN>
HUM-STR-<STREAM>
HUM-SEL-<SELECTION>
HUM-PRT-<PORTFOLIO>
HUM-ART-<ARTEFACT>
HUM-CPR-<CREATIVE-PRACTICE>
HUM-LPR-<LANGUAGE-PROFICIENCY>
HUM-RMT-<RESEARCH-METHOD>
HUM-FLD-<FIELDWORK>
HUM-SPR-<SUPERVISED-PRACTICE>
HUM-REC-<PROFESSIONAL-RECOGNITION>
HUM-CKS-<CULTURAL-KNOWLEDGE-SYSTEM>
HUM-HAS-<HERITAGE-ASSET>
HUM-PMF-<PUBLICATION-MEDIA-FORMAT>
CAR-HUM-<CAREER-OUTCOME>
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
:SubjectEquivalenceRule
:Interest
:Aptitude
:Skill
:PersonalityTrait
:WorkPreference
:Activity
:Project
:InternshipType
:Apprenticeship
:CareerOutcome
:EmploymentMode
:EnterprisePath
:SalaryRange
:City
:Scholarship
:EducationLoan
:CreativePractice
:Portfolio
:WorkArtefact
:AuditionPortfolioSelection
:LanguageProficiency
:ResearchMethod
:FieldworkCommunityEngagement
:SupervisedPractice
:ProfessionalRecognition
:CulturalKnowledgeSystem
:HeritageAssetCollection
:PublicationMediaFormat
```

*End of RSA SCC Ontology v0.8 — Humanities Universe Technical Specification.*
