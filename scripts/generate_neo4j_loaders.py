#!/usr/bin/env python3
"""Generate Neo4j LOAD CSV scaffolds from the semantic registry."""

from __future__ import annotations

import re
from collections import defaultdict
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
REGISTRY = ROOT / "semantic-registry"
NEO4J = ROOT / "neo4j"

ENTITY_CATALOG = REGISTRY / "entity-catalog" / "entities.yaml"
PROPERTY_CATALOG = REGISTRY / "property-catalog" / "properties.yaml"
RELATIONSHIP_CATALOG = REGISTRY / "relationship-catalog" / "relationships.yaml"

LOADERS = NEO4J / "loaders"
NODE_LOADER = LOADERS / "01_load_nodes.cypher"
RELATIONSHIP_LOADER = LOADERS / "02_load_relationships.cypher"
IMPORT_ORDER = LOADERS / "import-order.md"
LOADER_README = LOADERS / "README.md"


def parse_constrained_yaml(path: Path) -> tuple[str | None, list[dict[str, str]]]:
    top_level = None
    entries: list[dict[str, str]] = []
    current: dict[str, str] | None = None
    for raw_line in path.read_text(encoding="utf-8").splitlines():
        line = raw_line.split("#", 1)[0].rstrip()
        if not line.strip():
            continue
        if not line.startswith((" ", "\t")) and re.fullmatch(r"[A-Za-z_]+:\s*(?:\[\])?", line):
            top_level = line.split(":", 1)[0]
            continue
        item = re.match(r"^\s*-\s+([A-Za-z_]+):\s*(.*)$", line)
        if item:
            current = {item.group(1): item.group(2).strip()}
            entries.append(current)
            continue
        field = re.match(r"^\s+([A-Za-z_]+):\s*(.*)$", line)
        if field and current is not None:
            current[field.group(1)] = field.group(2).strip()
    return top_level, entries


def scalar(value: str) -> str:
    value = value.strip()
    if value.startswith('"') and value.endswith('"'):
        return value[1:-1]
    return value


def file_stem(value: str) -> str:
    return re.sub(r"[^a-z0-9]+", "_", value.lower()).strip("_")


def cypher_string(value: str) -> str:
    return value.replace("\\", "\\\\").replace("'", "\\'")


def row_value(prop_name: str, datatype: str) -> str:
    source = f"CASE WHEN row.{prop_name} IS NULL OR trim(row.{prop_name}) = '' THEN null ELSE trim(row.{prop_name}) END"
    if datatype in {"integer"}:
        return f"CASE WHEN {source} IS NULL THEN null ELSE toInteger({source}) END"
    if datatype in {"float", "decimal"}:
        return f"CASE WHEN {source} IS NULL THEN null ELSE toFloat({source}) END"
    if datatype in {"boolean"}:
        return f"CASE WHEN {source} IS NULL THEN null ELSE toBoolean({source}) END"
    return source


