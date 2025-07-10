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