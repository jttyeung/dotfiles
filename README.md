# What is this?
We have a set of tools, languages, and software we often setup by default on our machines. Whenever one reimages or gets a new machine, it's a pain to re-setup and can be quite time consuming. This repo contains configuration files of my personal dev environment setup, managed with [chezmoi](https://www.chezmoi.io/). It makes life just a little less difficult when I need to start over.

# Layout
- [.chezmoiroot](.chezmoiroot) points chezmoi at [home/](home/), so repo-level files like this README stay out of `$HOME`.
- `home/dot_*` files map to `~/.*` (e.g. `home/dot_zshrc` → `~/.zshrc`).
- [home/.chezmoiexternal.toml](home/.chezmoiexternal.toml) installs Oh My Zsh into `~/.oh-my-zsh`, alongside the custom aliases and shortcuts. Powerlevel10k is installed and loaded separately through Homebrew.
- [home/.chezmoidata/packages.toml](home/.chezmoidata/packages.toml) lists Homebrew formulae/casks. `run_onchange_darwin-install-packages.sh.tmpl` runs `brew bundle` against it whenever the list changes.
- [home/dot_config/mise/config.toml](home/dot_config/mise/config.toml) is the global mise tool list; `run_onchange_after_mise-install.sh.tmpl` reruns `mise install` when it changes.
- [home/Library/Application Support/iTerm2/DynamicProfiles/dotfiles.json.tmpl](<home/Library/Application Support/iTerm2/DynamicProfiles/dotfiles.json.tmpl>) defines the macOS iTerm2 `Dotfiles` profile; `run_onchange_after_darwin-configure-iterm.sh.tmpl` makes it the default.
- Work-only packages are gated by the `work` flag, prompted once on `chezmoi init`.

# Setting up a new machine
1. Install [Homebrew](https://brew.sh/)

	```sh
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	```

1. Install chezmoi

	```sh
	brew install chezmoi
	```

1. Clone this repo into `$HOME` and initialize

	```sh
	git clone https://github.com/jttyeung/dotfiles.git ~/dotfiles
	chezmoi init --source ~/dotfiles
	```

	You'll be asked once whether this is a work machine.

1. Preview, then apply

	```sh
	chezmoi diff
	chezmoi apply
	```

	Quit iTerm2 before applying, and run the commands from VS Code's terminal or macOS Terminal. This also downloads Oh My Zsh and sets iTerm2's default profile; no separate installer is needed. Reopen iTerm2 after applying.

1. Select the prompt font

	The package list installs `MesloLGS NF`, which provides Powerlevel10k's icons:

	- **VS Code:** set `terminal.integrated.fontFamily` to `MesloLGS NF` in User Settings.
	- **iTerm2:** chezmoi installs the `Dotfiles` dynamic profile with `MesloLGS NF` at size 12 and makes it the default automatically. It inherits other settings from the existing `Default` profile. To change the managed font or size, edit the JSON template in this repo and apply with iTerm2 closed.

	Restart the terminal app after installing the font. Existing iTerm2 sessions may retain their previous profile; open a new window with the `Dotfiles` profile if needed. Boxes in the prompt indicate missing font glyphs.

# Day-to-day
```sh
chezmoi edit ~/.zshrc     # edit the source copy
chezmoi diff              # see what would change
chezmoi apply             # write changes to $HOME
chezmoi cd                # drop into ~/dotfiles to commit/push
```

Unlike the old bork setup, files in `$HOME` are real files, not symlinks — edit via `chezmoi edit` (or edit in the repo) and run `chezmoi apply`.
