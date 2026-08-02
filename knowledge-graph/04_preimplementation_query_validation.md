# 04 — Preimplementation Query Validation

**Package version:** 1.0  
**Date:** 2026-08-02  
**Target:** Neo4j 5.x  
**Author note:** Generated from the supplied RSA files only; no external facts were introduced.  
**Inputs:** The RSA Master Blueprint Version 1.0.docx, RSA_SCC_Ontology_v0.6.1a.md, RSA_GAS_Rulebook_v1.2.md, Question_Bank_All_Ontologies_NEP2020.md, RSA_SCC_Structural_Integrity_Test_Set.md, 1-Structured-Science.xlsx, 2-Structured- Arts_Humanities.xlsx, 3-Structured - Commerce.xlsx, 4-Strcutured-Management.xlsx, 5-Structured- Law.xlsx, 6-Structured-Interdisciplinary.xlsx

## Result

All 300 questions are enumerated below before ingestion. `SUPPORTED` means the final proposed schema can express the query; it does not mean the supplied data is complete. `PARTIAL` means a schema path exists but the workbook/source evidence is incomplete or policy-specific.

### Query-family contracts

| Family | Primary path | Expected complexity |
|---|---|---|
| DISCOVERY | Universe→Stream→CareerOutcome plus competency concepts | indexed + bounded expansion |
| ELIGIBILITY | Stream/Offering→Criterion/Exam/BridgeCourse | indexed + bounded expansion |
| NEP_POLICY | ProgrammeOffering→CreditPolicy/ExitAward | indexed + 1–3 hops |
| EXPERIENCE | Stream/Career→Activity/Project/Internship/PortfolioRequirement | indexed + 1–3 hops |
| INCLUSION | ProgrammeOffering→Language/Accommodation/Scholarship | indexed + 1–3 hops |
| FINANCE | Offering→cost support and Career→SalaryRange | indexed + aggregation |
| REGULATION | Degree/Career→Licence/RegulatoryBody | indexed + 1–4 hops |
| COMPARE | two bounded subqueries with normalized projections | O(result sets) |

## Complete question traceability

