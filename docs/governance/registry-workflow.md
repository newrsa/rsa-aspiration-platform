# Semantic Registry Workflow

## Purpose

The registry converts approved semantic sources into governed, machine-checkable engineering definitions. It must be updated before generated Neo4j, API, documentation, or test artifacts.

## Change sequence

1. Preserve the approved source material in `ontology/` and record its version.
2. Add or update catalog records using stable IDs.
3. Run `python scripts/validate_registry.py`.
4. In strict mode, resolve placeholder records and broken references: `python scripts/validate_registry.py --strict`.
5. Review the logical and physical graph impact.
6. Generate or update downstream runtime artifacts.
7. Commit the registry and derived artifacts together.

## Source precedence

1. Approved ontology: semantic meaning.
2. GAS rulebook: implementation conventions and governance.
3. Structural integrity tests: mandatory validation requirements.
4. Master test bank: supported query capabilities and acceptance criteria.

## Stable identifiers

| Catalog | Format | Example |
| --- | --- | --- |
| Entity | `ENT-<NAME>` | `ENT-FACULTY` |
| Relationship | `REL-<NAME>` | `REL-LEADS-TO` |
| Property | `PROP-<ENTITY>-<NAME>` | `PROP-CAREER-CODE` |
| Validation | `VAL-<NAME>` | `VAL-CAREER-REACHABLE` |
| Query | `QRY-<DOMAIN>-<NUMBER>` | `QRY-ELIGIBILITY-001` |

## Catalog lifecycle

`placeholder` records establish the scaffold only. They must be replaced with approved entries before implementation generation or a strict validation pass.
