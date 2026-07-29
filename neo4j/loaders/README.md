# Neo4j Loaders

These generated loaders provide the first import scaffold for SCC data.

The loaders assume a `$csv_base_url` parameter, for example:

```cypher
:param csv_base_url => 'file:///rsa/';
```

Use `01_load_nodes.cypher` before `02_load_relationships.cypher`.
Generated relationship loaders match nodes by stable reference codes, not UUIDs.
