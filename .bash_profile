################
# Source filez #
################

source ~/.bash_alias
source ~/.custom

export PS1="\[\033[38;5;1m\]\u\[$(tput sgr0)\]\[\033[38;5;4m\]@\[$(tput sgr0)\]\[\033[38;5;2m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;5m\]\W\[$(tput sgr0)\]\[\033[38;5;3m\]\\$ \[$(tput sgr0)\]"
export FZF_DEFAULT_COMMAND='ag --ignore compiled_lib --ignore node_modules --ignore .git --hidden -i -g ""'
export NVIM_TUI_ENABLE_TRUE_COLOR=1

export LS_COLORS='di=0;31:ow=1;32:'
export PATH=$PATH:$GOROOT/bin

case $(hostname -s) in
  macbuddy)
    export GOPATH=~/Source/go/
    export GOROOT=~/Source/go/
    export PATH=$PATH:/usr/local/opt/go/libexec/bin
    export RUST_SRC_PATH=~/Source/rust/src
    export FZF_PATH=/usr/local/opt/fzf
    ;;
  *)
    export FZF_PATH=/home/s98430/.fzf/bin
    export NVM_DIR="/home/$(whoami)/.nvm"
    export JAVA_HOME="/usr/lib/jvm/java-8-oracle"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
    ;;
esac

