# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

########## API Tokens ##########
source ~/API_Tokens/circle-ci-token


########## User configurations ##########

# Add brew install Z
. $(brew --prefix)/etc/profile.d/z.sh

# Git Clone for Heroku; Automagically Place into $GOPATH
gclw() {
  git clone "git@github.com:heroku/$1.git" $(go env GOPATH)/src/github.com/heroku/"$1" && cd $(go env GOPATH)/src/github.com/heroku/"$1"
}

# Heroku Sudo
# source ~/.heroku/heroku-sudo-shell.bash

# Manges Heroku cloud env using Ion
cloud() {
  eval "$(ion-client shell)"
  cloud "$@"
}

# for github private
export GOPRIVATE=github.com/heroku

# kubeconfig
export KUBECONFIG=$HOME/.kube/config

# kubebuilder
export PATH=$PATH:/usr/local/kubebuilder/bin

# Kubernetes kubectl plugins with krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# rbenv
eval "$(rbenv init -)"

# PostgreSQL
alias pg-start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg-stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

# SQLite
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

# for .nvmrc
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Python3
alias python=python3
export PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"

# Other Aliases
alias kc="kubectl"
alias h="heroku"


##################################################


# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

########## ZSH Default configurations ##########

ZSH_DISABLE_COMPFIX=true
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="muse"
# ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  golang
  bundler
  httpie
)

source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# added by travis gem
[ -f /Users/joanne.yeung/.travis/travis.sh ] && source /Users/joanne.yeung/.travis/travis.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
