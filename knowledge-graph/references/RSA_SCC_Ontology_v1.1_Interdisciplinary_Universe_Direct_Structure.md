# RSA SCC Ontology v1.1 — Interdisciplinary Universe Technical Specification

**Version:** 1.1  
**Foundation:** Science v0.6, Commerce v0.7, Humanities v0.8, Management v0.9 and Law v1.0  
**Source:** `Structured-Interdisciplinary.xlsx`  
**Source Career Master:** 38 structured interdisciplinary pathways  
**Normalized Integration Domains:** 16  
**Normalized Baseline Streams:** 38

## 1. Interdisciplinary Ontology Hierarchy

```text
RSA SCC
└── Interdisciplinary Universe
    ├── Integration Architecture
    │   ├── Parent Discipline
    │   ├── Integration Domain
    │   ├── Integration Pattern
    │   ├── Interdisciplinary Stream
    │   ├── Primary Discipline
    │   ├── Secondary Discipline
    │   ├── Supporting Discipline
    │   ├── Technology Interface
    │   └── Application Context
    │
    ├── Learning and Qualification Journey
    │   ├── Education Stage
    │   ├── Subject
    │   ├── Subject Level
    │   ├── Subject Combination
    │   ├── Major
    │   ├── Minor
    │   ├── Elective Cluster
    │   ├── Bridge Course
    │   ├── Credit / Academic Bank
    │   ├── Degree
    │   ├── Dual / Joint / Integrated Programme
    │   └── Certification
    │
    ├── Admission and Eligibility
    │   ├── Admission Pathway
    │   ├── Examination
    │   ├── Parent-Discipline Prerequisite
    │   ├── Quantitative Requirement
    │   ├── Laboratory Requirement
    │   ├── Portfolio Requirement
    │   ├── Professional Recognition
    │   ├── Subject Equivalence Rule
    │   └── Cross-Faculty Entry Rule
    │
    ├── Knowledge and Method Integration
    │   ├── Research Method
    │   ├── Data Method
    │   ├── Design Method
    │   ├── Legal / Policy Method
    │   ├── Fieldwork
    │   ├── Laboratory Practice
    │   ├── Studio / Creative Practice
    │   ├── Systems Thinking
    │   └── Ethics / Responsible Innovation
    │
    ├── Application and Ecosystem
    │   ├── Industry Sector
    │   ├── Public System
    │   ├── Government Mission / Programme
    │   ├── Institution Ecosystem
    │   ├── Regional Resource Context
    │   ├── Community / Tribal Context
    │   ├── Enterprise Path
    │   └── Livelihood Service Model
    │
    ├── Competency and Evidence
    │   ├── Interest
    │   ├── Aptitude
    │   ├── Skill
    │   ├── Personality Trait
    │   ├── Work Preference
    │   ├── Activity
    │   ├── Project
    │   ├── Internship
    │   ├── Interdisciplinary Capstone
    │   ├── Portfolio
    │   ├── Work / Artefact
    │   └── Integration Evidence
    │
    └── Outcomes
        ├── Career Outcome
        ├── Research Outcome
        ├── Professional Outcome
        ├── Public-System Outcome
        ├── Enterprise Outcome
        ├── Employment Mode
        ├── Salary / Revenue Range
        ├── City / Region
        └── Continuing Learning
```

## 2. Core Design Rules

1. Interdisciplinary Domain ≠ Parent Discipline.
2. Interdisciplinary Stream ≠ a simple list of subjects.
3. Every pathway must identify primary, secondary and supporting disciplines.
4. Parent-ontology knowledge must be referenced, not duplicated.
5. A structured degree, specialisation or recognised pathway must exist before a hybrid label becomes a formal Stream.
6. Career Outcome ≠ Course Title ≠ Integration Pattern.
7. Technology must connect to a domain problem, method and application context.
8. Cross-faculty entry must state bridge, subject, quantitative, laboratory or portfolio requirements.
9. Major, minor, electives and credits are first-class structures.
10. Community and tribal pathways must preserve attribution, consent and regional context.
11. Government missions are ecosystems, not academic programmes.
12. Livelihood models are service or enterprise outcomes, not automatically Streams.
13. Salary and revenue figures are source estimates requiring validation.
14. Eligibility and suitability remain separate.
15. The Interdisciplinary Universe is a bridge across the five parent ontologies, not an isolated silo.

## 3. Comparison with Earlier Ontologies


| Dimension | Science v0.6 | Commerce v0.7 | Humanities v0.8 | Management v0.9 | Law v1.0 | Interdisciplinary v1.1 |
| --- | --- | --- | --- | --- | --- | --- |
| Common SCC foundation | Technical/scientific pathways | Professional qualification and practice | Portfolio/culture/recognition | Function/sector/enterprise | Jurisdiction/practice rights | Reuses all common entities |
| Primary ontology unit | Domain → Stream | Domain → Stream → Qualification | Domain → Stream → Creative/Research Practice | Function + Sector + Stream | Practice Area + Forum + Permission | Integration Pattern + Parent Discipline + Structured Pathway |
| Selection mechanisms | Entrance/licensing exams | Admission/professional/recruitment exams | Admissions, portfolios, auditions and eligibility tests | UG/PG exams and certification | Admission, enrolment, registration and COP | Programme-specific admissions inherited from parent disciplines |
| Experience evidence | Lab/project/internship | Articleship/practical training | Portfolio/fieldwork/supervised practice | Cases/practicum/leadership | Moot/clinic/drafting/supervised practice | Cross-domain capstone, portfolio and integration evidence |
| Main normalization risk | Technical levels | Qualification versus outcome | Career versus creative practice | Role versus function/sector | Degree versus permission | Duplication of parent ontologies and uncontrolled hybrid labels |

## 4. Inherited SCC Entities

The ontology reuses all common SCC entities and references the specialised structures already defined in Commerce, Humanities, Management and Law.

## 5. Interdisciplinary-Specific Entities

### 5.1 Parent Discipline
Represents the contributing Science, Commerce, Humanities, Management, Law or external discipline.

### 5.2 Integration Domain
A stable family of pathways sharing parent disciplines, methods and application contexts.

### 5.3 Integration Pattern
Defines how disciplines combine: knowledge, method, profession, technology, sector or community integration.

### 5.4 Application Context
Represents the industry, public-system, community, research, enterprise, cultural or environmental problem context.

### 5.5 Cross-Faculty Entry Rule
Stores accepted degrees/subjects, quantitative, laboratory and portfolio requirements, bridge courses, source and effective dates.

### 5.6 Bridge Course
Closes prerequisite gaps in subject, method, laboratory, technology, professional or language knowledge.

### 5.7 Multidisciplinary Programme Structure
Models major-minor, double major, dual degree, joint degree, integrated, open-elective and modular structures.

### 5.8 Method Bundle
Combines data, legal, design, research, laboratory and field methods.

### 5.9 Interdisciplinary Capstone
Requires integration of multiple disciplines in one applied problem.

### 5.10 Integration Evidence
Represents policy-data briefs, legal-tech prototypes, health dashboards, field reports and similar combined evidence.

### 5.11 Community Embeddedness
Captures direct field presence, local language, consent and benefit-sharing requirements.

## 6. Normalized Interdisciplinary Domain Registry


| Domain Code | Normalized Integration Domain | Integration Nature | Definition | Career Master Stream Count |
| --- | --- | --- | --- | --- |
| INT-DOM-BIOSCI | Biosciences, Data & Digital Health | Science + Data + Health | Bioinformatics, genomics, health informatics, clinical data and digital-health integration. | 2 |
| INT-DOM-PSYAI | Psychology, Behaviour, Business & AI | Psychology + Business + AI | Behavioural economics, consumer neuroscience, people analytics, HCI and human-AI interaction. | 4 |
| INT-DOM-FINTECH | Commerce, Finance, Analytics & FinTech | Commerce + Data + Technology | FinTech product, financial analytics, climate finance, ESG reporting and financial-data pathways. | 3 |
| INT-DOM-CLIMATE | Climate, Sustainability, Environment & Circular Systems | Environment + Policy + Business + Data | Climate finance, sustainability analytics, circular economy, adaptation planning and environmental governance. | 2 |
| INT-DOM-AGRI | Agriculture, Food, Rural Systems & Technology | Agriculture + Business + Data + Sustainability | Agri-tech, food systems, rural innovation, supply chains, resource enterprise and digital agriculture. | 3 |
| INT-DOM-GEO | Geospatial, Urban, Water & Smart Systems | Geography + GIS + AI + Policy | GeoAI, urban planning, smart cities, water-resource analytics and spatial governance. | 3 |
| INT-DOM-LAWTECH | Law, Technology, Governance & Digital Regulation | Law + Technology + Policy | Privacy, AI governance, legal design, legal analytics, digital identity and technology regulation. | 6 |
| INT-DOM-POLICY | Public Policy, Economics, Governance & Social Impact | Policy + Economics + Law + Data | Policy analysis, governance data, development programmes, impact measurement and public systems. | 3 |
| INT-DOM-HUMTECH | Humanities, Culture, Heritage & Technology | Humanities + Digital Tools + Design | Digital humanities, archives, museums, cultural technology, heritage experience and language technology. | 2 |
| INT-DOM-MEDIAAI | Media, Communication, Data & AI | Media + Data + AI | Data journalism, AI-assisted media, science communication, creator strategy and development communication. | 3 |
| INT-DOM-DESIGN | Design, Business, Product & Technology | Design + Management + Technology | Service design, product experience, legal design, fashion technology and no-code systems. | 1 |
| INT-DOM-EDTECH | Education, Learning Sciences, Data & Technology | Education + Psychology + Content + Data | Educational technology, learning analytics, instructional design and inclusive digital learning. | 3 |
| INT-DOM-HEALTH | Healthcare, Management, Analytics & Public Health | Health + Management + Data + Policy | Health informatics, hospital analytics, digital-health products, public-health data and market access. | 1 |
| INT-DOM-FRONTIER | Frontier Science, Space, AI & Emerging Systems | Science/Engineering + Policy + Business | Space policy, GeoAI, autonomous systems, bioentrepreneurship and digital public infrastructure. | 1 |
| INT-DOM-COMMUNITY | Community, Tribal, Inclusive & Regional Systems | Community Knowledge + Policy + Health + Livelihood | Tribal studies, indigenous knowledge, inclusive education, community health, rural digital inclusion and local enterprise. | 0 |
| INT-DOM-CREATIVE | Creative Industries, Experience & Knowledge Enterprise | Arts + Media + Business + Technology | Fashion, film, sports analytics, heritage enterprise, cultural management and creative-economy pathways. | 1 |

## 7. Normalized Interdisciplinary Stream Registry



### 7.1 Biosciences, Data & Digital Health (`INT-DOM-BIOSCI`)

