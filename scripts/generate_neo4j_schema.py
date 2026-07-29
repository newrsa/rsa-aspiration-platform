#!/usr/bin/env python3
"""Generate initial Neo4j physical schema artifacts from the semantic registry.

The generator intentionally uses the same constrained YAML parser style as the
registry validator. It keeps the repo dependency-free while the platform
toolchain is still being established.
"""

from __future__ import annotations

import re
from collections import defaultdict
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
REGISTRY = ROOT / "semantic-registry"

ENTITY_CATALOG = REGISTRY / "entity-catalog" / "entities.yaml"
PROPERTY_CATALOG = REGISTRY / "property-catalog" / "properties.yaml"
RELATIONSHIP_CATALOG = REGISTRY / "relationship-catalog" / "relationships.yaml"
CONSTRAINT_CATALOG = REGISTRY / "constraint-catalog" / "constraints.yaml"
INDEX_CATALOG = REGISTRY / "index-catalog" / "indexes.yaml"

NEO4J = ROOT / "neo4j"
CONSTRAINT_CYPHER = NEO4J / "constraints" / "01_node_identity_constraints.cypher"
REQUIRED_CYPHER = NEO4J / "constraints" / "02_required_property_constraints.cypher"
INDEX_CYPHER = NEO4J / "indexes" / "01_lookup_indexes.cypher"
FULLTEXT_CYPHER = NEO4J / "indexes" / "02_fulltext_indexes.cypher"
RELATIONSHIP_REFERENCE = NEO4J / "schema" / "01_relationship_reference.cypher"
VALIDATION_CYPHER = NEO4J / "validation" / "01_structural_integrity.cypher"
PHYSICAL_MODEL = ROOT / "docs" / "architecture" / "physical-graph-model.md"

FULLTEXT_FIELDS = {"name", "display_name", "description", "aliases", "keywords", "notes"}


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


def bool_value(value: str) -> bool:
    return scalar(value).lower() == "true"


def cypher_name(value: str) -> str:
    cleaned = re.sub(r"[^A-Za-z0-9_]+", "_", value).strip("_").lower()
    return cleaned or "unnamed"


def cypher_string(value: str) -> str:
    return value.replace("\\", "\\\\").replace("'", "\\'")


