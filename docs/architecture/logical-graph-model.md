# Logical Graph Model

## Scope

This document records the runtime-neutral graph representation derived from the semantic registry. Populate it only after source ontology extraction is complete.

## Modeling rules

- Each catalog entity represents a distinct domain concept and has a stable identifier.
- Relationships carry semantic meaning; do not replace a governed relationship with an ambiguous property.
- Model universal facts in SCC. Keep user state in the Digital Twin and comparative policy in the Decision Engine.
- Record relationship direction, cardinality, mandatory status, and traversal purpose in the relationship catalog.
- Use the query catalog to justify denormalization and indexes in the physical model.

## Required outputs

| Output | Registry source |
| --- | --- |
| Node labels | Entity catalog |
| Relationship types | Relationship catalog |
| Property allocation | Property catalog |
| Integrity constraints | Validation and constraint catalogs |
| Query traversal patterns | Query catalog |

## Pending source extraction

The ontology, GAS rulebook, structural integrity set, and master test bank must be added to `ontology/` (or referenced with provenance) before this model can be completed without assumptions.