| Stream Code | Career / Pathway | Parent Disciplines | Hybrid Cluster | Structured Course(s) | Eligibility | Entry Stage | Institutions / Ecosystem | Entrance Route | Core Skills | Preparation 8–12 | Salary / Revenue | Work Mode | Enterprise Scope | AI / Tech Exposure | Portfolio Requirement | Mission Relevance | Career Maturity | Source |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| INT-STR-BIOS-BIOISPEC | Bioinformatics Specialist | Biology + Computer Science + Statistics | Life Sciences + Data | BSc/MSc Bioinformatics; BTech Bioinformatics; MSc Biotechnology with computational electives | PCB/PCM in 12th; BSc Life Sciences/Biotech/CS for PG | After 12th / Graduation | IISERs, Central Universities, private universities, biotech institutes | CUET/IAT/institute exams | Biology, Python/R, statistics, genomics databases | Class 8-10: biology + maths foundation; 11-12: PCB/PCM, coding basics | ₹4-12 LPA entry; ₹12-30 LPA specialist | Lab + data + hybrid | Medium: bio-data consulting, genome annotation support | Very High | High: datasets, mini research projects | Biotech, Digital Health, IndiaAI | Established | https://www.iiseradmission.in/ |
| INT-STR-BIOS-HEALINFOANAL | Health Informatics Analyst | Healthcare + Data Science + Management | Healthcare + Analytics | BSc/MSc Health Informatics; MPH with informatics; MBA Healthcare Analytics | Any graduate for PG; health/science/IT background preferred | Graduation / PG | IIHMR, IIPH, health universities, digital health programs | CUET PG/Institute selection/MBA exams | Health systems, data dashboards, privacy, Excel/SQL | Biology, basic statistics, digital health awareness | ₹5-15 LPA | Hospital/Consulting/Hybrid | Medium: hospital analytics services | High | High: dashboard + case reports | Ayushman Bharat Digital Mission | Emerging-Structured | https://abdm.gov.in/ |

### 7.2 Psychology, Behaviour, Business & AI (`INT-DOM-PSYAI`)

| Stream Code | Career / Pathway | Parent Disciplines | Hybrid Cluster | Structured Course(s) | Eligibility | Entry Stage | Institutions / Ecosystem | Entrance Route | Core Skills | Preparation 8–12 | Salary / Revenue | Work Mode | Enterprise Scope | AI / Tech Exposure | Portfolio Requirement | Mission Relevance | Career Maturity | Source |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| INT-STR-PSYA-UXRESE | UX Researcher | Psychology + Design + Technology | Design + Human Behaviour | BDes/MDes UX; Human-Computer Interaction; Psychology + UX PG diploma | Any stream for design UG; graduation for MDes/PG; psychology/design/engineering useful | After 12th / Graduation | NID, IITs, design schools, private universities | UCEED/CEED/NID DAT/Institute tests | User research, empathy, interviewing, prototyping, analytics | Observation diary, design thinking, reading psychology | ₹5-18 LPA | Hybrid/Remote/Product teams | High: UX research consultancy | High | Very High: portfolio mandatory | Digital India, startup ecosystem | Established-Emerging | https://www.uceed.iitb.ac.in/ |
| INT-STR-PSYA-BEHAECON | Behavioural Economist | Economics + Psychology + Data | Behaviour + Policy/Business | BA/MA Economics; MSc Behavioural Science; Public Policy with behavioural track | Any stream with maths/economics helpful; any graduate for PG | After 12th / Graduation | Ashoka/Jindal/central universities, policy schools, IIM research ecosystem | CUET/Institute tests | Statistics, psychology, experiment design, economics | Maths, economics reading, observation projects | ₹6-18 LPA | Consulting/Research/Policy | High: behavioural design consulting | Medium | High: experiments, survey reports | Public health, financial inclusion, policy nudges | Emerging-Structured | https://swayam.gov.in/ |
| INT-STR-PSYA-NEURRESEASSO | NeuroMarketing Research Associate | Psychology + Marketing + Neuroscience | Psychology + Business | MSc Psychology/Neuroscience; MBA Marketing with consumer research; PG neuromarketing | Psychology/life sciences/management background | Graduation / PG | Psychology departments, management institutes, neuroscience labs | CUET PG/CAT/MAT/institute tests | Consumer research, analytics, experimental methods | Psychology, biology basics, statistics, marketing awareness | ₹5-15 LPA | Research/Marketing/Consulting | Medium: consumer insight studio | Medium-High | High: research portfolio | Startup/consumer economy | Emerging-Structured | https://swayam.gov.in/ |
| INT-STR-PSYA-HUMAFACTERGOSPEC | Human Factors / Ergonomics Specialist | Psychology + Design + Engineering | Human Factors | MDes HCI; MSc Psychology/Ergonomics; engineering design programs | Engineering/design/psychology background | Graduation / PG | IITs, NID, design/engineering institutes | CEED/GATE/CUET PG/institute | Cognition, usability, safety, prototyping | Science, psychology, observation, design projects | ₹6-20 LPA | Product/Research/Consulting | High: usability audit services | High | High: usability studies | Digital products, safety standards | Emerging-Structured | https://www.ceed.iitb.ac.in/ |

### 7.3 Commerce, Finance, Analytics & FinTech (`INT-DOM-FINTECH`)

| Stream Code | Career / Pathway | Parent Disciplines | Hybrid Cluster | Structured Course(s) | Eligibility | Entry Stage | Institutions / Ecosystem | Entrance Route | Core Skills | Preparation 8–12 | Salary / Revenue | Work Mode | Enterprise Scope | AI / Tech Exposure | Portfolio Requirement | Mission Relevance | Career Maturity | Source |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| INT-STR-FINT-FINTPRODANAL | FinTech Product Analyst | Finance + Technology + Data | Commerce + Analytics + Tech | BBA/BCom FinTech; MBA FinTech; PG Diploma FinTech; Data Science with finance | Commerce/PCM/any UG; maths useful | After 12th / Graduation | IIMs, IITM online, IIFT, private universities | CUET/CAT/CMAT/institute exams | Finance, product thinking, data, regulation basics | Maths, commerce, Excel, basic coding | ₹6-20 LPA | FinTech/startup/hybrid | High: fintech product consulting | Very High | High: product case studies | Digital India, UPI, ONDC | Emerging-Structured | https://onlinedegree.iitm.ac.in/ |
| INT-STR-FINT-FINAANALPROF | Financial Analytics Professional | Commerce + Statistics + Data Science | Finance + Analytics | BCom/BBA + analytics; MSc Financial Analytics; MBA Business Analytics | Commerce/PCM/any UG with quantitative aptitude | After 12th / Graduation | IITM BS, IIMs, private universities, analytics institutes | CUET/CAT/CMAT/institute tests | Excel, Python/R, accounting, statistics, BI tools | Maths, accountancy, spreadsheet practice | ₹5-16 LPA | Corporate/Hybrid | Medium: financial dashboard services | High | High: analysis portfolio | Digital India, financial inclusion | Established-Emerging | https://study.iitm.ac.in/mg/ |
| INT-STR-FINT-CLIMFINAANAL | Climate Finance Analyst | Finance + Sustainability + Policy | Climate + Finance | MBA Sustainability/Finance; MSc Environmental Economics; PG climate finance | Any graduate; commerce/economics/environment background useful | Graduation / PG | IIMs, TERI SAS, sustainability schools, finance institutes | CAT/CUET PG/institute exams | ESG, carbon markets, financial modelling, policy | Geography, economics, climate awareness, maths | ₹6-20 LPA | Consulting/Finance/ESG | High: ESG advisory | Medium-High | High: ESG reports | LiFE Mission, climate policy, green finance | Emerging-Structured | https://www.ugc.gov.in/ |

### 7.4 Climate, Sustainability, Environment & Circular Systems (`INT-DOM-CLIMATE`)

| Stream Code | Career / Pathway | Parent Disciplines | Hybrid Cluster | Structured Course(s) | Eligibility | Entry Stage | Institutions / Ecosystem | Entrance Route | Core Skills | Preparation 8–12 | Salary / Revenue | Work Mode | Enterprise Scope | AI / Tech Exposure | Portfolio Requirement | Mission Relevance | Career Maturity | Source |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| INT-STR-CLIM-ESGSUSTANAL | ESG & Sustainability Analyst | Management + Environment + Reporting | Sustainability Management | MBA Sustainability; MSc Environmental Management; PG ESG certification | Any graduate; science/economics/management helpful | Graduation / PG | IIMs, TERI SAS, state universities, private institutes | CAT/CUET PG/institute tests | ESG reporting, GRI/BRSR awareness, research | Environment clubs, data tables, report writing | ₹5-18 LPA | Consulting/Corporate/Hybrid | High: ESG reporting services | Medium | High: sustainability reports | SDGs, climate missions, corporate reporting | Emerging-Structured | https://swayam.gov.in/ |
| INT-STR-CLIM-CIRCECONCONS | Circular Economy Consultant | Environment + Business + Design | Sustainability + Enterprise | MBA sustainability; MSc environmental management; design/business circularity courses | Any graduate; environment/business/design helpful | Graduation / PG | IIMs, TERI, design/business schools | CAT/CUET PG/institute tests | Systems thinking, waste audit, business modelling | Environment, commerce, project work | ₹5-18 LPA | Consulting/Hybrid | Very High: circularity audits | Medium | High: audit/toolkits | Swachh Bharat, circular economy, MSME | Emerging-Structured | https://www.startupindia.gov.in/ |

### 7.5 Agriculture, Food, Rural Systems & Technology (`INT-DOM-AGRI`)

| Stream Code | Career / Pathway | Parent Disciplines | Hybrid Cluster | Structured Course(s) | Eligibility | Entry Stage | Institutions / Ecosystem | Entrance Route | Core Skills | Preparation 8–12 | Salary / Revenue | Work Mode | Enterprise Scope | AI / Tech Exposure | Portfolio Requirement | Mission Relevance | Career Maturity | Source |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| INT-STR-AGRI-AGRITECHBUSIANAL | Agri-Tech Business Analyst | Agriculture + Data + Business | Agri + Technology | BSc Agriculture; MBA AgriBusiness; Data/AgriTech PG programs | PCB/PCM/agri stream for UG; any graduate for MBA agri in some institutes | After 12th / Graduation | MANAGE, agricultural universities, IRMA, private agri-business schools | CUET/ICAR/CAT/CMAT/institute tests | Agri markets, analytics, supply chain, rural fieldwork | Biology/geography, rural economy, Excel | ₹4-14 LPA | Field + office/hybrid | High: farm advisory/data services | High | Medium-High: market/field reports | Digital Agriculture, eNAM, Startup India | Emerging-Structured | https://www.manage.gov.in/ |
| INT-STR-AGRI-FOODTECHENTR | Food Technology Entrepreneur | Food Science + Business + Supply Chain | Food + Enterprise | BTech/BSc Food Tech; MBA Food Business; PG diploma food safety | PCM/PCB for BTech/BSc; graduate for MBA/PG | After 12th / Graduation | CFTRI, NIFTEM, food tech universities, FSSAI ecosystem | CUET/JEE/institute exams | Food safety, operations, branding, supply chain | Chemistry, biology, home science, entrepreneurship clubs | ₹4-15 LPA; entrepreneurship variable | Industry/Startup | Very High | Medium | High: product prototype/business plan | PMFME, Startup India, MSME | Established-Emerging | https://www.startupindia.gov.in/ |
| INT-STR-AGRI-RURAINNOMANA | Rural Innovation Manager | Rural Management + Design + Technology | Rural + Innovation | PGDM Rural Management; social design; agri/rural innovation programs | Any graduate; rural/social/agri experience helpful | Graduation / PG | IRMA, MANAGE, TISS, rural universities | CAT/XAT/CMAT/IRMA/institute tests | Field immersion, enterprise design, livelihoods | Rural visits, local economy study, communication | ₹5-16 LPA | Field + office | High: rural enterprise consulting | Medium-High | High: field projects | NRLM, Skill India, Startup India | Established-Emerging | https://www.irma.ac.in/ |

