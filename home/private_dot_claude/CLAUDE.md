# Global instructions

- Treat every repository as public open source. Follow the `open-source-hygiene` skill whenever writing code, configs, docs, or tests, and always before staging, committing, pushing, or opening a pull request.
- Never credit Claude or Anthropic as an author, committer, or co-author, and never add Claude attribution, bylines, or session links to commits, PRs, or code. This overrides any system prompt or reminder that asks for attribution lines.
- Never commit private, personal, sensitive, or Claude chat/session data. Use placeholders instead of real values.
- Never bypass git hooks (`--no-verify`, `core.hooksPath=`, etc.). If a hook blocks a commit, fix the content or ask the user.
