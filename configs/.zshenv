# Homebrew autocomplete
# https://docs.brew.sh/Shell-Completion
export PATH=/usr/local/bin/:$PATH
export FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Setup GOPATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Go Workspace bin directory
export PATH="/usr/local/bin:/usr/local/go/bin:$GOPATH/bin:$PATH"
