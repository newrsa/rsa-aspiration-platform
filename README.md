# RSA Career Knowledge Platform

An aspirant-facing conversational application built on the RSA SCC Neo4j knowledge graph. It interprets natural-language career questions, maps them to reviewed read-only Cypher templates, queries Neo4j, and presents grounded pathway results with confidence information.

## What is included

- Aspirant chatbot website
- Local NLP intent and entity router with no model cost
- Server-side Neo4j connection; credentials never enter browser code
- Approved, parameterized, read-only graph queries
- Focused pathway and graph result views
- Health endpoint and beginner-friendly setup feedback
- Complete ontology, CSV, Cypher, validation, and reference package in `knowledge-graph/`

## Local setup

1. Install Node.js 22 or newer.
2. Start the loaded RSA database in Neo4j Desktop.
3. Copy `.env.example` to `.env.local`.
4. Enter the local Neo4j password in `.env.local`.
5. Run `npm install`.
6. Run `npm run dev` for this PC only, or `npm run dev:lan` for testing from devices on the same network.
7. Open `http://localhost:3000` on this PC.

See `docs/LOCAL_TEST_SERVER.md` before allowing access from another device.

## NLP design

The first release deliberately does not execute model-generated Cypher. The NLP layer classifies an intent, extracts relevant terms, selects an approved query, and returns grounded graph results. See `docs/NLP_ARCHITECTURE.md`.

## Security

- Never commit `.env.local`.
- Do not expose Neo4j ports 7474 or 7687 to the internet.
- Do not port-forward the development server from the router.
- Use the current application only on this PC or a trusted local network.
- Add authentication, HTTPS, rate limiting, and production process supervision before public deployment.
