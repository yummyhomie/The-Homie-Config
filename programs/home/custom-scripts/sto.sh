#!/usr/bin/env bash
set -euo pipefail

while true; do
  StorageAvailable=$(df -BG --output=avail / | tail -n 1 | tr -dc '0-9')
  echo "sto|int|${StorageAvailable}"
  echo ""
  sleep 30
done
