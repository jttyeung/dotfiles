#!/bin/bash
# Installs VS Code extensions. Add IDs to the list and the script reruns.

set -eufo pipefail

extensions=(
    Catppuccin.catppuccin-vsc # matches the Ghostty theme
)

if ! command -v code >/dev/null 2>&1; then
    echo "code CLI not found; skipping VS Code extension install" >&2
    exit 0
fi

for ext in "${extensions[@]}"; do
    code --install-extension "$ext" --force
done
