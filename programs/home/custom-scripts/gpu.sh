#!/usr/bin/env bash
set -euo pipefail

card=""
for dev in /sys/class/drm/card*/device; do
  if [[ -f "$dev/vendor" ]] && [[ "$(cat "$dev/vendor")" == "0x1002" ]] \
     && [[ -f "$dev/gpu_busy_percent" ]]; then
    card="$dev"
    break
  fi
done

while true; do
  if [[ -n "$card" ]]; then
    usage=$(cat "$card/gpu_busy_percent")
  else
    usage=0
  fi
  echo "gpu|int|${usage}"
  echo ""
  sleep 2
done