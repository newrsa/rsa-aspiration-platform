// Finalized universe ontology schema registrations. Neo4j 5.x; additive and idempotent.
CREATE CONSTRAINT commerce_stream_code_unique IF NOT EXISTS FOR (n:CommerceStream) REQUIRE n.stream_code IS UNIQUE;
CREATE CONSTRAINT humanities_stream_code_unique IF NOT EXISTS FOR (n:HumanitiesStream) REQUIRE n.stream_code IS UNIQUE;
CREATE CONSTRAINT management_stream_code_unique IF NOT EXISTS FOR (n:ManagementStream) REQUIRE n.stream_code IS UNIQUE;
CREATE CONSTRAINT law_stream_code_unique IF NOT EXISTS FOR (n:LawStream) REQUIRE n.stream_code IS UNIQUE;
CREATE CONSTRAINT commerce_domain_code_unique IF NOT EXISTS FOR (n:CommerceDomain) REQUIRE n.domain_code IS UNIQUE;
CREATE CONSTRAINT humanities_domain_code_unique IF NOT EXISTS FOR (n:HumanitiesDomain) REQUIRE n.domain_code IS UNIQUE;
CREATE CONSTRAINT management_domain_code_unique IF NOT EXISTS FOR (n:ManagementDomain) REQUIRE n.domain_code IS UNIQUE;
CREATE CONSTRAINT law_domain_code_unique IF NOT EXISTS FOR (n:LawDomain) REQUIRE n.domain_code IS UNIQUE;

UNWIND [
 {code:'UNI-COMMERCE',name:'Commerce',version:'0.7',source:'RSA_SCC_Ontology_v0.7_Commerce_Universe.md'},
 {code:'UNI-HUMANITIES',name:'Humanities',version:'0.8',source:'RSA_SCC_Ontology_v0.8_Humanities_Universe_Direct_Structure.md'},
 {code:'UNI-MANAGEMENT',name:'Management',version:'0.9',source:'RSA_SCC_Ontology_v0.9_Management_Universe_Direct_Structure.md'},
 {code:'UNI-LAW',name:'Law',version:'1.0',source:'RSA_SCC_Ontology_v1.0_Law_Universe_Direct_Structure.md'}
] AS row
MERGE (u:Universe {universe_code:row.code})
ON CREATE SET u.id=randomUUID(),u.created_at=datetime(),u.created_by='rsa-finalized-universe-migration'
SET u.name=row.name,u.version=row.version,u.introduced_in_ontology_version=row.version,
    u.governance_status='Published',u.ontology_definition_status='Published',
    u.instance_data_status='Pending finalized-registry load',u.source=row.source,
    u.updated_at=datetime(),u.updated_by='rsa-finalized-universe-migration',u.last_refreshed=date();
