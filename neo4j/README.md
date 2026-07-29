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

## Seed Smoke Test

Generate seed CSV files with `python scripts/generate_seed_csv.py`.

For manual execution, generate and open the single notebook:

```powershell
python scripts\generate_neo4j_notebook.py
```

Notebook file:

- `notebooks/manual_seed_smoke_test.cypher`

Run these sections in order:

1. `constraints/01_node_identity_constraints.cypher`
2. `indexes/02_fulltext_indexes.cypher`
3. `loaders/01_load_nodes.cypher`
4. `loaders/02_load_relationships.cypher`
5. `queries/01_smoke_test.cypher`
6. `validation/01_structural_integrity.cypher`

Use `:param csv_base_url => 'file:///rsa/seed/';` when the contents of `datasets/seed` are available in Neo4j's import directory under `rsa/seed`.