def main() -> None:
    LOADERS.mkdir(parents=True, exist_ok=True)

    _, entities = parse_constrained_yaml(ENTITY_CATALOG)
    _, properties = parse_constrained_yaml(PROPERTY_CATALOG)
    _, relationships = parse_constrained_yaml(RELATIONSHIP_CATALOG)

    entity_by_id = {scalar(entity["id"]): entity for entity in entities}
    properties_by_entity: dict[str, list[dict[str, str]]] = defaultdict(list)
    for prop in properties:
        properties_by_entity[scalar(prop["entity_id"])].append(prop)

    node_lines = [
        "// Generated node loaders.",
        "// Set $csv_base_url to a Neo4j-readable URL such as 'file:///rsa/'.",
        "// Expected files: nodes/<entity-name>.csv.",
        "",
    ]
    for entity in entities:
        entity_id = scalar(entity["id"])
        label = scalar(entity["name"])
        reference = scalar(entity.get("reference_code_property", ""))
        if not reference:
            continue
        csv_name = f"nodes/{file_stem(label)}.csv"
        node_lines.extend(
            [
                f"// {label}",
                f"LOAD CSV WITH HEADERS FROM $csv_base_url + '{csv_name}' AS row",
                f"WITH row WHERE row.{reference} IS NOT NULL AND trim(row.{reference}) <> ''",
                f"MERGE (n:{label} {{{reference}: trim(row.{reference})}})",
            ]
        )
        assignments: list[str] = []
        for prop in properties_by_entity[entity_id]:
            prop_name = scalar(prop["name"])
            datatype = scalar(prop["datatype"])
            if datatype == "uuid" and prop_name.endswith("_id"):
                value = (
                    f"coalesce(CASE WHEN row.{prop_name} IS NULL OR trim(row.{prop_name}) = '' "
                    f"THEN null ELSE trim(row.{prop_name}) END, n.{prop_name}, randomUUID())"
                )
            elif prop_name == reference:
                value = f"trim(row.{reference})"
            else:
                value = row_value(prop_name, datatype)
            assignments.append(f"    n.{prop_name} = {value}")
        assignments.extend(
            [
                f"    n.registry_entity_id = '{cypher_string(entity_id)}'",
                "    n.updated_at = datetime()",
            ]
        )
        node_lines.append("SET\n" + ",\n".join(assignments) + ";")
        node_lines.append("")
    NODE_LOADER.write_text("\n".join(node_lines), encoding="utf-8")

    rel_lines = [
        "// Generated relationship loaders.",
        "// Expected files: relationships/<relationship-id>.csv with source_code,target_code columns.",
        "",
    ]
    for rel in relationships:
        rel_id = scalar(rel["id"])
        rel_name = scalar(rel["name"])
        source = entity_by_id[scalar(rel["source_entity_id"])]
        target = entity_by_id[scalar(rel["target_entity_id"])]
        source_label = scalar(source["name"])
        target_label = scalar(target["name"])
        source_ref = scalar(source.get("reference_code_property", ""))
        target_ref = scalar(target.get("reference_code_property", ""))
        if not source_ref or not target_ref:
            continue
        csv_name = f"relationships/{file_stem(rel_id)}.csv"
        rel_lines.extend(
            [
                f"// {source_label}-[:{rel_name}]->{target_label}",
                f"LOAD CSV WITH HEADERS FROM $csv_base_url + '{csv_name}' AS row",
                "WITH row WHERE row.source_code IS NOT NULL AND row.target_code IS NOT NULL",
                f"MATCH (source:{source_label} {{{source_ref}: trim(row.source_code)}})",
                f"MATCH (target:{target_label} {{{target_ref}: trim(row.target_code)}})",
                f"MERGE (source)-[r:{rel_name}]->(target)",
                "SET",
                f"    r.registry_relationship_id = '{cypher_string(rel_id)}',",
                "    r.updated_at = datetime();",
                "",
            ]
        )
    RELATIONSHIP_LOADER.write_text("\n".join(rel_lines), encoding="utf-8")

    order_lines = [
        "# Import Order",
        "",
        "1. Apply Neo4j constraints.",
        "2. Apply Neo4j indexes.",
        "3. Load all node CSV files using `01_load_nodes.cypher`.",
        "4. Load all relationship CSV files using `02_load_relationships.cypher`.",
        "5. Run `neo4j/validation/01_structural_integrity.cypher`.",
        "",
        "Node CSV files are expected under `nodes/`. Relationship CSV files are expected under `relationships/`.",
        "Relationship files must contain `source_code` and `target_code` columns that map to each entity's reference-code property.",
    ]
    IMPORT_ORDER.write_text("\n".join(order_lines) + "\n", encoding="utf-8")

    readme_lines = [
        "# Neo4j Loaders",
        "",
        "These generated loaders provide the first import scaffold for SCC data.",
        "",
        "The loaders assume a `$csv_base_url` parameter, for example:",
        "",
        "```cypher",
        ":param csv_base_url => 'file:///rsa/';",
        "```",
        "",
        "Use `01_load_nodes.cypher` before `02_load_relationships.cypher`.",
        "Generated relationship loaders match nodes by stable reference codes, not UUIDs.",
    ]
    LOADER_README.write_text("\n".join(readme_lines) + "\n", encoding="utf-8")

    print(f"Generated {len(entities)} node loader blocks and {len(relationships)} relationship loader blocks.")


if __name__ == "__main__":
    main()
