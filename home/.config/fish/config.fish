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

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

direnv hook fish | source
fnm env --use-on-cd | source
starship init fish | source
