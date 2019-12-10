if [ -f "/usr/local/share/antigen/antigen.zsh" ]; then source /usr/local/share/antigen/antigen.zsh ; fi
if [ -f "$HOME/.antigen.zsh" ]; then source $HOME/.antigen.zsh  ; fi

# Antigen
antigen use oh-my-zsh
antigen bundle autopep8
antigen bundle command-not-found
antigen bundle docker-compose
antigen bundle docker
antigen bundle extract
antigen bundle git
antigen bundle npm
antigen bundle pip
antigen bundle pep8
antigen bundle python
antigen bundle paulirish/git-open
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen apply

# Go
export GOPATH="$HOME/go"
export PATH="/opt/things:$PATH"
export PATH=$PATH:$GOPATH/bin

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.pyenv/bin:$PATH"
export VIRTUALENVWRAPPER_PYTHON=python
export WORKON_HOME=$HOME/.venvs

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYTHONDONTWRITEBYTECODE=1
alias venv3='workon . || mkvirtualenv -p $(which python3.7) ${PWD##*/}'
alias venv2='workon . || mkvirtualenv -p $(which python2.7) ${PWD##*/}'
alias venv=venv3

if [ -f "/usr/local/bin/virtualenvwrapper.sh" ]; then source /usr/local/bin/virtualenvwrapper.sh ; fi
if [ -f "$PYENV_ROOT/versions/$(pyenv global)/bin/virtualenvwrapper.sh" ]; then source "$PYENV_ROOT/versions/$(pyenv global)/bin/virtualenvwrapper.sh" ; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.z.sh ] && source ~/.z.sh
[ -f ~/.fz.sh ] && source ~/.fz.sh
PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

export EDITOR=nano
alias p=popd
alias cat=bat
alias gro=git-o
alias gg=ggpush
alias ggg='ggpush --force'
alias gp=ggpull
alias gcdtn='git commit --amend --no-edit --date "$(date)"'
alias glog='git log --oneline --decorate --graph --all --full-history'
alias gk=gitkraken
alias ls='lsd'
alias fork='open -a Fork .'
alias path='echo $PATH | tr -s ":" "\n"'
alias uuid="python -c 'from uuid import uuid4; print(str(uuid4()))'"
alias code.="code ."
alias co="code -a"
alias rn=trash
alias mosh='LC_ALL="en_US.UTF-8" mosh'
alias clear_docker_logs="docker run -it --privileged \
    --pid=host debian nsenter -t 1 -m -u -n -i \
    sh -c 'truncate -s 0 /var/lib/docker/containers/*/*-json.log \
    && echo ok'"
alias docker-update-container='docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    containrrr/watchtower --run-once'
command -v open || alias open='gio open'

function sshlcode {
    DIR=.$(echo $1 | sed 's/[@.:\/]/_/g') && \
    mkdir -p $DIR && \
    sshfs $1 $DIR && \
    code --new-window --wait $DIR ; \
    echo "Unmounting..." && \
    until sudo umount $DIR 2> /dev/null; do sleep 0.1; done && \
    rmdir $DIR
}

function take {
    mkdir $1; cd $1
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

source ~/.zshrc.secrets
export TERM=xterm-256color
command -v code > /dev/null && export EDITOR='code -w'