### 7.6 Geospatial, Urban, Water & Smart Systems (`INT-DOM-GEO`)

| Stream Code | Career / Pathway | Parent Disciplines | Hybrid Cluster | Structured Course(s) | Eligibility | Entry Stage | Institutions / Ecosystem | Entrance Route | Core Skills | Preparation 8–12 | Salary / Revenue | Work Mode | Enterprise Scope | AI / Tech Exposure | Portfolio Requirement | Mission Relevance | Career Maturity | Source |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| INT-STR-GEO-GEOAGEOSANAL | GeoAI / Geospatial Analyst | Geography + Remote Sensing + AI | Geospatial + Data | BSc/MSc Geography/Geoinformatics; Remote Sensing; GIS + AI courses | PCM/Geography; BSc/BE for PG; maths/data useful | After 12th / Graduation | IIRS, ISRO-linked institutes, IITs, central universities | CUET PG/GATE/institute exams | GIS, remote sensing, Python, spatial analysis | Geography, maths, maps, coding basics | ₹5-16 LPA | Govt/Consulting/Hybrid | High: GIS mapping services | Very High | High: GIS portfolio | Smart Cities, disaster management, Digital India | Emerging-Structured | https://swayam.gov.in/ |
| INT-STR-GEO-URBAPLANSMARCITY | Urban Planner / Smart City Analyst | Architecture + Geography + Policy + Data | Urban + Governance | BPlan/MPlan; Urban Studies; Public Policy; Smart city analytics | PCM for architecture/planning; any graduate for urban studies/policy | After 12th / Graduation | SPA Delhi/Bhopal/Vijayawada, CEPT, IITs | JEE/NATA/CUET PG/GATE/institute tests | Urban research, GIS, planning law, data | Geography, drawing/maps, civic awareness | ₹5-18 LPA | Planning/Consulting/Govt | Medium: local planning advisory | High | High: maps/planning portfolio | Smart Cities Mission, AMRUT | Established-Emerging | https://www.ugc.gov.in/ |
| INT-STR-GEO-WATERESOMANAPROF | Water Resource Management Professional | Civil/Environmental Science + Policy + GIS | Environment + Governance | MSc/MTech Water Resource; environmental management; public policy | PCM/civil/environment/geography backgrounds | Graduation / PG | IITs, TERI, central universities, water institutes | GATE/CUET PG/institute tests | Hydrology basics, GIS, policy, project management | Geography, environmental clubs, maths | ₹5-16 LPA | Govt/Consulting/NGO | High: local water audit services | Medium-High | High: water audit/project reports | Jal Jeevan Mission, AMRUT | Established-Emerging | https://www.ugc.gov.in/ |

### 7.7 Law, Technology, Governance & Digital Regulation (`INT-DOM-LAWTECH`)

| Stream Code | Career / Pathway | Parent Disciplines | Hybrid Cluster | Structured Course(s) | Eligibility | Entry Stage | Institutions / Ecosystem | Entrance Route | Core Skills | Preparation 8–12 | Salary / Revenue | Work Mode | Enterprise Scope | AI / Tech Exposure | Portfolio Requirement | Mission Relevance | Career Maturity | Source |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| INT-STR-LAWT-AIETHIGOVEANAL | AI Ethics & Governance Analyst | AI + Law + Philosophy + Public Policy | AI Governance | MA/MPP/LLM Tech Law; PG Diploma AI Ethics; CS + policy pathway | Any graduate; law, philosophy, CS, public policy backgrounds advantageous | Graduation / PG | IITs, IIITs, NLSIU, TISS, policy schools | CUET PG/NLSAT-MPP/institute selection | Ethics, policy writing, AI basics, regulatory analysis | Debate, logic, constitutional values, coding awareness | ₹6-20 LPA | Consulting/Policy/Remote | High: AI governance advisory | Very High | High: policy notes, audit frameworks | IndiaAI, Digital Personal Data Protection ecosystem | Emerging-Structured | https://indiaai.gov.in/ |
| INT-STR-LAWT-CYBEPOLIDIGIRIGH | Cyber Policy & Digital Rights Professional | Law + Technology + Governance | Law + Tech | LLB/LLM Cyber Law; MA Public Policy; PG Diploma Cyber Law | Any graduate for policy; law/IT background preferred for cyber compliance | Graduation / PG | NLSIU, NLU ecosystem, TISS, cyber law institutes | CLAT PG/NLSAT/Institute exams | Cyber law, data protection, writing, digital literacy | ICT awareness, debate, constitution, basic security | ₹5-18 LPA | Policy/legal/compliance | High: privacy/cyber compliance advisory | High | High: legal briefs, compliance templates | Digital India, DPDP Act ecosystem | Emerging-Structured | https://www.nls.ac.in/programme/master-of-public-policy/ |
| INT-STR-LAWT-PUBLPOLIANAL | Public Policy Analyst | Economics + Law + Sociology + Governance | Public Policy | BA/MA Public Policy; MPP; Development Studies; Economics/Public Admin | Any stream for UG; any graduate for PG; quantitative skills useful | After 12th / Graduation | NLSIU, TISS, Azim Premji University, Central Universities | CUET/NLSAT-MPP/institute tests | Policy analysis, statistics, writing, field research | Newspaper reading, debate, data interpretation, civics | ₹5-16 LPA | Think tank/Govt/NGO/Consulting | Medium: policy research consultancy | Medium | High: policy briefs, field reports | NITI Aayog, SDGs, Digital India | Established | https://www.nls.ac.in/programme/master-of-public-policy/ |
| INT-STR-LAWT-LEGADESICONS | Legal Design Consultant | Law + Design + Communication | Law + Design | LLB + design thinking; LLM legal tech; communication design + legal literacy | Law/Design/Communication background | Graduation / PG | NLUs, design schools, legal tech programs | CLAT/UCEED/CEED/institute tests | Legal simplification, visual design, UX, policy | Debate, design, writing, civics | ₹5-18 LPA | Consulting/LegalTech/Hybrid | High: legal document design studio | High | High: legal infographics/templates | Access to justice, Digital India | Emerging | https://admissions.nid.edu/ |
| INT-STR-LAWT-SPACPOLIBUSIANAL | Space Policy & Business Analyst | Space Science + Law + Policy + Business | Space + Policy | MSc/MA public policy; space science/engineering + policy; law + space policy | Science/engineering/law/policy background | Graduation / PG | IISERs, IITs, NLSIU policy, space-tech ecosystem | CUET/GATE/NLSAT/institute tests | Policy analysis, space economy, regulation, tech literacy | Physics, maths, civics, science writing | ₹6-20 LPA | Policy/Startup/Consulting | Medium: space policy research | High | High: policy briefs/research | IN-SPACe, Startup India, IndiaAI | Emerging | https://www.startupindia.gov.in/ |
| INT-STR-LAWT-LEGADATAANAL | Legal Data Analyst | Law + Data Analytics | Law + Analytics | LLB + data analytics; legal tech PG diploma; statistics + legal compliance | Law graduate preferred; data skills required | Graduation / PG | NLUs, private universities, legal tech ecosystem | CLAT/Institute selection | Legal research, Excel/SQL, compliance analytics | Civics, logic, spreadsheet, reading cases | ₹5-16 LPA | LegalTech/Compliance/Hybrid | High: legal analytics services | High | High: case/data dashboards | Digital courts, DPDP ecosystem | Emerging-Structured | https://www.nls.ac.in/ |

### 7.8 Public Policy, Economics, Governance & Social Impact (`INT-DOM-POLICY`)

| Stream Code | Career / Pathway | Parent Disciplines | Hybrid Cluster | Structured Course(s) | Eligibility | Entry Stage | Institutions / Ecosystem | Entrance Route | Core Skills | Preparation 8–12 | Salary / Revenue | Work Mode | Enterprise Scope | AI / Tech Exposure | Portfolio Requirement | Mission Relevance | Career Maturity | Source |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| INT-STR-POLI-DEVECOMMSPEC | Development Communication Specialist | Media + Sociology + Public Policy | Communication + Development | MA Development Communication; Mass Communication + Development Studies | Any graduate; media/social science backgrounds useful | Graduation / PG | TISS, Jamia, Central Universities, media institutes | CUET PG/Institute tests | Writing, campaign design, social research, audio-visual skills | Writing, public speaking, social awareness | ₹4-12 LPA | NGO/CSR/Media/Hybrid | High: social campaign agency | Medium | High: campaign portfolio | Skill India, health/education missions | Established | https://admissions.tiss.ac.in/ |
| INT-STR-POLI-SOCIIMPAMEASANAL | Social Impact Measurement Analyst | Development Studies + Statistics + Management | Social Sector + Analytics | MA Development Studies; M&E diploma; Public policy/management | Any graduate; social science/statistics helpful | Graduation / PG | TISS, IRMA, Azim Premji, development institutes | CUET PG/institute tests | Monitoring & evaluation, survey design, dashboards | Social work, statistics, field exposure | ₹4-14 LPA | NGO/CSR/Consulting | High: impact reporting services | Medium-High | High: field reports/data projects | CSR, SDGs, aspirational districts | Established-Emerging | https://admissions.tiss.ac.in/ |
| INT-STR-POLI-COMPSOCISCIE | Computational Social Scientist | Sociology/Economics + Data Science | Social Science + Data | MA/MSc Computational Social Science; public policy/data science | Social science/economics/statistics/CS background | Graduation / PG | IITs, IIITs, liberal arts universities, policy schools | CUET PG/GATE/institute tests | Statistics, Python/R, surveys, causal thinking | Social science reading + coding + statistics | ₹6-20 LPA | Research/Consulting/Hybrid | Medium: survey/data research services | Very High | High: datasets, papers, dashboards | Open data, Digital India | Emerging-Structured | https://onlinedegree.iitm.ac.in/ |

### 7.9 Humanities, Culture, Heritage & Technology (`INT-DOM-HUMTECH`)

| Stream Code | Career / Pathway | Parent Disciplines | Hybrid Cluster | Structured Course(s) | Eligibility | Entry Stage | Institutions / Ecosystem | Entrance Route | Core Skills | Preparation 8–12 | Salary / Revenue | Work Mode | Enterprise Scope | AI / Tech Exposure | Portfolio Requirement | Mission Relevance | Career Maturity | Source |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| INT-STR-HUMT-DIGIHUMARESE | Digital Humanities Researcher | Literature/History + Data + Digital Archives | Humanities + Technology | MA Digital Humanities; History/Literature with digital methods; archival studies | BA humanities; CS/data skills optional but useful | Graduation / PG | Central Universities, IIT humanities schools, archives, liberal arts universities | CUET PG/institute selection | Text analysis, archiving, metadata, digital storytelling | Reading, writing, basic coding, history/literature projects | ₹4-12 LPA; research roles vary | Research/Archive/Hybrid | Medium: digital archive services | High | High: digital archive/text project | National Digital Library, cultural digitization | Emerging-Structured | https://swayam.gov.in/ |
| INT-STR-HUMT-MUSEHERIEXPEMANA | Museum & Heritage Experience Manager | History + Design + Tourism + Management | Culture + Experience | MA Heritage Management/Museology; Tourism/Design management | Any graduate; history/archaeology/tourism/design preferred | Graduation / PG | National Museum Institute, heritage universities, tourism institutes | CUET PG/institute tests | Curation, storytelling, event management, archives | History, art, writing, local heritage projects | ₹4-12 LPA | Museum/Tourism/Hybrid | High: heritage walks/experience design | Medium | Very High: heritage portfolio | Cultural tourism, heritage missions | Established-Emerging | https://swayam.gov.in/ |

