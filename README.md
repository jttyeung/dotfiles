# What this is
We have a set of tools, languages, and software we often setup by default on our machines. Whenever one reimages or gets a new machine, it's a pain to re-setup and can be quite time consuming. This repo is my personal dev environment setup using [bork](https://github.com/mattly/bork).

See the [bork repo](https://github.com/mattly/bork) for more on usage beyond the example here.

~ Inspired by [@jsillivan](https://github.com/jsullivan/dotfiles)


# Usage instructions for this repo
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