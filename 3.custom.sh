#!/usr/bin/env zsh

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

# Install antigen
brew install antigen

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "source /usr/local/share/antigen/antigen.zsh" > ~/.zshrc

# Adds antigen config
echo >> ~/.zshrc
echo "# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle adb
antigen bundle autopep8
antigen bundle command-not-found
antigen bundle composer
antigen bundle docker-compose
antigen bundle docker
antigen bundle extract
antigen bundle git
antigen bundle gulp
antigen bundle jsontools
antigen bundle laravel5
antigen bundle npm
antigen bundle pip
antigen bundle pep8
antigen bundle python
antigen bundle sublime
antigen bundle yarn


# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

# Load the theme.
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

# Tell Antigen that you're done.
antigen apply" >> ~/.zshrc

source ~/.zshrc


# Hides last login
touch ~/.hushlogin

defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

