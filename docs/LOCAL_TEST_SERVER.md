# Use this PC as the testing server

## Initial configuration

1. Start the RSA database in Neo4j Desktop.
2. Copy `.env.example` to `.env.local` and replace only the Neo4j password.
3. In the project folder, run `npm install` once.
4. Run `npm run dev:lan`.
5. The terminal shows the local address. On this PC, use `http://localhost:3000`.

## Access from another device

1. Keep both devices on the same trusted Wi-Fi or office network.
2. Run `ipconfig` and locate this PC's IPv4 address, such as `192.168.1.25`.
3. Open `http://<this-pc-ip>:3001` on the other device. Port 3001 is the trusted-network gateway; Neo4j remains private.
4. If Windows asks whether to allow Node.js through the firewall, allow Private networks only.

Do not expose ports 3000 or 3001 through the internet router. Neo4j remains local to the server and the browser communicates only with the web application.

## Daily startup

1. Start Neo4j Desktop and the RSA database.
2. Start the website with `npm run dev:lan`.
3. Confirm the website header says the graph is ready.

## Before internet deployment

Replace the development server with a production build, add HTTPS, authentication, rate limiting, service monitoring, automated off-device backups, and a reverse proxy. Move secrets into the VPS secret store or protected environment file.
