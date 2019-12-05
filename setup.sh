#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Installing Xcode Command Line Tools..."
xcode-select --install

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update > /dev/null
brew upgrade > /dev/null
brew install newt > /dev/null
brew tap caskroom/cask > /dev/null
brew tap bramstein/webfonttools > /dev/null
brew tap caskroom/fonts > /dev/null

echo "Installing stuff..."

echo "Installing Android SDK..." && brew cask install android-sdk > /dev/null
echo "Installing Antigen..." && brew install antigen > /dev/null
echo "Installing asciinema..." && brew install asciinema > /dev/null
echo "Installing bash_completion2..." && brew install bash-completion2 > /dev/null
echo "Installing bash..." && brew install bash > /dev/null
echo "Installing bat..." && brew install bat > /dev/null
echo "Installing chromedriver..." && brew install chromedriver > /dev/null
echo "Installing Clipy..." && brew cask install clipy > /dev/null
echo "Installing cmake..." && brew install cmake > /dev/null
echo "Installing coreutils..." && brew install coreutils > /dev/null
echo "Installing Docker..." && brew cask install --appdir="/Applications" docker > /dev/null
echo "Installing findutils..." && brew install findutils > /dev/null
echo "Installing firebase_cli..." && brew install firebase-cli > /dev/null
echo "Installing firefox..." && brew cask install --appdir="/Applications" firefox > /dev/null
echo "Installing font-fira-code..." && brew cask install font-fira-code > /dev/null
echo "Installing font-hack..." && brew cask install font-hack > /dev/null
echo "Installing font-roboto-mono..." && brew cask install font-roboto-mono > /dev/null
echo "Installing Fork..." && brew cask install --appdir="/Applications" fork > /dev/null
echo "Installing fz..." && curl "https://raw.githubusercontent.com/changyuheng/fz/master/fz.sh" > ~/.fz.sh
echo "Installing fzf..." && brew install fzf > /dev/null
echo "Installing gci..." && npm install -g 'victor141516/git-checkout-interactive#patch-1' > /dev/null
echo "Installing git-open" && npm install --global https://github.com/victor141516/git-o > /dev/null
echo "Installing git..." && brew install git > /dev/null
echo "Installing gnu-sed..." && brew install gnu-sed --with-default-names > /dev/null
echo "Installing go..." && brew install go > /dev/null
echo "Installing Google Chrome Canary..." && brew cask install --appdir="/Applications" google-chrome-canary > /dev/null
echo "Installing Google Chrome..." && brew cask install --appdir="/Applications" google-chrome > /dev/null
echo "Installing Google Cloud SDK..." && brew cask install google-cloud-sdk > /dev/null
echo "Installing Google Drive File Stream..." && brew cask install --appdir="/Applications" google-drive-file-stream > /dev/null
echo "Installing grep..." && brew install grep > /dev/null
echo "Installing htop..." && brew install htop > /dev/null
echo "Installing httpie..." && brew install httpie > /dev/null
echo "Installing iina..." && brew cask install --appdir="/Applications" iina > /dev/null
echo "Installing iTerm2..." && brew cask install --appdir="/Applications" iterm2 > /dev/null
echo "Installing Java..." && brew cask install --appdir="/Applications" java > /dev/null
echo "Installing jq..." && brew install jq > /dev/null
echo "Installing lsd..." && brew install lsd > /dev/null
echo "Installing mosh..." && brew install mosh > /dev/null
echo "Installing ncdu..." && brew install ncdu > /dev/null
echo "Installing node..." && brew install node > /dev/null
echo "Installing openssh..." && brew install openssh > /dev/null
echo "Installing OpenSSL..." && brew install openssl > /dev/null
echo "Installing osxfuse..." && brew cask install osxfuse > /dev/null
echo "Installing pyenv-virtualenv..." && brew install pyenv-virtualenv > /dev/null
echo "Installing pyenv..." && brew install pyenv > /dev/null
echo "Installing Python 2..." && brew install python2 > /dev/null
echo "Installing Python 3..." && brew install python3 > /dev/null
echo "Installing RAR..." && brew install rar > /dev/null
echo "Installing reattach-to-user-namespace..." && brew install reattach-to-user-namespace > /dev/null
echo "Installing rg..." && brew install rg > /dev/null
echo "Installing screen..." && brew install screen > /dev/null
echo "Installing sfnt2woff_zopfli..." && brew install sfnt2woff-zopfli > /dev/null
echo "Installing sfnt2woff..." && brew install sfnt2woff > /dev/null
echo "Installing Sip..." && brew cask install --appdir="/Applications" sip > /dev/null
echo "Installing Slack..." && brew cask install --appdir="/Applications" slack > /dev/null
echo "Installing sops..." && brew install sops > /dev/null
echo "Installing Spectacle..." && brew cask install --appdir="/Applications" spectacle > /dev/null
echo "Installing speedtest_cli..." && brew install speedtest_cli > /dev/null
echo "Installing Spotify..." && brew cask install --appdir="/Applications" spotify > /dev/null
echo "Installing ssh-copy-id..." && brew install ssh-copy-id > /dev/null
echo "Installing sshfs..." && brew install sshfs > /dev/null
echo "Installing sshuttle..." && brew install sshuttle > /dev/null
echo "Installing Sublime Text..." && brew cask install --appdir="/Applications" sublime-text > /dev/null
echo "Installing TablePlus..." && brew cask install --appdir="/Applications" tableplus > /dev/null
echo "Installing Telegram Desktop..." && brew cask install --appdir="/Applications" telegram-desktop > /dev/null
echo "Installing The Unarchiver..." && brew cask install --appdir="/Applications" the-unarchiver > /dev/null
echo "Installing tig..." && brew install tig > /dev/null
echo "Installing TLDR..." && brew install tldr > /dev/null
echo "Installing tmux..." && brew install tmux > /dev/null
echo "Installing tpm" && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm > /dev/null
echo "Installing trash..." && brew install trash > /dev/null
echo "Installing tree..." && brew install tree > /dev/null
echo "Installing vim..." && brew install vim --override-system-vi > /dev/null
echo "Installing Visual Studio Code..." && brew cask install --appdir="/Applications" visual-studio-code > /dev/null
echo "Installing VLC..." && brew cask install --appdir="/Applications" vlc > /dev/null
echo "Installing wget..." && brew install wget --with-iri > /dev/null
echo "Installing woff2..." && brew install woff2 > /dev/null
echo "Installing Z..." && curl -fsSL "https://raw.githubusercontent.com/rupa/z/master/z.sh" > ~/.z.sh
echo "Installing ZSH..." && brew install zsh > /dev/null

