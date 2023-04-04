
fish_add_paths "/usr/local/sbin"
fish_add_paths "/usr/local/bin"
fish_add_paths "/opt/homebrew/bin"
fish_add_paths "$HOME/.cargo/bin"
fish_add_path "/opt/homebrew/opt/postgresql@15/bin"
fish_add_path "/opt/homebrew/opt/libpq/bin"

set EDITOR vim

eval "$(/opt/homebrew/bin/brew shellenv)"

source ~/.asdf/asdf.fish

starship init fish | source
