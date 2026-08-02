# Secure external tester tunnel

This setup exposes only the RSA Career Guide website. Neo4j remains bound to localhost and is never published directly.

## One-time ngrok account connection

1. Create or sign in to an ngrok account at `https://dashboard.ngrok.com/signup`.
2. Open **Your Authtoken** in the ngrok dashboard.
3. Copy the displayed `ngrok config add-authtoken ...` command.
4. Run that command locally in PowerShell. Do not save or send the token in chat, documentation, or GitHub.

## Create tester access credentials

1. Copy `.tunnel.example` to `.tunnel.env`.
2. Set a non-personal tester username and a strong, unique password.
3. Do not reuse a personal, Neo4j, email, or GitHub password.
4. `.tunnel.env` is ignored by Git.

## Start a testing session

1. Start Neo4j Desktop and the RSA database.
2. Start the chatbot with `Start RSA Career Guide.cmd` if it is not already running.
3. Double-click `Start Secure Tester Tunnel.cmd`.
4. Share only the displayed HTTPS forwarding address with testers.
5. Share the tester username and password separately.
6. Keep both server windows open during the session.

Double-click `Stop Secure Tester Tunnel.cmd` to terminate public access. The forwarding address normally changes for a new free testing session.

## Safety limits

- Use temporary credentials and change them between testing rounds.
- Do not expose Neo4j ports 7474 or 7687.
- Do not use this development tunnel as permanent production hosting.
- Stop the tunnel when testing ends.
- Review logs and add application rate limiting before a larger test group.