brew cleanup

if ! fgrep -q "/usr/local/bin/bash" /etc/shells; then
  echo "/usr/local/bin/bash" | sudo tee -a /etc/shells;
fi;

if ! fgrep -q "/usr/local/bin/zsh" /etc/shells; then
  echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/zsh;
  sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
fi;

touch ~/.hushlogin # Hides last login
defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 2 # normal minimum is 2 (30 ms)

echo "Installing node lts" && \
  npm install -g n && \
  sudo n install lts

echo "Installing Python 2 virtualenv..." \
  && pip2 install virtualenv virtualenvwrapper > /dev/null

echo "Installing Python 3 virtualenv..." \
  && pip3 install virtualenv virtualenvwrapper > /dev/null

echo "Setting up iTerm2..." \
  && cp com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist \
  && defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/Library/Preferences" \
  && defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

echo "Installing oh-my-zsh..." && curl -fsSL -o /tmp/install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh && sh /tmp/install.sh --unattended && rm /tmp/install.sh
echo "Setting up ZSH" && cp .zshrc ~/.zshrc
echo "Setting up tmux" && cp .tmux.conf ~/.tmux.conf

defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc

echo ' --------------------------------------------------'
echo '| Run tmux and press prefix + I to get all plugins |'
echo ' --------------------------------------------------'
