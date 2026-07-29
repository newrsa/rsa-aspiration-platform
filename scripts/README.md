# Automation Scripts

Place registry validation and artifact generators here. Scripts must be deterministic and should not overwrite reviewed artifacts without an explicit output path.

`validate_registry.py` is the initial dependency-free registry quality gate. It validates required catalog fields, entity IDs, and relationship endpoints.

`extract_ontology_registry.py` regenerates the initial entity, property, and relationship inventories from the approved SCC ontology. It intentionally creates **draft** records; GAS, structural tests, and the master test bank must govern later validation, constraint, and query decisions.
