# Source Reconciliation Register

## Baseline

The initial ontology extraction generated 33 declared entity sections, 652 domain-property records, and 57 directed relationship patterns. The ontology summary describes these as 33 variants / 32 entity types and approximately 600 domain properties; the generated registry preserves every declared section and table row for review.

## Blocking discrepancies before audit Cypher generation

| ID | Sources | Finding | Impact | Required disposition |
| --- | --- | --- | --- | --- |
| REC-001 | Structural T42/T43/T44; ontology §10 | Tests refer to `(:Licence)-[:UNLOCKS]->(:CareerOutcome)`, but `UNLOCKS` is absent from the canonical relationship inventory. | Licence-based career reachability cannot be faithfully audited. | Add a governed `UNLOCKS` relationship pattern or amend the tests to use a declared relationship. |
| REC-002 | Structural T48; ontology §10 | T48 refers to `(:Degree)-[:REQUIRES_EXAM]->(:EntranceExam)`, but `REQUIRES_EXAM` is absent from the canonical relationship inventory. | Orphan-exam validation is incomplete. | Add a governed `REQUIRES_EXAM` pattern or amend T48 to the approved model. |
| REC-003 | Structural T46; GAS §11.6 | The structural test recommends weighted-average Digital Twin weights; GAS specifies primary-parent threshold precedence and additive requirement union. | No SCC schema change is implied, but Digital Twin ownership must remain explicit. | Treat GAS as the SCC contract; record any Digital Twin aggregation rule in its peer ontology. |

## Non-blocking interpretation

- Test-bank category coverage can be registered now, but individual question-to-traversal mappings require the complete question text, not category summaries alone.
- Physical constraints and indexes remain pending query-pattern design; they must not be inferred from property names alone.
