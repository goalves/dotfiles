#!/bin/sh

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install Brew stuff from leaves file
xargs brew install < leaves.txt

# Install oh my fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# Install ASDF
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

# Setup Projects folder and clone dotfiles
mkdir ~/Projects && cd ~/Projects
git clone https://github.com/goalves/dotfiles

# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Setup ASDF elixir and erlang
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Configure Fish
mkdir -p ~/.config/fish/completions
ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions

# Use stow to configure the home/.config files to their correct location ~/.

# Configure Wezterm
ln -s wezterm.lua ~/.config/wezterm/wezterm.lua
