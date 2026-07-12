ok brew

ok brew bat
ok brew chezmoi
ok brew fzf
ok brew git
ok brew jq
ok brew mise
ok brew powerlevel10k
ok brew tmux
ok brew z
ok brew zsh-completions
ok brew zsh-syntax-highlighting

# Run mise install to sync your tools against the updated config file
ok directory "$HOME/.config/mise"
ok file "$HOME/.config/mise/config.toml" < "./configs/mise-global-config.toml"
ok run "mise install --global"
