# Import Order

1. Apply Neo4j constraints.
2. Apply Neo4j indexes.
3. Load all node CSV files using `01_load_nodes.cypher`.
4. Load all relationship CSV files using `02_load_relationships.cypher`.
5. Run `neo4j/validation/01_structural_integrity.cypher`.

Node CSV files are expected under `nodes/`. Relationship CSV files are expected under `relationships/`.
Relationship files must contain `source_code` and `target_code` columns that map to each entity's reference-code property.