| ID | Universe | Theme | Family | Schema verdict | Data verdict | Question |
|---|---|---|---|---|---|---|
| QB-SCI-01 | Science | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | SUPPORTED | Which Science career options suit me if I enjoy Biology but do not want to become a doctor? |
| QB-SCI-02 | Science | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | SUPPORTED | Which Science careers can I pursue if I like Mathematics but do not enjoy coding? |
| QB-SCI-03 | Science | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | SUPPORTED | Can I study a Science-related career after choosing Humanities in Class 11? |
| QB-SCI-04 | Science | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | SUPPORTED | Can I enter a technology career after studying PCB without Mathematics? |
| QB-SCI-05 | Science | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | SUPPORTED | Which careers combine Physics, design and creativity? |
| QB-SCI-06 | Science | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | SUPPORTED | Which careers combine Biology, data and technology? |
| QB-SCI-07 | Science | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | SUPPORTED | What subject combination should I choose in Class 11 if I am undecided between medicine, biotechnology and environmental science? |
| QB-SCI-08 | Science | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | SUPPORTED | How can I compare pure science, applied science, engineering and healthcare careers? |
| QB-SCI-09 | Science | Career discovery and subject choice | `EXPERIENCE` | SUPPORTED | PARTIAL | Which Science careers are suitable for students who prefer fieldwork over laboratory work? |
| QB-SCI-10 | Science | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | SUPPORTED | Which Science careers are suitable for students who prefer research over corporate employment? |
| QB-SCI-11 | Science | Flexible pathways and NEP choices | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can I take a major in Physics and a minor in Economics or Data Science? |
| QB-SCI-12 | Science | Flexible pathways and NEP choices | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Which Science programmes allow open electives from Humanities or Management? |
| QB-SCI-13 | Science | Flexible pathways and NEP choices | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can I leave a four-year Science degree after one or two years and receive a recognised exit award? |
| QB-SCI-14 | Science | Flexible pathways and NEP choices | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can I re-enter the same programme later after taking an approved exit? |
| QB-SCI-15 | Science | Flexible pathways and NEP choices | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can credits earned through SWAYAM or another recognised online course count toward my Science degree? |
| QB-SCI-16 | Science | Flexible pathways and NEP choices | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | How does the Academic Bank of Credits help me change institutions or programmes? |
| QB-SCI-17 | Science | Flexible pathways and NEP choices | `DISCOVERY` | SUPPORTED | SUPPORTED | Can my vocational or diploma learning be recognised when I enter a Science degree? |
| QB-SCI-18 | Science | Flexible pathways and NEP choices | `ELIGIBILITY` | SUPPORTED | SUPPORTED | What bridge courses would I need to move from Biology to Data Science? |
| QB-SCI-19 | Science | Flexible pathways and NEP choices | `DISCOVERY` | SUPPORTED | SUPPORTED | Can I combine laboratory science with entrepreneurship under NEP 2020? |
| QB-SCI-20 | Science | Flexible pathways and NEP choices | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can I pursue a multidisciplinary degree with Science as my major and Public Policy as my minor? |
| QB-SCI-21 | Science | Experiential learning and readiness | `EXPERIENCE` | SUPPORTED | PARTIAL | What laboratory, field, project or research experience should I build before applying for a Science programme? |
| QB-SCI-22 | Science | Experiential learning and readiness | `EXPERIENCE` | SUPPORTED | PARTIAL | How can I create a portfolio for biotechnology, environmental science or data science? |
| QB-SCI-23 | Science | Experiential learning and readiness | `EXPERIENCE` | SUPPORTED | PARTIAL | Which internships are useful for a Class 11 or Class 12 Science student? |
| QB-SCI-24 | Science | Experiential learning and readiness | `EXPERIENCE` | SUPPORTED | PARTIAL | Can a school science project be recorded as evidence in my aspirant profile? |
| QB-SCI-25 | Science | Experiential learning and readiness | `DISCOVERY` | SUPPORTED | SUPPORTED | How can I demonstrate scientific thinking if I have limited access to laboratories? |
| QB-SCI-26 | Science | Experiential learning and readiness | `EXPERIENCE` | SUPPORTED | PARTIAL | Which competitions, citizen-science projects or online labs can strengthen my profile? |
| QB-SCI-27 | Science | Experiential learning and readiness | `DISCOVERY` | SUPPORTED | SUPPORTED | How do I know whether I am ready for a research-intensive Science degree? |
| QB-SCI-28 | Science | Experiential learning and readiness | `DISCOVERY` | SUPPORTED | SUPPORTED | What skills should I build for AI-enabled Science careers? |
| QB-SCI-29 | Science | Experiential learning and readiness | `DISCOVERY` | SUPPORTED | SUPPORTED | How can I gain practical experience in environmental or community science? |
| QB-SCI-30 | Science | Experiential learning and readiness | `EXPERIENCE` | SUPPORTED | PARTIAL | What evidence should I show for a Science career that requires both coding and domain knowledge? |
| QB-SCI-31 | Science | Access, inclusion and support | `FINANCE` | SUPPORTED | PARTIAL | Which scholarships can support my Science education if my family cannot afford laboratory and hostel costs? |
| QB-SCI-32 | Science | Access, inclusion and support | `INCLUSION` | SUPPORTED | PARTIAL | Which Science programmes provide support for students with disabilities? |
| QB-SCI-33 | Science | Access, inclusion and support | `INCLUSION` | SUPPORTED | PARTIAL | Can I request reasonable accommodation during laboratory work or entrance examinations? |
| QB-SCI-34 | Science | Access, inclusion and support | `INCLUSION` | SUPPORTED | PARTIAL | What options do I have if I live in a rural area with limited coaching and laboratory access? |
| QB-SCI-35 | Science | Access, inclusion and support | `DISCOVERY` | SUPPORTED | SUPPORTED | Can I study Science through blended or open learning without weakening my career prospects? |
| QB-SCI-36 | Science | Access, inclusion and support | `INCLUSION` | SUPPORTED | PARTIAL | Which Science resources are available in Indian languages? |
| QB-SCI-37 | Science | Access, inclusion and support | `INCLUSION` | SUPPORTED | PARTIAL | Can I take entrance examinations in a regional language? |
| QB-SCI-38 | Science | Access, inclusion and support | `INCLUSION` | SUPPORTED | PARTIAL | What support is available for first-generation learners entering Science careers? |
| QB-SCI-39 | Science | Access, inclusion and support | `DISCOVERY` | SUPPORTED | SUPPORTED | How can I prepare for Science careers if my school does not offer advanced Mathematics or Computer Science? |
| QB-SCI-40 | Science | Access, inclusion and support | `DISCOVERY` | SUPPORTED | SUPPORTED | Which community-based or local-knowledge Science pathways can I explore? |
| QB-SCI-41 | Science | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | SUPPORTED | Which Science careers allow me to work in government, research, industry or entrepreneurship? |
| QB-SCI-42 | Science | Career outcomes and lifelong learning | `REGULATION` | SUPPORTED | SUPPORTED | How do licensing and professional recognition differ across Science careers? |
| QB-SCI-43 | Science | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | SUPPORTED | Which Science careers require a postgraduate degree and which allow employment after graduation? |
| QB-SCI-44 | Science | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | SUPPORTED | How can I shift from a Science degree into policy, management, communication or law? |
| QB-SCI-45 | Science | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | SUPPORTED | Which micro-credentials can complement my Science degree? |
| QB-SCI-46 | Science | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | SUPPORTED | How can I continue learning after graduation without enrolling in another full degree? |
| QB-SCI-47 | Science | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | SUPPORTED | Which Science careers are likely to require strong human judgement even when AI tools are widely used? |
| QB-SCI-48 | Science | Career outcomes and lifelong learning | `FINANCE` | SUPPORTED | PARTIAL | How should I compare the cost, duration and career outcomes of two Science pathways? |
| QB-SCI-49 | Science | Career outcomes and lifelong learning | `ELIGIBILITY` | SUPPORTED | SUPPORTED | What alternative pathway can I follow if I do not qualify for my preferred Science entrance examination? |
| QB-SCI-50 | Science | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | SUPPORTED | How can RSA help me review and revise my Science career plan over time? |
| QB-HUM-01 | Humanities | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | PARTIAL | Which Humanities careers suit me if I enjoy History but do not want to become a teacher? |
| QB-HUM-02 | Humanities | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | PARTIAL | Which careers combine Psychology, writing and technology? |
| QB-HUM-03 | Humanities | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | PARTIAL | Can I build a career in Humanities after studying Science or Commerce in Class 12? |
| QB-HUM-04 | Humanities | Career discovery and subject choice | `INCLUSION` | SUPPORTED | PARTIAL | Which careers combine languages, culture and digital technology? |
| QB-HUM-05 | Humanities | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | PARTIAL | What is the difference between studying Political Science, Public Policy and Public Administration? |
| QB-HUM-06 | Humanities | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | PARTIAL | Which careers are available after Philosophy besides teaching and research? |
| QB-HUM-07 | Humanities | Career discovery and subject choice | `EXPERIENCE` | SUPPORTED | PARTIAL | Which Humanities careers involve fieldwork and community engagement? |
| QB-HUM-08 | Humanities | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | PARTIAL | Which careers combine Geography, GIS and public policy? |
| QB-HUM-09 | Humanities | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | PARTIAL | Which career options are available in museums, archives, heritage and cultural management? |
| QB-HUM-10 | Humanities | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | PARTIAL | Which Humanities careers suit a student who enjoys reading, analysis and public speaking? |
| QB-HUM-11 | Humanities | Flexible pathways and NEP choices | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can I major in Psychology and minor in Data Science? |
| QB-HUM-12 | Humanities | Flexible pathways and NEP choices | `DISCOVERY` | SUPPORTED | PARTIAL | Can I combine History with Digital Humanities or Archaeology? |
| QB-HUM-13 | Humanities | Flexible pathways and NEP choices | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can I choose Political Science with Economics and Law-related electives? |
| QB-HUM-14 | Humanities | Flexible pathways and NEP choices | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can I earn credits through community work, fieldwork or a heritage project? |
| QB-HUM-15 | Humanities | Flexible pathways and NEP choices | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can I exit a four-year Humanities programme after one or two years with a recognised award? |
| QB-HUM-16 | Humanities | Flexible pathways and NEP choices | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can I re-enter the programme after an approved break? |
| QB-HUM-17 | Humanities | Flexible pathways and NEP choices | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can credits earned through online language, writing or digital humanities courses be transferred? |
| QB-HUM-18 | Humanities | Flexible pathways and NEP choices | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | How can the Academic Bank of Credits help me change my Humanities major? |
| QB-HUM-19 | Humanities | Flexible pathways and NEP choices | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can prior work in theatre, music, translation or community service be formally recognised? |
| QB-HUM-20 | Humanities | Flexible pathways and NEP choices | `ELIGIBILITY` | SUPPORTED | PARTIAL | Which bridge courses would help me move from Literature to UX writing or digital publishing? |
| QB-HUM-21 | Humanities | Portfolio, research and experiential learning | `EXPERIENCE` | SUPPORTED | PARTIAL | What should I include in a writing portfolio for Journalism, Publishing or Creative Writing? |
| QB-HUM-22 | Humanities | Portfolio, research and experiential learning | `EXPERIENCE` | SUPPORTED | PARTIAL | How should I prepare a portfolio for Fine Arts, Theatre, Music or Dance? |
| QB-HUM-23 | Humanities | Portfolio, research and experiential learning | `EXPERIENCE` | SUPPORTED | PARTIAL | What type of fieldwork is useful for Sociology, Social Work or Development Studies? |
| QB-HUM-24 | Humanities | Portfolio, research and experiential learning | `EXPERIENCE` | SUPPORTED | PARTIAL | How can I demonstrate research ability for History, Political Science or Cultural Studies? |
| QB-HUM-25 | Humanities | Portfolio, research and experiential learning | `EXPERIENCE` | SUPPORTED | PARTIAL | What evidence should I collect for a translation or language-services career? |
| QB-HUM-26 | Humanities | Portfolio, research and experiential learning | `EXPERIENCE` | SUPPORTED | PARTIAL | How can I prepare for an audition or portfolio-based admission? |
| QB-HUM-27 | Humanities | Portfolio, research and experiential learning | `EXPERIENCE` | SUPPORTED | PARTIAL | Which school activities can strengthen my profile for Psychology or Social Work? |
| QB-HUM-28 | Humanities | Portfolio, research and experiential learning | `EXPERIENCE` | SUPPORTED | PARTIAL | Can an oral-history project or local heritage documentation become part of my portfolio? |
| QB-HUM-29 | Humanities | Portfolio, research and experiential learning | `EXPERIENCE` | SUPPORTED | PARTIAL | How can I show competency in multilingual communication? |
| QB-HUM-30 | Humanities | Portfolio, research and experiential learning | `REGULATION` | SUPPORTED | PARTIAL | What supervised practice may be required for counselling, psychology or special education? |
| QB-HUM-31 | Humanities | Inclusion, language and IKS | `INCLUSION` | SUPPORTED | PARTIAL | Which Humanities programmes support study in Indian or regional languages? |
| QB-HUM-32 | Humanities | Inclusion, language and IKS | `INCLUSION` | SUPPORTED | PARTIAL | Can I pursue a career using my mother tongue as a professional language? |
| QB-HUM-33 | Humanities | Inclusion, language and IKS | `INCLUSION` | SUPPORTED | PARTIAL | Which careers are connected to Indian Knowledge Systems, folk traditions or indigenous studies? |
| QB-HUM-34 | Humanities | Inclusion, language and IKS | `INCLUSION` | SUPPORTED | PARTIAL | How can I study tribal or community knowledge ethically without misusing it? |
| QB-HUM-35 | Humanities | Inclusion, language and IKS | `INCLUSION` | SUPPORTED | PARTIAL | What career options exist in regional-language publishing and translation? |
| QB-HUM-36 | Humanities | Inclusion, language and IKS | `EXPERIENCE` | SUPPORTED | PARTIAL | Which support is available for students with disabilities in portfolio, audition or fieldwork-based programmes? |
| QB-HUM-37 | Humanities | Inclusion, language and IKS | `INCLUSION` | SUPPORTED | PARTIAL | Can I request accessible formats for reading, writing or practical assessments? |
| QB-HUM-38 | Humanities | Inclusion, language and IKS | `FINANCE` | SUPPORTED | PARTIAL | Which scholarships support arts, languages, social sciences or cultural studies? |
| QB-HUM-39 | Humanities | Inclusion, language and IKS | `INCLUSION` | SUPPORTED | PARTIAL | What options are available for rural and first-generation students in Humanities? |
| QB-HUM-40 | Humanities | Inclusion, language and IKS | `INCLUSION` | SUPPORTED | PARTIAL | How can community engagement contribute to my degree and career readiness? |
| QB-HUM-41 | Humanities | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | Which Humanities careers offer salaried, freelance, research and entrepreneurial options? |
| QB-HUM-42 | Humanities | Career outcomes and lifelong learning | `REGULATION` | SUPPORTED | PARTIAL | What professional recognition is required for Psychology, Counselling or Special Education careers? |
| QB-HUM-43 | Humanities | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | What qualifications are required to become an Assistant Professor or researcher? |
| QB-HUM-44 | Humanities | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | How can I move from Humanities into public policy, management, law or technology? |
| QB-HUM-45 | Humanities | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | Which Humanities careers are least dependent on automation and most dependent on human judgement? |
| QB-HUM-46 | Humanities | Career outcomes and lifelong learning | `EXPERIENCE` | SUPPORTED | PARTIAL | How can I build a portfolio career using writing, teaching, research and consulting? |
| QB-HUM-47 | Humanities | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | Which micro-credentials can complement a Humanities degree? |
| QB-HUM-48 | Humanities | Career outcomes and lifelong learning | `FINANCE` | SUPPORTED | PARTIAL | How should I compare the income patterns of salaried and freelance Humanities careers? |
| QB-HUM-49 | Humanities | Career outcomes and lifelong learning | `EXPERIENCE` | SUPPORTED | PARTIAL | What alternative path can I follow if I do not clear an entrance test or portfolio selection? |
| QB-HUM-50 | Humanities | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | How can RSA help me update my Humanities pathway as my interests change? |
| QB-COM-01 | Commerce | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | PARTIAL | Which Commerce careers can I pursue without Mathematics in Class 11 and 12? |
| QB-COM-02 | Commerce | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | PARTIAL | Which Commerce careers require Mathematics or Applied Mathematics? |
| QB-COM-03 | Commerce | Career discovery and subject choice | `FINANCE` | SUPPORTED | PARTIAL | What is the difference between Chartered Accountancy, Company Secretaryship and Cost and Management Accountancy? |
| QB-COM-04 | Commerce | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | PARTIAL | Which careers combine Commerce, Data Analytics and Technology? |
| QB-COM-05 | Commerce | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | PARTIAL | Which careers are available in Banking, Investment, Insurance and Financial Markets? |
| QB-COM-06 | Commerce | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | PARTIAL | Which Commerce careers suit me if I prefer analysis but do not want to work in accounting? |
| QB-COM-07 | Commerce | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | PARTIAL | Can I enter Commerce careers after studying Science or Humanities? |
| QB-COM-08 | Commerce | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | PARTIAL | Which careers combine Commerce with Law and Corporate Governance? |
| QB-COM-09 | Commerce | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | PARTIAL | Which Commerce careers offer entrepreneurship or independent consulting? |
| QB-COM-10 | Commerce | Career discovery and subject choice | `ELIGIBILITY` | SUPPORTED | PARTIAL | How can I compare a degree route with a professional qualification route? |
| QB-COM-11 | Commerce | Professional qualifications and progression | `DISCOVERY` | SUPPORTED | PARTIAL | What is the complete pathway from registration to qualification in CA, CS or CMA? |
| QB-COM-12 | Commerce | Professional qualifications and progression | `REGULATION` | SUPPORTED | PARTIAL | What is the difference between passing an examination, obtaining membership and receiving a practice right? |
| QB-COM-13 | Commerce | Professional qualifications and progression | `DISCOVERY` | SUPPORTED | PARTIAL | When is articleship or prescribed practical training compulsory? |
| QB-COM-14 | Commerce | Professional qualifications and progression | `DISCOVERY` | SUPPORTED | PARTIAL | Can my graduation exempt me from any professional examination level? |
| QB-COM-15 | Commerce | Professional qualifications and progression | `DISCOVERY` | SUPPORTED | PARTIAL | Can I pause a professional qualification and resume it later? |
| QB-COM-16 | Commerce | Professional qualifications and progression | `DISCOVERY` | SUPPORTED | PARTIAL | What happens if I clear some levels but do not complete the full qualification? |
| QB-COM-17 | Commerce | Professional qualifications and progression | `REGULATION` | SUPPORTED | PARTIAL | Which professional qualifications allow independent practice? |
| QB-COM-18 | Commerce | Professional qualifications and progression | `REGULATION` | SUPPORTED | PARTIAL | Which career outcomes require a licence, membership or regulatory certification? |
| QB-COM-19 | Commerce | Professional qualifications and progression | `DISCOVERY` | SUPPORTED | PARTIAL | How do recruitment examinations such as bank examinations differ from admission examinations? |
| QB-COM-20 | Commerce | Professional qualifications and progression | `DISCOVERY` | SUPPORTED | PARTIAL | How should I verify whether a professional rule is current? |
| QB-COM-21 | Commerce | NEP flexibility, credits and vocational learning | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can I major in Commerce and minor in Data Science, Economics or Law? |
| QB-COM-22 | Commerce | NEP flexibility, credits and vocational learning | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can I combine Accountancy with Entrepreneurship and Digital Business? |
| QB-COM-23 | Commerce | NEP flexibility, credits and vocational learning | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can I transfer credits if I change from B.Com to another multidisciplinary programme? |
| QB-COM-24 | Commerce | NEP flexibility, credits and vocational learning | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can credits from SWAYAM or recognised online courses count toward my Commerce degree? |
| QB-COM-25 | Commerce | NEP flexibility, credits and vocational learning | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can I leave a degree after one or two years and receive a recognised exit award? |
| QB-COM-26 | Commerce | NEP flexibility, credits and vocational learning | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can I re-enter the degree after taking an approved exit? |
| QB-COM-27 | Commerce | NEP flexibility, credits and vocational learning | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can my work experience in accounting, sales or family business be recognised through RPL? |
| QB-COM-28 | Commerce | NEP flexibility, credits and vocational learning | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can professional examination learning count toward academic credits? |
| QB-COM-29 | Commerce | NEP flexibility, credits and vocational learning | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | What bridge course would help a non-Commerce student enter Finance or Analytics? |
| QB-COM-30 | Commerce | NEP flexibility, credits and vocational learning | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can vocational training in GST, bookkeeping or digital commerce be integrated into a degree? |
| QB-COM-31 | Commerce | Experience, inclusion and affordability | `FINANCE` | SUPPORTED | PARTIAL | What projects should I complete for Finance, Banking, Taxation or Analytics careers? |
| QB-COM-32 | Commerce | Experience, inclusion and affordability | `FINANCE` | SUPPORTED | PARTIAL | How can I build a portfolio for financial analytics or business intelligence? |
| QB-COM-33 | Commerce | Experience, inclusion and affordability | `FINANCE` | SUPPORTED | PARTIAL | What internships are useful before attempting a professional qualification? |
| QB-COM-34 | Commerce | Experience, inclusion and affordability | `FINANCE` | SUPPORTED | PARTIAL | How should I document practical training, articleship or enterprise experience? |
| QB-COM-35 | Commerce | Experience, inclusion and affordability | `FINANCE` | SUPPORTED | PARTIAL | What scholarships or loans can support professional examination and membership costs? |
| QB-COM-36 | Commerce | Experience, inclusion and affordability | `FINANCE` | SUPPORTED | PARTIAL | Can stipends from practical training reduce the total cost of qualification? |
| QB-COM-37 | Commerce | Experience, inclusion and affordability | `FINANCE` | SUPPORTED | PARTIAL | Which accommodations are available during professional examinations for students with disabilities? |
| QB-COM-38 | Commerce | Experience, inclusion and affordability | `FINANCE` | SUPPORTED | PARTIAL | Which Commerce learning resources are available in regional languages? |
| QB-COM-39 | Commerce | Experience, inclusion and affordability | `FINANCE` | SUPPORTED | PARTIAL | What support is available for rural or first-generation Commerce learners? |
| QB-COM-40 | Commerce | Experience, inclusion and affordability | `FINANCE` | SUPPORTED | PARTIAL | How can I study Commerce through blended or online learning? |
| QB-COM-41 | Commerce | Career outcomes and lifelong learning | `REGULATION` | SUPPORTED | PARTIAL | Which Commerce careers allow salaried employment, government service, freelance work or independent practice? |
| QB-COM-42 | Commerce | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | Which certifications are useful for Wealth Management, Financial Planning or Securities careers? |
| QB-COM-43 | Commerce | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | How can I move from Commerce into FinTech, Analytics or E-Commerce? |
| QB-COM-44 | Commerce | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | Which Commerce roles require knowledge of financial instruments but not authority to give financial advice? |
| QB-COM-45 | Commerce | Career outcomes and lifelong learning | `FINANCE` | SUPPORTED | PARTIAL | How should I compare salary data across experience, city and employment mode? |
| QB-COM-46 | Commerce | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | Which Commerce careers are likely to change because of AI and automation? |
| QB-COM-47 | Commerce | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | Which human skills will remain important in accounting, compliance and finance? |
| QB-COM-48 | Commerce | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | What alternative career can I follow if I do not complete CA, CS or CMA? |
| QB-COM-49 | Commerce | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | Which short courses or micro-credentials can help me upskill after graduation? |
| QB-COM-50 | Commerce | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | How can RSA help me revise my Commerce pathway after each examination stage? |
| QB-MAN-01 | Management | Career discovery and education choice | `DISCOVERY` | SUPPORTED | PARTIAL | Do I need an MBA to become a manager? |
| QB-MAN-02 | Management | Career discovery and education choice | `ELIGIBILITY` | SUPPORTED | PARTIAL | Which Management careers can I enter directly after Class 12 or graduation? |
| QB-MAN-03 | Management | Career discovery and education choice | `COMPARE` | SUPPORTED | PARTIAL | What is the difference between a management function, an industry sector and a job role? |
| QB-MAN-04 | Management | Career discovery and education choice | `DISCOVERY` | SUPPORTED | PARTIAL | Which Management careers suit me if I enjoy people, communication and teamwork? |
| QB-MAN-05 | Management | Career discovery and education choice | `DISCOVERY` | SUPPORTED | PARTIAL | Which careers suit me if I prefer data, systems and problem-solving? |
| QB-MAN-06 | Management | Career discovery and education choice | `DISCOVERY` | SUPPORTED | PARTIAL | Which Management careers combine technology, product and business strategy? |
| QB-MAN-07 | Management | Career discovery and education choice | `DISCOVERY` | SUPPORTED | PARTIAL | Can I enter Management after studying Science, Humanities, Law or Design? |
| QB-MAN-08 | Management | Career discovery and education choice | `DISCOVERY` | SUPPORTED | PARTIAL | How should I choose between BBA, BMS, B.Com, an integrated management programme and an MBA later? |
| QB-MAN-09 | Management | Career discovery and education choice | `EXPERIENCE` | SUPPORTED | PARTIAL | Which Management careers are available without an MBA but require a strong portfolio? |
| QB-MAN-10 | Management | Career discovery and education choice | `INCLUSION` | SUPPORTED | PARTIAL | Which careers combine Management with sustainability, rural development or public systems? |
| QB-MAN-11 | Management | NEP flexibility and programme structure | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can I major in Management and minor in Data Science, Psychology or Public Policy? |
| QB-MAN-12 | Management | NEP flexibility and programme structure | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can I combine Marketing with Media, Design or Technology electives? |
| QB-MAN-13 | Management | NEP flexibility and programme structure | `INCLUSION` | SUPPORTED | PARTIAL | Can I combine Rural Management with Agriculture or Social Work? |
| QB-MAN-14 | Management | NEP flexibility and programme structure | `DISCOVERY` | SUPPORTED | PARTIAL | Can I leave a four-year management programme early with a recognised award? |
| QB-MAN-15 | Management | NEP flexibility and programme structure | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can I re-enter the programme after work experience or an approved break? |
| QB-MAN-16 | Management | NEP flexibility and programme structure | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can credits from online business, analytics or entrepreneurship courses be transferred? |
| QB-MAN-17 | Management | NEP flexibility and programme structure | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | How does the Academic Bank of Credits support movement between institutions? |
| QB-MAN-18 | Management | NEP flexibility and programme structure | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can prior work in family business, sales, operations or entrepreneurship be recognised through RPL? |
| QB-MAN-19 | Management | NEP flexibility and programme structure | `ELIGIBILITY` | SUPPORTED | PARTIAL | What bridge courses would help a non-quantitative student enter Business Analytics? |
| QB-MAN-20 | Management | NEP flexibility and programme structure | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can vocational and entrepreneurial projects earn academic credits? |
| QB-MAN-21 | Management | Practical experience and portfolio | `EXPERIENCE` | SUPPORTED | PARTIAL | What should I include in a Management portfolio? |
| QB-MAN-22 | Management | Practical experience and portfolio | `EXPERIENCE` | SUPPORTED | PARTIAL | How can I demonstrate leadership before I have formal work experience? |
| QB-MAN-23 | Management | Practical experience and portfolio | `EXPERIENCE` | SUPPORTED | PARTIAL | Which live projects are useful for Marketing, Finance, HR or Operations? |
| QB-MAN-24 | Management | Practical experience and portfolio | `EXPERIENCE` | SUPPORTED | PARTIAL | How should I build a product-management portfolio? |
| QB-MAN-25 | Management | Practical experience and portfolio | `EXPERIENCE` | SUPPORTED | PARTIAL | What case studies should I practise for consulting or strategy careers? |
| QB-MAN-26 | Management | Practical experience and portfolio | `EXPERIENCE` | SUPPORTED | PARTIAL | How can I demonstrate competence in CRM, ERP, analytics or no-code tools? |
| QB-MAN-27 | Management | Practical experience and portfolio | `EXPERIENCE` | SUPPORTED | PARTIAL | Can a family-business improvement project count as experience evidence? |
| QB-MAN-28 | Management | Practical experience and portfolio | `EXPERIENCE` | SUPPORTED | PARTIAL | What fieldwork is useful for Rural, Healthcare or Public-System Management? |
| QB-MAN-29 | Management | Practical experience and portfolio | `EXPERIENCE` | SUPPORTED | PARTIAL | How should I document an entrepreneurship experiment or small revenue project? |
| QB-MAN-30 | Management | Practical experience and portfolio | `EXPERIENCE` | SUPPORTED | PARTIAL | What evidence is required for skill-based non-MBA roles? |
| QB-MAN-31 | Management | Access, inclusion and regional pathways | `FINANCE` | SUPPORTED | PARTIAL | Which Management programmes are affordable if I cannot pay high private-institute fees? |
| QB-MAN-32 | Management | Access, inclusion and regional pathways | `FINANCE` | SUPPORTED | PARTIAL | What scholarships and education loans are available for Management education? |
| QB-MAN-33 | Management | Access, inclusion and regional pathways | `EXPERIENCE` | SUPPORTED | PARTIAL | Which programmes support students with disabilities in case-based and internship learning? |
| QB-MAN-34 | Management | Access, inclusion and regional pathways | `DISCOVERY` | SUPPORTED | PARTIAL | Can I study Management through blended, executive or open-learning modes? |
| QB-MAN-35 | Management | Access, inclusion and regional pathways | `INCLUSION` | SUPPORTED | PARTIAL | Which Management careers are relevant in rural, tribal or regional economies? |
| QB-MAN-36 | Management | Access, inclusion and regional pathways | `INCLUSION` | SUPPORTED | PARTIAL | Can local-language and regional-market knowledge become a career advantage? |
| QB-MAN-37 | Management | Access, inclusion and regional pathways | `DISCOVERY` | SUPPORTED | PARTIAL | Which careers are connected to FPOs, SHGs, cooperatives or livelihood missions? |
| QB-MAN-38 | Management | Access, inclusion and regional pathways | `INCLUSION` | SUPPORTED | PARTIAL | What support is available for first-generation learners entering management education? |
| QB-MAN-39 | Management | Access, inclusion and regional pathways | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can community projects or social-impact work earn credits? |
| QB-MAN-40 | Management | Access, inclusion and regional pathways | `DISCOVERY` | SUPPORTED | PARTIAL | Which traditional or local enterprises connect with Management and Lok Vidya? |
| QB-MAN-41 | Management | Career outcomes and lifelong learning | `ELIGIBILITY` | SUPPORTED | PARTIAL | Which Management roles require prior experience and which are genuine entry-level roles? |
| QB-MAN-42 | Management | Career outcomes and lifelong learning | `COMPARE` | SUPPORTED | PARTIAL | How do I compare a functional career such as HR with a sector career such as Healthcare Management? |
| QB-MAN-43 | Management | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | Which Management careers allow freelance, consulting, agency or entrepreneurial work? |
| QB-MAN-44 | Management | Career outcomes and lifelong learning | `REGULATION` | SUPPORTED | PARTIAL | Which licences or certifications are needed in regulated sectors such as insurance or real estate? |
| QB-MAN-45 | Management | Career outcomes and lifelong learning | `FINANCE` | SUPPORTED | PARTIAL | How should I evaluate salary, return on investment and career growth for an MBA? |
| QB-MAN-46 | Management | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | Which AI-era Management roles require strong human accountability? |
| QB-MAN-47 | Management | Career outcomes and lifelong learning | `ELIGIBILITY` | SUPPORTED | PARTIAL | What alternatives do I have if I do not clear CAT or another MBA entrance examination? |
| QB-MAN-48 | Management | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | Which micro-credentials can help me change Management functions later? |
| QB-MAN-49 | Management | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | How can I move from a sector role into strategy, consulting or entrepreneurship? |
| QB-MAN-50 | Management | Career outcomes and lifelong learning | `EXPERIENCE` | SUPPORTED | PARTIAL | How can RSA help me update my Management pathway after internships and work experience? |
| QB-LAW-01 | Law | Career discovery and legal education | `COMPARE` | SUPPORTED | PARTIAL | What is the difference between a five-year integrated LLB and a three-year LLB? |
| QB-LAW-02 | Law | Career discovery and legal education | `DISCOVERY` | SUPPORTED | PARTIAL | Which Law careers require an LLB and which legal-adjacent careers do not? |
| QB-LAW-03 | Law | Career discovery and legal education | `DISCOVERY` | SUPPORTED | PARTIAL | Can I study Law after Science, Commerce or Humanities? |
| QB-LAW-04 | Law | Career discovery and legal education | `REGULATION` | SUPPORTED | PARTIAL | Which careers are available outside litigation and courtroom practice? |
| QB-LAW-05 | Law | Career discovery and legal education | `REGULATION` | SUPPORTED | PARTIAL | What is the difference between a legal practice area, a legal service and a legal career outcome? |
| QB-LAW-06 | Law | Career discovery and legal education | `DISCOVERY` | SUPPORTED | PARTIAL | Which Law careers combine technology, privacy and AI governance? |
| QB-LAW-07 | Law | Career discovery and legal education | `DISCOVERY` | SUPPORTED | PARTIAL | Which careers combine Law with counselling, social work or education? |
| QB-LAW-08 | Law | Career discovery and legal education | `DISCOVERY` | SUPPORTED | PARTIAL | Which careers combine Law with Finance, Company Secretaryship or Insolvency? |
| QB-LAW-09 | Law | Career discovery and legal education | `DISCOVERY` | SUPPORTED | PARTIAL | Which Law careers involve research, policy or public-interest work? |
| QB-LAW-10 | Law | Career discovery and legal education | `COMPARE` | SUPPORTED | PARTIAL | How should I compare litigation, corporate law, judiciary and legal operations? |
| QB-LAW-11 | Law | Professional permission and regulation | `REGULATION` | SUPPORTED | PARTIAL | Does completing an LLB automatically allow me to practise in court? |
| QB-LAW-12 | Law | Professional permission and regulation | `REGULATION` | SUPPORTED | PARTIAL | What is the difference between State Bar Council enrolment and the AIBE Certificate of Practice? |
| QB-LAW-13 | Law | Professional permission and regulation | `REGULATION` | SUPPORTED | PARTIAL | Which legal roles require registration, membership or a licence? |
| QB-LAW-14 | Law | Professional permission and regulation | `REGULATION` | SUPPORTED | PARTIAL | Can I work in a legal department without being enrolled as an advocate? |
| QB-LAW-15 | Law | Professional permission and regulation | `REGULATION` | SUPPORTED | PARTIAL | What permission is required to become a Patent Agent or Insolvency Professional? |
| QB-LAW-16 | Law | Professional permission and regulation | `REGULATION` | SUPPORTED | PARTIAL | Which forums can a particular legal professional appear before? |
| QB-LAW-17 | Law | Professional permission and regulation | `REGULATION` | SUPPORTED | PARTIAL | How do jurisdiction and state-specific rules affect a legal career? |
| QB-LAW-18 | Law | Professional permission and regulation | `REGULATION` | SUPPORTED | PARTIAL | How can I verify whether a legal qualification or institution is recognised? |
| QB-LAW-19 | Law | Professional permission and regulation | `REGULATION` | SUPPORTED | PARTIAL | What continuing obligations apply after receiving a professional registration? |
| QB-LAW-20 | Law | Professional permission and regulation | `REGULATION` | SUPPORTED | PARTIAL | Can a non-law graduate provide legal documentation or compliance services? |
| QB-LAW-21 | Law | NEP flexibility and multidisciplinary learning | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can I major in Law and minor in Technology, Economics or Public Policy? |
| QB-LAW-22 | Law | NEP flexibility and multidisciplinary learning | `DISCOVERY` | SUPPORTED | PARTIAL | Can I combine Law with Design, Media or Environmental Studies? |
| QB-LAW-23 | Law | NEP flexibility and multidisciplinary learning | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can I transfer credits between integrated Law programmes or institutions? |
| QB-LAW-24 | Law | NEP flexibility and multidisciplinary learning | `DISCOVERY` | SUPPORTED | PARTIAL | Can online courses in cyber law, mediation or legal technology count toward my degree? |
| QB-LAW-25 | Law | NEP flexibility and multidisciplinary learning | `DISCOVERY` | SUPPORTED | PARTIAL | Can I leave an integrated Law programme early with a recognised award? |
| QB-LAW-26 | Law | NEP flexibility and multidisciplinary learning | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can I re-enter after an approved break? |
| QB-LAW-27 | Law | NEP flexibility and multidisciplinary learning | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can prior paralegal, documentation or legal-aid experience be recognised through RPL? |
| QB-LAW-28 | Law | NEP flexibility and multidisciplinary learning | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can professional certifications count toward academic credits? |
| QB-LAW-29 | Law | NEP flexibility and multidisciplinary learning | `ELIGIBILITY` | SUPPORTED | PARTIAL | What bridge course would help a technology graduate enter a Law-and-policy pathway? |
| QB-LAW-30 | Law | NEP flexibility and multidisciplinary learning | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can legal clinics and community service earn academic credits? |
| QB-LAW-31 | Law | Experience, portfolio and inclusion | `EXPERIENCE` | SUPPORTED | PARTIAL | What should I include in a legal research and drafting portfolio? |
| QB-LAW-32 | Law | Experience, portfolio and inclusion | `EXPERIENCE` | SUPPORTED | PARTIAL | How important are moot courts, legal clinics and internships? |
| QB-LAW-33 | Law | Experience, portfolio and inclusion | `EXPERIENCE` | SUPPORTED | PARTIAL | How can I gain courtroom exposure before enrolment? |
| QB-LAW-34 | Law | Experience, portfolio and inclusion | `EXPERIENCE` | SUPPORTED | PARTIAL | What evidence should I build for corporate, compliance or legal-operations careers? |
| QB-LAW-35 | Law | Experience, portfolio and inclusion | `EXPERIENCE` | SUPPORTED | PARTIAL | How can I demonstrate competence in legal technology or AI-assisted research? |
| QB-LAW-36 | Law | Experience, portfolio and inclusion | `EXPERIENCE` | SUPPORTED | PARTIAL | Which accommodations are available in Law entrance and professional examinations for students with disabilities? |
| QB-LAW-37 | Law | Experience, portfolio and inclusion | `EXPERIENCE` | SUPPORTED | PARTIAL | Are legal resources and programmes available in Indian languages? |
| QB-LAW-38 | Law | Experience, portfolio and inclusion | `EXPERIENCE` | SUPPORTED | PARTIAL | Can I prepare for Law careers without expensive coaching? |
| QB-LAW-39 | Law | Experience, portfolio and inclusion | `FINANCE` | SUPPORTED | PARTIAL | What scholarships and legal-aid education support are available? |
| QB-LAW-40 | Law | Experience, portfolio and inclusion | `EXPERIENCE` | SUPPORTED | PARTIAL | How can community justice or constitutional-literacy work strengthen my profile? |
| QB-LAW-41 | Law | Career outcomes and lifelong learning | `REGULATION` | SUPPORTED | PARTIAL | Which Law careers offer salaried, government, academic, freelance or independent-practice options? |
| QB-LAW-42 | Law | Career outcomes and lifelong learning | `FINANCE` | SUPPORTED | PARTIAL | How should I compare law-firm salary, chamber income, government pay and freelance revenue? |
| QB-LAW-43 | Law | Career outcomes and lifelong learning | `REGULATION` | SUPPORTED | PARTIAL | Which Law careers are likely to grow because of AI, privacy and digital regulation? |
| QB-LAW-44 | Law | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | Which legal tasks must always remain under competent human review? |
| QB-LAW-45 | Law | Career outcomes and lifelong learning | `ELIGIBILITY` | SUPPORTED | PARTIAL | What alternative paths are available if I do not clear CLAT or another Law entrance examination? |
| QB-LAW-46 | Law | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | What alternatives are available if I complete Law but do not want to practise in court? |
| QB-LAW-47 | Law | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | Which short courses can help me move into mediation, compliance, policy or legal technology? |
| QB-LAW-48 | Law | Career outcomes and lifelong learning | `REGULATION` | SUPPORTED | PARTIAL | How can I build a flexible legal livelihood without crossing professional-practice boundaries? |
| QB-LAW-49 | Law | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | Which continuing legal education requirements may apply to my chosen role? |
| QB-LAW-50 | Law | Career outcomes and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | How can RSA help me review my Law pathway as rules and interests change? |
| QB-INT-01 | Interdisciplinary | Career discovery and integration | `DISCOVERY` | SUPPORTED | PARTIAL | How do I know whether an interdisciplinary career is a real structured pathway or only a new job label? |
| QB-INT-02 | Interdisciplinary | Career discovery and integration | `DISCOVERY` | SUPPORTED | PARTIAL | Which parent disciplines are required for the career I am considering? |
| QB-INT-03 | Interdisciplinary | Career discovery and integration | `DISCOVERY` | SUPPORTED | PARTIAL | What is the primary discipline and what are the supporting disciplines in this pathway? |
| QB-INT-04 | Interdisciplinary | Career discovery and integration | `DISCOVERY` | SUPPORTED | PARTIAL | Which careers combine Science with Policy or Business? |
| QB-INT-05 | Interdisciplinary | Career discovery and integration | `DISCOVERY` | SUPPORTED | PARTIAL | Which careers combine Humanities with Technology? |
| QB-INT-06 | Interdisciplinary | Career discovery and integration | `DISCOVERY` | SUPPORTED | PARTIAL | Which careers combine Commerce with Analytics and FinTech? |
| QB-INT-07 | Interdisciplinary | Career discovery and integration | `DISCOVERY` | SUPPORTED | PARTIAL | Which careers combine Psychology, Design and AI? |
| QB-INT-08 | Interdisciplinary | Career discovery and integration | `DISCOVERY` | SUPPORTED | PARTIAL | Which careers combine Law, Technology and Governance? |
| QB-INT-09 | Interdisciplinary | Career discovery and integration | `DISCOVERY` | SUPPORTED | PARTIAL | Which careers combine Agriculture, Sustainability and Data? |
| QB-INT-10 | Interdisciplinary | Career discovery and integration | `COMPARE` | SUPPORTED | PARTIAL | How can I compare a dedicated interdisciplinary degree with a traditional degree plus certifications? |
| QB-INT-11 | Interdisciplinary | Cross-faculty entry and bridge learning | `ELIGIBILITY` | SUPPORTED | PARTIAL | Can I enter this pathway from my current school stream or graduation background? |
| QB-INT-12 | Interdisciplinary | Cross-faculty entry and bridge learning | `ELIGIBILITY` | SUPPORTED | PARTIAL | Which subjects or degrees are accepted for entry? |
| QB-INT-13 | Interdisciplinary | Cross-faculty entry and bridge learning | `EXPERIENCE` | SUPPORTED | PARTIAL | Do I need Mathematics, laboratory science, coding, Law or a portfolio? |
| QB-INT-14 | Interdisciplinary | Cross-faculty entry and bridge learning | `ELIGIBILITY` | SUPPORTED | PARTIAL | Which bridge courses can close my prerequisite gaps? |
| QB-INT-15 | Interdisciplinary | Cross-faculty entry and bridge learning | `ELIGIBILITY` | SUPPORTED | PARTIAL | Can I move from Humanities to Data-oriented interdisciplinary careers? |
| QB-INT-16 | Interdisciplinary | Cross-faculty entry and bridge learning | `ELIGIBILITY` | SUPPORTED | PARTIAL | Can I move from Science to Public Policy, Design or Communication? |
| QB-INT-17 | Interdisciplinary | Cross-faculty entry and bridge learning | `ELIGIBILITY` | SUPPORTED | PARTIAL | Can a Commerce graduate enter Health Analytics or Digital Public Infrastructure? |
| QB-INT-18 | Interdisciplinary | Cross-faculty entry and bridge learning | `ELIGIBILITY` | SUPPORTED | PARTIAL | Can a Law graduate enter AI Governance or Legal Data Analytics? |
| QB-INT-19 | Interdisciplinary | Cross-faculty entry and bridge learning | `ELIGIBILITY` | SUPPORTED | PARTIAL | What alternatives exist if I do not meet the direct eligibility requirements? |
| QB-INT-20 | Interdisciplinary | Cross-faculty entry and bridge learning | `ELIGIBILITY` | SUPPORTED | PARTIAL | How should RSA distinguish eligibility from suitability for an interdisciplinary pathway? |
| QB-INT-21 | Interdisciplinary | NEP programme and credit flexibility | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can I create a major-minor combination that leads to this career? |
| QB-INT-22 | Interdisciplinary | NEP programme and credit flexibility | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can I pursue a double major or dual degree instead of a dedicated interdisciplinary programme? |
| QB-INT-23 | Interdisciplinary | NEP programme and credit flexibility | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can open electives from another faculty count toward my pathway? |
| QB-INT-24 | Interdisciplinary | NEP programme and credit flexibility | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can credits from different institutions be combined through the Academic Bank of Credits? |
| QB-INT-25 | Interdisciplinary | NEP programme and credit flexibility | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can I exit a multidisciplinary programme early with a recognised award? |
| QB-INT-26 | Interdisciplinary | NEP programme and credit flexibility | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can I re-enter later without losing valid credits? |
| QB-INT-27 | Interdisciplinary | NEP programme and credit flexibility | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can online, vocational or community-based learning earn credits? |
| QB-INT-28 | Interdisciplinary | NEP programme and credit flexibility | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | Can prior work or informal learning be recognised through RPL? |
| QB-INT-29 | Interdisciplinary | NEP programme and credit flexibility | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | How do I know whether an institution actually offers the required major-minor combination? |
| QB-INT-30 | Interdisciplinary | NEP programme and credit flexibility | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | What happens if a career exists but no dedicated degree is widely available? |
| QB-INT-31 | Interdisciplinary | Capstone, portfolio and application context | `EXPERIENCE` | SUPPORTED | PARTIAL | What interdisciplinary capstone should I complete for this pathway? |
| QB-INT-32 | Interdisciplinary | Capstone, portfolio and application context | `EXPERIENCE` | SUPPORTED | PARTIAL | How can I prove that I can integrate disciplines rather than merely study them separately? |
| QB-INT-33 | Interdisciplinary | Capstone, portfolio and application context | `EXPERIENCE` | SUPPORTED | PARTIAL | What should I include in a portfolio for Health Analytics, Legal Design or Digital Humanities? |
| QB-INT-34 | Interdisciplinary | Capstone, portfolio and application context | `EXPERIENCE` | SUPPORTED | PARTIAL | Which methods must I combine for this career? |
| QB-INT-35 | Interdisciplinary | Capstone, portfolio and application context | `EXPERIENCE` | SUPPORTED | PARTIAL | Which fieldwork, laboratory, design or data experience is required? |
| QB-INT-36 | Interdisciplinary | Capstone, portfolio and application context | `EXPERIENCE` | SUPPORTED | PARTIAL | How can a community project become valid integration evidence? |
| QB-INT-37 | Interdisciplinary | Capstone, portfolio and application context | `EXPERIENCE` | SUPPORTED | PARTIAL | What ethical review is needed for projects involving health, AI, tribal knowledge or personal data? |
| QB-INT-38 | Interdisciplinary | Capstone, portfolio and application context | `EXPERIENCE` | SUPPORTED | PARTIAL | Which government mission or public system is relevant to this pathway? |
| QB-INT-39 | Interdisciplinary | Capstone, portfolio and application context | `EXPERIENCE` | SUPPORTED | PARTIAL | How should I evaluate a rare or emerging interdisciplinary career with limited market evidence? |
| QB-INT-40 | Interdisciplinary | Capstone, portfolio and application context | `NEP_POLICY` | SUPPORTED | MISSING_OR_POLICY_SPECIFIC | What fallback pathways preserve most of my existing credits and skills? |
| QB-INT-41 | Interdisciplinary | Community, inclusion and lifelong learning | `INCLUSION` | SUPPORTED | PARTIAL | Which interdisciplinary careers directly serve rural, tribal or marginalised communities? |
| QB-INT-42 | Interdisciplinary | Community, inclusion and lifelong learning | `INCLUSION` | SUPPORTED | PARTIAL | How can local-language ability strengthen an interdisciplinary career? |
| QB-INT-43 | Interdisciplinary | Community, inclusion and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | What consent and benefit-sharing rules apply when working with indigenous knowledge? |
| QB-INT-44 | Interdisciplinary | Community, inclusion and lifelong learning | `EXPERIENCE` | SUPPORTED | PARTIAL | Which accommodations are available for interdisciplinary laboratory, field or portfolio work? |
| QB-INT-45 | Interdisciplinary | Community, inclusion and lifelong learning | `FINANCE` | SUPPORTED | PARTIAL | What scholarships support cross-disciplinary and emerging programmes? |
| QB-INT-46 | Interdisciplinary | Community, inclusion and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | Can I build an interdisciplinary livelihood or micro-consultancy after graduation? |
| QB-INT-47 | Interdisciplinary | Community, inclusion and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | Which micro-credentials can be stacked with my main degree? |
| QB-INT-48 | Interdisciplinary | Community, inclusion and lifelong learning | `DISCOVERY` | SUPPORTED | PARTIAL | How can I continue adding new disciplines during my career? |
| QB-INT-49 | Interdisciplinary | Community, inclusion and lifelong learning | `FINANCE` | SUPPORTED | PARTIAL | How should I compare salary claims for rare or frontier careers? |
| QB-INT-50 | Interdisciplinary | Community, inclusion and lifelong learning | `REGULATION` | SUPPORTED | PARTIAL | How can RSA update my pathway when new programmes, regulations or technologies emerge? |

## Validation rule

A question passes post-ingestion only when the query returns either (a) a source-backed answer, (b) a source-backed statement that no qualifying result exists, or (c) an explicit insufficiency/escalation response. A merely non-empty result is not correctness.
