#!/usr/bin/env python3
"""Create the initial RSA Knowledge Platform repository scaffold.

Usage:
    python bootstrap_rsa_repository.py [target-directory]
"""

from __future__ import annotations

import sys
from pathlib import Path


ROOT_NAME = "rsa-knowledge-platform"

FILES = {
    "README.md": """# RSA Knowledge Platform

The RSA Knowledge Platform (RKP) is an ontology-driven, explainable career-intelligence foundation. Neo4j is the first runtime; the semantic registry is the engineering source of truth.

## Repository map

- `docs/` — architecture, governance, glossary, and architecture decision records (ADRs).
- `semantic-kernel/` — invariant semantic and governance rules.
- `semantic-registry/` — machine-readable catalogs that drive implementation.
- `ontology/` — source ontology material and its normalized representations.
- `neo4j/` — generated and hand-maintained runtime assets, loaders, validation, and query examples.
- `scripts/` — generators, validators, and operational helpers.
- `tests/` — registry, schema, and query acceptance tests.

## Bootstrap

Run `python bootstrap_rsa_repository.py` from the parent directory to create this scaffold. The bootstrap is idempotent: it does not overwrite existing files.

## Principles

1. Ontology is the canonical semantic source of truth.
2. The semantic registry is the engineering source of truth.
3. Master test-bank questions map to explicit, explainable traversals.
4. SCC stores universal facts; user state and comparative decisions remain outside it.

See [`docs/architecture/enterprise-architecture.md`](docs/architecture/enterprise-architecture.md) and [`semantic-registry/specification/semantic-registry-specification.yaml`](semantic-registry/specification/semantic-registry-specification.yaml).
""",
    ".gitignore": """__pycache__/\n*.py[cod]\n.venv/\n.env\n.idea/\n.vscode/\n.DS_Store\n""",
    "docs/architecture/enterprise-architecture.md": """# Enterprise Architecture Review

## Purpose

Define the reference architecture for the RSA Knowledge Platform (RKP) and its first runtime, the RSA Science Runtime (RSR).

## Platform boundary

The knowledge graph stores governed, universal facts. The Decision Engine owns comparative reasoning; the Digital Twin owns user-specific state; LLMs explain verified graph evidence rather than author facts.

## Architecture principles

1. Ontology first.
2. Query-driven design.
3. Modular universes and peer ontologies.
4. Explainability by explicit traversal.
5. Generation over duplicated definitions.
6. Governance, provenance, and versioning by design.

## Initial acceptance criteria

- Registry references are internally valid.
- GAS naming and identity rules are represented in the registry.
- Structural integrity validations are executable.
- Each supported test-bank capability has a query-registry entry.
- Neo4j artifacts can be generated without redefining semantics.
""",
    "docs/governance/engineering-principles.md": """# Engineering Principles

- Define a concept once, in the semantic registry.
- Prefer generated artifacts over parallel manual definitions.
- Version ontology, registry, data, rules, and runtime artifacts.
- Treat every relationship as a governed semantic contract.
- Keep business policy separate from universal graph facts.
- Make every answer traceable to evidence and traversal paths.
""",
    "docs/governance/glossary.md": """# Glossary

| Term | Meaning |
| --- | --- |
| RKP | RSA Knowledge Platform: the standards, registry, generators, and runtime contracts. |
| RSR | RSA Science Runtime: the first Neo4j implementation of RKP. |
| SCC | Science Career Conceptual ontology / universal science-career knowledge boundary. |
| Semantic Registry | Machine-readable catalog of entities, properties, relationships, rules, constraints, indexes, and queries. |
| Digital Twin | Peer domain for user-specific data and state; it is outside SCC. |
""",
    "docs/architecture/adr/ADR-001-ontology-is-canonical.md": """# ADR-001: Ontology is the canonical semantic source

**Status:** Accepted  
**Decision:** Business semantics originate in the ontology; generated/runtime artifacts must not redefine them.  
**Consequences:** Ontology changes require registry review and regenerated downstream artifacts.
""",
    "docs/architecture/adr/ADR-002-semantic-registry-is-engineering-source.md": """# ADR-002: Semantic Registry is the engineering source

**Status:** Accepted  
**Decision:** The semantic registry is the authoritative machine-readable engineering definition.  
**Consequences:** Constraints, indexes, docs, validations, and templates should derive from it where practical.
""",
    "docs/architecture/adr/ADR-003-neo4j-is-first-runtime.md": """# ADR-003: Neo4j is the first runtime

**Status:** Accepted  
**Decision:** Neo4j is the initial graph runtime, not the semantic platform itself.  
**Consequences:** Preserve runtime-neutral semantic definitions; isolate Neo4j-specific generation details.
""",
    "semantic-kernel/semantic-kernel.md": """# RSA Semantic Kernel

The kernel contains cross-universe rules that are intentionally stable:

- Stable identity and immutable reference codes.
- One canonical semantic definition per entity, property, and relationship.
- Explicit relationship direction, cardinality, and validation.
- Ownership, lifecycle, provenance, review, and version metadata.
- Machine-verifiable integrity rules.
- Explainable traversal paths for supported questions.
""",
    "semantic-registry/README.md": """# Semantic Registry

Catalogs are deliberately separate so their lifecycles remain clear. Cross-catalog references use stable IDs such as `ENT-FACULTY`, `REL-LEADS-TO`, and `VAL-CAREER-REACHABLE`.

Populate the catalogs from the approved ontology, GAS rulebook, structural tests, and master test bank. Do not add implementation-only meanings here.
""",
    "semantic-registry/specification/semantic-registry-specification.yaml": """registry:
  id: RSA-SEMANTIC-REGISTRY
  name: RSA Semantic Registry
  version: 0.1.0
  status: draft
  canonical_semantic_source: ontology
  catalogs:
    - entity-catalog
    - relationship-catalog
    - property-catalog
    - validation-catalog
    - constraint-catalog
    - index-catalog
    - query-catalog
    - business-rule-catalog
    - enumeration-catalog
    - source-authority-catalog
  cross_catalog_rules:
    - Entities may reference only registered properties and relationships.
    - Relationships must reference registered source and target entities.
    - Constraints and indexes must reference registered entity properties.
    - Queries must identify traversal, acceptance criteria, and routing scope.
""",
    "semantic-registry/entity-catalog/entities.yaml": """entities:
  - id: ENT-EXAMPLE
    name: ExampleEntity
    status: placeholder
    version: 0.1.0
    owner: SCC
    stability: reference
    description: Replace with an ontology-derived entity definition.
    mandatory_property_ids: []
    optional_property_ids: []
    relationship_ids: []
    validation_rule_ids: []
""",
    "semantic-registry/relationship-catalog/relationships.yaml": """relationships:
  - id: REL-EXAMPLE
    name: EXAMPLE_RELATIONSHIP
    status: placeholder
    source_entity_id: ENT-EXAMPLE
    target_entity_id: ENT-EXAMPLE
    cardinality: many_to_many
    mandatory: false
    semantic_meaning: Replace with an ontology-derived relationship.
    validation_rule_ids: []
""",
    "semantic-registry/property-catalog/properties.yaml": """properties:
  - id: PROP-EXAMPLE-CODE
    name: example_code
    status: placeholder
    datatype: string
    required: true
    unique: true
    indexed: true
    description: Replace with a registered ontology property.
""",
    "semantic-registry/validation-catalog/validations.yaml": """validations:
  - id: VAL-EXAMPLE
    name: example_validation
    status: placeholder
    severity: error
    applies_to: ENT-EXAMPLE
    rationale: Replace with an ontology, GAS, or structural-test rule.
    automated: false
    test_query: null
""",
    "semantic-registry/constraint-catalog/constraints.yaml": """constraints: []
# Add generated Neo4j constraints only after the property and entity catalogs are approved.
""",
    "semantic-registry/index-catalog/indexes.yaml": """indexes: []
# Add query-driven index definitions after the query capability matrix is populated.
""",
    "semantic-registry/query-catalog/queries.yaml": """queries:
  - id: QRY-EXAMPLE
    business_question: Replace with a Master Test Bank question.
    status: placeholder
    category: unclassified
    intent: unknown
    required_entity_ids: []
    required_relationship_ids: []
    traversal_pattern: []
    acceptance_criteria: []
    peer_ontology_routing: undecided
""",
    "semantic-registry/business-rule-catalog/business-rules.yaml": """business_rules: []
# Policies remain separate from universal graph facts.
""",
    "semantic-registry/enumeration-catalog/enumerations.yaml": """enumerations: []
# Register controlled vocabularies here rather than scattering literals through code.
""",
    "semantic-registry/source-authority-catalog/authorities.yaml": """authorities: []
# Register external authorities to support provenance and future citations.
""",
    "ontology/README.md": """# Ontology Sources

Store approved source ontology files and normalized representations here. Preserve originals, record version and source context, and avoid editing source material in place.
""",
    "neo4j/README.md": """# Neo4j Runtime

This directory will hold generated schema, constraints, indexes, loaders, validation queries, and query examples. No production Cypher is committed until the semantic registry and graph model are approved.
""",
    "neo4j/schema/.gitkeep": "",
    "neo4j/constraints/.gitkeep": "",
    "neo4j/indexes/.gitkeep": "",
    "neo4j/loaders/.gitkeep": "",
    "neo4j/validation/.gitkeep": "",
    "neo4j/queries/.gitkeep": "",
    "scripts/README.md": """# Automation Scripts

Place registry validation and artifact generators here. Scripts must be deterministic and should not overwrite reviewed artifacts without an explicit output path.
""",
    "tests/README.md": """# Tests

Future suites cover registry consistency, generated Neo4j schema, structural integrity requirements, and query acceptance tests derived from the Master Test Bank.
""",
    "graphrag/README.md": """# GraphRAG Extension

Reserved for evidence, document/chunk provenance, retrieval configuration, and citation policies. It is intentionally separate from SCC universal facts.
""",
    "api/README.md": """# API Contracts

Reserved for generated OpenAPI and GraphQL contracts derived from approved semantic and query registries.
""",
}


def bootstrap(root: Path) -> None:
    for relative, content in FILES.items():
        destination = root / relative
        destination.parent.mkdir(parents=True, exist_ok=True)
        if destination.exists():
            print(f"exists  {destination.relative_to(root)}")
            continue
        destination.write_text(content, encoding="utf-8")
        print(f"created {destination.relative_to(root)}")
    script_copy = root / "scripts" / "bootstrap_repository.py"
    if not script_copy.exists():
        script_copy.write_text(Path(__file__).read_text(encoding="utf-8"), encoding="utf-8")
        print(f"created {script_copy.relative_to(root)}")


if __name__ == "__main__":
    if len(sys.argv) > 1:
        target = Path(sys.argv[1])
    else:
        current_directory = Path.cwd()
        target = (
            current_directory
            if current_directory.name == ROOT_NAME
            and (current_directory / "semantic-registry").is_dir()
            else current_directory / ROOT_NAME
        )
    bootstrap(target.resolve())
    print(f"\nRSA repository scaffold ready: {target.resolve()}")
