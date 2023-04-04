
fish_add_paths "/usr/local/sbin"
fish_add_paths "/usr/local/bin"
fish_add_paths "/opt/homebrew/bin"
fish_add_paths "$HOME/.cargo/bin"
set EDITOR vim

eval "$(/opt/homebrew/bin/brew shellenv)"

source ~/.asdf/asdf.fish

starship init fish | source
