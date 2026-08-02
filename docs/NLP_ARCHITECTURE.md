# NLP over the RSA knowledge graph

## Current pipeline

1. Accept a natural-language question.
2. Normalize text and classify the question into a governed intent.
3. Extract career, subject, domain, universe, examination, and qualification terms.
4. Select an approved parameterized Cypher template.
5. Execute it with read-only Neo4j credentials.
6. Build an answer exclusively from returned graph records.
7. Return pathway cards, graph nodes, confidence, and source metadata.

## Algorithms currently used

The production path is deterministic and explainable; it is not currently a trained neural model.

- Text normalization removes punctuation and normalizes case and whitespace.
- Rule-based intent classification uses reviewed phrases and regular expressions.
- Ontology entity recognition maps universe names and common domain terms to stable graph codes.
- Controlled synonym expansion maps expressions such as `fintech` to graph-compatible alternatives such as `digital finance`.
- Persona-aware routing selects separate intent catalogues for Aspirants and Leaders.
- Query-template selection maps each intent to reviewed, parameterized, read-only Cypher.
- Field-weighted lexical ranking scores direct matches in career, pathway and domain fields more highly than descriptive matches.
- Multi-concept coverage requires cross-domain questions to match both concepts rather than only one.
- Clarification rules stop broad questions from returning arbitrary database rows.
- Evidence-aware response composition varies by intent and refuses to invent missing eligibility or pathway evidence.

## Persona behaviour

The Aspirant persona supports career discovery, eligibility, examinations and interdisciplinary pathways. It prioritizes actionable routes, prerequisites, alternatives, confidence and evidence gaps.

The Leader persona supports universe details, total-versus-finalized record counts, ontology and instance-data maturity, backend entity composition, provenance and structural data-quality indicators. It intentionally distinguishes retained workbook-derived records from authoritative version baselines.

Persona selection changes interpretation and presentation. It is not authorization. Protected leader-only access requires authenticated user roles before production launch.

## Data-understanding contract

Natural-language terms never map directly to arbitrary Cypher. They resolve through controlled vocabulary, stable universe codes, approved graph labels and known properties. Every response should preserve five distinctions: ontology definition versus instance data; finalized baseline versus all loaded records; fact versus derived result; current evidence versus missing evidence; and source-backed result versus unverified claim.

## Next NLP increment

Convert the RSA Question Bank into a versioned intent catalogue containing example utterances, required parameters, clarification prompts, Cypher-template identifiers, and expected assertions. Add profile context for education stage, subjects, interests, location, budget, and preferred work mode.

An optional language model can later improve intent classification and answer phrasing. It must return validated structured JSON and must never execute arbitrary generated Cypher. The deterministic pipeline remains the fallback and source of control.

## Evaluation

For every Question Bank item, test intent accuracy, extracted parameters, selected query identifier, graph result correctness, evidence status, clarification behaviour, latency, and unsupported-claim rate. A response fails when it invents eligibility, institutions, examinations, salaries, or permissions absent from governed graph evidence.