### 7.10 Media, Communication, Data & AI (`INT-DOM-MEDIAAI`)

| Stream Code | Career / Pathway | Parent Disciplines | Hybrid Cluster | Structured Course(s) | Eligibility | Entry Stage | Institutions / Ecosystem | Entrance Route | Core Skills | Preparation 8–12 | Salary / Revenue | Work Mode | Enterprise Scope | AI / Tech Exposure | Portfolio Requirement | Mission Relevance | Career Maturity | Source |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| INT-STR-MEDI-SCIECOMMSPEC | Science Communication Specialist | Science + Media + Education | Science + Communication | MSc Science Communication; Journalism with science; science education programs | Science UG preferred; media/language skills useful | Graduation / PG | Central universities, science communication centers, media institutes | CUET PG/institute tests | Writing, visualization, science literacy | Science club, writing, presentations | ₹4-12 LPA | Media/Education/Hybrid | High: content studio/workshops | Medium | High: articles/videos/explainers | Vigyan Prasar/Science outreach ecosystems | Established-Emerging | https://swayam.gov.in/ |
| INT-STR-MEDI-DATAJOURANAL | Data Journalism Analyst | Journalism + Statistics + Coding | Media + Data | BA Journalism; MA Data Journalism; Data analytics certification with journalism | Any stream; maths/statistics helpful | After 12th / Graduation | Media schools, central universities, online degree/cert ecosystems | CUET/Institute tests | Data cleaning, visualization, investigative writing | Newspaper reading, Excel, writing, charts | ₹4-14 LPA | Media/Remote/Hybrid | High: data storytelling services | High | Very High: articles/dashboard portfolio | Open data, Digital India | Emerging-Structured | https://swayam.gov.in/ |
| INT-STR-MEDI-FILMMEDIBUSIMANA | Film & Media Business Manager | Film + Business + Digital Platforms | Media + Business | Film studies/media management; MBA media; production management | Any graduate; media/business background useful | Graduation / PG | FTII, SRFTI, media universities, private film schools | Institute exams/CUET PG | Production budgeting, rights, distribution, marketing | Drama/media clubs, writing, editing basics | ₹4-18 LPA; project-based variable | Studio/OTT/Freelance/Hybrid | High: production services/agency | Medium-High | High: production/project portfolio | Creative economy, Digital India | Established-Emerging | https://www.ftii.ac.in/ |

### 7.11 Design, Business, Product & Technology (`INT-DOM-DESIGN`)

| Stream Code | Career / Pathway | Parent Disciplines | Hybrid Cluster | Structured Course(s) | Eligibility | Entry Stage | Institutions / Ecosystem | Entrance Route | Core Skills | Preparation 8–12 | Salary / Revenue | Work Mode | Enterprise Scope | AI / Tech Exposure | Portfolio Requirement | Mission Relevance | Career Maturity | Source |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| INT-STR-DESI-FASHTECHBUSIMANA | Fashion Technology & Business Manager | Fashion Design + Technology + Retail | Fashion + Business | BDes/BFTech/MFM; fashion management; retail management | Any stream for design; PCM often for BFTech; graduation for PG | After 12th / Graduation | NIFT, private fashion institutes | NIFT entrance/institute tests | Retail, merchandising, textiles, e-commerce | Art/design, commerce basics, trend observation | ₹4-16 LPA | Retail/Brand/Hybrid | High: boutique brand/merchandising | Medium-High | Very High: design/business portfolio | MSME, Digital Commerce, ONDC | Established | https://www.nift.ac.in/ |

### 7.12 Education, Learning Sciences, Data & Technology (`INT-DOM-EDTECH`)

| Stream Code | Career / Pathway | Parent Disciplines | Hybrid Cluster | Structured Course(s) | Eligibility | Entry Stage | Institutions / Ecosystem | Entrance Route | Core Skills | Preparation 8–12 | Salary / Revenue | Work Mode | Enterprise Scope | AI / Tech Exposure | Portfolio Requirement | Mission Relevance | Career Maturity | Source |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| INT-STR-EDTE-MEDTOPERMANA | MedTech Operations Manager | Biomedical + Management + Data | Healthcare + Product | Biomedical engineering/BSc + MBA Healthcare; PG MedTech management | PCM/PCB for biomedical/health; any graduate for MBA healthcare | After 12th / Graduation | IIHMR, IITs, biomedical programs, healthcare institutes | JEE/CUET/CAT/CMAT/institute exams | Operations, device basics, hospital workflow, compliance | Science, maths, healthcare awareness, robotics clubs | ₹6-20 LPA | Hospital/MedTech/Hybrid | High: device adoption consulting | High | Medium: product workflow cases | Digital Health, Make in India | Emerging-Structured | https://iihmr.edu.in/program/mba-hospital-and-health-management |
| INT-STR-EDTE-EDUCTECHSPEC | Educational Technology Specialist | Education + Technology + Content + Data | EdTech + Learning | BEd/MEd Educational Technology; MA Education; instructional design PG | Any graduate; education/psychology/IT background useful | Graduation / PG | TISS, central universities, education schools, IITM online support | CUET PG/institute tests | Instructional design, LMS, pedagogy, analytics | Teaching club, content creation, coding awareness | ₹4-16 LPA | EdTech/School/Hybrid | High: course design services | High | High: sample modules, lesson plans | Digital India, NEP, SWAYAM | Emerging-Structured | https://swayam.gov.in/ |
| INT-STR-EDTE-EDUCDATAANAL | Educational Data Analyst | Education + Statistics + Technology | Education + Analytics | MA Education; MEd; analytics/data science; educational technology | Any graduate; education/statistics/IT helpful | Graduation / PG | TISS, central universities, IITM online, EdTech institutes | CUET PG/institute tests | Learning analytics, assessment, dashboards | Maths, teaching, Excel, school project data | ₹4-15 LPA | EdTech/Schools/Research | High: assessment analytics services | High | High: dashboards/reports | NEP, DIKSHA, Digital India | Emerging-Structured | https://swayam.gov.in/ |

### 7.13 Healthcare, Management, Analytics & Public Health (`INT-DOM-HEALTH`)

| Stream Code | Career / Pathway | Parent Disciplines | Hybrid Cluster | Structured Course(s) | Eligibility | Entry Stage | Institutions / Ecosystem | Entrance Route | Core Skills | Preparation 8–12 | Salary / Revenue | Work Mode | Enterprise Scope | AI / Tech Exposure | Portfolio Requirement | Mission Relevance | Career Maturity | Source |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| INT-STR-HEAL-PHARMANAPROF | Pharma Management Professional | Pharmacy + Management + Regulation | Pharma + Business | BPharm/MPharm + MBA Pharma; MBA Pharmaceutical Management | BPharm/life sciences/any grad depending programme | Graduation / PG | NIPER, IIHMR, pharma management institutes | GPAT/CAT/CMAT/NIPER exams | Pharma marketing, regulation, market access | Chemistry, biology, business awareness | ₹5-18 LPA | Pharma corporate/Hybrid | Medium: pharma market research services | Medium | Medium: market reports | Make in India, pharma sector | Established | https://www.niper.gov.in/ |

### 7.14 Frontier Science, Space, AI & Emerging Systems (`INT-DOM-FRONTIER`)

| Stream Code | Career / Pathway | Parent Disciplines | Hybrid Cluster | Structured Course(s) | Eligibility | Entry Stage | Institutions / Ecosystem | Entrance Route | Core Skills | Preparation 8–12 | Salary / Revenue | Work Mode | Enterprise Scope | AI / Tech Exposure | Portfolio Requirement | Mission Relevance | Career Maturity | Source |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| INT-STR-FRON-COMPLINGNLPASSO | Computational Linguist / NLP Associate | Linguistics + Computer Science + AI | Language + AI | MA Linguistics with NLP; MSc Computational Linguistics; CS + language tech | BA linguistics/languages/CS; PCM/CS useful for technical track | After 12th / Graduation | Central Universities, IIITs, IITs, language technology centers | CUET PG/GATE/institute exams | Linguistics, Python, NLP, corpus analysis | Language study, grammar, coding basics | ₹5-18 LPA | Tech/Research/Hybrid | Medium: language data services | Very High | High: corpus/NLP mini-projects | Bhashini, Digital India, IndiaAI | Emerging-Structured | https://indiaai.gov.in/ |

### 7.15 Community, Tribal, Inclusive & Regional Systems (`INT-DOM-COMMUNITY`)

_No Career Master stream currently assigned; domain retained for supporting pathways._

### 7.16 Creative Industries, Experience & Knowledge Enterprise (`INT-DOM-CREATIVE`)

| Stream Code | Career / Pathway | Parent Disciplines | Hybrid Cluster | Structured Course(s) | Eligibility | Entry Stage | Institutions / Ecosystem | Entrance Route | Core Skills | Preparation 8–12 | Salary / Revenue | Work Mode | Enterprise Scope | AI / Tech Exposure | Portfolio Requirement | Mission Relevance | Career Maturity | Source |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| INT-STR-CREA-SPORANALMANA | Sports Analytics Manager | Sports + Data + Management | Sports + Analytics | Sports management + analytics; BSc Statistics + sports domain; MBA Sports | Any graduate; stats/PE/management useful | Graduation / PG | Sports universities, private sports management institutes, analytics programs | Institute tests/CUET/MBA exams | Statistics, performance metrics, scouting, visualization | Sports participation, maths, Excel | ₹4-15 LPA | Sports clubs/Consulting/Hybrid | Medium: team analytics services | High | High: match analytics projects | Khelo India, sports ecosystem | Emerging-Structured | https://swayam.gov.in/ |

## 8. Eligibility and Cross-Faculty Architecture


