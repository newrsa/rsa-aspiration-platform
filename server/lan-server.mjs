import http from "node:http";
import { spawn } from "node:child_process";

const app = process.platform === "win32"
  ? spawn("cmd.exe", ["/d", "/s", "/c", "npm run dev"], { stdio: "inherit", shell: false })
  : spawn("npm", ["run", "dev"], { stdio: "inherit", shell: false });

const proxy = http.createServer((incoming, outgoing) => {
  const request = http.request({ hostname: "localhost", port: 3000, path: incoming.url, method: incoming.method, headers: incoming.headers }, response => {
    outgoing.writeHead(response.statusCode || 502, response.headers);
    response.pipe(outgoing);
  });
  request.on("error", () => { outgoing.writeHead(503, { "Content-Type": "text/plain" }); outgoing.end("RSA Career Guide is starting. Please refresh shortly."); });
  incoming.pipe(request);
});

proxy.on("upgrade", (request, socket, head) => {
  const upstream = http.request({ hostname: "localhost", port: 3000, path: request.url, method: request.method, headers: request.headers });
  upstream.on("upgrade", (response, upstreamSocket, upstreamHead) => {
    socket.write(`HTTP/1.1 101 Switching Protocols\r\n${Object.entries(response.headers).map(([k,v]) => `${k}: ${v}`).join("\r\n")}\r\n\r\n`);
    if (upstreamHead.length) socket.write(upstreamHead);
    if (head.length) upstreamSocket.write(head);
    upstreamSocket.pipe(socket); socket.pipe(upstreamSocket);
  });
  upstream.end();
});

proxy.listen(3001, "0.0.0.0", () => console.log("Trusted-network URL: http://0.0.0.0:3001"));

function shutdown() { proxy.close(); if (!app.killed) app.kill(); }
process.on("SIGINT", shutdown); process.on("SIGTERM", shutdown); app.on("exit", code => { proxy.close(); process.exitCode = code ?? 0; });
