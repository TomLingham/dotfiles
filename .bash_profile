export PS1="\[\033[38;5;1m\]\u\[$(tput sgr0)\]\[\033[38;5;4m\]@\[$(tput sgr0)\]\[\033[38;5;2m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;5m\]\W\[$(tput sgr0)\]\[\033[38;5;3m\]\\$ \[$(tput sgr0)\]"
source ~/.bash_alias

export FZF_DEFAULT_COMMAND='ag --ignore compiled_lib --ignore node_modules -i -g ""'
export NVIM_TUI_ENABLE_TRUE_COLOR=1

case $(hostname -s) in
    macbuddy)
        source ~/.bashrc
        export GOPATH=~/Source/go/
        export PATH=$PATH:/usr/local/opt/go/libexec/bin
        export PATH=$PATH:$GOPATH/bin
        export RUST_SRC_PATH=~/Source/rust/src
        export FZF_PATH=/usr/local/opt/fzf
        ;;
    *)
        ;;
esac
