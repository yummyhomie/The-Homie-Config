#!/usr/bin/env bash
set -euo pipefail

while true; do
  usage=$(df --output=pcent / | tail -n 1 | tr -dc '0-9')
  free=$(df --output=avail -BG / | tail -n 1 | tr -dc '0-9')
  echo "sto|int|${usage}"
  echo "free|int|${free}"
  echo ""
  sleep 30
done
