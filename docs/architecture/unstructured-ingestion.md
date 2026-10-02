# Unstructured Ingestion and Evidence Architecture

## Decision

Unstructured sources are an evidence layer, not an extension mechanism for the
canonical SCC ontology. Extraction may identify claims and propose mappings;
human review governs whether those claims support an existing ontology entity
or justify a separately governed ontology change.

## Data flow

```text
Approved source
      |
      v
Immutable acquisition + SHA-256
      |
      v
Layout-aware text extraction
      |
      v
Citation-preserving chunks (page or timestamp)
      |
      +----------> Postgres: canonical text and review state
      |
      +----------> Qdrant: embedding and citation payload
      |
      +----------> Neo4j: evidence metadata
                         |
                         v
                reviewed SUPPORTS links
```

## Evidence graph

```text
(SourceDocument)-[:HAS_CHUNK]->(EvidenceChunk)
(OntologyEntity)-[:SUPPORTED_BY_EVIDENCE]->(EvidenceChunk)
```

`SourceDocument` represents one immutable content version. A later publication
or changed web page creates a new version rather than silently replacing cited
evidence. `EvidenceChunk` carries the page range or media timestamp needed to
reconstruct a citation.

The graph stores an excerpt and retrieval metadata. Postgres stores complete
text. Qdrant stores the embedding and a payload containing `chunk_id`,
`document_id`, locator, categories, content hash, and source URL.

## Review states

- `proposed` - produced by deterministic or model-assisted mapping;
- `approved` - a reviewer confirmed that the chunk supports the entity;
- `rejected` - a reviewer found the match irrelevant or misleading;
- `superseded` - a newer evidence version replaced the reviewed claim.

Only `approved` rows may produce Neo4j `SUPPORTED_BY_EVIDENCE` relationships.
The review event records reviewer, timestamp, rationale, and pipeline version.

## Initial document-to-ontology mapping

| Source | Primary content | Candidate ontology areas |
| --- | --- | --- |
| National Education Policy 2020 | education stages, multidisciplinary programmes, multiple entry/exit, vocational learning, assessment and regulation | `EducationStage`, `Degree`, `Subject`, `Skill`, `Institution`, `RegulatoryBody`, `AdmissionPathway`, `EntranceExam` |
| 2 Years of NEP 2020 | implemented programmes, skill modules, vocational exposure, examinations and teacher education | `Skill`, `Subject`, `CareerOutcome`, `Institution`, `RegulatoryBody`, `EntranceExam`, `Degree` |
| National Credit Framework | credit levels, accumulation, transfer, qualifications, Academic Bank of Credits and vocational equivalence | `EducationStage`, `Degree`, `Certification`, `Skill`, `Subject`, `Institution`, `RegulatoryBody`, `AdmissionPathway` |

The mapping table identifies candidate areas; it does not assert relationships.
Evidence becomes queryable only after entity-level review.

## Answering contract

An aspirant-facing answer may cite an evidence chunk only when:

1. the source version and content hash are recorded;
2. a page or timestamp locator is available;
3. retrieval returns the chunk itself, not merely a document title;
4. any ontology relationship used in the explanation is canonical or reviewed;
5. the answer distinguishes policy, implementation evidence, and current facts;
6. stale or superseded content is not presented as current.

## Website acquisition controls

- Maintain an explicit domain and path allowlist.
- Check robots.txt on every run and cache the decision with the run record.
- Use a descriptive user agent and conservative delay.
- Never bypass authentication, CAPTCHAs, 403 responses, or technical controls.
- Prefer official PDFs, notices, feeds, sitemaps, and APIs to broad crawling.
- Store retrieval time, final URL, HTTP validators, and content hash.
- Quarantine navigation, duplicate, login, search-result, and low-text pages.

## Media transcripts

For an official transcript, preserve the supplied timestamps. For speech-to-text,
store the media URL, transcription model/version, language, confidence when
available, and timestamp bounds. Generated transcripts require review before
they can support an aspirant answer.
