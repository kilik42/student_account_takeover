# Student investigation — CASE DCT-026
**Mission:** explain how nova_mod's account was likely taken over, using at least five evidence citations. You are investigating fictional files, not attacking an account.

Work in teams of three: **terminal operator** types, **evidence reader** checks results, **recorder** updates the report. Rotate after steps 2 and 4. Partners can combine reader/recorder. Success means a supported explanation, not the most commands.

## Command mini-guide
| Command | Meaning |
|---|---|
| pwd | Show your current folder |
| ls | List files |
| cat FILE | Display a short file |
| head -n 12 FILE | Display the first 12 lines |
| grep -n 'TEXT' FILE | Find matching lines and show line numbers |
| grep -nE 'A\|B' FILE | Find A or B (either/or) |
| sort FILE | Sort lines; ISO UTC timestamps sort chronologically |
| wc -l FILE | Count lines, not unique people |
| command > FILE | Save output; overwrites that output file |

Copy commands without the ``` markers. Names are case-sensitive. A command returning no output may simply mean no matches; it is not evidence that an event never happened. Use the up arrow to recall a command. Read surrounding lines before drawing conclusions.

## 1. Get ready and preserve evidence (5 minutes)
```bash
pwd
ls
bash scripts/setup.sh
cat evidence/README.md
```
All hash entries should say OK. If not, stop and tell your teacher. Do not edit evidence/. setup.sh makes working/evidence/ copies and `reports/incident_report.md`. Open the report in the Explorer and enter your team names. Record the hash result in section 7.

**Checkpoint:** What does a matching hash prove? What does it not prove?

## 2. Analyze the message (8 minutes)
```bash
cat working/evidence/discord_messages.txt
grep -nE 'M102|M103|M104' working/evidence/discord_messages.txt
```
The grep output shows message headers, not the bodies below them. Return to cat or open the file with line numbers in the editor to cite both header and body. Do not open the URLs.

Record answers in the report:
1. Which account is targeted? Which message first asks for action?
2. Find evidence of authority impersonation, fear, urgency, and isolation from trusted help.
3. Is a convincing display name sufficient proof of identity?
4. Compare the request with River's earlier announcement. What would a safer response have been?

**Checkpoint:** Select two short phrases and explain the tactics they use.

## 3. Connect the click, form, and login (12 minutes)
```bash
cat working/evidence/browser_history.csv
cat working/evidence/endpoint_events.log
grep -n 'user=nova_mod' working/evidence/login_attempts.log
cat working/evidence/user_accounts.csv
```
A CSV's first row names its columns. A log's `key=value` fields label facts. `user=nova_mod` is an exact search string. `SUCCESS` means authentication succeeded, not that the correct person signed in.

5. What time did the verification page load? When was the form submitted? Which field names were observed? Were actual values captured?
6. Identify Nova's earlier device/IP and the new successful login's device/IP. What is the new session ID?
7. How much time passes between form submission and that successful login?
8. Did this account have MFA enabled before the incident? How could that affect risk?
9. Why is a URL using HTTPS not sufficient proof that its operator is trustworthy?

**Checkpoint:** Cite two different files that connect the form to the login. Describe that connection as an inference, not proof of who operated the session.

## 4. Trace actions and test an alternative (10 minutes)
```bash
grep -n 'S900' working/evidence/account_activity.log
cat working/evidence/security_alerts.log
grep -n 'user=echo_mod' working/evidence/login_attempts.log
cat working/evidence/helpdesk_notes.txt
```
10. List the changes and messages associated with the session you identified. Which ID links the giveaway to the message archive?
11. Explain why Nova's later sign-in failed and why removing a post alone is insufficient recovery.
12. Does Echo's new-IP alert establish a takeover? Compare authentication, context, and subsequent behavior with Nova's case.
13. Do these records establish that other members clicked the giveaway? Explain.

**Checkpoint:** Give one fact, one inference, and one claim the evidence cannot support.

## 5. Build the timeline and finish the report (10 minutes)
Use the supplied helper after you have investigated the sources:
```bash
bash scripts/build_timeline.sh
cat working/timeline.txt
```
This sorts selected event headers; it omits message bodies, browser CSV rows, alerts, and some admin events. Add those manually where relevant. The helper creates a convenience file, not new evidence. Cite original filenames/lines, not only the derived timeline.

Enter at least six ordered UTC events and five citations. Include observed harm, two uncertainties, an alternative explanation, confidence, and four prioritized response recommendations. Recommendations should explain how they break the attack chain. Use the account recovery process through a trusted channel; do not follow the suspect message.

## 6. Analyst briefing and submission (5 minutes)
Deliver a 30-second briefing: likely entry method → strongest two sources → observed impact → first response action → one uncertainty. Save/download your report and submit through the LMS. Do not rely on Git push to save ignored report files.

## Independent extension (after the core lesson)
Choose one:
- Without the helper, use grep and sort to save a timeline. Explain which events your filter misses.
- Use `grep -n 'result=FAILED' working/evidence/login_attempts.log` and explain why not every failed login is an attack.
- Write a five-line Bash script using a variable for the username. Compare results for Nova and Echo. Explain a limitation of keyword matching.
- Propose an alert that combines a new login with a recovery-email change. Describe a possible false positive.

## If you get stuck
Search the full username, then session ID. Use the evidence inventory to choose the next source. Ask: “What record would I expect to see if my explanation were true?” A different IP is a clue; corroborate it with actions and context.
