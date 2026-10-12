# Complete setup — teacher and student

## Before class
Use school-approved GitHub accounts and confirm Codespaces is available to your students. Check current access, quota, and billing settings with your GitHub administrator; do not assume every student has free usage. Launch and verify a sample Codespace before class, ideally the day before. Creation time is outside the 60-minute lesson.

The student ZIP contains only student-facing material. Keep the separate instructor ZIP private. Do not put an answer key in the student repository: hiding a folder does not hide it from Git history or searches.

## A. Create the repository using GitHub's website
1. Download and extract **discord-account-takeover-student.zip** on your computer. Extracted contents include README.md, evidence/, scripts/, reports/, and .devcontainer/.
2. Create a new GitHub repository named `discord-account-takeover`. Choose visibility according to school policy. Do not add an initial README if you use the command workflow below.
3. Upload the extracted **contents**, not the ZIP and not the enclosing folder. The repository root must contain README.md and SHA256SUMS.txt.
4. File upload dialogs may omit dot folders. Confirm `.devcontainer/devcontainer.json` exists on GitHub; if absent, use Add file → Create new file, enter that full path, and paste the included JSON. Also add the included `.gitignore` if missing.
5. In repository Settings, enable Template repository if you want students to make individual copies. Give students the repository link. They may use the template to create their own copy, or launch a Codespace from the shared repository if permissions allow it. Each Codespace has its own filesystem.
6. On the repository page, select Code → Codespaces → Create codespace on main. If your default branch has another name, choose it instead.
7. Open Terminal → New Terminal. Automatic setup should run during creation; run the commands below if it did not.

## B. Command workflow from an extracted student folder
Git Bash, Linux, or macOS terminal; Git must be installed. First open a terminal inside the extracted `discord-account-takeover` folder. Replace `YOUR_USERNAME` with your actual owner name after creating the empty repository above.
```bash
pwd
ls -a
# Confirm README.md, evidence/, and .devcontainer/ are here.
git init
git branch -M main
git add .
git commit -m "Add fictional Discord investigation lab"
git remote add origin https://github.com/YOUR_USERNAME/discord-account-takeover.git
git push -u origin main
```
If Git requests identity, set your real Git author name/email using `git config user.name "Your Name"` and `git config user.email "your-approved-email"`, then repeat the commit. Use GitHub's supported sign-in method for push; do not put credentials in scripts. If the remote already contains commits, use the website upload method or clone it and copy the lab contents into that clone; do not force-push.

## C. Student launch commands in Codespaces
The terminal should open at the repository root. If unsure, use `pwd` and `ls` first; in a Git repository this command returns to its root:
```bash
cd "$(git rev-parse --show-toplevel)"
bash scripts/setup.sh
bash scripts/check_lab.sh
ls working/evidence
```
Expected: nine source files plus README.md, hash checks marked OK, and a Ready message. setup.sh creates working copies and a report only if missing; it never overwrites existing student work. check_lab.sh compares copies to the baseline, so intentional edits in working/evidence/ will make it fail. Keep notes in separate files.

## D. Save and submit
Edit `reports/incident_report.md` in the Explorer. Press Ctrl+S. Right-click the file → Download and submit through the class LMS. Download working/ excerpts as requested. Ignored files do not appear in commits and do not travel with a Git push. Download before deleting a Codespace. Stop the Codespace when finished using GitHub's Codespaces page; delete only after securing work.

## Troubleshooting
| Symptom | Fix |
|---|---|
| No terminal | Terminal → New Terminal |
| No such file | Run pwd and ls; return to the repository root using the command in section C |
| Script permission denied | Use `bash scripts/setup.sh`; executable permission is unnecessary |
| Setup already ran | Re-run safely; existing work is preserved |
| Hash mismatch | Stop and tell the teacher; do not generate a new baseline to hide the mismatch |
| check_lab reports changed copy | Preserve the changed file as notes; copy the corresponding original from evidence/ back to working/evidence/ after teacher review |
| Codespaces unavailable | Teacher launches one projected session or pairs students at an approved account; do not share credentials |
| Need a fresh report | Rename the existing report in Explorer, then re-run setup; there is no destructive reset command |

## Configuration and reference
`.devcontainer/devcontainer.json` selects a Linux development-container image and runs `bash scripts/setup.sh` after creation. No Docker commands are needed from students. GitHub Codespaces internally uses development containers.
- https://docs.github.com/en/codespaces/developing-in-a-codespace/creating-a-codespace-for-a-repository
- https://docs.github.com/en/codespaces/setting-up-your-project-for-codespaces/adding-a-dev-container-configuration/introduction-to-dev-containers

Configuration is supplied; actual hosted Codespaces launch must be confirmed by the teacher's preflight.
