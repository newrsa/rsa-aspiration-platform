# NLP over the RSA knowledge graph

## Current pipeline

1. Accept a natural-language question.
2. Normalize text and classify the question into a governed intent.
3. Extract career, subject, domain, universe, examination, and qualification terms.
4. Select an approved parameterized Cypher template.
5. Execute it with read-only Neo4j credentials.
6. Build an answer exclusively from returned graph records.
7. Return pathway cards, graph nodes, confidence, and source metadata.

Initial intents are career discovery, eligibility, examinations, interdisciplinary discovery, graph coverage, and source traceability.

## Next NLP increment

Convert the RSA Question Bank into a versioned intent catalogue containing example utterances, required parameters, clarification prompts, Cypher-template identifiers, and expected assertions. Add profile context for education stage, subjects, interests, location, budget, and preferred work mode.

An optional language model can later improve intent classification and answer phrasing. It must return validated structured JSON and must never execute arbitrary generated Cypher. The deterministic pipeline remains the fallback and source of control.

## Evaluation

For every Question Bank item, test intent accuracy, extracted parameters, selected query identifier, graph result correctness, evidence status, clarification behaviour, latency, and unsupported-claim rate. A response fails when it invents eligibility, institutions, examinations, salaries, or permissions absent from governed graph evidence.
