set -e fish_user_paths
set -U fish_user_paths "/usr/local/sbin" $fish_user_paths
set -U fish_user_paths "/usr/local/bin" $fish_user_paths
set -U fish_user_paths "$HOME/.cargo/bin" $fish_user_paths
set -U fish_user_paths "$HOME/.poetry/bin" $fish_user_paths
set -U EDITOR vim

eval (starship init fish)

source /opt/asdf-vm/asdf.fish
set -g fish_user_paths "/usr/local/opt/mysql@5.6/bin" $fish_user_paths
