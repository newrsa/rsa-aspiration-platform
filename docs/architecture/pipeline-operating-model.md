# Pipeline Operating Model

## Purpose

Define how RSA runs acquisition, extraction, validation, resolution, publishing,
and reconciliation without binding pipeline business logic to a particular
orchestration product.

## Runtime boundary

```text
Host scheduler / future orchestrator
                 |
                 v
       versioned pipeline command
                 |
        Postgres run ledger
                 |
       immutable Bronze input
                 |
       versioned Silver output
                 |
       review and publish ledger
          +------+------+
          |             |
        Neo4j         Qdrant
          +------+------+
                 |
          reconciliation
```

The scheduler starts work; it does not own source semantics. Pipeline commands
remain runnable and testable without Airflow, Airbyte, cron, or a web UI.

## Current Phase 1 components

| Concern | Current mechanism | Future extension |
| --- | --- | --- |
| Manual execution | Versioned commands under `scripts/` | Same commands invoked by Airflow tasks |
| Scheduling | `systemd` timer or cron on Ubuntu | Airflow after ADR-006 thresholds |
| Run state | Postgres ingestion and publishing tables | Airflow metadata supplements, not replaces, domain state |
| Structured acquisition | RSA file/API adapters | Airbyte connectors where recurring systems justify it |
| PDF/transcript parsing | RSA ingestion pipeline | Containerized workers if throughput requires it |
| Review | Postgres review states and governed files | Reviewer UI and assignment workflow |
| Publishing | Idempotent Neo4j/Qdrant publishers | Parallel workers coordinated by publish ledger |
| Reconciliation | Scheduled count/hash/reference checks | Airflow DAG when workflow scale warrants it |

## Required pipeline contract

Every production command must accept or derive:

- `run_id` and pipeline version;
- source ID and immutable source-version hash;
- input and output locations;
- environment name;
- concurrency and cost limits;
- dry-run mode where mutation risk exists.

Every command must emit:

- machine-readable status;
- record counts by outcome;
- duration and resource metrics;
- warnings, quarantines, and failures;
- output hashes and schema versions;
- enough information to resume or safely rerun.

## Scheduling policy

Schedule only jobs that already pass a manual idempotency test. A failed job must
resume from durable state or create a new attempt under the same logical run; it
must not silently duplicate graph nodes, vectors, documents, or relationships.

Recommended Phase 1 cadence:

- source discovery: weekly or manually after source approval;
- approved web acquisition: daily or weekly according to change rate;
- PDF/transcript extraction: event driven;
- embedding publication: batched after review;
- Neo4j/Qdrant reconciliation: after every publication and nightly when active;
- backups: daily, with periodic restore drills;
- source freshness review: monthly or source-specific.

## Airflow boundary

Airflow may eventually coordinate the commands, retries, dependencies, alerts,
and backfills. It must not contain the only copy of mapping rules, review state,
source manifests, or publish status. DAGs should be thin wrappers around reusable
pipeline packages.

Airflow must use a separate metadata database and account. Its UI is bound only
to localhost or the Tailscale network in the build phase. It receives an explicit
memory/CPU budget and must not reduce the approved Neo4j page cache or cause
Qdrant eviction under peak ingestion.

## Airbyte boundary

Airbyte is useful for repeatable transport from supported structured systems.
It may write into the Bronze layer or a dedicated landing schema. Data is not
canonical merely because a connector copied it successfully.

RSA validation, provenance, normalization, ontology alignment, review, and
publishing always occur after the connector boundary. Websites, PDFs, videos,
podcasts, O*NET distributions, and regulator publications continue through
source-specific RSA adapters unless a tested connector materially reduces work.

## Production promotion

The owned build plane produces a release manifest containing dataset version,
ontology version, source hashes, schema versions, embedding version, graph/vector
counts, validation results, and publication timestamp. The cloud serving plane
imports that tested release. It does not share the build server's writable
databases and does not wait on Airflow or Airbyte during an aspirant request.
