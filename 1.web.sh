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

brew install node
brew install yarn
brew install composer
brew install chromedriver
brew install phantomjs
brew install mysql
brew install homebrew/php/php71 --with-imap
brew install homebrew/php/php71-mcrypt

# Remove outdated versions from the cellar.
brew cleanup

# npm install -g coffee-script
# npm install -g grunt-cli
# npm install -g jshint
# npm install -g less
