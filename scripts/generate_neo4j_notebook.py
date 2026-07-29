#!/usr/bin/env python3
"""Generate a single manual Neo4j Browser notebook from runtime Cypher files."""

from __future__ import annotations

from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
NOTEBOOK = ROOT / "neo4j" / "notebooks" / "manual_seed_smoke_test.cypher"

SECTIONS = [
    (
        "01 Parameters",
        """// Update this parameter if you place the seed CSVs elsewhere in Neo4j's import directory.
:param csv_base_url => 'file:///rsa/seed/';
""",
    ),
    ("02 Identity Constraints", (ROOT / "neo4j" / "constraints" / "01_node_identity_constraints.cypher").read_text(encoding="utf-8")),
    (
        "03 Required Property Constraints",
        """// These constraints require a Neo4j edition that supports node property existence constraints.
// If your Neo4j environment rejects this section, skip it and continue with the next section.

"""
        + (ROOT / "neo4j" / "constraints" / "02_required_property_constraints.cypher").read_text(encoding="utf-8"),
    ),
    ("04 Lookup Indexes", (ROOT / "neo4j" / "indexes" / "01_lookup_indexes.cypher").read_text(encoding="utf-8")),
    ("05 Full-Text Indexes", (ROOT / "neo4j" / "indexes" / "02_fulltext_indexes.cypher").read_text(encoding="utf-8")),
    (
        "06 Load Nodes",
        """// Before running this section, copy datasets/seed into Neo4j's import directory as rsa/seed.
// Expected example path inside Neo4j import directory: rsa/seed/nodes/faculty.csv

"""
        + (ROOT / "neo4j" / "loaders" / "01_load_nodes.cypher").read_text(encoding="utf-8"),
    ),
    ("07 Load Relationships", (ROOT / "neo4j" / "loaders" / "02_load_relationships.cypher").read_text(encoding="utf-8")),
    ("08 Smoke Queries", (ROOT / "neo4j" / "queries" / "01_smoke_test.cypher").read_text(encoding="utf-8")),
    (
        "09 Structural Validation",
        """// These queries should return zero rows for violation checks, except the placeholder scholarship check.

"""
        + (ROOT / "neo4j" / "validation" / "01_structural_integrity.cypher").read_text(encoding="utf-8"),
    ),
]


def main() -> None:
    NOTEBOOK.parent.mkdir(parents=True, exist_ok=True)
    lines = [
        "// RSA Knowledge Platform - Manual Neo4j Seed Smoke-Test Notebook",
        "// Open this file in Neo4j Browser or copy one section at a time.",
        "// Generated from the canonical Neo4j runtime artifacts.",
        "",
        "// Manual preparation:",
        "// 1. Start a local Neo4j database.",
        "// 2. Copy datasets/seed into Neo4j's import directory as rsa/seed.",
        "// 3. Run each numbered section below in order.",
        "",
    ]
    for title, body in SECTIONS:
        lines.extend(
            [
                "",
                "// -----------------------------------------------------------------------------",
                f"// {title}",
                "// -----------------------------------------------------------------------------",
                "",
                body.strip(),
                "",
            ]
        )
    NOTEBOOK.write_text("\n".join(lines).rstrip() + "\n", encoding="utf-8")
    print(f"Generated {NOTEBOOK.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
