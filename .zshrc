#============================================
# General Settings
#============================================

#============================================
# Env Vars
#============================================

export EDITOR="$VISUAL"
export FZF_DEFAULT_COMMAND="ag ${ag_ignore_string} --hidden -i -g \"\""
export FZF_PATH="$HOME/.fzf/bin"
export LC_ALL=C
export LS_COLORS='di=00;33:ow=01;32:*.js=00;36'
export PATH=$PATH:$GOROOT/bin
export VISUAL=nvim
export SOURCE_DIR=$HOME/Source


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
[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ] && source "$SDKMAN_DIR//bin/sdkman-init.sh"

