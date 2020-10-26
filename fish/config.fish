set -e fish_user_paths
set -U fish_user_paths "/usr/local/sbin" $fish_user_paths
set -U fish_user_paths "/usr/local/bin" $fish_user_paths
set -U fish_user_paths "$HOME/.cargo/bin" $fish_user_paths
set -U fish_user_paths "$HOME/.poetry/bin" $fish_user_paths
set -U EDITOR vim

eval (starship init fish)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/goalves/Downloads/google-cloud-sdk 2/path.fish.inc' ]; . '/Users/goalves/Downloads/google-cloud-sdk 2/path.fish.inc'; end

source /usr/local/opt/asdf/asdf.fish
set -g fish_user_paths "/usr/local/opt/mysql@5.6/bin" $fish_user_paths

source /usr/local/opt/asdf/asdf.fish
