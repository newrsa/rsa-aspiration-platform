#!/usr/bin/env python3
"""Generate initial RSA semantic-registry catalogs from the approved SCC ontology.

This generator deliberately produces *draft* records. It captures the ontology's
declared entity, property, and relationship inventory without deciding physical
Neo4j constraints, query indexes, or application-layer policy. Those decisions
remain governed by GAS and the test artifacts.
"""

from __future__ import annotations

import hashlib
import json
import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
ONTOLOGY = ROOT / "ontology" / "RSA_SCC_Science_Ontology_v0.6.md"
REGISTRY = ROOT / "semantic-registry"
ENTITY_OUTPUT = REGISTRY / "entity-catalog" / "entities.yaml"
PROPERTY_OUTPUT = REGISTRY / "property-catalog" / "properties.yaml"
RELATIONSHIP_OUTPUT = REGISTRY / "relationship-catalog" / "relationships.yaml"
MANIFEST_OUTPUT = REGISTRY / "source-manifest.yaml"

ENTITY_HEADING = re.compile(r"^##\s+(?:[3-8]\.\d+[a-z]?)\s+(.+?)\s*$", re.M)


def canonical_name(title: str) -> str:
    """Turn ontology display names into GAS-compliant PascalCase labels."""
    if title == "SCC Faculty":
        return "Faculty"
    return "".join(re.findall(r"[A-Za-z0-9]+", title))


def entity_id(name: str) -> str:
    return "ENT-" + re.sub(r"(?<!^)(?=[A-Z])", "-", name).upper()


def scalar(value: str) -> str:
    return json.dumps(value.strip(), ensure_ascii=False)


def parse_pipe_row(line: str) -> list[str]:
    return [cell.strip() for cell in line.strip().strip("|").split("|")]


def clean_property_name(value: str) -> str:
    cleaned = value.strip().strip("*`")
    cleaned = cleaned.replace("**", "")
    cleaned = re.sub(r"[^A-Za-z0-9_]+", "_", cleaned)
    cleaned = re.sub(r"_+", "_", cleaned).strip("_")
    return cleaned.lower()


def is_separator(cells: list[str]) -> bool:
    return all(re.fullmatch(r":?-{3,}:?", cell.replace(" ", "")) for cell in cells)


def normalize_type(raw: str) -> str:
    lowered = raw.lower()
    if "uuid" in lowered:
        return "uuid"
    if "datetime" in lowered:
        return "datetime"
    if re.search(r"\bdate\b", lowered):
        return "date"
    if "boolean" in lowered:
        return "boolean"
    if "bigint" in lowered or "integer" in lowered:
        return "integer"
    if "decimal" in lowered or "float" in lowered:
        return "float"
    if "structured" in lowered or "json" in lowered:
        return "json_string"
    if "list" in lowered:
        return "list"
    if "reference" in lowered:
        return "reference"
    if "enum" in lowered:
        return "enum"
    if "text" in lowered:
        return "text"
    return "string"


def parse_entities(text: str) -> tuple[list[dict[str, object]], list[dict[str, object]]]:
    headings = list(ENTITY_HEADING.finditer(text))
    entities: list[dict[str, object]] = []
    properties: list[dict[str, object]] = []
    for index, match in enumerate(headings):
        title = match.group(1).strip()
        section_end = headings[index + 1].start() if index + 1 < len(headings) else text.find("## 9. Controlled Vocabularies", match.end())
        section = text[match.end() : section_end]
        name = canonical_name(title)
        eid = entity_id(name)
        rows = [parse_pipe_row(line) for line in section.splitlines() if line.lstrip().startswith("|")]
        data = [row for row in rows if len(row) >= 4 and not is_separator(row) and row[0] != "#"]
        domain_rows = [row for row in data if not row[0].startswith("G1-G12")]
        code_property = next((row[1] for row in domain_rows if row[1].endswith("_code")), None)
        entities.append(
            {
                "id": eid,
                "name": name,
                "display_name": title,
                "status": "draft",
                "version": "0.6.0",
                "owner": "SCC",
                "stability": "static",
                "description": f"Ontology-defined {title} entity.",
                "reference_code_property": code_property or "",
                "mandatory_property_ids": [],
                "optional_property_ids": [],
                "relationship_ids": [],
                "validation_rule_ids": [],
                "source_reference": f"RSA_SCC_Science_Ontology_v0.6.md:{match.start()}",
            }
        )
        for row in domain_rows:
            number, raw_property_name, raw_type, notes = row[0], row[1], row[2], row[3]
            property_name = clean_property_name(raw_property_name)
            if not property_name or property_name == "property":
                continue
            prop_id = f"PROP-{eid.removeprefix('ENT-')}-{property_name.replace('_', '-').upper()}"
            properties.append(
                {
                    "id": prop_id,
                    "name": property_name,
                    "status": "draft",
                    "entity_id": eid,
                    "datatype": normalize_type(raw_type),
                    "required": property_name.endswith("_id") or property_name.endswith("_code"),
                    "unique": property_name.endswith("_id") or property_name.endswith("_code"),
                    "indexed": property_name.endswith("_code"),
                    "description": notes,
                    "ontology_type": raw_type,
                    "source_reference": f"RSA_SCC_Science_Ontology_v0.6.md:{match.start()}:property-{number}",
                }
            )
    return entities, properties


