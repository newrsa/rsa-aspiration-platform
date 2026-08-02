# RSA Career Guide — First run

## One-time preparation

1. Open Neo4j Desktop and start the loaded RSA database.
2. Make a copy of `.env.example` named `.env.local`.
3. Open `.env.local` and replace `replace-with-your-local-password` with the Neo4j database password.
4. Keep `.env.local` private. Git is configured not to upload it.
5. Install Node.js 22 or newer if Node.js is not already available.
6. In this folder, run `npm install` once.

## Start the chatbot

Double-click `Start RSA Career Guide.cmd`, or run `npm run dev`. Open `http://localhost:3000`.

The header should display the number of available pathways. If it says **Setup required**, confirm that Neo4j is running and the `.env.local` password is correct, then restart the website.

## Test from another device

See `docs/LOCAL_TEST_SERVER.md`. Other devices use this PC's address on port `3001`. Use only a trusted local network and do not expose the development server or Neo4j ports to the internet.
