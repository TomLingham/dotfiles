#============================================
# General Settings
#============================================

export EDITOR="$VISUAL"
export FZF_DEFAULT_COMMAND='ag --hidden -i -g ""'
export FZF_PATH="$HOME/.fzf/bin"
export LC_ALL="en_US.UTF-8"
export LS_COLORS='di=00;33:ow=01;32:*.js=00;36'
export VISUAL=nvim
export SOURCE_DIR=$HOME/Source
export ZPLUG_HOME=/usr/local/opt/zplug


#============================================
# Antibody Plugin Manager
#============================================

source $ZPLUG_HOME/init.zsh

zplug load


#============================================
# Autocompletions
#============================================

source <(npm completion)


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

# FZF
[ -s "$HOME/.fzf.zsh" ] && source ~/.fzf.zsh


#============================================
# Theme
#============================================

#source $HOME/.dotfiles/themes/gruvbox.sh
source $HOME/.dotfiles/themes/gotham.sh
#source $HOME/.dotfiles/themes/solarized.sh
#source $HOME/.dotfiles/themes/molokai.sh
