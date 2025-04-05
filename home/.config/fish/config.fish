fish_add_path "/usr/local/sbin"
fish_add_path "/usr/local/bin"
fish_add_path "/opt/homebrew/bin"
fish_add_path "$HOME/.cargo/bin"
fish_add_path "/opt/homebrew/opt/postgresql@15/bin"
fish_add_path "/opt/homebrew/opt/libpq/bin"
fish_add_path "$HOME/go/bin"
fish_add_path "$HOME/flutter/bin"

set EDITOR vim
set fish_greeting

eval "$(/opt/homebrew/bin/brew shellenv)"

source ~/.asdf/asdf.fish
source ~/.asdf/plugins/java/set-java-home.fish

direnv hook fish | source
fnm env --use-on-cd | source
starship init fish | source
