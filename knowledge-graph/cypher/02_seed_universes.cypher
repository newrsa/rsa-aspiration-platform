// Structural seeds. Requires APOC Core 5.x only for UUID generation.
UNWIND [
 {code:'UNI-SCIENCE',name:'Science',introduced:'0.5.2',status:'Published',source:'1-Structured-Science.xlsx'},
 {code:'UNI-HUMANITIES',name:'Humanities',introduced:'1.0-preview',status:'Draft',source:'2-Structured- Arts_Humanities.xlsx'},
 {code:'UNI-COMMERCE',name:'Commerce',introduced:'0.7',status:'Draft',source:'3-Structured - Commerce.xlsx'},
 {code:'UNI-MANAGEMENT',name:'Management',introduced:'0.8',status:'Draft',source:'4-Strcutured-Management.xlsx'},
 {code:'UNI-LAW',name:'Law',introduced:'0.9',status:'Draft',source:'5-Structured- Law.xlsx'},
 {code:'UNI-INTERDISCIPLINARY',name:'Interdisciplinary',introduced:'1.0',status:'Draft',source:'6-Structured-Interdisciplinary.xlsx'}
] AS row
MERGE (u:Universe {universe_code:row.code})
ON CREATE SET u.id=randomUUID(),u.created_at=datetime(),u.created_by='rsa-loader'
SET u.name=row.name,u.introduced_in_ontology_version=row.introduced,u.governance_status=row.status,
    u.source=row.source,u.version='0.6.1a',u.updated_at=datetime(),u.updated_by='rsa-loader',
    u.refresh_frequency='Static',u.last_refreshed=date(),u.data_owner='ontology_team';
