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

brew install composer
brew install homebrew/php/php71 --with-imap
brew install homebrew/php/php71-mcrypt

# Install laravel
composer global require "laravel/installer"

#Install valet
composer global require "laravel/valet"
valet install

mkdir ~/Sites

valet park ~/Sites