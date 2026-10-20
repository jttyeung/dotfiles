# What is this?
We have a set of tools, languages, and software we often setup by default on our machines. Whenever one reimages or gets a new machine, it's a pain to re-setup and can be quite time consuming. This repo contains configuration files of my personal dev environment setup, managed with [chezmoi](https://www.chezmoi.io/). It makes life just a little less difficult when I need to start over.

# Layout
- [.chezmoiroot](.chezmoiroot) points chezmoi at [home/](home/), so repo-level files like this README stay out of `$HOME`.
- `home/dot_*` files map to `~/.*` (e.g. `home/dot_zshrc` → `~/.zshrc`).
- [home/.chezmoiexternal.toml](home/.chezmoiexternal.toml) installs Oh My Zsh into `~/.oh-my-zsh`, alongside the custom aliases and shortcuts. Starship supplies the prompt, with Git branch on the right and Kubernetes context/namespace on work machines.
- [home/.chezmoidata/packages.toml](home/.chezmoidata/packages.toml) lists Homebrew formulae/casks. `run_onchange_darwin-install-packages.sh.tmpl` runs `brew bundle` against it whenever the list changes.
- [home/dot_config/mise/config.toml](home/dot_config/mise/config.toml) is the global mise tool list; `run_onchange_after_mise-install.sh.tmpl` reruns `mise install` when it changes.
- [home/.chezmoiignore](home/.chezmoiignore) skips the macOS-only `Library/` files on other operating systems.
- Work-only packages are gated by the `work` flag, prompted once on `chezmoi init`.
- [home/private_dot_claude/modify_settings.json](home/private_dot_claude/modify_settings.json) is a chezmoi `modify_` script: it merges our keys (currently `includeCoAuthoredBy: false`, which drops the `Co-Authored-By: Claude` trailer) into `~/.claude/settings.json` on every apply, leaving the settings Claude Code writes itself untouched.

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

	This also downloads Oh My Zsh; no separate installer is needed.

1. Select the prompt font

	The package list installs `Hack Nerd Font`, which provides the Starship prompt's icons. Ghostty is already configured to use it; set it as the font in any other terminal. Boxes in the prompt indicate missing font glyphs.

# Day-to-day
```sh
chezmoi edit ~/.zshrc     # edit the source copy
chezmoi diff              # see what would change
chezmoi apply             # write changes to $HOME
chezmoi cd                # drop into ~/dotfiles to commit/push
```

Unlike the old bork setup, files in `$HOME` are real files, not symlinks — edit via `chezmoi edit` (or edit in the repo) and run `chezmoi apply`.

# Kubernetes contexts with Teleport

The chezmoi `work` flag gates [kubeswitch](https://github.com/danielfoehrKn/kubeswitch)
installation, its zsh integration and completions, and Starship's Kubernetes
context/namespace display. Personal profiles omit this setup.
On work machines, zsh loads the integration when the binary is available.
After applying the dotfiles, open a new shell and use:

```sh
switch                       # fuzzy-select a Kubernetes context
switch namespace             # select a namespace
switch history               # select a previous context/namespace
```

Each selection uses a temporary kubeconfig for that shell, so switching in one
tmux pane does not change another pane's existing selection. Starship reads that
shell's `KUBECONFIG` and displays the context and namespace on the right, using
yellow for context names containing a `stg`/`staging` segment and red for
`prd`/`prod`/`production` (separated by dots, underscores, or hyphens). A nested shell
inherits its parent's kubeconfig; run `switch` in it to select independently.

Teleport still handles authentication. Populate or refresh the source kubeconfig
explicitly, since `switch` changes `KUBECONFIG` to a temporary copy:

Replace the example proxy below with your actual proxy. Keep real proxy addresses
and other company-specific values in local configuration outside this repository.

```sh
KUBECONFIG="$HOME/.kube/config" tsh login --proxy=teleport-stg.example.com:443
KUBECONFIG="$HOME/.kube/config" tsh kube login --proxy=teleport-stg.example.com:443 --all
# Repeat with your production proxy when needed.
switch
```

Reselect a context after refreshing to pick up the source changes. The displayed
Kubernetes context identifies the selected target; it does not indicate whether
the Teleport login is valid. Use `tsh status` to check the login and expiry.
