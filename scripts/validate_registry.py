#!/usr/bin/env python3
"""Validate the RSA semantic registry without third-party dependencies.

The parser intentionally supports the catalog's constrained YAML subset: a
top-level collection with list items and scalar/inline-list fields. Keeping the
validator dependency-free makes the repository usable before a Python toolchain
is established. Use a full YAML schema validator later if the catalog syntax is
expanded.
"""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CATALOGS = {
    "entity-catalog/entities.yaml": ("entities", {"id", "name", "status", "version", "owner", "stability", "description"}),
    "relationship-catalog/relationships.yaml": ("relationships", {"id", "name", "status", "source_entity_id", "target_entity_id", "cardinality", "mandatory", "semantic_meaning"}),
    "property-catalog/properties.yaml": ("properties", {"id", "name", "status", "datatype", "required", "unique", "indexed", "description"}),
    "validation-catalog/validations.yaml": ("validations", {"id", "name", "status", "severity", "applies_to", "rationale", "automated"}),
    "query-catalog/queries.yaml": ("queries", {"id", "business_question", "status", "category", "intent", "required_entity_ids", "required_relationship_ids", "traversal_pattern", "acceptance_criteria", "peer_ontology_routing"}),
}


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


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--strict", action="store_true", help="fail if placeholder records remain")
    args = parser.parse_args()

    registry = ROOT / "semantic-registry"
    errors: list[str] = []
    warnings: list[str] = []
    entity_ids: set[str] = set()
    parsed: dict[str, list[dict[str, str]]] = {}

    for relative, (top_key, required) in CATALOGS.items():
        path = registry / relative
        if not path.is_file():
            errors.append(f"missing catalog: {relative}")
            continue
        actual_key, records = parse_constrained_yaml(path)
        parsed[top_key] = records
        if actual_key != top_key:
            errors.append(f"{relative}: expected top-level key '{top_key}', found '{actual_key}'")
        for number, record in enumerate(records, start=1):
            absent = sorted(required - record.keys())
            if absent:
                errors.append(f"{relative} record {number}: missing {', '.join(absent)}")
            if record.get("status") == "placeholder":
                warnings.append(f"{relative} record {number}: placeholder record")
            if not record.get("id", "").strip():
                errors.append(f"{relative} record {number}: blank id")

    for entity in parsed.get("entities", []):
        entity_id = entity.get("id", "")
        if entity_id in entity_ids:
            errors.append(f"duplicate entity ID: {entity_id}")
        entity_ids.add(entity_id)
    for relationship in parsed.get("relationships", []):
        for role in ("source_entity_id", "target_entity_id"):
            reference = relationship.get(role, "")
            if reference and reference not in entity_ids:
                errors.append(f"relationship {relationship.get('id', '<unknown>')}: unknown {role} '{reference}'")

    for warning in warnings:
        print(f"WARNING: {warning}")
    for error in errors:
        print(f"ERROR: {error}")
    if args.strict and warnings:
        print("ERROR: strict mode does not allow placeholder records")
        return 1
    if errors:
        return 1
    print(f"Registry validation passed ({len(warnings)} warning(s)).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
