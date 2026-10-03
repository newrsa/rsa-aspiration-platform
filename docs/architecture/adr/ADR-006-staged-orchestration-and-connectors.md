# ADR-006: Adopt Orchestration and Connector Platforms Only at Measured Scale

- **Status:** Accepted
- **Date:** 2026-10-03
- **Decision owners:** RSA platform team

## Context

RSA needs repeatable pipelines for structured files, APIs, websites, PDFs, and
media transcripts. The present build plane has three durable stores and a small
number of manually initiated, idempotent ingestion jobs. The current Windows POC
has 16 GB of RAM; the planned Ubuntu build server has 64 GB but reserves most of
its memory for Neo4j page cache, Qdrant, Postgres, and extraction workloads.

Apache Airflow provides scheduling, dependency management, retries, backfills,
and operational visibility. Its official Docker Compose guide is a local
quickstart, calls for at least 4 GB and ideally 8 GB of Docker memory, and is not
the recommended production deployment model.

Airbyte provides reusable connectors for recurring structured-system
replication. Its current self-managed quickstart uses `abctl` to operate Airbyte
on a local Kubernetes cluster and recommends at least 8 GB of memory. Most of
RSA's immediate sources - PDFs, reviewed web pages, transcripts, ontology files,
and O*NET distribution files - still require RSA-specific parsing and governance
after acquisition.

## Decision

The core `docker-compose.yml` remains limited to Neo4j, Qdrant, and Postgres.
Neither Airflow nor Airbyte is added to the always-on data-store stack in the
current phase.

Phase 1 pipelines use versioned Python commands, Postgres run state, and a host
scheduler such as a `systemd` timer or cron. Every job must be idempotent,
restartable, observable, and safe to rerun before it is eligible for scheduling.

Airflow is adopted as a **separate orchestration deployment** only when at least
one of these conditions is met:

- five or more production workflows have interdependent schedules;
- routine backfills, branching, retries, or concurrency are difficult to manage
  with the Postgres run ledger and host scheduler;
- multiple operators need a shared workflow UI, audit history, and alerting;
- measured pipeline duration or failure rate requires distributed workers;
- an ingestion service-level objective is approved.

When adopted, Airflow receives its own database, credentials, volumes, resource
budget, network boundary, backups, and deployment lifecycle. The local Compose
quickstart may be used for evaluation only. Cloud production should use an
approved managed service or reviewed production deployment rather than the
quickstart configuration.

Airbyte is adopted only when recurring transfers from supported structured
systems justify operating it, such as several SaaS applications, databases, or
change-data-capture streams. It is not the crawler, PDF parser, transcript
processor, ontology mapper, or evidence reviewer. A connector may land immutable
source data in Bronze storage, after which the normal RSA pipeline takes over.

For one or two early connector use cases, a narrow source adapter or an evaluated
Python connector library is preferred to a permanently running Airbyte control
plane. A full Airbyte deployment remains separate from the core Compose project.

No orchestration or connector platform participates in the aspirant-facing
request path. The serving plane consumes only tested and promoted data releases.

## Consequences

- The POC remains usable on a 16 GB machine.
- The 64 GB server preserves memory for database caches and extraction jobs.
- Pipeline code must expose stable command-line and data contracts instead of
  embedding behavior inside an orchestrator.
- RSA avoids coupling source semantics to Airbyte connector schemas or Airflow
  DAG implementation details.
- Adding Airflow later becomes a scheduling change, not a pipeline rewrite.
- Adding Airbyte later becomes an acquisition adapter, not a new source of truth.
- Operations must maintain a simple host scheduler and Postgres run ledger in
  the interim.

## Revisit triggers

Review this decision quarterly during active ingestion and whenever workflow
count, connector count, operator count, backfill frequency, ingestion SLOs, or
resource measurements cross the thresholds above.

## Primary references

- Apache Airflow Docker Compose guide: https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html
- Apache Airflow production deployment: https://airflow.apache.org/docs/apache-airflow/stable/administration-and-deployment/production-deployment.html
- Apache Airflow Helm chart: https://airflow.apache.org/docs/helm-chart/stable/index.html
- Airbyte self-managed quickstart: https://docs.airbyte.com/platform/using-airbyte/getting-started/oss-quickstart
- Airbyte high-level architecture: https://docs.airbyte.com/platform/understanding-airbyte/high-level-view
