// 1. Show the ingested evidence corpus.
MATCH (d:SourceDocument)-[:HAS_CHUNK]->(c:EvidenceChunk)
RETURN d.title AS source,
       d.publication_date AS published,
       count(c) AS chunks
ORDER BY source;

// 2. Find page-cited evidence for an aspirant question about transferable credits.
MATCH (d:SourceDocument)-[:HAS_CHUNK]->(c:EvidenceChunk)
WHERE toLower(c.excerpt) CONTAINS 'academic bank of credit'
RETURN d.title AS source,
       c.locator_type AS locator_type,
       c.locator_start AS page_or_time,
       c.excerpt AS evidence
ORDER BY source, toInteger(c.locator_start)
LIMIT 10;

// 3. Find evidence about vocational skills and career preparation.
MATCH (d:SourceDocument)-[:HAS_CHUNK]->(c:EvidenceChunk)
WHERE 'skills_and_vocational' IN c.categories
  AND ('careers_and_employability' IN c.categories OR toLower(c.excerpt) CONTAINS 'career')
RETURN d.title AS source,
       c.locator_start AS page_or_time,
       c.excerpt AS evidence
LIMIT 10;

// 4. Auditable safety check: no unreviewed ontology evidence links should exist.
MATCH ()-[r:SUPPORTED_BY_EVIDENCE]->(:EvidenceChunk)
RETURN count(r) AS approved_evidence_links;
