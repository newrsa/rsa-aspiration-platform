# ADR-004: Add test-required SCC relationship extensions

**Status:** Accepted  
**Decision:** Add `UNLOCKS` from `Licence` to `CareerOutcome` and `REQUIRES_EXAM` from `Degree` to `EntranceExam` as proposed v0.6.1 registry relationship patterns.

## Context

The Structural Integrity Test Set requires both relationships for licence-based career reachability (T42–T44) and orphan-exam detection (T48). Neither appears in the ontology v0.6 canonical relationship inventory.

## Consequences

- The effective registry contains 59 directed relationship patterns.
- Both extensions retain Structural Test and reconciliation provenance.
- Generated Cypher may use the extensions, but source ontology v0.6 remains preserved unchanged.
- The next approved ontology/GAS release should absorb, amend, or deprecate these patterns explicitly.
