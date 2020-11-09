# Ensure all dotfiles are symlinked
# Run this with bork from your home dir like so:
# `bork satisfy ~/dotfiles/install/symlink.sh`

ok brew git                                   # presence and updatedness of Homebrew git package
ok directory $HOME/dotfiles                   # presence of the ~/dotfiles directory
cd $HOME
for file in $HOME/dotfiles/configs/.[!.]*
do                                            # for each dotfile in ~/dotfiles/configs,
  ok symlink "$(basename $file)" $file        # presence of a symlink to file in ~
done

# Hint:
# * matches all non-dot-files
# .[!.]* matches all dot files except . and files whose name begins with ..
# ..?* matches all dot-dot files except ..

# ex: rm -rf ..?* .[!.]* *