def write_catalog(path: Path, top_level: str, records: list[dict[str, object]]) -> None:
    lines = [f"{top_level}:"]
    for record in records:
        first = True
        for key, value in record.items():
            prefix = "  - " if first else "    "
            first = False
            if isinstance(value, bool):
                rendered = "true" if value else "false"
            elif isinstance(value, list):
                rendered = "[" + ", ".join(f'"{item}"' for item in value) + "]"
            else:
                rendered = f'"{value}"'
            lines.append(f"{prefix}{key}: {rendered}")
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> None:
    _, entities = parse_constrained_yaml(ENTITY_CATALOG)
    _, properties = parse_constrained_yaml(PROPERTY_CATALOG)
    _, relationships = parse_constrained_yaml(RELATIONSHIP_CATALOG)

    entity_by_id = {scalar(entity["id"]): entity for entity in entities}
    properties_by_entity: dict[str, list[dict[str, str]]] = defaultdict(list)
    for prop in properties:
        properties_by_entity[scalar(prop["entity_id"])].append(prop)

    unique_props = [prop for prop in properties if bool_value(prop.get("unique", "false"))]
    required_props = [prop for prop in properties if bool_value(prop.get("required", "false"))]
    indexed_props = [
        prop
        for prop in properties
        if bool_value(prop.get("indexed", "false")) and not bool_value(prop.get("unique", "false"))
    ]
    fulltext_index_specs: list[tuple[dict[str, str], list[str]]] = []
    for entity in entities:
        entity_props = properties_by_entity[scalar(entity["id"])]
        fields = [scalar(prop["name"]) for prop in entity_props if scalar(prop["name"]) in FULLTEXT_FIELDS]
        if fields:
            fulltext_index_specs.append((entity, fields))

    constraint_records: list[dict[str, object]] = []
    for prop in unique_props:
        entity = entity_by_id[scalar(prop["entity_id"])]
        label = scalar(entity["name"])
        prop_name = scalar(prop["name"])
        constraint_records.append(
            {
                "id": f"CON-{cypher_name(label).upper()}-{cypher_name(prop_name).upper()}-UNIQUE",
                "entity_id": scalar(entity["id"]),
                "property_ids": [scalar(prop["id"])],
                "type": "node_property_uniqueness",
                "status": "generated",
                "description": f"Unique constraint for {label}.{prop_name}.",
            }
        )
    for prop in required_props:
        entity = entity_by_id[scalar(prop["entity_id"])]
        label = scalar(entity["name"])
        prop_name = scalar(prop["name"])
        constraint_records.append(
            {
                "id": f"CON-{cypher_name(label).upper()}-{cypher_name(prop_name).upper()}-REQUIRED",
                "entity_id": scalar(entity["id"]),
                "property_ids": [scalar(prop["id"])],
                "type": "node_property_existence",
                "status": "generated",
                "description": f"Required property constraint for {label}.{prop_name}.",
            }
        )

    index_records: list[dict[str, object]] = []
    for prop in indexed_props:
        entity = entity_by_id[scalar(prop["entity_id"])]
        label = scalar(entity["name"])
        prop_name = scalar(prop["name"])
        index_records.append(
            {
                "id": f"IDX-{cypher_name(label).upper()}-{cypher_name(prop_name).upper()}",
                "entity_id": scalar(entity["id"]),
                "property_ids": [scalar(prop["id"])],
                "type": "range",
                "status": "generated",
                "reason": f"Lookup index for {label}.{prop_name}.",
            }
        )
    for entity, fields in fulltext_index_specs:
        label = scalar(entity["name"])
        field_text = ", ".join(fields)
        index_records.append(
            {
                "id": f"FTX-{cypher_name(label).upper()}-TEXT",
                "entity_id": scalar(entity["id"]),
                "property_ids": [
                    scalar(prop["id"])
                    for prop in properties_by_entity[scalar(entity["id"])]
                    if scalar(prop["name"]) in fields
                ],
                "type": "fulltext",
                "status": "generated",
                "reason": f"Full-text search for {label}: {field_text}.",
            }
        )

    write_catalog(CONSTRAINT_CATALOG, "constraints", constraint_records)
    write_catalog(INDEX_CATALOG, "indexes", index_records)

    unique_lines = [
        "// Generated from semantic-registry/property-catalog/properties.yaml",
        "// Neo4j 5.x node identity and reference-code constraints.",
        "",
    ]
    for prop in unique_props:
        entity = entity_by_id[scalar(prop["entity_id"])]
        label = scalar(entity["name"])
        prop_name = scalar(prop["name"])
        name = f"con_{cypher_name(label)}_{cypher_name(prop_name)}_unique"
        unique_lines.append(
            f"CREATE CONSTRAINT {name} IF NOT EXISTS\n"
            f"FOR (n:{label}) REQUIRE n.{prop_name} IS UNIQUE;\n"
        )
    CONSTRAINT_CYPHER.write_text("\n".join(unique_lines), encoding="utf-8")

    required_lines = [
        "// Generated from required=true registry properties.",
        "// Run after confirming the target Neo4j edition supports property existence constraints.",
        "",
    ]
    for prop in required_props:
        entity = entity_by_id[scalar(prop["entity_id"])]
        label = scalar(entity["name"])
        prop_name = scalar(prop["name"])
        name = f"con_{cypher_name(label)}_{cypher_name(prop_name)}_required"
        required_lines.append(
            f"CREATE CONSTRAINT {name} IF NOT EXISTS\n"
            f"FOR (n:{label}) REQUIRE n.{prop_name} IS NOT NULL;\n"
        )
    REQUIRED_CYPHER.write_text("\n".join(required_lines), encoding="utf-8")

    index_lines = [
        "// Generated from indexed=true, unique=false registry properties.",
        "// Uniqueness constraints already create backing indexes and are not duplicated here.",
        "",
    ]
    for prop in indexed_props:
        entity = entity_by_id[scalar(prop["entity_id"])]
        label = scalar(entity["name"])
        prop_name = scalar(prop["name"])
        name = f"idx_{cypher_name(label)}_{cypher_name(prop_name)}"
        index_lines.append(f"CREATE INDEX {name} IF NOT EXISTS\nFOR (n:{label}) ON (n.{prop_name});\n")
    INDEX_CYPHER.write_text("\n".join(index_lines), encoding="utf-8")

    fulltext_lines = [
        "// Generated for human-facing text retrieval and GraphRAG-ready search.",
        "// Full-text indexes cover available name/display/description/alias fields per label.",
        "",
    ]
    for entity, fields in fulltext_index_specs:
        label = scalar(entity["name"])
        name = f"ftx_{cypher_name(label)}_text"
        field_expr = ", ".join(f"n.{field}" for field in fields)
        fulltext_lines.append(
            f"CREATE FULLTEXT INDEX {name} IF NOT EXISTS\n"
            f"FOR (n:{label}) ON EACH [{field_expr}];\n"
        )
    FULLTEXT_CYPHER.write_text("\n".join(fulltext_lines), encoding="utf-8")

    rel_lines = [
        "// Relationship reference generated from semantic-registry/relationship-catalog/relationships.yaml",
        "// Neo4j creates relationship types when data is loaded; this file documents the approved patterns.",
        "",
    ]
    for rel in relationships:
        source = scalar(entity_by_id[scalar(rel["source_entity_id"])]["name"])
        target = scalar(entity_by_id[scalar(rel["target_entity_id"])]["name"])
        name = scalar(rel["name"])
        rel_lines.append(f"// ({source})-[:{name}]->({target})")
    RELATIONSHIP_REFERENCE.write_text("\n".join(rel_lines) + "\n", encoding="utf-8")

    validation_lines = [
        "// Structural integrity validation queries.",
        "// Queries return rows only when violations are found.",
        "",
        "// T44: Unreachable careers.",
        "MATCH (c:CareerOutcome)",
        "WHERE NOT ((:Stream)-[:LEADS_TO]->(c) OR (:Licence)-[:UNLOCKS]->(c))",
        "RETURN c.name AS unreachable_career;",
        "",
        "// T45: Prerequisite cycles.",
        "MATCH path = (s)-[:PREREQUISITE_OF*]->(s)",
        "RETURN path AS cycle_detected;",
        "",
        "// T48: Orphaned entrance exams.",
        "MATCH (e:EntranceExam)",
        "WHERE NOT (:Stream)-[:HAS_ENTRANCE_EXAM]->(e)",
        "  AND NOT (:Degree)-[:REQUIRES_EXAM]->(e)",
        "  AND NOT (:CareerOutcome)-[:HAS_FOLLOW_ON_EXAM]->(e)",
        "RETURN e.name AS orphaned_exam;",
        "",
        "// T49: Scholarship reachability placeholder.",
        "// Requires a representative test-student fixture before becoming executable.",
    ]
    VALIDATION_CYPHER.write_text("\n".join(validation_lines) + "\n", encoding="utf-8")

    labels = sorted(scalar(entity["name"]) for entity in entities)
    relationship_types = sorted({scalar(rel["name"]) for rel in relationships})
    model_lines = [
        "# Physical Graph Model",
        "",
        "Status: generated draft",
        "",
        "This document is generated from the Semantic Registry and describes the first Neo4j physical model.",
        "",
        "## Summary",
        "",
        f"- Node labels: {len(labels)}",
        f"- Relationship patterns: {len(relationships)}",
        f"- Distinct relationship types: {len(relationship_types)}",
        f"- Unique constraints: {len(unique_props)}",
        f"- Required property constraints: {len(required_props)}",
        f"- Lookup indexes: {len(indexed_props)}",
        f"- Full-text indexes: {len(fulltext_index_specs)}",
        "",
        "## Node Label Inventory",
        "",
    ]
    model_lines.extend(f"- `{label}`" for label in labels)
    model_lines.extend(["", "## Relationship Type Inventory", ""])
    model_lines.extend(f"- `{rel_type}`" for rel_type in relationship_types)
    model_lines.extend(
        [
            "",
            "## Generated Runtime Files",
            "",
            "- `neo4j/constraints/01_node_identity_constraints.cypher`",
            "- `neo4j/constraints/02_required_property_constraints.cypher`",
            "- `neo4j/indexes/01_lookup_indexes.cypher`",
            "- `neo4j/indexes/02_fulltext_indexes.cypher`",
            "- `neo4j/schema/01_relationship_reference.cypher`",
            "- `neo4j/validation/01_structural_integrity.cypher`",
            "",
            "## Execution Order",
            "",
            "1. Run identity constraints.",
            "2. Run required property constraints after confirming Neo4j edition support.",
            "3. Run lookup indexes.",
            "4. Run full-text indexes.",
            "5. Load data.",
            "6. Run structural validation queries.",
        ]
    )
    PHYSICAL_MODEL.write_text("\n".join(model_lines) + "\n", encoding="utf-8")

    print(
        "Generated "
        f"{len(constraint_records)} constraints, "
        f"{len(index_records)} indexes, "
        f"{len(relationships)} relationship references."
    )


if __name__ == "__main__":
    main()
