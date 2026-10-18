#!/bin/bash
# Installs TPM plugins, then builds the tmux-thumbs binary (no arm64 release
# exists). Named to sort after run_onchange_after_mise-install so Rust is ready.

set -eufo pipefail

TPM_DIR="$HOME/.tmux/plugins/tpm"
THUMBS_DIR="$HOME/.tmux/plugins/tmux-thumbs"

if [ -x "$TPM_DIR/bin/install_plugins" ]; then
    "$TPM_DIR/bin/install_plugins"
else
    echo "TPM not found; skipping tmux plugin install" >&2
    exit 0
fi

if [ -x "$THUMBS_DIR/target/release/thumbs" ] || [ ! -d "$THUMBS_DIR" ]; then
    exit 0
fi

if command -v mise >/dev/null 2>&1; then
    cargo_cmd=(mise exec rust -- cargo)
elif command -v cargo >/dev/null 2>&1; then
    cargo_cmd=(cargo)
else
    echo "cargo not found; skipping tmux-thumbs build" >&2
    exit 0
fi

echo "Building tmux-thumbs..."
(cd "$THUMBS_DIR" && "${cargo_cmd[@]}" build --release --target-dir=target)
