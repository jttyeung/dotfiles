# Homebrew autocomplete
# https://docs.brew.sh/Shell-Completion
export PATH=/usr/local/bin/:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Setup GOPATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Go Workspace bin directory
export PATH="/usr/local/bin:/usr/local/go/bin:$GOPATH/bin:$PATH"

# for ruby
export PATH=$PATH:/Users/joanne.yeung/.gem/bin

# kubebuilder
export PATH=$PATH:/usr/local/kubebuilder/bin

# Kubernetes kubectl plugins with krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Python3
export PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"

# SQLite
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# for github private
export GOPRIVATE=github.com/heroku

# kubeconfig
export KUBECONFIG=$HOME/.kube/config

# adsf shims
export PATH=$PATH:$HOME/.asdf/shims

# proto
export PROTO_HOME="$HOME/.proto";
export PATH="$PROTO_HOME/shims:$PROTO_HOME/bin:$PATH";

# Homebrew curl
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

# Holodeck SSL certificates
export HOLODECK_SSL_CERT_PATH="/Users/joanne.yeung/holodeck-localhost.pem"
export HOLODECK_SSL_KEY_PATH="/Users/joanne.yeung/holodeck-localhost-key.pem"

# Claude Code CA certificates
export NODE_EXTRA_CA_CERTS="/Users/joanne.yeung/.claude/certs/salesforce-ca-bundle.pem"