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
export RUST_SRC_PATH=$HOME/.multirust/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src/

export HISTFILE=$HOME/.zsh_history
export HISTSIZE=500
export SAVEHIST=$HISTSIZE


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
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
export NVM_LIB=$(realpath $NVM_BIN/../lib)

# Load SDK Man
export SDKMAN_DIR="$HOME/.sdkman"
[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# FZF
[ -s "$HOME/.fzf.zsh" ] && source $HOME/.fzf.zsh

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
autoload -U promptinit; promptinit
prompt pure


#============================================
# Autocompletions
#============================================
source <(go env)
source <(npm completion)

# Serverless
[[ -f $NVM_LIB/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . $NVM_LIB/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
[[ -f $NVM_LIB/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . $NVM_LIB/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
[[ -f $NVM_LIB/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . $NVM_LIB/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh


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
#
