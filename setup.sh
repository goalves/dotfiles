#!/bin/sh

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

brew tap homebrew/cask-fonts
brew install --cask font-fira-code

# Install other useful stuff
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
brew install fish helix tmux btop tig neovim coreutils curl git bat alacritty postgresql@15 libpq fnm

# Install oh my fish
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

# Install Rust
curl -sS https://starship.rs/install.sh | sh

# Install ASDF
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3

# Setup Projects folder and clone dotfiles
mkdir ~/Projects && cd ~/Projects
git clone https://github.com/goalves/dotfiles

# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install nerdfonts
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font

# Setup ASDF elixir and erlang
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git

# Now manually install files to their locations

# Configure Fish
mkdir -p ~/.config/fish/completions
ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions