cd $HOME
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh 	# Set shell default to zsh
export ZSH="$HOME/oh-my-zsh"; sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm .zshrc	# Replaces default .zshrc with symlink .zshrc in install_script
touch ~/.hushlogin	# Removes last login in Terminal