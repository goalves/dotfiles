#!/bin/sh

# Configure Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0.5
defaults write com.apple.dock autohide-time-modifier -float 0.3
killall Dock

# Configure Keyboard
defaults write -g KeyRepeat -int 0
defaults write -g InitialKeyRepeat -int 15

# Configure menu bar
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.bluetooth" -bool true
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.spotlight" -bool false
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
killall SystemUIServer
