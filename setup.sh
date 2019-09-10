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

export EXTRA_INSTALL=$(LC_ALL=en_US.UTF-8 \
  whiptail --notags --title "Select whatever you want" \
  --checklist "Select whatever you want" 0 0 0 \
  'echo "Installing Android SDK..." && brew cask install android-sdk > /dev/null' 'Android SDK' on \
  'echo "Installing asciinema..." && brew install asciinema > /dev/null' 'asciinema' on \
  'echo "Installing bash-completion2..." && brew install bash-completion2 > /dev/null' 'bash-completion2' on \
  'echo "Installing chromedriver..." && brew install chromedriver > /dev/null' 'chromedriver' on \
  'echo "Installing Firebase..." && brew install firebase-cli > /dev/null' 'Firebase' on \
  'echo "Installing Firefox..." && brew cask install --appdir="/Applications" firefox > /dev/null' 'Firefox' on \
  'echo "Installing Golang..." && brew install go > /dev/null' 'Golang' on \
  'echo "Installing Google Chrome Canary..." && brew cask install --appdir="/Applications" google-chrome-canary > /dev/null' 'Google Chrome Canary' on \
  'echo "Installing Google Drive File Stream..." && brew cask install --appdir="/Applications" google-drive-file-stream > /dev/null' 'Google Drive File Stream' on \
  'echo "Installing IINA..." && brew cask install --appdir="/Applications" iina > /dev/null' 'IINA' on \
  'echo "Installing Java..." && brew cask install --appdir="/Applications" java > /dev/null' 'Java' on \
  'echo "Installing OSXFuse..." && brew cask install osxfuse > /dev/null' 'OSXFuse' on \
  'echo "Installing Pyenv..." && brew install pyenv > /dev/null' 'Pyenv' on \
  'echo "Installing pyenv-virtualenv..." && brew install pyenv-virtualenv > /dev/null' 'pyenv-virtualenv' on \
  'echo "Installing screen..." && brew install homebrew/dupes/screen > /dev/null' 'screen' on \
  'echo "Installing sfnt2woff-zopfli..." && brew install sfnt2woff-zopfli > /dev/null' 'sfnt2woff-zopfli' on \
  'echo "Installing sfnt2woff..." && brew install sfnt2woff > /dev/null' 'sfnt2woff' on \
  'echo "Installing Sip..." && brew cask install --appdir="/Applications" sip > /dev/null' 'Sip' on \
  'echo "Installing Slack..." && brew cask install --appdir="/Applications" slack > /dev/null' 'Slack' on \
  'echo "Installing Sops..." && brew install sops > /dev/null' 'Sops' on \
  'echo "Installing speedtest_cli..." && brew install speedtest_cli > /dev/null' 'speedtest_cli' on \
  'echo "Installing Spotify..." && brew cask install --appdir="/Applications" spotify > /dev/null' 'Spotify' on \
  'echo "Installing ssh-copy-id..." && brew install ssh-copy-id > /dev/null' 'ssh-copy-id' on \
  'echo "Installing SSH-FS..." && brew install sshfs > /dev/null' 'SSH-FS' on \
  'echo "Installing sshuttle..." && brew install sshuttle > /dev/null' 'sshuttle' on \
  'echo "Installing Sublime Text..." && brew cask install --appdir="/Applications" sublime-text > /dev/null' 'Sublime Text' on \
  'echo "Installing Tableplus..." && brew cask install --appdir="/Applications" tableplus > /dev/null' 'Tableplus' on \
  'echo "Installing tig..." && brew install tig > /dev/null' 'tig' on \
  'echo "Installing Trash..." && brew install trash > /dev/null' 'Trash' on \
  3>&1 1>&2 2>&3)
export EXTRA_INSTALL=$(echo $EXTRA_INSTALL | sed -e 's/" "/ \&\& /g' -e 's/^"//g' -e 's/"$//g')


