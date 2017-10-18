#!/usr/bin/env bash

pip2 install virtualenv
pip2 install virtualenvwrapper

# Force brewed python
echo >> ~/.zshrc
echo >> ~/.zshrc
echo '# Use brewed python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"' >> ~/.zshrc

echo >> ~/.zshrc
echo '# Virtualenv config
export VIRTUALENVWRAPPER_PYTHON=/usr/local/opt/python/libexec/bin/python
export WORKON_HOME=$HOME/.venvs
source /usr/local/bin/virtualenvwrapper.sh' >> ~/.zshrc

source ~/.zshrc
