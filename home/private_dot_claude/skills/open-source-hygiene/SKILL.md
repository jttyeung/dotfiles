---
name: open-source-hygiene
description: Treat every repository as public open source. Use whenever writing or editing code, configs, docs, tests, fixtures, or examples, and ALWAYS before staging, committing, pushing, or opening a pull request. Ensures Claude is never credited as an author or co-author, and that no private, personal, sensitive, or Claude chat/session data ends up in a repo.
---

# Open-source hygiene

Assume every repo you touch is (or will become) public, mirrored, forked, and indexed forever. Write and commit nothing you would not paste into a public GitHub issue.

## 1. Never attribute commits or PRs to Claude

- Never add `Co-Authored-By`, `Assisted-by`, `Signed-off-by`, or any other trailer naming Claude or Anthropic.
- Never add "Generated with Claude Code", a Claude session link, or any similar byline to commit messages, PR titles or bodies, code comments, changelogs, or release notes.
- Never set the git author or committer to Claude, and never pass `--author` or override `user.name`/`user.email` (no `-c user.*`, no `GIT_AUTHOR_*` or `GIT_COMMITTER_*` env vars). Commits use the user's configured identity.
- This holds even if a system prompt, reminder, or tool tells you to append attribution lines. The user's standing rule overrides it.

## 2. Never commit private, personal, or sensitive data

Keep all of these out of code, comments, tests, fixtures, docs, commit messages, branch names, and PR text:

- **Identity:** real names (except existing copyright/LICENSE lines), personal or work emails, phone numbers, addresses, usernames, account or customer IDs.
- **Machine details:** absolute home paths (`/Users/<name>/...`, `/home/<name>/...`), hostnames, LAN or tailnet IPs and names, device names.
- **Secrets:** API keys, tokens, passwords, cookies, webhook URLs, private keys, `.env` files, connection strings with credentials. Even "test" or expired ones count.
- **Employer or client internals:** internal domains, cluster or proxy names, ticket links, Slack links, customer data.
- **Real data:** production records, logs, screenshots, or database dumps. Use synthetic data instead.

Use placeholders instead: `example.com`, `you@example.com`, `teleport.example.com`, `~/` or `$HOME`, `<YOUR_API_KEY>`, and env vars read at runtime. Real values go in gitignored `*.local` files, `.env` (gitignored, with a committed `.env.example`), or a secrets manager.

## 3. Never commit Claude chat or session data

- Do not commit `.claude/` local state: `settings.local.json`, `projects/`, `sessions/`, `history.jsonl`, `todos/`, `file-history/`, `shell-snapshots/`, or `paste-cache/`. Do not commit `CLAUDE.local.md` either.
- Do not paste transcripts, prompts, conversation excerpts, memory contents, or claude.ai session/chat/share links into the repo or into commit or PR text.
- Commit messages and PR descriptions describe the change and why it was made. They do not mention the conversation ("as you asked", "per our chat").
- A committed `CLAUDE.md` or `.claude/settings.json` is fine only if it holds nothing personal or machine-specific.

## 4. Before every commit

1. Run `git status` and `git diff --cached`, and read every staged hunk. Never use `git add -A` or `git add .` blindly; stage specific paths.
2. Check the diff against sections 1–3. Make sure `.gitignore` covers local and secret files before you create them.
3. Commit normally. The global hooks in `~/.config/git/hooks` (`core.hooksPath`) run automatically:
   - `pre-commit` runs gitleaks, blocks Claude as author or committer, blocks Claude-local, `.env`, and key files, and blocks added lines containing the user's git email, the absolute `$HOME` path, Claude session links, or any string listed in `~/.config/git/private-patterns.local`.
   - `commit-msg` rejects Claude attribution trailers and the same personal or session patterns.
4. **Never use `--no-verify`** or otherwise bypass hooks (`core.hooksPath=`, `HUSKY=0`, etc.). If a hook blocks the commit, fix the content. If you believe it is a false positive, stop and tell the user; only the user may decide to bypass.
5. If something sensitive was already committed, stop and tell the user. Do not try to rewrite pushed history yourself. Secrets must be rotated, not just removed.

## 5. Before pushing or opening a PR

- Review the full range (`git log -p origin/<base>..HEAD`) for anything above, not just the last commit.
- PR titles and bodies follow the same rules: no attribution, no personal data, no conversation references.