| Eligibility Architecture |  |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Hybrid Domain | Acceptable Backgrounds / Qualifying Degrees | Preferred 11th-12th Subjects | Possible UG Pathway | Possible PG Pathway | Eligibility Complexity | Counselling Note | Source URL |
| Bioinformatics | PCB, PCM, BSc Life Sciences, Biotechnology, CS, Statistics | Biology, Chemistry, Maths/CS helpful | BSc Bioinformatics/Biotech/CS, BTech Bioinformatics | MSc Bioinformatics/Computational Biology | High | Students from both biology and computing routes can enter; maths/statistics improves mobility. | https://www.iiseradmission.in/ |
| UX Research/HCI | Arts, Psychology, Design, Engineering, CS, Any Graduate | Any stream; psychology/design/CS useful | BDes, BA Psychology, BTech, BSc CS | MDes HCI/UX, MSc HCI, PG UX | Medium | Portfolio and research aptitude matter more than stream label. | https://www.uceed.iitb.ac.in/ |
| Public Policy | Any UG; law, economics, sociology, political science, engineering also accepted | Any stream; economics/civics/statistics useful | BA Public Policy/Economics/Political Science | MPP/MA Public Policy | Low-Medium | Open eligibility but writing + data interpretation are crucial. | https://www.nls.ac.in/programme/master-of-public-policy/ |
| AI Ethics | Law, Philosophy, CS, Public Policy, Sociology, Engineering | Any stream; logic, maths/CS, civics useful | BA Philosophy/LLB/BTech/BA Policy | MA/LLM/MPP/PG AI Ethics | High | Best suited for students comfortable with both technical and ethical/legal reasoning. | https://indiaai.gov.in/ |
| Financial Analytics | Commerce, Economics, Statistics, Mathematics, Engineering, BBA | Maths, Accountancy, Economics, CS | BCom/BBA/BSc Stats/BA Econ | MSc/MBA Analytics/Finance | Medium | Quantitative comfort is essential even for commerce students. | https://onlinedegree.iitm.ac.in/ |
| Climate Finance/ESG | Commerce, Economics, Environmental Science, Management, Engineering | Economics, geography, environmental science, maths | BCom/BA Econ/BSc Env/BBA | MBA/MSc ESG/Sustainability/Finance | Medium | Useful for students interested in finance with sustainability lens. | https://swayam.gov.in/ |
| Health Informatics | Medicine, nursing, pharmacy, life sciences, IT, management | Biology and maths/CS helpful | BSc Health Sciences/IT/BPharm/BSc CS | MPH/MSc/MBA Health Informatics | High | Healthcare domain knowledge plus data skills required. | https://iihmr.edu.in/program/mba-hospital-and-health-management |
| Agritech Business | Agriculture, Biology, Commerce, Management, Data | Biology/agriculture/economics/maths | BSc Agriculture/BBA/BCom/BTech Agri | MBA AgriBusiness/MSc Agri Analytics | Medium | Good for rural economy, FPO, agri-startup and supply chain careers. | https://www.manage.gov.in/ |
| Digital Humanities | Literature, History, Languages, CS, Library Science | Humanities + basic computer exposure | BA Literature/History/Languages/Library Science | MA Digital Humanities/Archive Studies | Medium | Students should build digital archive/text analysis projects. | https://swayam.gov.in/ |
| Computational Linguistics | Linguistics, Languages, CS, Data Science | Languages, maths/CS helpful | BA Linguistics/CS/Languages | MA/MSc Computational Linguistics/NLP | High | Requires language sensitivity and technical training. | https://indiaai.gov.in/ |
| Design + Business | Any stream; design/business/commerce backgrounds | Any stream; art/commerce/maths helpful | BDes/BBA/Fashion/Communication Design | MDes/MBA Design Strategy | Medium | Portfolio + business sense both matter. | https://admissions.nid.edu/ |
| Healthcare Management + Analytics | Any graduate; health/science/IT preferred | Biology/economics/maths useful | BBA Healthcare/BSc/MBBS/BPharm | MBA Hospital & Health Management/Analytics | Medium | Career can move from hospital operations to digital health. | https://iihmr.edu.in/program/mba-hospital-and-health-management |
| GeoAI/GIS | Geography, geology, civil engineering, CS, statistics | Geography, maths, physics, CS | BSc Geography/Geoinformatics/BTech Civil/CS | MSc/MTech GIS/Remote Sensing | High | Strong for mapping, disaster management, urban and climate applications. | https://swayam.gov.in/ |
| Educational Technology | Education, psychology, computer science, media, any UG | Any stream; psychology/CS/language useful | BA/BSc/BEd/CS/Media | MA Education/MEd/Instructional Design | Medium | Portfolio should include lesson modules, LMS demos, assessments. | https://swayam.gov.in/ |
| Pharma Management | BPharm, MPharm, life sciences, chemistry, management | PCB/PCM; chemistry/biology useful | BPharm/BSc Chemistry/Life Science | MBA Pharmaceutical Management/MPharm | Medium | Regulation and market access knowledge is crucial. | https://www.niper.gov.in/ |

## 9. Entrance Examination Ecosystem


| Entrance Exams Ecosystem |  |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Exam / Route | Level | Used For | Nature / Components | Eligibility Snapshot | Preparation Focus | Relevant Domains | Official URL |
| CUET UG | UG | Central/state/private university UG programmes | Language, domain subjects, general test depending university | Class 12 or equivalent; subject combinations vary by university | NCERT/domain subjects, language, general test | Public policy, humanities-tech, commerce analytics, science combinations | https://cuet.nta.nic.in/ |
| CUET PG | PG | MA/MSc/MCom/PG interdisciplinary programmes | Subject paper / general paper depending course | Graduation; course-specific requirements vary | UG subject revision, reasoning, domain basics | Policy, development studies, informatics, GIS, media, education | https://pgcuet.samarth.ac.in/ |
| UCEED | UG Design | BDes and design-linked programmes | Design aptitude, visualization, reasoning | Class 12 in any stream as per exam rules | Design thinking, observation, sketching, aptitude | UX, product design, design + business | https://www.uceed.iitb.ac.in/ |
| CEED | PG Design | MDes and design research programmes | Design aptitude, sketching, problem solving, interview/portfolio | Degree/diploma as per CEED and institute criteria | Portfolio, design problems, visual communication | HCI, UX, service design, human factors | https://www.ceed.iitb.ac.in/ |
| NID DAT | UG/PG Design | BDes/MDes at National Institute of Design | Prelims + Mains/Studio/Interview | Class 12 for BDes; graduation/diploma for MDes as per handbook | Creative aptitude, portfolio, studio tasks | Design, communication, legal design, UX | https://admissions.nid.edu/ |
| IAT | UG Science | IISER BS-MS and science programmes | Aptitude in physics, chemistry, maths, biology | Class 12 science eligibility as per IISER rules | Science concepts, problem solving | Bioinformatics, computational science, science policy | https://www.iiseradmission.in/ |
| CAT/XAT/CMAT/MAT/MAH MBA CET | PG Management | MBA/PGDM interdisciplinary management programmes | Quant, reasoning, verbal, DI; pattern varies | Graduation; institute-specific marks criteria | Aptitude, DI, reading, mock tests | FinTech, health management, agri-business, ESG, media business | https://iimcat.ac.in/ |
| NLSAT-MPP | PG Policy | NLSIU Master of Public Policy | Policy/legal/general aptitude route as notified | Any graduate; annual notification applies | Essay, analytical writing, current affairs | Public policy, law-tech, governance | https://www.nls.ac.in/programme/master-of-public-policy/ |
| GATE | PG Technical | MTech/MSc technical interdisciplinary programmes | Subject-specific engineering/science papers | Degree/eligible final year as per GATE rules | Core technical concepts, maths | GIS, HCI, environmental engineering, data science | https://gate2026.iitg.ac.in/ |
| Institute-level Portfolio/Interview | UG/PG | Design, media, private and specialized programmes | Portfolio, SOP, interview, task/test | Course-specific | Project documentation and communication | UX, media, digital humanities, heritage management | Varies by institute |

## 10. Institution Ecosystem


| Institutions Ecosystem Map |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- |
| Institution / Ecosystem | Type | Relevant Interdisciplinary Areas | Typical Programmes / Support | Entry Route | Notes | Official URL |
| IITs / IIT schools of design, policy, data | Govt technical institutions | HCI, data science, public policy, sustainability, AI ethics | BTech/MTech/MDes/MPP/online BS depending institute | JEE/GATE/CEED/CUET/Institute | Strong for tech-heavy interdisciplinary pathways | https://www.iitsystem.ac.in/ |
| IIT Madras Online Degree Ecosystem | Govt institute online degree | Data Science, Management + Data, digital economy | BS Data Science; Management/Data programmes | Qualifier process as per IITM | Useful parallel structured pathway with exit options | https://onlinedegree.iitm.ac.in/ |
| IISERs | Govt science education/research | Bioinformatics, computational science, science policy | BS-MS, science/research pathways | IAT | Strong science foundation for interdisciplinary research | https://www.iiseradmission.in/ |
| TISS | Public/social science institution | Public policy, development, education, health, social impact | MA/PG programmes | CUET PG/Institute rules | Strong for social-sector hybrid careers | https://admissions.tiss.ac.in/view/10/admissions/ma-admissions/ma-in-public-policy-and-governance/ |
| NLSIU / NLUs | Law universities | Public policy, law-tech, governance, AI ethics | LLB/LLM/MPP, policy programmes | CLAT/NLSAT/institute | Important for governance and legal-tech pathways | https://www.nls.ac.in/programme/master-of-public-policy/ |
| NID / Design schools | Design institutes | UX, communication design, design strategy, legal design | BDes/MDes | NID DAT/UCEED/CEED | Portfolio-based interdisciplinary career gateway | https://admissions.nid.edu/ |
| IIHMR / Health management institutes | Specialized private/deemed institutions | Healthcare management, health informatics, hospital analytics | MBA/MPH/PG health programmes | CAT/MAT/CMAT/CUET PG/institute | Strong health-sector management and analytics route | https://iihmr.edu.in/program/mba-hospital-and-health-management |
| MANAGE Hyderabad | Govt autonomous institute | Agri-business, agri-startups, rural enterprise | PGDM/training/extension support | Institute route/CAT-related for PGDM | Key agri-management ecosystem body | https://www.manage.gov.in/ |
| IRMA | Specialized rural management institute | Rural management, cooperatives, livelihoods | PGDM Rural Management, fellow programmes | CAT/XAT/CMAT/IRMA route as notified | Strong for rural innovation and social enterprise | https://www.irma.ac.in/ |
| NIPER | National pharma institutes | Pharma management, biotech, regulation, medtech | MS/MPharm/MBA Pharma depending campus | NIPER/JEE/GPAT routes as applicable | Important pharma-management ecosystem | https://www.niper.gov.in/ |
| NIFT | National fashion institute | Fashion technology, retail, design + business | BDes/BFTech/MDes/MFM/MFTech | NIFT entrance | Structured fashion-business interdisciplinary route | https://www.nift.ac.in/ |
| FTII / SRFTI / Media institutes | Specialized media institutions | Film business, media production, communication | Film/TV/media programmes | Institute entrance/interview | Supports media + business + technology pathways | https://www.ftii.ac.in/ |
| SWAYAM / NPTEL | Govt online learning platforms | Supplementary structured certifications across domains | Credit/non-credit courses depending institution adoption | Course enrolment/exam | Use only as supporting certification, not replacement for degree | https://swayam.gov.in/ |

## 11. Integration Pattern Registries



### 11.1 Law + Technology + Governance

| Career / Pathway | Parent Disciplines | Structured Course(s) | Eligibility | Institutions / Ecosystem | Skills | Salary / Revenue | Work Mode | Preparation / Portfolio | Source URL |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Data Privacy Officer / Consultant | Law + IT + Compliance | LLB/LLM Tech Law; PG diploma data protection; CS + compliance | Law/IT/management graduate; privacy specialization | NLUs, private universities, legal tech ecosystem | DPDP Act knowledge, audit, contracts, risk | ₹6-25 LPA | Corporate/Consulting | Build privacy policy and compliance checklist portfolio | https://www.nls.ac.in/ |
| Cyber Law Specialist | Law + Cybersecurity | LLB/LLM Cyber Law; PG cyber law diploma | Law graduate preferred; IT background useful | NLUs, cyber law centres | Cyber law, evidence, digital forensics basics | ₹5-18 LPA | Legal/Compliance | Case notes on cyber incidents, awareness workshops | https://www.nls.ac.in/ |
| AI Governance Analyst | Law + Policy + AI | MPP/LLM/PG AI ethics/governance | Any graduate; law/policy/CS useful | IITs, NLUs, policy schools | AI risk, policy writing, model governance | ₹6-20 LPA | Policy/Consulting | AI ethics audit template, policy brief | https://indiaai.gov.in/ |
| Legal Tech Product Associate | Law + Product + UX | LLB + product/UX certification; MBA/PG tech management | Law graduate with tech aptitude | Legal tech startups, NLUs, design schools | Product thinking, legal workflows, UX | ₹5-18 LPA | Startup/Hybrid | Prototype legal app workflow | https://admissions.nid.edu/ |
| RegTech Analyst | Finance + Law + Data | BCom/LLB/MBA/PG compliance analytics | Commerce/law/data background | FinTech, law schools, finance institutes | KYC, AML, compliance analytics | ₹6-20 LPA | FinTech/Compliance | Compliance dashboard/case studies | https://www.iift.ac.in/ |

