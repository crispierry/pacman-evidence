#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
cat player-protocol.jsonl.gz.part-* > player-protocol.jsonl.gz
echo "bdb8ca094a2f5d12e55b622b6139a9e80a212f84d36a1e8c182b3dd459aeac4b  player-protocol.jsonl.gz" | shasum -a 256 -c -
