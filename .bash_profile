# Load .bashrc if it exists, only needed for mac
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

export PS1="\[\033[38;5;72m\]\u\[$(tput sgr0)\]\[\033[38;5;249m\]@\[$(tput sgr0)\]\[\033[38;5;214m\]\h\[$(tput sgr0)\]\[\033[38;5;249m\]:\[$(tput sgr0)\]\[\033[38;5;209m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\]\\$ \[$(tput sgr0)\]"
source ~/.bash_alias
