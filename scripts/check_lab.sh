#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
sha256sum -c SHA256SUMS.txt
for file in evidence/*; do
  cmp "$file" "working/$file" >/dev/null || { echo "Working copy differs: $file"; exit 1; }
done
test -s reports/incident_report.md
echo 'Lab files and working copies verified. This checks files, not your conclusions.'