def parse_relationships(text: str, entities: list[dict[str, object]]) -> list[dict[str, object]]:
    start = text.index("## 10. Complete Relationship Inventory")
    end = text.index("## 11. Derived Formulas", start)
    section = text[start:end]
    known = {str(entity["display_name"]): str(entity["id"]) for entity in entities}
    known["SCC Faculty"] = "ENT-FACULTY"
    relationships: list[dict[str, object]] = []
    seen: set[tuple[str, str, str]] = set()
    for line in section.splitlines():
        if not line.lstrip().startswith("|"):
            continue
        row = parse_pipe_row(line)
        if len(row) < 6 or not row[0].isdigit():
            continue
        _, name, source, target, cardinality, properties = row[:6]
        key = (name, source, target)
        if key in seen:
            continue
        seen.add(key)
        source_id = known.get(source, entity_id(canonical_name(source)))
        target_id = known.get(target, entity_id(canonical_name(target)))
        relationship_id = "REL-" + "-".join(
            [name, source_id.removeprefix("ENT-"), target_id.removeprefix("ENT-")]
        )
        relationships.append(
            {
                "id": relationship_id,
                "name": name,
                "status": "draft",
                "source_entity_id": source_id,
                "target_entity_id": target_id,
                "cardinality": cardinality,
                "mandatory": cardinality.startswith("1"),
                "semantic_meaning": f"{source} {name} {target}.",
                "relationship_properties": properties if properties != "—" else "",
                "source_reference": "RSA_SCC_Science_Ontology_v0.6.md:relationship-inventory",
            }
        )
    return relationships


def test_required_relationship_extensions() -> list[dict[str, object]]:
    """Return governed extensions required by structural acceptance tests.

    They remain separate from the v0.6 source inventory in provenance, but are
    emitted into the effective registry so downstream generators have one model.
    """
    return [
        {
            "id": "REL-UNLOCKS-LICENCE-CAREER-OUTCOME",
            "name": "UNLOCKS",
            "status": "proposed_v0_6_1",
            "source_entity_id": "ENT-LICENCE",
            "target_entity_id": "ENT-CAREER-OUTCOME",
            "cardinality": "0..*",
            "mandatory": False,
            "semantic_meaning": "A Licence unlocks eligibility for a Career Outcome.",
            "relationship_properties": "is_mandatory (Boolean), requirement_group (String)",
            "source_reference": "RSA_SCC_Structural_Integrity_Test_Set.md:T42,T43,T44; REC-001",
        },
        {
            "id": "REL-REQUIRES-EXAM-DEGREE-ENTRANCE-EXAM",
            "name": "REQUIRES_EXAM",
            "status": "proposed_v0_6_1",
            "source_entity_id": "ENT-DEGREE",
            "target_entity_id": "ENT-ENTRANCE-EXAM",
            "cardinality": "0..*",
            "mandatory": False,
            "semantic_meaning": "A Degree requires an Entrance Exam for admission.",
            "relationship_properties": "is_mandatory (Boolean), exam_purpose (String)",
            "source_reference": "RSA_SCC_Structural_Integrity_Test_Set.md:T48; REC-002",
        },
    ]


def write_records(path: Path, top_level: str, records: list[dict[str, object]]) -> None:
    lines = [f"{top_level}:"]
    for record in records:
        first = True
        for key, value in record.items():
            prefix = "  - " if first else "    "
            first = False
            if isinstance(value, bool):
                rendered = "true" if value else "false"
            elif isinstance(value, list):
                rendered = "[]"
            else:
                rendered = scalar(str(value))
            lines.append(f"{prefix}{key}: {rendered}")
    lines.append("")
    path.write_text("\n".join(lines), encoding="utf-8")


def main() -> None:
    text = ONTOLOGY.read_text(encoding="utf-8")
    entities, properties = parse_entities(text)
    relationships = parse_relationships(text, entities) + test_required_relationship_extensions()
    write_records(ENTITY_OUTPUT, "entities", entities)
    write_records(PROPERTY_OUTPUT, "properties", properties)
    write_records(RELATIONSHIP_OUTPUT, "relationships", relationships)
    digest = hashlib.sha256(ONTOLOGY.read_bytes()).hexdigest()
    MANIFEST_OUTPUT.write_text(
        "sources:\n"
        "  - id: SRC-SCC-ONTOLOGY-0-6\n"
        "    file: RSA_SCC_Science_Ontology_v0.6.md\n"
        "    version: 0.6.0\n"
        f"    sha256: {digest}\n"
        "    role: canonical_semantic_source\n",
        encoding="utf-8",
    )
    print(f"Generated {len(entities)} entities, {len(properties)} properties, and {len(relationships)} relationship patterns.")


if __name__ == "__main__":
    main()
