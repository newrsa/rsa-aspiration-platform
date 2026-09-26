# Tailscale Access

Install Tailscale on the Ubuntu host using the official stable packages, then authenticate interactively:

```bash
sudo tailscale up --ssh
tailscale ip -4
tailscale status
```

Set `RSA_BIND_ADDRESS` to the returned `100.x.y.z` address and set `RSA_ADVERTISED_HOST` to either that address or the MagicDNS hostname. Restart the Compose stack after changing the file.

Team members install Tailscale on their own machines and join the same tailnet. Use tailnet access-control policy to grant database ports only to the developer group. Do not port-forward 7474, 7687, 6333, 6334, or 5432 on the home router.

Recommended policy:

- Administrators: Tailscale SSH plus all database ports.
- Developers: database ports only, with least-privilege database credentials.
- CI: no direct home-box access until a dedicated tagged device and narrowly scoped policy are created.
- Remove a member and rotate shared development credentials immediately when access is no longer required.

Keep Tailscale key expiry enabled unless an explicit availability decision accepts the risk of a non-expiring server key.
