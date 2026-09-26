// RSA SCC Interdisciplinary Universe v1.1 — additive schema migration.
// Neo4j 5.x; idempotent; does not delete or overwrite earlier heuristic records.

CREATE CONSTRAINT parent_discipline_code_unique IF NOT EXISTS
FOR (n:ParentDiscipline) REQUIRE n.parent_discipline_code IS UNIQUE;
CREATE CONSTRAINT interdisciplinary_stream_code_unique IF NOT EXISTS
FOR (n:InterdisciplinaryStream) REQUIRE n.stream_code IS UNIQUE;
CREATE CONSTRAINT integration_domain_code_unique IF NOT EXISTS
FOR (n:IntegrationDomain) REQUIRE n.integration_domain_code IS UNIQUE;
CREATE CONSTRAINT integration_pattern_code_unique IF NOT EXISTS
FOR (n:IntegrationPattern) REQUIRE n.integration_pattern_code IS UNIQUE;
CREATE CONSTRAINT application_context_code_unique IF NOT EXISTS
FOR (n:ApplicationContext) REQUIRE n.application_context_code IS UNIQUE;
CREATE CONSTRAINT cross_faculty_entry_rule_code_unique IF NOT EXISTS
FOR (n:CrossFacultyEntryRule) REQUIRE n.cross_faculty_entry_rule_code IS UNIQUE;
CREATE CONSTRAINT multidisciplinary_programme_structure_code_unique IF NOT EXISTS
FOR (n:MultidisciplinaryProgrammeStructure) REQUIRE n.programme_structure_code IS UNIQUE;
CREATE CONSTRAINT method_bundle_code_unique IF NOT EXISTS
FOR (n:MethodBundle) REQUIRE n.method_bundle_code IS UNIQUE;
CREATE CONSTRAINT interdisciplinary_capstone_code_unique IF NOT EXISTS
FOR (n:InterdisciplinaryCapstone) REQUIRE n.capstone_code IS UNIQUE;
CREATE CONSTRAINT integration_evidence_code_unique IF NOT EXISTS
FOR (n:IntegrationEvidence) REQUIRE n.integration_evidence_code IS UNIQUE;
CREATE CONSTRAINT community_embeddedness_code_unique IF NOT EXISTS
FOR (n:CommunityEmbeddedness) REQUIRE n.community_embeddedness_code IS UNIQUE;
CREATE CONSTRAINT livelihood_service_model_code_unique IF NOT EXISTS
FOR (n:LivelihoodServiceModel) REQUIRE n.livelihood_service_model_code IS UNIQUE;

MATCH (u:Universe {universe_code:'UNI-INTERDISCIPLINARY'})
SET u.introduced_in_ontology_version='1.1',
    u.version='1.1',
    u.governance_status='Published',
    u.ontology_definition_status='Published',
    u.instance_data_status='Pending v1.1 load',
    u.source='RSA_SCC_Ontology_v1.1_Interdisciplinary_Universe_Direct_Structure.md',
    u.updated_at=datetime(),
    u.updated_by='rsa-v1.1-migration',
    u.last_refreshed=date();
