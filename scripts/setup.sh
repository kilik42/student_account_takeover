#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
for tool in bash grep sort head wc sha256sum cp mkdir; do
  command -v "$tool" >/dev/null || { echo "Missing tool: $tool" >&2; exit 1; }
done
sha256sum -c SHA256SUMS.txt
mkdir -p working/evidence reports
# Re-running setup never overwrites a student's working copy or report.
for source in evidence/*; do
  target="working/evidence/$(basename "$source")"
  if [ ! -e "$target" ]; then cp "$source" "$target"; fi
done
if [ ! -e reports/incident_report.md ]; then
  cp reports/incident_report_template.md reports/incident_report.md
fi
echo 'Ready. Open STUDENT_WALKTHROUGH.md. Original evidence verified.'
echo 'Use working/evidence/ for analysis. Your report is reports/incident_report.md.'
