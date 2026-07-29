# Automation Scripts

Place registry validation and artifact generators here. Scripts must be deterministic and should not overwrite reviewed artifacts without an explicit output path.

`validate_registry.py` is the initial dependency-free registry quality gate. It validates required catalog fields, entity IDs, and relationship endpoints.

`extract_ontology_registry.py` regenerates the initial entity, property, and relationship inventories from the approved SCC ontology. It intentionally creates **draft** records; GAS, structural tests, and the master test bank must govern later validation, constraint, and query decisions.

`generate_neo4j_schema.py` generates the first Neo4j physical runtime artifacts from the Semantic Registry:

- constraint and index catalogs
- Neo4j constraint Cypher
- Neo4j lookup and full-text index Cypher
- relationship reference Cypher
- structural validation Cypher
- the physical graph model document

Run order:

1. `python scripts/extract_ontology_registry.py`
2. `python scripts/validate_registry.py --strict`
3. `python scripts/generate_neo4j_schema.py`
4. `python scripts/validate_registry.py --strict`
