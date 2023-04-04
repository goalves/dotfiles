set -e fish_user_paths
set fish_user_paths "/usr/local/sbin" $fish_user_paths
set fish_user_paths "/usr/local/bin" $fish_user_paths
set fish_user_paths "/opt/homebrew/bin/fish" $fish_user_paths
set fish_user_paths "$HOME/.cargo/bin" $fish_user_paths
set EDITOR vim

eval "$(/opt/homebrew/bin/brew shellenv)"

source ~/.asdf/asdf.fish

starship init fish | source
