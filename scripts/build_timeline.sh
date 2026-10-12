#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p working
# -h omits filename prefixes; -E enables either/or; sort orders ISO timestamps.
grep -hE 'user=nova_mod|DM_to_nova_mod|sender=nova_mod'   working/evidence/login_attempts.log   working/evidence/account_activity.log   working/evidence/endpoint_events.log   working/evidence/discord_messages.txt | sort > working/timeline.txt
echo 'Saved working/timeline.txt (event lines only; read message bodies separately).'
