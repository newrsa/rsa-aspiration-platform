#!/usr/bin/env python3
"""Create Qdrant collection snapshots and record their server-side names."""

from __future__ import annotations

import argparse
import json
import os
import urllib.request
from pathlib import Path


def request_json(url: str, api_key: str, method: str = "GET") -> dict:
    request = urllib.request.Request(
        url,
        data=b"" if method == "POST" else None,
        method=method,
        headers={"api-key": api_key},
    )
    with urllib.request.urlopen(request, timeout=120) as response:
        return json.load(response)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--url", required=True)
    parser.add_argument("--manifest", required=True, type=Path)
    args = parser.parse_args()

    api_key = os.environ.get("QDRANT_API_KEY")
    if not api_key:
        parser.error("QDRANT_API_KEY must be present in the environment")

    collection_payload = request_json(f"{args.url.rstrip('/')}/collections", api_key)
    collections = [item["name"] for item in collection_payload["result"]["collections"]]
    snapshots = []
    for collection in collections:
        response = request_json(
            f"{args.url.rstrip('/')}/collections/{collection}/snapshots",
            api_key,
            method="POST",
        )
        snapshots.append({"collection": collection, "snapshot": response["result"]})

    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps({"snapshots": snapshots}, indent=2) + "\n")
    print(f"Created {len(snapshots)} Qdrant snapshots.")


if __name__ == "__main__":
    main()
