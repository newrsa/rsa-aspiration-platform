# Neo4j Runtime

This directory contains generated Neo4j runtime artifacts derived from the Semantic Registry.

## Generated Files

- `constraints/01_node_identity_constraints.cypher` creates uniqueness constraints for ontology IDs and reference codes.
- `constraints/02_required_property_constraints.cypher` creates required-property constraints where the Neo4j edition supports them.
- `indexes/01_lookup_indexes.cypher` creates non-unique lookup indexes when the registry defines them.
- `indexes/02_fulltext_indexes.cypher` creates label-specific full-text indexes for human-facing text fields.
- `schema/01_relationship_reference.cypher` documents approved relationship patterns.
- `validation/01_structural_integrity.cypher` contains executable graph health checks from the structural test set.

## Execution Order

1. Run `constraints/01_node_identity_constraints.cypher`.
2. Run `constraints/02_required_property_constraints.cypher` after confirming Neo4j edition support.
3. Run `indexes/01_lookup_indexes.cypher`.
4. Run `indexes/02_fulltext_indexes.cypher`.
5. Load data.
6. Run `validation/01_structural_integrity.cypher`.

Regenerate these files with `python scripts/generate_neo4j_schema.py` after registry changes.
