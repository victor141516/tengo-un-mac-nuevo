if [ -f "/usr/local/share/antigen/antigen.zsh" ]; then source /usr/local/share/antigen/antigen.zsh; fi
if [ -f "$HOME/.antigen.zsh" ]; then source $HOME/.antigen.zsh; fi

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
antigen bundle sindresorhus/pure@main
antigen apply

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
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    export PYTHONDONTWRITEBYTECODE=1
    if [ -f "$PYENV_ROOT/versions/$(pyenv global)/bin/virtualenvwrapper.sh" ]; then source "$PYENV_ROOT/versions/$(pyenv global)/bin/virtualenvwrapper.sh"; fi
    export PYTHONBREAKPOINT=ipdb.set_trace
    export IPDB_CONTEXT_SIZE=11
fi
export VIRTUALENVWRAPPER_PYTHON=python
export WORKON_HOME=$HOME/.venvs
alias venv3='workon . || mkvirtualenv -p $(which python3) ${PWD##*/}'
alias venv2='workon . || mkvirtualenv -p $(which python2) ${PWD##*/}'
alias venv=venv3
if [ -f "/usr/local/bin/virtualenvwrapper.sh" ]; then source /usr/local/bin/virtualenvwrapper.sh; fi
if [ -f "$HOME/.local/bin/virtualenvwrapper.sh" ]; then source $HOME/.local/bin/virtualenvwrapper.sh; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.z.sh ] && source ~/.z.sh
[ -f ~/.fz.sh ] && source ~/.fz.sh

export PATH="$HOME/.local/bin:/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="$PATH:/usr/lib/dart/bin"

export EDITOR=nano
alias p=popd
alias cat=bat
alias gro=git-o
alias gg=ggpush
alias ggg='ggpush --force'
alias gp=ggpull
alias gcdtn='git commit --amend --no-edit --no-verify --date "$(date)"'
alias glog='git log --oneline --decorate --graph --all --full-history'
alias gmnff="git merge --no-ff"
alias gwip='git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
alias gawip="git add -A; git rm $(git ls-files --deleted) 2> /dev/null; gwip"
alias gk=gitkraken
alias ls='lsd'
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

alias k=kubectl
source <(kubectl completion zsh)
compdef k="kubectl"
source <(minikube completion zsh)

export SC_SRC=/home/victor141516/Code/Work/shuttlecloud

case "$(uname -s)" in
Darwin)
    # OSX
    alias fork='open -a Fork .'
    ;;
Linux)
    if grep -qi Microsoft /proc/version; then
        # WSL
        alias fork='/mnt/c/Windows/System32/cmd.exe /c "%USERPROFILE%\\AppData\Local\Fork\Fork.exe "$(wslpath -w -a .) 2> /dev/null'
        # /mnt/c/Users/victor141516/AppData/Local/Fork/Fork.exe $(wslpath -w $1)

        export WINDOWS_IP="$(ipconfig.exe | grep -A6 WSL | grep 'IPv4 Address' | awk '{print $NF}' | tr -d '\r')"
        export DISPLAY="$WINDOWS_IP:0.0"
        alias open="powershell.exe Start-Process"
	alias ding="/mnt/c/Program\ Files/VideoLAN/VLC/vlc.exe --intf dummy http://www.sonidosmp3gratis.com/sounds/010762485_prev.mp3 vlc://quit"

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

function take() {
    mkdir $1
    cd $1
}

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# gcloud
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

source ~/.zshrc.secrets
export TERM=xterm-256color
command -v code >/dev/null && export EDITOR='code -w'

#code () {
#    docker run -d --rm \
#        --name code-server \
#        --network caddywork \
#        -e 'SERVICE_URL=https://marketplace.visualstudio.com/_apis/public/gallery' \
#        -e 'ITEM_URL=https://marketplace.visualstudio.com/items' \
#        -v "$HOME:/home/coder/project" \
#        -v "$HOME/remote/code-server-config/config:/home/coder/.config" \
#        -v "$HOME/remote/code-server-config/local:/home/coder/.local/share/code-server" \
#        -u "$(id -u):$(id -g)" \
#        --entrypoint '' \
#        codercom/code-server:latest /home/coder/.config/entrypoint.sh > /dev/null 2> /dev/null
#
#    REMOTEPATH=$(echo "$(readlink -f $1)" | sed "s/$(echo $HOME | sed 's/\//\\\//g')/\/home\/coder\/project/")
#
#    echo '"%programfiles(x86)%\\Google\\Chrome\\Application\\chrome.exe" --ignore-certificate-errors --app=https://codes.viti.site/?folder='$REMOTEPATH
#}

function \$() {$@}

autoload -U +X bashcompinit && bashcompinit
