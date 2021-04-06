#============================================
# ENV Settings
#============================================
export LS_COLORS="di=00;33:ow=01;32:*.js=00;36"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Load NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load SDK Man
export SDKMAN_DIR="$HOME/.sdkman"
[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# FZF
[ -s "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"


#============================================
# Prompt
#============================================
eval "$(starship init zsh)"


#============================================
# Autocompletions
#============================================

# zsh-autosuggest
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source <(go env)
source <(npm completion)

eval "$(rbenv init -)"


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