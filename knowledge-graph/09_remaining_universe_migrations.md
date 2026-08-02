# Finalized Commerce, Humanities, Management and Law migrations

This release adds the authoritative normalized registries defined by:

- Commerce v0.7: 15 domains, 47 streams, 111 preserved career outcomes.
- Humanities v0.8: 16 domains, 125 streams, 160 preserved source careers.
- Management v0.9: 21 domains, 67 streams, 67 baseline career outcomes.
- Law v1.0: 22 domains, 90 streams, 90 baseline career outcomes.

## Status semantics

The finalized ontology definitions are `Published`. Their normalized registries are `Validated baseline`. This does not promote volatile professional rules, permissions, exams, institutions, salaries, or labour-market facts that the specifications identify as requiring authoritative validation.

## Execution

1. Copy the sixteen CSV files beginning `commerce_v0_7_`, `humanities_v0_8_`, `management_v0_9_`, and `law_v1_0_` from `data/` into the active Neo4j `import/rsa/` folder.
2. Run `cypher/09_migrate_remaining_universe_schemas.cypher`.
3. Run `cypher/10_load_remaining_universe_registries.cypher`.
4. Run `cypher/11_validate_remaining_universes.cypher`.

The loaders use stable codes and `MERGE`; rerunning them is idempotent. Existing workbook-derived nodes are updated when their stable codes match and retained for reconciliation when they do not. No delete operation is performed.

The first validation result must show `PASS` for each universe. The two offender queries must return zero rows.
