#============================================
# ENV Settings
#============================================
export RG_COMMAND="rg --hidden --ignore-file $HOME/.gitignore --ignore-file $HOME/.ignore --follow"

export ACK_COMMAND="$RG_COMMAND --vimgrep --no-heading"
export EDITOR="$VISUAL"
export FZF_DEFAULT_COMMAND="$RG_COMMAND --files"
export FZF_PATH="$HOME/.fzf/bin"
export GPG_TTY=$(tty)
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=500
export LC_ALL="en_US.UTF-8"
export SAVEHIST="$HISTSIZE"
export SOURCE_DIR="$HOME/Source"
export VISUAL="nvim"
export ZPLUG_HOME="/usr/local/opt/zplug"


#============================================
# Loading...
#============================================

# Load Aliases
[ -s "$HOME/.aliases" ] && source "$HOME/.aliases"

# Custom Scripts
[ -s "$HOME/.custom" ] && source ~/.custom


#============================================
# Path
#============================================

# Python
path=("/usr/local/opt/python/libexec/bin", $path)

# Cargo
path+=("$HOME/.cargo/bin")
source "$HOME/.cargo/env"

# Golang
path+=("$GOPATH/bin")

# Android SDKs
path+=("$HOME/Library/Android/sdk/platform-tools")

# Random Bins
path+=("$HOME/.somebin")


#============================================
# FPath
#============================================
fpath+=("$HOME/.zfunc")


#============================================
# NIX
#============================================

[ -s "$HOME/.nix-profile/etc/profile.d/nix.sh" ] && source "$HOME/.nix-profile/etc/profile.d/nix.sh"


#============================================
# Android
#============================================

export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_NDK_ROOT=$ANDROID_HOME/sdk/ndk/23.1.7779620
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

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
#source $HOME/.dotfiles/themes/molokai.sh
. "$HOME/.cargo/env"
