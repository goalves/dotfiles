set -e fish_user_paths
set -U fish_user_paths "/usr/local/sbin" $fish_user_paths

set -U EDITOR vim

eval (starship init fish)