echo "Installing some basic stuff..."
echo "Installing Antigen..." && brew install antigen > /dev/null
echo "Installing bash..." && brew install bash > /dev/null
echo "Installing bat..." && brew install bat > /dev/null
echo "Installing Clipy..." && brew cask install clipy > /dev/null
echo "Installing cmake..." && brew install cmake > /dev/null
echo "Installing coreutils..." && brew install coreutils > /dev/null
echo "Installing Docker..." && brew cask install --appdir="/Applications" docker > /dev/null
echo "Installing findutils..." && brew install findutils > /dev/null
echo "Installing font-fira-code..." && brew cask install font-fira-code > /dev/null
echo "Installing font-hack..." && brew cask install font-hack > /dev/null
echo "Installing font-roboto-mono..." && brew cask install font-roboto-mono > /dev/null
echo "Installing Fork..." && brew cask install --appdir="/Applications" fork > /dev/null
echo "Installing fzf..." && brew install fzf > /dev/null
echo "Installing git..." && brew install git > /dev/null
echo "Installing gnu-sed..." && brew install gnu-sed --with-default-names > /dev/null
echo "Installing Google Chrome..." && brew cask install --appdir="/Applications" google-chrome > /dev/null
echo "Installing grep..." && brew install homebrew/dupes/grep > /dev/null
echo "Installing htop..." && brew install htop > /dev/null
echo "Installing httpie..." && brew install httpie > /dev/null
echo "Installing iTerm2..." && brew cask install --appdir="/Applications" iterm2 > /dev/null
echo "Installing jq..." && brew install jq > /dev/null
echo "Installing lsd..." && brew install lsd > /dev/null
echo "Installing mosh..." && brew install mosh > /dev/null
echo "Installing ncdu..." && brew install ncdu > /dev/null
echo "Installing node..." && brew install node > /dev/null
echo "Installing openssh..." && brew install homebrew/dupes/openssh > /dev/null
echo "Installing OpenSSL..." && brew install openssl > /dev/null
echo "Installing Python 2..." && brew install python2 > /dev/null
echo "Installing Python 3..." && brew install python3 > /dev/null
echo "Installing RAR..." && brew install rar > /dev/null
echo "Installing reattach-to-user-namespace..." && brew install reattach-to-user-namespace > /dev/null
echo "Installing rg..." && brew install rg > /dev/null
echo "Installing Spectacle..." && brew cask install --appdir="/Applications" spectacle > /dev/null
echo "Installing Telegram Desktop..." && brew cask install --appdir="/Applications" telegram-desktop > /dev/null
echo "Installing The Unarchiver..." && brew cask install --appdir="/Applications" the-unarchiver > /dev/null
echo "Installing TLDR..." && brew install tldr > /dev/null
echo "Installing tmux..." && brew install tmux > /dev/null
echo "Installing tree..." && brew install tree > /dev/null
echo "Installing vim..." && brew install vim --override-system-vi > /dev/null
echo "Installing Visual Studio Code..." && brew cask install --appdir="/Applications" visual-studio-code > /dev/null
echo "Installing VLC..." && brew cask install --appdir="/Applications" vlc > /dev/null
echo "Installing wget..." && brew install wget --with-iri > /dev/null
echo "Installing woff2..." && brew install woff2 > /dev/null
echo "Installing Z..." && brew install z > /dev/null
echo "Installing ZSH..." && brew install zsh > /dev/null
echo "Installing git-open" && npm install --global git-open > /dev/null

echo "Installing your selected stuff..."
eval $EXTRA_INSTALL

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

echo "Installing Python 2 virtualenv..." \
  && pip2 install virtualenv virtualenvwrapper > /dev/null

echo "Installing Python 3 virtualenv..." \
  && pip3 install virtualenv virtualenvwrapper > /dev/null

echo "Setting up iTerm2..." \
  && cp com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist \
  && defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/Library/Preferences" \
  && defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

echo "Installing oh-my-zsh..." && curl -fsSL -o /tmp/install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh && sh /tmp/install.sh --unattended
echo "Setting up ZSH" && cp .zshrc ~/.zshrc
echo "Setting up tmux" && cp .tmux.conf ~/.tmux.conf
