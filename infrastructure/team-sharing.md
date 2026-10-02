# Sharing the RSA Docker Environment

Docker separates four things that must not be confused:

1. **Image** — the packaged database software.
2. **Compose definition** — RSA's recipe for versions, ports, memory, network, and storage.
3. **Container** — one machine's running instance of an image.
4. **Data** — graph, vectors, and relational records stored outside the container layer.

Share images or image references, Compose files, environment-variable names, and database-native exports. Do not try to copy or share a running container.

## Current RSA image model

RSA currently uses public vendor images:

```text
neo4j:2026.09.0-community
qdrant/qdrant:v1.19.1
postgres:17.10-alpine3.24
```

There is no custom RSA application image yet. The web application currently runs with Node.js. Therefore, online team members do not need an RSA image registry: they clone the repository and Docker pulls the exact vendor images named by Compose.

## Option A — Give another developer an independent local stack

The developer needs Git, Docker Desktop or Docker Engine, and access to the repository.

```bash
git clone https://github.com/newrsa/rsa-aspiration-platform.git
cd rsa-aspiration-platform
cp infrastructure/.env.poc.example infrastructure/.env.poc
# Set fresh local secrets.
bash scripts/infrastructure/poc.sh up
```

This creates new containers and new volumes on that developer's computer. It does not copy the first developer's database. Load the seed dataset or an approved data subset afterward.

This is the preferred development workflow because it is reproducible and does not distribute shared administrator credentials.

## Option B — Share images without internet access

On a connected source machine:

```bash
docker pull neo4j:2026.09.0-community
docker pull qdrant/qdrant:v1.19.1
docker pull postgres:17.10-alpine3.24
docker image save \
  neo4j:2026.09.0-community \
  qdrant/qdrant:v1.19.1 \
  postgres:17.10-alpine3.24 \
  | gzip > rsa-poc-images.tar.gz
```

Transfer the archive through an approved file-sharing channel. On the recipient machine:

```bash
gzip -dc rsa-poc-images.tar.gz | docker image load
git clone https://github.com/newrsa/rsa-aspiration-platform.git
cd rsa-aspiration-platform
# Create infrastructure/.env.poc, then start normally.
bash scripts/infrastructure/poc.sh up
```

The archive contains software images only—not RSA database content or secrets.

## Option C — Give a developer access to one shared POC

Install Tailscale on the Windows host and each approved developer machine. Do not open router ports.

On the host:

1. Find the Windows Tailscale IPv4 address, normally in `100.64.0.0/10`.
2. In `infrastructure/.env.poc`, set:

```dotenv
RSA_BIND_ADDRESS=100.x.y.z
RSA_ADVERTISED_HOST=100.x.y.z
```

3. Recreate the containers:

```bash
bash scripts/infrastructure/poc.sh down
bash scripts/infrastructure/poc.sh up
```

4. Restrict access with the Tailscale access policy and Windows Firewall. Never expose these ports through the residential router.

Approved developers then use:

```dotenv
NEO4J_URI=neo4j://100.x.y.z:17687
NEO4J_USER=neo4j
NEO4J_PASSWORD=<distributed through an approved secret channel>
QDRANT_URL=http://100.x.y.z:16333
QDRANT_API_KEY=<distributed through an approved secret channel>
DATABASE_URL=postgresql://rsa_app:<url-encoded-password>@100.x.y.z:15432/rsa
```

Neo4j Browser is available at `http://100.x.y.z:17474` to users permitted by the tailnet policy.

A developer connecting to this shared host does not need Docker. They need Tailscale and whichever database clients or RSA application code they use.

## Sharing database content

Database data is separate from images and containers.

### Preferred development method

Share reviewed source datasets and deterministic loaders through Git or approved object storage. Each developer builds their own local data. This keeps provenance and schema generation reproducible.

### Neo4j

Use `neo4j-admin database dump` and `load`, not a raw copy of live database files. Community Edition requires an offline dump, so stop Neo4j first. The Phase 1 backup helper already follows this model for the Linux server.

### Qdrant

Create collection snapshots, download the snapshot files, and recover them through Qdrant's snapshot-upload API. Do not copy live Qdrant storage while it is running.

### Postgres

Use `pg_dump` in custom format and restore with `pg_restore`. Do not distribute the live Postgres data directory.

Exports may contain proprietary or sensitive data. Encrypt them in transit and at rest, checksum them after transfer, and keep them out of Git.

Relevant vendor procedures: [Neo4j dump and load](https://neo4j.com/docs/operations-manual/current/docker/dump-load/), [Qdrant snapshot creation](https://api.qdrant.tech/api-reference/snapshots/create-snapshot), [Qdrant snapshot download](https://api.qdrant.tech/api-reference/snapshots/get-snapshot), and [Qdrant recovery from an uploaded snapshot](https://api.qdrant.tech/api-reference/snapshots/recover-from-uploaded-snapshot).

## Secrets

- Commit `.env.example` files only.
- Never commit `.env`, `.env.local`, `.env.poc`, passwords, API keys, snapshot download URLs, or access tokens.
- Prefer individual developer accounts where the database edition supports them.
- For a shared Community Edition POC credential, distribute it through a password manager and rotate it when team membership changes.
- Use separate credentials for local POC, shared POC, cloud development, and production.

## When RSA has custom application images

Add a reviewed `Dockerfile`, build a versioned image, and publish it to the RSA organization registry, preferably GitHub Container Registry. Use immutable release tags and, for controlled deployments, image digests. Team members then authenticate to the registry and pull the image through Compose.

Do not use `docker commit` to turn an manually changed container into a team image. That loses the reproducible build instructions and makes security review difficult.
