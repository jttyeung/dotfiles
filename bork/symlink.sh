# Run this with bork from your home dir like so:
# `bork satisfy ~/dotfiles/bork/symlink.sh`

# Ensure all dotfiles are symlinked

ok directory $HOME/dotfiles                   # presence of the ~/dotfiles directory
cd $HOME
for file in $HOME/dotfiles/configs/.[!.]*
do                                            # for each dotfile in ~/dotfiles/configs,
  ok symlink "$(basename $file)" $file        # presence of a symlink to file in ~
done


# Ensure all oh-my-zsh terminal customizations are symlinked

ok directory $HOME/.oh-my-zsh/custom          # presence of the ~/.oh-my-zsh directory
for file in $HOME/dotfiles/configs/oh-my-zsh/*
do                                            # for each dotfile in ~/dotfiles/configs/oh-my-zsh,
  ok symlink "$HOME/.oh-my-zsh/custom/$(basename $file)" $file        # presence of a symlink to file in ~/.oh-my-zsh/custom
done

# Hint:
# * matches all non-dot-files
# .[!.]* matches all dot files except . and files whose name begins with ..
# ..?* matches all dot-dot files except ..

# ex: rm -rf ..?* .[!.]* *