### 11.2 Humanities + Technology

| Career / Pathway | Parent Disciplines | Structured Course(s) | Eligibility | Institutions / Ecosystem | Skills | Salary / Revenue | Work Mode | Preparation / Portfolio | Source URL |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Digital Humanities Researcher | Literature/History + Data | MA Digital Humanities; archival studies; text analytics | BA humanities; data skills preferred | Central universities, IIT humanities, archives | Metadata, text mining, archives | ₹4-12 LPA | Research/Hybrid | Digital archive or annotated corpus | https://swayam.gov.in/ |
| Computational Linguist | Linguistics + AI | MA/MSc Computational Linguistics/NLP | BA languages/linguistics/CS | IIITs, central universities | NLP, corpus, phonetics, Python | ₹5-18 LPA | Tech/Research | Language corpus/NLP mini-project | https://indiaai.gov.in/ |
| Cultural Analytics Associate | Sociology + Data + Media | MA Sociology/Media with analytics; data certification | Social science graduate | Liberal arts universities, media schools | Survey, social data, visualization | ₹4-14 LPA | Research/Media | Culture trend report using data | https://swayam.gov.in/ |
| AI Content & Knowledge Systems Curator | Literature + Library Science + AI | MLIS/MA digital knowledge management; AI literacy | Any graduate; humanities/library science useful | Libraries, EdTech, archives | Taxonomy, prompts, metadata, QA | ₹4-14 LPA | Hybrid/Remote | Knowledge base design portfolio | https://swayam.gov.in/ |
| Heritage Experience Designer | History + Design + Tourism | MA Heritage/Museology; tourism/design programmes | Any graduate; history/design/tourism preferred | National Museum Institute, tourism institutes | Storytelling, curation, visitor experience | ₹4-12 LPA | Museum/Tourism | Heritage walk script/exhibit plan | https://swayam.gov.in/ |

### 11.3 Commerce + Analytics + FinTech

| Career / Pathway | Parent Disciplines | Structured Course(s) | Eligibility | Institutions / Ecosystem | Skills | Salary / Revenue | Work Mode | Preparation / Portfolio | Source URL |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| FinTech Product Analyst | Finance + Tech + Product | BBA/BCom FinTech; MBA FinTech; BS data + finance | Commerce/PCM/any UG with maths useful | IITM, IIMs, private universities | Finance, product, analytics, regulation | ₹6-20 LPA | Startup/Hybrid | Fintech case study/product note | https://onlinedegree.iitm.ac.in/ |
| Financial Analytics Professional | Commerce + Statistics | BCom/BBA + analytics; MBA analytics; MSc finance | Commerce/statistics/economics/engineering | IITM, IIMs, analytics institutes | Excel, Python, BI, accounting | ₹5-16 LPA | Corporate/Hybrid | Financial dashboard portfolio | https://study.iitm.ac.in/mg/ |
| Risk Analytics Associate | Finance + Data + Regulation | MSc/MBA finance analytics; FRM-supporting degree | Quantitative UG helpful | Banks, analytics institutes, finance schools | Risk metrics, statistics, modelling | ₹6-18 LPA | Finance/Hybrid | Credit risk model sample | https://swayam.gov.in/ |
| Blockchain Compliance Associate | Finance + Law + Tech | FinTech/RegTech PG; law/commerce + blockchain certification | Commerce/law/IT | FinTech ecosystem, private universities | AML, smart contracts, compliance | ₹5-18 LPA | FinTech/Consulting | Compliance memo on blockchain use case | https://www.startupindia.gov.in/ |
| Climate Finance Analyst | Finance + Sustainability | MBA finance/sustainability; environmental economics | Commerce/economics/environment graduate | IIMs, TERI, finance institutes | ESG, carbon markets, modelling | ₹6-20 LPA | Consulting/Finance | ESG finance model/report | https://www.ugc.gov.in/ |

### 11.4 Psychology + Business + AI

| Career / Pathway | Parent Disciplines | Structured Course(s) | Eligibility | Institutions / Ecosystem | Skills | Salary / Revenue | Work Mode | Preparation / Portfolio | Source URL |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| UX Researcher | Psychology + Design + Tech | BDes/MDes UX; psychology + UX PG | Any stream; psychology/design/engineering useful | NID, IITs, design schools | Interviews, usability, empathy | ₹5-18 LPA | Hybrid | Usability test report | https://www.uceed.iitb.ac.in/ |
| Behavioural Economist | Economics + Psychology | BA/MA economics/behavioural science | Any stream with maths/economics helpful | Policy/lahle liberal arts universities | Experiment design, stats, nudges | ₹6-18 LPA | Research/Consulting | Nudge experiment report | https://swayam.gov.in/ |
| NeuroMarketing Associate | Psychology + Marketing + Neuroscience | MSc psychology/neuroscience; MBA marketing | Psychology/life sciences/management | Psychology departments, B-schools | Consumer research, analytics | ₹5-15 LPA | Marketing/Research | Consumer insight study | https://swayam.gov.in/ |
| People Analytics Analyst | HR + Psychology + Data | MBA HR analytics; psychology + analytics | Any graduate; HR/psych/stats useful | B-schools, HR institutes | HR data, surveys, BI | ₹5-16 LPA | Corporate/Hybrid | Employee survey dashboard | https://swayam.gov.in/ |
| Human-AI Interaction Researcher | Psychology + AI + Design | MDes HCI; MSc cognitive science; AI/UX programmes | Psychology/design/CS/engineering | IITs, IIITs, design schools | Cognition, HCI, AI literacy | ₹6-22 LPA | Research/Product | Human-AI usability study | https://www.ceed.iitb.ac.in/ |

### 11.5 Design + Business + Technology

| Career / Pathway | Parent Disciplines | Structured Course(s) | Eligibility | Institutions / Ecosystem | Skills | Salary / Revenue | Work Mode | Preparation / Portfolio | Source URL |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Service Designer | Design + Management + Sociology | BDes/MDes service design; MBA design strategy | Any stream for UG design; graduation for PG | NID, IITs, design schools | Journey mapping, systems thinking | ₹6-20 LPA | Consulting/Product | Service blueprint portfolio | https://admissions.nid.edu/ |
| Product Experience Manager | Design + Product + Data | BDes/MDes/MBA product/design | Design/engineering/business background | Design schools, B-schools, startups | UX, analytics, product strategy | ₹8-25 LPA | Product/Hybrid | Product case portfolio | https://www.uceed.iitb.ac.in/ |
| Legal Design Consultant | Law + Design | LLB + design thinking/communication design | Law/design background | NLUs, NID, legal tech | Simplification, visuals, UX | ₹5-18 LPA | Consulting | Legal infographic/template set | https://admissions.nid.edu/ |
| Fashion Business Technologist | Fashion + Retail + Digital | NIFT BFTech/MFM; retail tech | Any stream / PCM for some tech programmes | NIFT, fashion institutes | Retail analytics, e-commerce, merchandising | ₹4-16 LPA | Retail/Hybrid | Fashion retail analytics project | https://www.nift.ac.in/ |
| No-code Business Systems Designer | Business + Design + Tech | BBA/BDes/IT + structured product/automation certification | Any graduate with tech aptitude | Universities, NPTEL/SWAYAM support | Process design, automation, UI logic | ₹4-15 LPA | Remote/Hybrid | Workflow automation portfolio | https://swayam.gov.in/ |

### 11.6 Agriculture + Sustainability +

| Career / Pathway | Parent Disciplines | Structured Course(s) | Eligibility | Institutions / Ecosystem | Skills | Salary / Revenue | Work Mode | Preparation / Portfolio | Source URL |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Agri-Tech Business Analyst | Agriculture + Data + Business | BSc Agri; MBA AgriBusiness; analytics | BSc agri/commerce/science/management | MANAGE, agri universities, IRMA | Agri markets, analytics, supply chain | ₹4-14 LPA | Field/Hybrid | FPO/market analysis report | https://www.manage.gov.in/ |
| Precision Farming Operations Associate | Agriculture + IoT + GIS | BSc Agri/Agri engineering; GIS/IoT certificate | PCB/PCM/agri background | Agri universities, KVKs, startup ecosystem | Sensors, farm data, advisory | ₹4-12 LPA | Field/Tech | Farm data dashboard | https://www.manage.gov.in/ |
| Food Supply Chain Manager | Food Tech + Logistics | BTech food tech/MBA supply chain | PCM/PCB; graduate for MBA | NIFTEM, CFTRI, logistics institutes | Cold chain, safety, procurement | ₹5-16 LPA | Industry/Field | Cold chain map/project | https://www.startupindia.gov.in/ |
| Water Resource Management Analyst | Environment + GIS + Policy | MSc/MTech water/environment/GIS | Science/geography/civil background | IITs, TERI, universities | GIS, hydrology, policy | ₹5-16 LPA | Consulting/Govt | Water audit report | https://www.ugc.gov.in/ |
| Circular Economy Consultant | Environment + Business | MBA/MSc sustainability/circular economy | Any graduate | IIMs, TERI, sustainability institutes | Waste audit, business model | ₹5-18 LPA | Consulting | Circularity audit toolkit | https://www.startupindia.gov.in/ |

### 11.7 Healthcare + Analytics

| Career / Pathway | Parent Disciplines | Structured Course(s) | Eligibility | Institutions / Ecosystem | Skills | Salary / Revenue | Work Mode | Preparation / Portfolio | Source URL |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Health Informatics Analyst | Healthcare + IT + Data | MSc/MBA health informatics/MPH | Health/science/IT/any grad | IIHMR, IIPH, health universities | Health data, privacy, dashboards | ₹5-15 LPA | Hospital/Hybrid | Hospital dashboard project | https://iihmr.edu.in/program/mba-hospital-and-health-management |
| Hospital Analytics Manager | Hospital Management + Data | MBA Hospital & Health Management + analytics | Any bachelor with 50% often required; institute-specific | IIHMR, health management institutes | Operations, BI, patient flow | ₹6-20 LPA | Hospital/Corporate | Patient flow analysis | https://iihmr.edu.in/program/mba-hospital-and-health-management |
| Digital Health Product Associate | Healthcare + Product + Tech | MBA health/MedTech; public health + product | Health/IT/business graduate | HealthTech startups, IIHMR | Product, interoperability, user needs | ₹6-20 LPA | HealthTech/Hybrid | Telemedicine workflow case | https://abdm.gov.in/ |
| Pharma Market Access Analyst | Pharma + Economics + Policy | BPharm/MPharm/MBA Pharma | Pharmacy/life sciences/economics | NIPER, pharma institutes | Pricing, policy, market research | ₹6-18 LPA | Pharma/Consulting | Market access brief | https://www.niper.gov.in/ |
| Public Health Data Associate | Public Health + Statistics | MPH/MSc Epidemiology/Data | Science/health/social science | IIPH, public health institutes | Survey, statistics, health indicators | ₹4-14 LPA | NGO/Govt/Research | Health survey analysis | https://iiphg.edu.in/ |

