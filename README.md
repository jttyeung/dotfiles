# What is this?
We have a set of tools, languages, and software we often setup by default on our machines. Whenever one reimages or gets a new machine, it's a pain to re-setup and can be quite time consuming. This repo contains configuration files of my personal dev environment setup using [bork](https://github.com/borksh/bork). It makes life just a little less difficult when I need to start over.

See the [bork repo](https://github.com/borksh/bork) for more on usage beyond the example here.
~ Inspired by [@jsillivan](https://github.com/jsullivan/dotfiles)


# Instructions
1. Install [Homebrew](https://brew.sh/)

	```sh
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	```

1. Install [bork](https://github.com/borksh/bork)

	```sh
	brew install bork
	```

1. Install github cli

	```sh
	brew install gh
	```

1. Clone this repo in $HOME

	```sh
	cd $HOME && gh repo clone jttyeung/dotfiles
	```

1. Create an executable of the install script

	```sh
	chmod +x ~/dotfiles/install.sh
	```

1. Run the executable

	```sh
	~/dotfiles/install.sh
	```

1. Create the symlinks to $HOME

	```sh
	bork satisfy ~/dotfiles/bork/symlink.sh
	```
