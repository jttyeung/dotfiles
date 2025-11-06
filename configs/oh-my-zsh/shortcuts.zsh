# Git clone shortcut; Automagically Place into $GOPATH
# takes the $GITHUB_ORG/$REPO_NAME as the argument
gclw() {
  git clone "git@github.com:$1.git" $(go env GOPATH)/src/github.com/"$1" && cd $(go env GOPATH)/src/github.com/"$1"
}

cloud() {
  eval "$(ion-client shell)"
  cloud "$@"
}

pg-restart() {
  brew services restart postgresql
}

claude() {
    export CLAUDE_CODE_USE_BEDROCK=1
    command claude "$@"
}
