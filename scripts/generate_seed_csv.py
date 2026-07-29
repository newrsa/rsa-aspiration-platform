#!/usr/bin/env python3
"""Generate minimal seed CSV fixtures for Neo4j loader smoke tests."""

from __future__ import annotations

import csv
import re
from collections import defaultdict
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
REGISTRY = ROOT / "semantic-registry"
DATASET = ROOT / "datasets" / "seed"
NODE_DIR = DATASET / "nodes"
REL_DIR = DATASET / "relationships"

ENTITY_CATALOG = REGISTRY / "entity-catalog" / "entities.yaml"
PROPERTY_CATALOG = REGISTRY / "property-catalog" / "properties.yaml"
RELATIONSHIP_CATALOG = REGISTRY / "relationship-catalog" / "relationships.yaml"


SAMPLE_NODES = {
    "Faculty": {
        "faculty_id": "00000000-0000-4000-8000-000000000001",
        "faculty_code": "FAC-SCIENCE",
        "name": "Science",
        "description": "Science faculty seed record.",
        "active_status": "true",
        "universe": "Science",
    },
    "Domain": {
        "domain_id": "00000000-0000-4000-8000-000000000002",
        "domain_code": "DOM-ENGINEERING",
        "name": "Engineering",
        "description": "Engineering domain seed record.",
        "active_status": "true",
    },
    "Stream": {
        "stream_id": "00000000-0000-4000-8000-000000000003",
        "stream_code": "STR-AEROSPACE-ENGINEERING",
        "name": "Aerospace Engineering",
        "description": "Aerospace engineering stream seed record.",
        "active_status": "true",
        "universe": "Science",
        "path_type": "Specialized",
    },
    "EducationStage": {
        "stage_id": "00000000-0000-4000-8000-000000000004",
        "stage_code": "STAGE-UG",
        "name": "Undergraduate",
    },
    "SubjectCombination": {
        "combination_id": "00000000-0000-4000-8000-000000000005",
        "combination_code": "SUBCOM-PCM",
        "name": "Physics Chemistry Mathematics",
    },
    "Degree": {
        "degree_id": "00000000-0000-4000-8000-000000000006",
        "degree_code": "DEG-BTECH-AERO",
        "name": "B.Tech Aerospace Engineering",
    },
    "EntranceExam": {
        "exam_id": "00000000-0000-4000-8000-000000000007",
        "exam_code": "EXAM-JEE-MAIN",
        "name": "JEE Main",
    },
    "CareerOutcome": {
        "outcome_id": "00000000-0000-4000-8000-000000000008",
        "outcome_code": "CAREER-AEROSPACE-ENGINEER",
        "name": "Aerospace Engineer",
    },
    "Licence": {
        "licence_id": "00000000-0000-4000-8000-000000000009",
        "licence_code": "LIC-DGCA-AMEL",
        "name": "DGCA Aircraft Maintenance Engineer Licence",
    },
}

SAMPLE_RELATIONSHIPS = {
    "REL-CONTAINS-FACULTY-DOMAIN": [("FAC-SCIENCE", "DOM-ENGINEERING")],
    "REL-CONTAINS-DOMAIN-STREAM": [("DOM-ENGINEERING", "STR-AEROSPACE-ENGINEERING")],
    "REL-PROGRESSES_THROUGH-STREAM-EDUCATION-STAGE": [("STR-AEROSPACE-ENGINEERING", "STAGE-UG")],
    "REL-REQUIRES_SUBJECT_COMBINATION-STREAM-SUBJECT-COMBINATION": [
        ("STR-AEROSPACE-ENGINEERING", "SUBCOM-PCM")
    ],
    "REL-AWARDS_DEGREE-STREAM-DEGREE": [("STR-AEROSPACE-ENGINEERING", "DEG-BTECH-AERO")],
    "REL-HAS_ENTRANCE_EXAM-STREAM-ENTRANCE-EXAM": [("STR-AEROSPACE-ENGINEERING", "EXAM-JEE-MAIN")],
    "REL-LEADS_TO-STREAM-CAREER-OUTCOME": [("STR-AEROSPACE-ENGINEERING", "CAREER-AEROSPACE-ENGINEER")],
    "REL-UNLOCKS-LICENCE-CAREER-OUTCOME": [("LIC-DGCA-AMEL", "CAREER-AEROSPACE-ENGINEER")],
    "REL-REQUIRES-EXAM-DEGREE-ENTRANCE-EXAM": [("DEG-BTECH-AERO", "EXAM-JEE-MAIN")],
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


def scalar(value: str) -> str:
    value = value.strip()
    if value.startswith('"') and value.endswith('"'):
        return value[1:-1]
    return value


def file_stem(value: str) -> str:
    return re.sub(r"[^a-z0-9]+", "_", value.lower()).strip("_")


def write_csv(path: Path, fieldnames: list[str], rows: list[dict[str, str]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames, lineterminator="\n")
        writer.writeheader()
        for row in rows:
            writer.writerow({field: row.get(field, "") for field in fieldnames})


def main() -> None:
    _, entities = parse_constrained_yaml(ENTITY_CATALOG)
    _, properties = parse_constrained_yaml(PROPERTY_CATALOG)
    _, relationships = parse_constrained_yaml(RELATIONSHIP_CATALOG)

    properties_by_entity: dict[str, list[str]] = defaultdict(list)
    for prop in properties:
        properties_by_entity[scalar(prop["entity_id"])].append(scalar(prop["name"]))

    for entity in entities:
        entity_id = scalar(entity["id"])
        label = scalar(entity["name"])
        fields = properties_by_entity[entity_id]
        rows = [SAMPLE_NODES[label]] if label in SAMPLE_NODES else []
        write_csv(NODE_DIR / f"{file_stem(label)}.csv", fields, rows)

    for rel in relationships:
        rel_id = scalar(rel["id"])
        rows = [
            {"source_code": source, "target_code": target}
            for source, target in SAMPLE_RELATIONSHIPS.get(rel_id, [])
        ]
        write_csv(REL_DIR / f"{file_stem(rel_id)}.csv", ["source_code", "target_code"], rows)

    print(f"Generated seed CSVs for {len(entities)} node labels and {len(relationships)} relationship patterns.")


if __name__ == "__main__":
    main()
