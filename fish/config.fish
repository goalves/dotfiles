set -e fish_user_paths
set -U fish_user_paths "/usr/local/sbin" $fish_user_paths
set -U fish_user_paths "/usr/local/bin" $fish_user_paths
set -U fish_user_paths "$HOME/.cargo/bin" $fish_user_paths
set -U fish_user_paths "$HOME/.poetry/bin" $fish_user_paths
set -U EDITOR vim
set fish_greeting

source /opt/asdf-vm/asdf.fish

eval (starship init fish)
