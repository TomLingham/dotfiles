#============================================
# ENV Settings
#============================================

export EDITOR="$VISUAL"
export FZF_DEFAULT_COMMAND='ag --path-to-ignore $HOME/.agignore --hidden -i -g ""'
export FZF_PATH="$HOME/.fzf/bin"
export LC_ALL="en_US.UTF-8"
export LS_COLORS='di=00;33:ow=01;32:*.js=00;36'
export VISUAL=nvim
export SOURCE_DIR=$HOME/Source
export ZPLUG_HOME=/usr/local/opt/zplug
export RUST_SRC_PATH=$HOME/.multirust/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src/

source <(go env)


#============================================
# Vi in CLI Mode
#============================================
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# compinit
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit


#============================================
# ZPlug
#============================================

# source $ZPLUG_HOME/init.zsh

# zplug load


#============================================
# Loading...
#============================================

# Load Aliases
[ -s "$HOME/.aliases" ] && source "$HOME/.aliases"

# Load Pure Prompt
[ -s "$SOURCE_DIR/pure/async.zsh" ] && source "$SOURCE_DIR/pure/async.zsh"
[ -s "$SOURCE_DIR/pure/pure.zsh" ] && source "$SOURCE_DIR/pure/pure.zsh"

# Load NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Load SDK Man
export SDKMAN_DIR="$HOME/.sdkman"
[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# FZF
[ -s "$HOME/.fzf.zsh" ] && source ~/.fzf.zsh

# Custom Scripts
[ -s "$HOME/.custom" ] && source ~/.custom


#============================================
# Path
#============================================

# Cargo
path+=("$HOME/.cargo/bin")

# Golang
path+=("$GOPATH/bin")

# Random Bins
path+=("$HOME/.somebin")


#============================================
# FPath
#============================================

fpath=( ~/.zfunc "${fpath[@]}" )
fpath=( /usr/local/share/zsh-completions $fpath )


#============================================
# Autocompletions
#============================================

source <(npm completion)


#============================================
# Theme
#============================================

#source $HOME/.dotfiles/themes/gruvbox.sh
source $HOME/.dotfiles/themes/gotham.sh
#source $HOME/.dotfiles/themes/solarized.sh
#source $HOME/.dotfiles/themes/molokai.sh
