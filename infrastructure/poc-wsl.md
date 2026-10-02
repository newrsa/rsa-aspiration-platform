# Windows + Ubuntu WSL Docker POC

This runbook creates a disposable proof of concept on a 16 GB Windows computer. It runs the same pinned Neo4j, Qdrant, and Postgres images as the server design, but applies an 8 GB combined container ceiling and stores database files in Docker-managed Linux volumes.

Do not use this profile for full ingestion, performance testing, or authoritative data.

Official references: [Docker Desktop for Windows installation](https://docs.docker.com/desktop/setup/install/windows-install/), [Docker Desktop WSL 2 backend](https://docs.docker.com/desktop/features/wsl/), and [Docker's WSL development workflow](https://docs.docker.com/desktop/features/wsl/use-wsl/).

## POC layout

| Store | Container | Windows port | Memory ceiling | Persistent volume |
|---|---|---:|---:|---|
| Neo4j | `rsa-neo4j` | 17474 / 17687 | 5 GB | `rsa-poc-neo4j-data` |
| Qdrant | `rsa-qdrant` | 16333 / 16334 | 2 GB | `rsa-poc-qdrant-data` |
| Postgres | `rsa-postgres` | 15432 | 1 GB | `rsa-poc-postgres-data` |

The alternate ports allow the POC to coexist with Neo4j Desktop on its usual ports 7474 and 7687.

## 1. Prepare Windows and WSL

Open PowerShell and check WSL:

```powershell
wsl --version
wsl --update
wsl --list --verbose
```

Ubuntu must show version 2. Restart Windows if the WSL update requests it.

Close memory-heavy applications before starting the stack. On a 16 GB computer, avoid running a large Neo4j Desktop database at the same time as ingestion inside the POC.

## 2. Install Docker Desktop

1. Download Docker Desktop for Windows from the official Docker website.
2. Choose the recommended per-user installation.
3. Keep the WSL 2 backend selected.
4. Start Docker Desktop and accept its terms.
5. In **Settings → General**, confirm **Use the WSL 2 based engine**.
6. In **Settings → Resources → WSL Integration**, enable the Ubuntu distribution.
7. Apply the settings and restart Docker Desktop if requested.

Docker Desktop requires a qualifying subscription for some larger commercial organizations. Confirm RSA's eligibility before organizational deployment.

Open Ubuntu and verify:

```bash
docker version
docker compose version
docker run --rm hello-world
```

Do not install a second Docker Engine inside Ubuntu when using Docker Desktop. Two engines create confusing, separate sets of images, containers, and volumes.

## 3. Keep the repository in Ubuntu

Docker recommends storing active source under the Linux filesystem for the best WSL performance:

```bash
mkdir -p ~/src
cd ~/src
git clone https://github.com/newrsa/rsa-aspiration-platform.git
cd rsa-aspiration-platform
```

If the repository is private, authenticate GitHub in WSL using GitHub CLI or a credential helper. Never put a personal access token directly in the clone URL or commit it to a file.

## 4. Create the private POC configuration

```bash
cp infrastructure/.env.poc.example infrastructure/.env.poc
chmod 600 infrastructure/.env.poc
nano infrastructure/.env.poc
```

Replace all three `replace-with-...` values with different random secrets. Generate a value with:

```bash
openssl rand -base64 36
```

If a Postgres password contains URL-special characters, URL-encode it in `DATABASE_URL`; keep the unencoded value in `POSTGRES_PASSWORD`.

Validate the merged configuration without starting anything:

```bash
bash scripts/infrastructure/poc.sh config >/tmp/rsa-poc-compose.txt
```

Treat the generated file as sensitive because the expanded Compose model contains credentials. Delete it after inspection:

```bash
rm /tmp/rsa-poc-compose.txt
```

## 5. Start and verify the stack

```bash
bash scripts/infrastructure/poc.sh up
bash scripts/infrastructure/poc.sh status
```

Expected containers:

```text
rsa-neo4j
rsa-qdrant
rsa-postgres
```

Useful endpoints:

- Neo4j Browser: `http://localhost:17474`
- Neo4j Bolt: `neo4j://localhost:17687`
- Qdrant dashboard/API: `http://localhost:16333/dashboard`
- Postgres: `localhost:15432`

View service output with:

```bash
bash scripts/infrastructure/poc.sh logs
```

## 6. Load and validate the RSA seed graph

1. Open `http://localhost:17474`.
2. Connect with user `neo4j` and the password from `infrastructure/.env.poc`.
3. Open `neo4j/notebooks/manual_seed_smoke_test.cypher` from the repository.
4. Confirm its CSV parameter is `file:///seed/`.
5. Run its sections in order: constraints, indexes, nodes, relationships, smoke queries, and structural validation.
6. Run `neo4j/notebooks/query_capability_cookbook.cypher` for representative business questions.

The `datasets` directory is mounted read-only at `/import`, so `file:///seed/...` resolves to the generated seed CSVs without copying them into a container.

## 7. Connect the web application

Create `.env.local` from the root `.env.example` and use:

```dotenv
NEO4J_URI=neo4j://localhost:17687
NEO4J_USER=neo4j
NEO4J_PASSWORD=<same value as infrastructure/.env.poc>
```

Then run:

```bash
npm ci
npm test
npm run dev
```

Open `http://localhost:3000` and confirm the dashboard reads the containerized Neo4j graph.

## 8. Stop and restart safely

```bash
# Stop and remove containers; named-volume data remains.
bash scripts/infrastructure/poc.sh down

# Recreate containers and reuse the existing data.
bash scripts/infrastructure/poc.sh up
```

Verify persistence by creating or loading data, running `down`, running `up`, and checking that the data remains.

Never add `--volumes` unless the POC data has been exported and you deliberately intend to erase it. The helper refuses to automate that destructive operation.

## 9. Optional WSL memory guardrail

If WSL retains too much host memory, copy the settings from `infrastructure/wslconfig.poc.example` to `C:\Users\<your-user>\.wslconfig`, then run this in PowerShell:

```powershell
wsl --shutdown
```

Restart Docker Desktop afterward. The example caps WSL at 10 GB and enables gradual unused-memory reclamation.

## Acceptance checklist

- All three containers report running.
- Neo4j Browser opens on port 17474.
- Qdrant `/readyz` succeeds on port 16333 with its API key.
- Postgres `pg_isready` succeeds.
- Seed graph loads without missing-file errors.
- Structural validation returns no unexpected violations.
- Application tests pass and the dashboard connects.
- Data survives a `down` followed by `up`.
