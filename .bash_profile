export PS1="\[\033[38;5;72m\]\u\[$(tput sgr0)\]\[\033[38;5;249m\]@\[$(tput sgr0)\]\[\033[38;5;214m\]\h\[$(tput sgr0)\]\[\033[38;5;249m\]:\[$(tput sgr0)\]\[\033[38;5;209m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\]\\$ \[$(tput sgr0)\]"
source ~/.bash_alias

export FZF_DEFAULT_COMMAND='ag -i --ignore compiled_lib --ignore node_modules -g ""'

case $(hostname -s) in
    macbuddy)
        export GOPATH=~/Source/go/
        export PATH=$PATH:/usr/local/opt/go/libexec/bin
        export PATH=$PATH:$GOPATH/bin
        export RUST_SRC_PATH=~/Source/rust/src
        export FZF_PATH=/usr/local/opt/fzf
        ;;
    *)
        ;;
esac
