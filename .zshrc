# Old: autoload -U +X bashcompinit && bashcompinit
# New:
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi


# Homebrew
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
test -d /home/linuxbrew/.linuxbrew/bin && export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
test -d $HOME/.linuxbrew/bin && export PATH="${PATH+$PATH:}$HOME/.linuxbrew/bin"
test -d /opt/homebrew/bin && export PATH="${PATH+$PATH:}/opt/homebrew/bin"
test -d /opt/homebrew/sbin && export PATH="${PATH+$PATH:}/opt/homebrew/sbin"

# Starship
eval "$(starship init zsh)"

# ZSH plugins
if test -d $HOME/.oh-my-zsh; then
    export ZSH="$HOME/.oh-my-zsh"
    plugins=(git docker-compose docker zsh-syntax-highlighting zsh-autosuggestions h)  # https://github.com/paoloantinori/hhighlighter
    fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
    source $ZSH/oh-my-zsh.sh
fi

# Go
if test -f /usr/local/go/bin/go &> /dev/null; then
    export GOROOT=/usr/local/go
    export GOPATH="$HOME/go"
    export PATH="/opt/things:$PATH"
    export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
fi

# Python
if command -v pyenv &>/dev/null; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
		if command -v virtualenv-init &>/dev/null; then
    		eval "$(pyenv virtualenv-init -)"
		fi
    export PYTHONDONTWRITEBYTECODE=1
    if [ -f "$PYENV_ROOT/versions/$(pyenv global)/bin/virtualenvwrapper.sh" ]; then
        source "$PYENV_ROOT/versions/$(pyenv global)/bin/virtualenvwrapper.sh";
    fi
    export PYTHONBREAKPOINT=ipdb.set_trace
    export IPDB_CONTEXT_SIZE=11
fi
export VIRTUALENVWRAPPER_PYTHON=python
command -v virtualenvwrapper.sh &>/dev/null && source virtualenvwrapper.sh 2>/dev/null;  # to hide errors in console because of pyenv
export WORKON_HOME=$HOME/.venvs
alias venv3='workon . || mkvirtualenv -p $(which python3) ${PWD##*/}'
alias venv2='workon . || mkvirtualenv -p $(which python2) ${PWD##*/}'
alias venv=venv3
if [ -f "/usr/local/bin/virtualenvwrapper.sh" ]; then source /usr/local/bin/virtualenvwrapper.sh; fi
if [ -f "$HOME/.local/bin/virtualenvwrapper.sh" ]; then source $HOME/.local/bin/virtualenvwrapper.sh; fi
test -d /opt/homebrew/opt/python/libexec/bin && export PATH="$PATH:/opt/homebrew/opt/python/libexec/bin"

[ $PREFIX ] && export N_PREFIX=$PREFIX  # For n to work in termux

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# [ -f ~/.fz.sh ] && source ~/.fz.sh
# [ -f ~/.z.sh ] && source ~/.z.sh

if command -v atuin &>/dev/null; then
    ATUIN_NOBIND=1 eval "$(atuin init zsh)"
    bindkey '^r' _atuin_search_widget
fi


export PATH="$HOME/.local/bin:/usr/local/opt/grep/libexec/gnubin:$PATH"
test -d /usr/lib/dart/bin && export PATH="$PATH:/usr/lib/dart/bin"
test -d /.deno/bin && export PATH="$PATH:$HOME/.deno/bin"

# Bun
if [ -d "$HOME/.bun" ]; then
    export BUN_INSTALL="$HOME/.bun"
    export PATH="$BUN_INSTALL/bin:$PATH"
fi

# Java
if [ -d "/opt/homebrew/opt/openjdk" ]; then
    export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
fi

eval "$(zoxide init zsh)"

export EDITOR=nano
alias p=popd
alias cat=bat
alias gro=git-o
alias gg=ggpush
alias ggg='ggpush --force'
alias gp=ggpull
alias gcdtn='git commit --amend --no-edit --no-verify --date "$(date)"'
alias gudtn=gcdtn
alias glog='git log --oneline --decorate --graph --all --full-history'
alias gmnff="git merge --no-ff"
alias gwip='git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
alias gawip="git add -A; git rm \$(git ls-files --deleted) 2> /dev/null; gwip"
alias gcedit='git commit --amend --no-verify'
alias ls='lsd'
alias path='echo $PATH | tr -s ":" "\n"'
alias uuid="python -c 'from uuid import uuid4; print(str(uuid4()))'"
alias code.="code ."
alias mosh='LC_ALL="en_US.UTF-8" mosh'
alias docker-update-container='docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    containrrr/watchtower --run-once'
command -v open &>/dev/null || alias open='gio open'

