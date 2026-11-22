# Shared helpers for the global pre-commit and commit-msg hooks. Sourced, not run.
#
# Personal strings to block live OUTSIDE any repo, one fixed string per line
# (blank lines and lines starting with # are ignored):
#   ~/.config/git/private-patterns.local
# Good candidates: full name, phone, home address, hostnames, tailnet name,
# LAN IPs, account numbers, employer-internal domains.

PRIVATE_PATTERNS_FILE="${PRIVATE_PATTERNS_FILE:-$HOME/.config/git/private-patterns.local}"

# Regexes are written so this file never matches itself (e.g. `\.` and `[:]`).
CLAUDE_DATA_RE='claude\.ai/(code/session|chat/|share/)|Claude-Session[:]|noreply@anthropic\.com'

# Print fixed strings that must never appear in committed content or messages.
privacy_fixed_strings() {
  git config --get-all user.email 2>/dev/null
  # Absolute home path leaks the local username, e.g. /Users/<name>/...
  printf '%s/\n' "$HOME"
  if [ -f "$PRIVATE_PATTERNS_FILE" ]; then
    grep -v -e '^[[:space:]]*#' -e '^[[:space:]]*$' "$PRIVATE_PATTERNS_FILE"
  fi
}

# Read text on stdin and print lines that hit a private or Claude-data pattern.
# Matching is case-insensitive. Exits 0 if anything matched.
privacy_scan() {
  tmp_strings=$(mktemp)
  privacy_fixed_strings | sort -u > "$tmp_strings"
  input=$(cat)
  hits=$(
    {
      [ -s "$tmp_strings" ] && printf '%s\n' "$input" | grep -i -n -F -f "$tmp_strings"
      printf '%s\n' "$input" | grep -i -n -E "$CLAUDE_DATA_RE"
    } | sort -u -t: -k1,1n
  )
  rm -f "$tmp_strings"
  [ -n "$hits" ] || return 1
  printf '%s\n' "$hits"
}
