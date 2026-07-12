#! /bin/zsh

cd $HOME/dotfiles/bork/

bork satisfy apps.sh
bork satisfy languages.sh
bork satisfy tools.sh
# symlink needs to be last since it relies on other things installed first
bork satisfy symlink.sh

# only for werk
# bork satisfy work.sh
