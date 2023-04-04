#!/bin/sh

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

brew tap homebrew/cask-fonts
brew install --cask font-fira-code

# Install other useful stuff
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
brew install fish helix btop tig neovim coreutils curl git bat postgresql@15

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
curl -sS https://starship.rs/install.sh | sh

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions

# Setup Projects folder and clone dotfiles
mkdir ~/Projects && cd ~/Projects
git clone https://github.com/goalves/dotfiles

# Didn't test but I think it works
cp -rsf /Users/goalves/Projects/dotfiles/home/. /Users/goalves