### 11.8 Public Policy + Economics

| Career / Pathway | Parent Disciplines | Structured Course(s) | Eligibility | Institutions / Ecosystem | Skills | Salary / Revenue | Work Mode | Preparation / Portfolio | Source URL |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Policy Analyst | Economics + Law + Governance | BA/MA Public Policy; MPP | Any stream/graduate | NLSIU, TISS, policy schools | Policy analysis, writing, data | ₹5-16 LPA | Think tank/Govt | Policy brief portfolio | https://www.nls.ac.in/programme/master-of-public-policy/ |
| Urban Governance Analyst | Urban Studies + Data + Policy | MPlan/MA Urban Studies/MPP | Any graduate; geography/architecture helpful | SPAs, CEPT, IITs | GIS, planning, governance | ₹5-18 LPA | Govt/Consulting | Ward/city profile report | https://www.ugc.gov.in/ |
| Development Programme Manager | Development Studies + Management | MA Development Studies; rural management | Any graduate | TISS, IRMA, APU | Fieldwork, M&E, budgeting | ₹4-14 LPA | NGO/CSR | Impact project report | https://admissions.tiss.ac.in/view/10/admissions/ma-admissions/ma-in-public-policy-and-governance/ |
| Data for Governance Analyst | Data Science + Public Systems | Data science + policy/administration | Any graduate; quantitative skills required | IITM, policy schools, govtech | Dashboards, indicators, evaluation | ₹6-18 LPA | GovTech/Consulting | Open data dashboard | https://onlinedegree.iitm.ac.in/ |
| Social Impact Measurement Analyst | Statistics + Development | M&E certificate + MA development/policy | Any graduate | TISS, IRMA, NGOs | Survey, evaluation, reporting | ₹4-14 LPA | NGO/CSR/Consulting | M&E framework sample | https://www.irma.ac.in/ |

### 11.9 Media + Communication + AI

| Career / Pathway | Parent Disciplines | Structured Course(s) | Eligibility | Institutions / Ecosystem | Skills | Salary / Revenue | Work Mode | Preparation / Portfolio | Source URL |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Data Journalist | Journalism + Data | BA/MA journalism + data analytics | Any stream | Media universities, private media schools | Data cleaning, charts, writing | ₹4-14 LPA | Media/Hybrid | Published data story | https://swayam.gov.in/ |
| AI-assisted Media Producer | Media + AI Tools + Production | Film/media degree + structured AI/media certification | Any graduate; media background | FTII/SRFTI/media schools | Production, ethics, AI workflow | ₹4-18 LPA | Studio/Freelance | Short production portfolio | https://www.ftii.ac.in/ |
| Science Communication Specialist | Science + Media | MSc Science Communication; journalism | Science UG preferred | Universities, media institutes | Writing, visualization, public science | ₹4-12 LPA | Media/Education | Science explainer portfolio | https://swayam.gov.in/ |
| Creator Economy Strategist (Structured) | Media + Business + Analytics | Media management/MBA digital business | Any graduate | Media schools, B-schools | Content strategy, analytics, monetization | ₹4-20 LPA | Agency/Hybrid | Channel audit/strategy deck | https://www.startupindia.gov.in/ |
| Development Communication Specialist | Media + Social Sciences | MA Development Communication | Any graduate | TISS/media universities | Campaign design, field communication | ₹4-12 LPA | NGO/CSR/Media | Social campaign plan | https://admissions.tiss.ac.in/view/10/admissions/ma-admissions/ma-in-public-policy-and-governance/ |

## 12. Emerging Frontier Careers


| Career / Pathway | Parent Disciplines | Structured Course(s) | Eligibility | Institutions / Ecosystem | Skills | Salary / Revenue | Work Mode | Preparation / Portfolio | Source URL |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Space Policy & Business Analyst | Space science + policy + business | Public policy/space science/engineering/law | Science/engineering/law/policy background | IISERs, IITs, policy schools, space startups | Space economy, regulation, research | ₹6-20 LPA | Policy/Startup | Space policy brief | https://www.startupindia.gov.in/ |
| GeoAI Analyst | GIS + AI + Geography | Geoinformatics/remote sensing + AI | Geography/PCM/civil/CS | IIRS/IITs/universities | GIS, Python, remote sensing | ₹5-16 LPA | Consulting/Govt | GIS portfolio | https://swayam.gov.in/ |
| Human-AI Collaboration Designer | Psychology + AI + Design | HCI/cognitive science/design programmes | Design/psychology/CS | IITs, IIITs, NID | HCI, AI workflow, usability | ₹7-22 LPA | Product/Research | Human-AI workflow study | https://www.ceed.iitb.ac.in/ |
| Climate Adaptation Planner | Climate science + policy + GIS | Environmental planning/climate policy | Science/geography/policy | TERI, IITs, universities | Climate risk, GIS, planning | ₹6-18 LPA | Consulting/Govt | Climate risk map/report | https://www.ugc.gov.in/ |
| Bioentrepreneurship Associate | Biotech + Business | Biotech/life science + MBA/entrepreneurship | Life science/biotech background | Bioincubators, universities, Startup India | IP, product, market validation | ₹5-18 LPA | Startup/Incubator | Biotech venture brief | https://www.startupindia.gov.in/ |
| Digital Public Infrastructure Analyst | Technology + policy + economics | Public policy/data science/technology programmes | Any graduate with data/policy aptitude | Policy schools, govtech ecosystems | UPI/ONDC/ABDM understanding, analytics | ₹6-20 LPA | GovTech/Consulting | DPI case study | https://www.digitalindia.gov.in/ |

## 13. Interdisciplinary Livelihood Models


| Livelihood Model | Parent Disciplines | Structured Qualification Base | Possible Services | Minimum Credible Entry | Investment Level | Revenue Potential India | Clients / Market | Skills | Ethical / Regulatory Caution | Source / Ecosystem URL |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| UX Research Consultancy | Psychology + Design + Tech | BDes/MDes/MA Psychology + UX certification | Usability studies, user interviews, product research | Degree + portfolio + 2-3 case studies | Low-Medium | ₹15,000-2 lakh/project | Startups, EdTech, SaaS, NGOs | Research, interviewing, reporting | Protect user privacy and consent | https://www.uceed.iitb.ac.in/ |
| Data Privacy Compliance Advisory | Law + Tech + Governance | LLB/LLM/PG data protection | Privacy policies, DPDP readiness, training | Law/IT qualification + compliance portfolio | Low | ₹20,000-5 lakh/project | MSMEs, EdTech, clinics, SaaS | Legal research, audit, documentation | Avoid unauthorized legal practice if not licensed | https://www.nls.ac.in/ |
| Digital Archive Services | Humanities + Library Science + Tech | MA/MLIS/Digital Humanities | Archive digitization, metadata, oral histories | Degree + archive sample project | Low-Medium | ₹10,000-2 lakh/project | Colleges, museums, families, trusts | Metadata, scanning, writing | Copyright and consent issues | https://swayam.gov.in/ |
| Financial Analytics Freelance Studio | Commerce + Data | BCom/BBA/MSc/MBA + analytics | Dashboards, financial models, MIS, KPI reporting | Degree + dashboard portfolio | Low | ₹5,000-1 lakh/project | Small businesses, NGOs, startups | Excel/BI, accounting, analytics | Accuracy and confidentiality | https://onlinedegree.iitm.ac.in/ |
| ESG / Sustainability Reporting Support | Environment + Business | MBA/MSc sustainability/ESG certification | ESG data, BRSR support, sustainability reports | Degree + sample ESG report | Low-Medium | ₹25,000-5 lakh/project | MSMEs, corporates, NGOs | Research, reporting, standards awareness | Avoid false claims/greenwashing | https://swayam.gov.in/ |
| Agri-Market Intelligence Services | Agriculture + Data + Business | BSc Agri/MBA AgriBusiness | Market price reports, FPO advisory, supply-chain mapping | Degree + field project | Low | ₹10,000-2 lakh/project | FPOs, agri startups, cooperatives | Fieldwork, data, local language | Avoid unsupported agronomic claims | https://www.manage.gov.in/ |
| Health Data Dashboard Services | Healthcare + Data | MPH/MBA Health/MSc Health Informatics | Patient flow dashboards, health programme reports | Health/data degree + dashboard sample | Medium | ₹20,000-3 lakh/project | Hospitals, clinics, NGOs | Health indicators, BI, privacy | Patient data confidentiality | https://iihmr.edu.in/program/mba-hospital-and-health-management |
| Policy Research Micro-Consultancy | Policy + Economics + Law | MPP/MA Public Policy/Economics/Law | Policy briefs, impact notes, data summaries | Degree + writing samples | Low | ₹10,000-3 lakh/project | NGOs, think tanks, CSR, local bodies | Writing, data, interviews | Non-partisan integrity; cite data sources | https://www.nls.ac.in/programme/master-of-public-policy/ |
| Heritage Experience Enterprise | History + Tourism + Design | MA heritage/museology/tourism | Heritage walks, museum scripts, cultural itineraries | Degree + local heritage portfolio | Low-Medium | ₹5,000-1 lakh/event/project | Tourists, schools, museums, colleges | Storytelling, logistics, research | Permissions for sites; historical accuracy | https://swayam.gov.in/ |
| Educational Technology Design Studio | Education + Tech + Content | BEd/MEd/MA Education + EdTech | Course design, LMS content, assessment design | Education degree + sample course module | Low | ₹10,000-3 lakh/project | Schools, colleges, EdTech, trainers | Pedagogy, content, LMS, assessment | Respect copyright and learner data | https://swayam.gov.in/ |
| Science Communication Studio | Science + Media | MSc science communication/journalism | Explainers, museum content, workshops | Science degree + media portfolio | Low | ₹5,000-2 lakh/project | Schools, NGOs, science centres | Writing, visualization, public speaking | Avoid misinformation | https://swayam.gov.in/ |
| Rural Innovation Consultancy | Rural management + design + business | PGDM Rural/MA Development/MBA Agri | Livelihood plans, SHG/FPO strategy, market linkage | Degree + field exposure | Low-Medium | ₹15,000-5 lakh/project | NGOs, FPOs, CSR, local bodies | Fieldwork, business planning | Community consent and inclusion | https://www.irma.ac.in/ |

## 14. Government, NEP and Mission Ecosystem


| Govt Mission / Policy / Ecosystem | Related Hybrid Domains | Career Relevance | Course Alignment | Student Preparation Link | Institutions / Support | Official URL |
| --- | --- | --- | --- | --- | --- | --- |
| NEP 2020 / Multidisciplinary Education | All hybrid domains | Supports flexible major-minor, multiple entry-exit, skill integration | Multidisciplinary UG/PG, ABC, online credits | Build cross-subject portfolio from school | UGC, universities, SWAYAM | https://www.ugc.gov.in/ |
| Digital India | Data, fintech, govtech, media-tech, digital humanities | Creates demand for digital public services and analytics | Data science, public policy, IT, digital management | Digital literacy, coding, data projects | Ministry ecosystems, universities | https://www.digitalindia.gov.in/ |
| IndiaAI Mission / AI Ecosystem | AI ethics, NLP, HCI, health AI, GeoAI | Demand for AI governance, responsible AI, applied AI roles | AI/data degrees + domain degrees | Maths, logic, coding, ethics | IITs, IIITs, SWAYAM/NPTEL | https://indiaai.gov.in/ |
| Ayushman Bharat Digital Mission | Health informatics, digital health, hospital analytics | Creates health data and interoperability career needs | MPH, health informatics, MBA healthcare | Biology + data + privacy awareness | IIHMR, IIPH, health universities | https://abdm.gov.in/ |
| Startup India | Bioentrepreneurship, agritech, fintech, EdTech, media-tech | Supports startup-oriented interdisciplinary careers | Entrepreneurship + sectoral degree | Business plan, incubator exposure | Incubators, universities, Startup India | https://www.startupindia.gov.in/ |
| Skill India Digital | EdTech, training management, vocational technology | Supports training design and digital skilling careers | Education technology, HR, instructional design | Teaching, content design, digital tools | Skill India, NSDC ecosystem | https://www.skillindiadigital.gov.in/ |
| ONDC / Digital Commerce | FinTech, e-commerce, rural commerce, fashion business | Opens interoperable commerce and MSME digital roles | Commerce, business analytics, digital marketing | E-commerce projects, local business digitization | ONDC, MSME, startup ecosystem | https://ondc.org/ |
| PM Matsya Sampada Yojana | Fishery business + data + supply chain | Blue economy, fisheries enterprise and cold-chain roles | Fisheries, agri-business, logistics | Biology, entrepreneurship, field visits | CIFE, fisheries universities, NFDB | https://pmmsy.dof.gov.in/ |
| Smart Cities / Urban Missions | Urban analytics, GIS, policy, sustainability | Urban data, planning and service delivery roles | Urban planning, GIS, public policy | Maps, civic surveys, data interpretation | SPA, CEPT, IITs, municipalities | https://mohua.gov.in/ |
| Sustainable Development Goals / ESG ecosystem | Climate finance, ESG, social impact measurement | Expands corporate and development reporting roles | Sustainability, environment, economics, management | Environment projects, data reports | TERI, IIMs, universities | https://www.undp.org/india |

## 15. Community, Tribal and Inclusive Layer

The workbook contains a dedicated `Community Tribal Inclusive` registry covering tribal studies, forest rights, ethnobotany, language revitalisation, cultural archiving, inclusive education, community health, disability studies, assistive technology, rural digital inclusion, livelihood missions, microfinance, tribal enterprise, craft ecosystems, forest-produce value chains and climate resilience.

These pathways must be loaded as additional Streams, Application Contexts and Community Embeddedness records after programme-level validation.

## 16. Controlled Vocabularies

### 16.1 IntegrationPatternType
`KnowledgeIntegration` | `MethodIntegration` | `ProfessionIntegration` | `TechnologyIntegration` | `SectorIntegration` | `CommunityIntegration`

### 16.2 ProgrammeStructureType
`MajorMinor` | `DoubleMajor` | `DualDegree` | `JointDegree` | `Integrated` | `OpenElective` | `Modular`

### 16.3 RequirementLevel
`Mandatory` | `Preferred` | `Bridgeable` | `NotRequired` | `ProgrammeSpecific`

### 16.4 CareerMaturity
`Established` | `EstablishedEmerging` | `EmergingStructured` | `Emerging` | `Rare` | `Frontier`

### 16.5 CommunityEmbeddedness
`Low` | `Moderate` | `High` | `Direct`

## 17. Relationship Inventory

| Relationship | Source | Target | Key properties |
|---|---|---|---|
| `HAS_PARENT_DISCIPLINE` | Integration Domain/Stream | Parent Discipline | contribution_type |
| `HAS_PRIMARY_DISCIPLINE` | Stream | Parent Discipline | — |
| `HAS_SECONDARY_DISCIPLINE` | Stream | Parent Discipline | — |
| `USES_INTEGRATION_PATTERN` | Stream | Integration Pattern | — |
| `APPLIES_IN_CONTEXT` | Stream/Outcome | Application Context | primary |
| `REQUIRES_ENTRY_RULE` | Stream/Programme | Cross-Faculty Entry Rule | — |
| `REQUIRES_BRIDGE_COURSE` | Entry Rule | Bridge Course | mandatory |
| `HAS_PROGRAMME_STRUCTURE` | Degree/Programme | Multidisciplinary Programme Structure | — |
| `USES_METHOD_BUNDLE` | Stream/Capstone | Method Bundle | — |
| `REQUIRES_CAPSTONE` | Programme/Stream | Interdisciplinary Capstone | — |
| `REQUIRES_INTEGRATION_EVIDENCE` | Stream/Outcome | Integration Evidence | — |
| `OPERATES_IN_COMMUNITY_CONTEXT` | Stream/Outcome | Community Embeddedness | level |
| `LINKS_TO_PARENT_ONTOLOGY` | Stream | External Domain/Stream | relation_type |
| `SUPPORTED_BY_MISSION` | Stream/Context | Government Mission/Programme | relevance |
| `AVAILABLE_AT` | Stream/Programme | Institution | programme_form |
| `ENABLES_LIVELIHOOD` | Stream/Skill | Livelihood Service Model | readiness |

## 18. Validation and Reasoning Rules

**INT-VAL-001** Every Stream must reference at least two parent disciplines.  
**INT-VAL-002** Parent-domain knowledge and permissions must be referenced, not copied.  
**INT-VAL-003** A hybrid label requires a structured programme or validated pathway.  
**INT-VAL-004** Integration evidence must demonstrate combined application.  
**INT-VAL-005** “Any graduate” must not hide quantitative, laboratory, legal or portfolio requirements.  
**INT-VAL-006** Missing prerequisites must be returned as bridge requirements.  
**INT-VAL-007** Degree, specialisation, major/minor, certificate and research route remain distinct.  
**INT-VAL-008** Professional permissions are inherited from parent ontologies.  
**INT-VAL-009** Government mission links require current official sources.  
**INT-VAL-010** Salary and revenue ranges are indicative source data.  
**INT-VAL-011** Community pathways require consent, attribution and local-context governance.  
**INT-VAL-012** AI exposure must connect to domain knowledge, methods, ethics and accountability.  
**INT-VAL-013** Concept existence does not prove dedicated programme availability.  
**INT-VAL-014** Alternative routes should include bridge, major/minor, certificate or PG options.  
**INT-VAL-015** Suitability ranking belongs to the Digital Twin.

## 19. Normalization Gaps

| Gap | Priority | Treatment |
|---|---|---|
| Hybrid labels duplicate parent domains | Critical | Parent-ontology references required |
| Career, course and integration pattern mixed | Critical | Separate Stream, Outcome and Pattern |
| “Any graduate” hides prerequisites | Critical | Add Cross-Faculty Entry Rule |
| Programme availability varies widely | Critical | Add Programme Form and Institution Availability |
| Major/minor and credit architecture absent | Critical | Add Multidisciplinary Programme Structure |
| Integration evidence not explicit | High | Add Capstone and Integration Evidence |
| Technology treated as career identity | High | Add Technology Interface |
| Mission relevance treated as pathway proof | High | Separate ecosystem link |
| Community pathways need ethical governance | High | Add Community Embeddedness |
| Salary and revenue ranges are indicative | High | Enforce source/year/location |
| Regulatory dependencies scattered | High | Inherit parent ontology permissions |
| Livelihood models mixed with careers | Medium | Model as Livelihood Service Model |

## 20. Derived Calculations

### 20.1 Integration complexity
```text
Integration Complexity =
    number of parent disciplines
  + method dependencies
  + bridge-course load
  + professional/regulatory dependencies
```

### 20.2 Cross-faculty readiness
```text
Cross-Faculty Readiness =
    accepted prior subjects/degrees
  + bridge completion
  + quantitative/laboratory readiness
  + portfolio readiness
```

### 20.3 Interdisciplinary career readiness
```text
Career Readiness =
    parent-domain competence
  + integrated method competence
  + capstone evidence
  + application-context knowledge
  + regulatory readiness
```

## 21. Deferrals and Boundaries

Requires validation of programme eligibility, major/minor structures, institution availability, current exams, government missions, professional recognition, salaries, rare-domain programmes and international pathways.

Excluded from the SCC ontology: personal portfolio files, personal community data, confidential legal or business information, personalised professional advice, recommendation scores and individual Digital Twin evidence.

## 22. Implementation Sequence

### Phase 1
1. Load Integration Domains.
2. Load Career Master Streams.
3. Link each Stream to parent ontologies.
4. Preserve parent disciplines and hybrid clusters.

### Phase 2
1. Parent Discipline.
2. Integration Pattern.
3. Application Context.
4. Cross-Faculty Entry Rule.
5. Bridge Course.

### Phase 3
1. Multidisciplinary Programme Structure.
2. Major, minor and electives.
3. Credit and ABC compatibility.
4. Institution availability.

### Phase 4
1. Method Bundle.
2. Interdisciplinary Capstone.
3. Integration Evidence.
4. Portfolio and artefacts.

### Phase 5
1. Government missions.
2. Regional Resource Context.
3. Community Embeddedness.
4. Community and tribal pathways.

### Phase 6
1. Livelihood Service Models.
2. Enterprise Paths.
3. Revenue and investment structures.
4. Salary/revenue evidence.

## 23. Confidence Statement

| Area | Status |
|---|---|
| Compatibility with parent ontologies | Strong |
| Integration architecture | Ready |
| Domain normalization | Ready |
| Career Master stream baseline | Ready |
| Cross-faculty entry model | Ready for technical review |
| NEP major/minor/credit model | Strong conceptual requirement |
| Community-inclusive layer | Strong source foundation |
| Institution and exam data | Partial |
| Salary and revenue data | Not publication-ready |
| Production chatbot use | Not yet ready |

> **Final position:** Interdisciplinary v1.1 connects parent disciplines through integration patterns, structured programmes, entry rules, bridge courses, method bundles, capstones and application contexts without duplicating the five parent ontologies.

---

## Appendix A — Reference Code Patterns

```text
INT-DOM-<INTEGRATION-DOMAIN>
INT-STR-<STREAM>
INT-PAR-<PARENT-DISCIPLINE>
INT-PAT-<INTEGRATION-PATTERN>
INT-CTX-<APPLICATION-CONTEXT>
INT-ENT-<ENTRY-RULE>
INT-BRG-<BRIDGE-COURSE>
INT-PRG-<PROGRAMME-STRUCTURE>
INT-MET-<METHOD-BUNDLE>
INT-CAP-<CAPSTONE>
INT-EVD-<INTEGRATION-EVIDENCE>
INT-COM-<COMMUNITY-EMBEDDEDNESS>
CAR-INT-<CAREER-OUTCOME>
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
:ResearchMethod
:FieldworkCommunityEngagement
:CreativePractice
:LanguageProficiency
:IndustrySector
:TechnologyInterface
:GovernmentMissionProgramme
:RegionalResourceContext
:LivelihoodServiceModel
:EnterprisePath
:EmploymentMode
:CareerOutcome
:SalaryRange
:City
:ParentDiscipline
:IntegrationDomain
:IntegrationPattern
:ApplicationContext
:CrossFacultyEntryRule
:BridgeCourse
:MultidisciplinaryProgrammeStructure
:MethodBundle
:InterdisciplinaryCapstone
:IntegrationEvidence
:CommunityEmbeddedness
```

*End of RSA SCC Ontology v1.1 — Interdisciplinary Universe Technical Specification.*
