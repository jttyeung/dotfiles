#!/bin/bash

# Target destination path for TPM
TPM_DIR="$HOME/.tmux/plugins/tpm"

# Check if the directory already exists to avoid redundant clones
if [ ! -d "$TPM_DIR" ]; then
    echo "Installing Tmux Plugin Manager (TPM)..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
    echo "TPM is already installed."
fi
