fish_add_path "/usr/local/sbin"
fish_add_path "/usr/local/bin"
fish_add_path "/opt/homebrew/bin"
fish_add_path "$HOME/.cargo/bin"
fish_add_path "/opt/homebrew/opt/postgresql@15/bin"
fish_add_path "/opt/homebrew/opt/libpq/bin"

set EDITOR vim

eval "$(/opt/homebrew/bin/brew shellenv)"

source ~/.asdf/asdf.fish

fnm env --use-on-cd | source
starship init fish | source