gci() {
 git checkout "$(git branch --all | fzf | tr -d '[:space:]')"
}

alias k=kubectl
command -v kubectl &>/dev/null && source <(kubectl completion zsh)
compdef k="kubectl"
command -v minikube &>/dev/null && source <(minikube completion zsh)

# bye sc
# export SC_SRC=/home/victor141516/Code/Work/shuttlecloud

case "$(uname -s)" in
Darwin)
    # OSX
    alias fork='open -a Fork .'
    # Force x86 on Apple Silicon
    export DOCKER_DEFAULT_PLATFORM=linux/amd64
    alias restart-audio-service="sudo pkill -9 coreaudiod"
    ;;
Linux)
    if test -r /proc/version && grep -qi Microsoft /proc/version; then
        # WSL
        alias fork='/mnt/c/Windows/System32/cmd.exe /c "%USERPROFILE%\\AppData\Local\Fork\Fork.exe "$(wslpath -w -a .) 2> /dev/null'
        # /mnt/c/Users/victor141516/AppData/Local/Fork/Fork.exe $(wslpath -w $1)

        export WINDOWS_IP="$(ipconfig.exe | grep -A6 WSL | grep 'IPv4 Address' | awk '{print $NF}' | tr -d '\r')"
        export DISPLAY="$WINDOWS_IP:0.0"
        alias open="powershell.exe Start-Process"

        # Start or enter a PID namespace in WSL2
        # source /usr/sbin/start-systemd-namespace

        # Fix Wireguard stuff
        alias fix-ssh='sudo ip link set dev eth0 mtu 1400'
    else
        # Linux
    fi
    ;;
esac

if command -v sshfs &>/dev/null; then
    function sshlcode() {
        DIR=.$(echo $1 | sed 's/[@.:\/]/_/g') &&
            mkdir -p $DIR &&
            sshfs $1 $DIR &&
            code --new-window --wait $DIR
        echo "Unmounting..." &&
            until sudo umount $DIR 2>/dev/null; do sleep 0.1; done &&
            rmdir $DIR
    }
fi

if [ -d "${HOME}/.npm-packages" ]; then
    NPM_PACKAGES="${HOME}/.npm-packages"
    export PATH="$PATH:$NPM_PACKAGES/bin"
fi

function take() {
    mkdir $1
    cd $1
}

if [ -d "$HOME/.asdf" ]; then
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
fi

function export-dotenv() {
    export $(cat "${1:-.env}" | grep -v '^#' | xargs)
}
alias load-dotenv='export-dotenv'

# gcloud
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

[ -f "~/.zshrc.secrets" ] && source ~/.zshrc.secrets
export TERM=xterm-256color
command -v code >/dev/null && export EDITOR='code -w'

function deploy_web_to_viti.site() {
  [ $1 ] || return
  npm run build &&
    zip -r dist.zip dist &&
    scp dist.zip victor141516@viti.site:dist.zip &&
    rm dist.zip &&
    ssh victor141516@viti.site "zsh -i -c 'rm -rf services/webs/$1/* ; unzip dist.zip -d services/webs/$1 && \
      rm dist.zip && \
      mv services/webs/$1/dist/* services/webs/$1 && \
      rmdir services/webs/$1/dist'"
}

alias fzf="fzf --reverse --preview 'if [ -f {} ]; then
    bat --color=always {}
elif [ -d {} ]; then
    lsd -la --color=always {}
else
    echo No preview available for \"{}\"
fi'"

function z() {
    if [ $# -eq 0 ]; then
        ZOXIDE_RESULT=$(zoxide query -l | fzf)
        if [ ! -z "$ZOXIDE_RESULT" ]; then
            cd "$ZOXIDE_RESULT"
        fi
    else
        __zoxide_z "$@"  
    fi
}

# function \$() {$@}
# bun completions
[ -s "/Users/victor141516/.bun/_bun" ] && source "/Users/victor141516/.bun/_bun"
