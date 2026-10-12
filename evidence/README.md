# Evidence inventory — CASE DCT-026
All records are fictional classroom simulations, not exports from Discord. Schemas, session IDs, and alerts are simplified and invented. No real passwords, tokens, people, or live phishing sites are included.

Incident: Pixel Harbor Gaming moderator **nova_mod** posted a suspicious giveaway at about 18:49 on October 8, 2026. Determine how access was obtained and what happened next.

All timestamps use UTC (Z) on 2026-10-08. Sort ISO timestamps to compare events. On this date Chicago is UTC−05:00; 18:42Z is 1:42 PM Chicago. Use UTC in your report.

| File | Source and scope | Limitation |
|---|---|---|
| discord_messages.txt | Community message archive, 18:30–18:51 | Display names are self-selected; not proof of identity |
| browser_history.csv | Consented fictional export from Nova's laptop | Page visit alone does not prove credentials were entered |
| endpoint_events.log | Simulated local browser observation | Detects form field names, never their values; not standard Discord telemetry |
| login_attempts.log | Simulated identity-provider audit, Oct 7–8 | SUCCESS alone does not identify a human |
| user_accounts.csv | Snapshot at 18:40Z, before incident | Describes pre-incident controls only |
| account_activity.log | Simulated application audit, 18:40–18:52 | Records observed actions; not all possible actions |
| security_alerts.log | Rule-generated alerts | Alerts require corroboration; not verdicts |
| helpdesk_notes.txt | Interview notes collected at 19:05Z | Self-report may be incomplete |
| suspicious_links.csv | Analyst URL inventory | Risk labels are triage, not proof |

IP addresses use documentation ranges (192.0.2.0/24, 198.51.100.0/24, 203.0.113.0/24). Web addresses use reserved .example domains. Do not browse them. Infer no country, person, or physical location from these IPs.

Original evidence is in evidence/. Use working/evidence/ for searches. SHA256SUMS.txt at the repository root is the supplied baseline. A matching hash shows bytes match this baseline; it does not establish the truth or authenticity of the records.
