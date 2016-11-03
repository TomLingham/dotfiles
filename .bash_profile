################
# Source filez #
################

source ~/.bash_alias
[[ -f ~/.custom ]] && source ~/.custom

export PS1="\[\033[38;5;1m\]\u\[$(tput sgr0)\]\[\033[38;5;4m\]@\[$(tput sgr0)\]\[\033[38;5;2m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;5m\]\W\[$(tput sgr0)\]\[\033[38;5;3m\]\\$ \[$(tput sgr0)\]"
export FZF_DEFAULT_COMMAND='ag --ignore compiled_lib --ignore node_modules --ignore .git --ignore _build --ignore deps --hidden -i -g ""'
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export LS_COLORS='di=0;31:ow=1;32:'
export VISUAL=nvim
export EDITOR="$VISUAL"
export PATH=$PATH:$GOROOT/bin

case $(hostname -s) in
  macbuddy)
    # empty because deprecated
    ;;
  *)
    export FZF_PATH=/home/s98430/.fzf/bin
    export NVM_DIR="/home/$(whoami)/.nvm"
    export JAVA_HOME="/usr/lib/jvm/java-8-oracle"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash
    ;;
esac

