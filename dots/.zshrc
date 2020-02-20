#============================================
# ENV Settings
#============================================
export EDITOR="$VISUAL"
export RG_COMMAND="rg --hidden --ignore-file $HOME/.gitignore --ignore-file $HOME/.ignore --follow"
export FZF_DEFAULT_COMMAND="$RG_COMMAND --files"
export ACK_COMMAND="$RG_COMMAND --vimgrep --no-heading"
export FZF_PATH="$HOME/.fzf/bin"
export LC_ALL="en_US.UTF-8"
export LS_COLORS='di=00;33:ow=01;32:*.js=00;36'
export VISUAL=nvim
export SOURCE_DIR=$HOME/Source
export ZPLUG_HOME=/usr/local/opt/zplug
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

export HISTFILE=$HOME/.zsh_history
export HISTSIZE=500
export SAVEHIST=$HISTSIZE
export http_proxy=localhost:3128
export https_proxy=localhost:3128

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

eval "$(rbenv init -)"

#============================================
# Loading...
#============================================

# Load Aliases
[ -s "$HOME/.aliases" ] && source "$HOME/.aliases"

# Custom Scripts
[ -s "$HOME/.custom" ] && source ~/.custom

# Load NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load SDK Man
export SDKMAN_DIR="$HOME/.sdkman"
[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# FZF
[ -s "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

# zsh-autosuggest
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

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
fpath+=("$HOME/.zfunc")


#============================================
# Prompt
#============================================
eval "$(starship init zsh)"


#============================================
# Autocompletions
#============================================
source <(go env)
#source <(npm completion)


#============================================
# Theme
#============================================

# Defaults
export TMUX_COLOR_BG='#333333'
export TMUX_COLOR_FG='#aaaaaa'
export TMUX_COLOR_ACCENT_BG='#bbbbbb'
export TMUX_COLOR_ACCENT_FG='#444444'
export TMUX_COLOR_ACCENT_IDLE_BG='#888888'
export TMUX_COLOR_ACCENT_IDLE_FG='#222222'
export TMUX_COLOR_HIGHLIGHT_BG='#eeeeee'
export TMUX_COLOR_HIGHLIGHT_FG='#888888'
export TMUX_COLOR_HIGHLIGHT_IDLE_BG='#bbbbbb'
export TMUX_COLOR_HIGHLIGHT_IDLE_FG='#555555'

#source $HOME/.dotfiles/themes/gruvbox.sh
#source $HOME/.dotfiles/themes/gotham.sh
source $HOME/.dotfiles/themes/dracula.sh
#source $HOME/.dotfiles/themes/solarized.sh
#source $HOME/.dotfiles/themes/molokai.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
