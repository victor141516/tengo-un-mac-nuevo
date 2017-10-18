#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# iterm should be already installed, but just in case
brew cask install --appdir="/Applications" iterm2
brew install zsh

# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/Library/Preferences"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

echo "------------------------------"
echo "Downloading previous config to ~/Library/Preferences"
curl -L https://gist.githubusercontent.com/ZiFFeL1992/d058534081ee0e8741dff5fd644389ee/raw/14caaafe5be5f5fc2f060640a8e65b482e42825f/com.googlecode.iterm2.plist > ~/Library/Preferences/com.googlecode.iterm2.plist

# Change default shell to zsh
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

echo "------------------------------"
echo "Opening iTerm.app..."
echo "Run custom.zsh from iTerm.app"
sleep 5

open -a iTerm.app
