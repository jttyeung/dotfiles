# Dev environment setup using [bork](https://github.com/mattly/bork)

~ inspired by [@jsillivan](https://github.com/jsullivan/dotfiles)


# Usage
1. Install [Homebrew](https://brew.sh/):

	`$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`

2. Install [bork](https://github.com/mattly/bork):

	`$ brew install bork`

3. Clone this repo.

4. Create an executable of the install script:

	`$ chmod +x ~/dotfiles/install/install_script.sh`

5. Run the executable.

	`$ ~/dotfiles/install/install_script.sh`

6. Create the symlinks to $HOME:

	`bork satisfy ~/dotfiles/install/symlink.sh`