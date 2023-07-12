#============================================
# ENV Settings
#============================================
export LANG="en_US.UTF-8"

export RG_COMMAND="rg --hidden --ignore-file $HOME/.gitignore --ignore-file $HOME/.ignore --follow"
export ACK_COMMAND="$RG_COMMAND --vimgrep --no-heading"

export VISUAL="nvim"

# FZF
export FZF_DEFAULT_COMMAND="$RG_COMMAND --files"
export FZF_PATH="$HOME/.fzf/bin"

export GPG_TTY=$(tty)

# Setup history for ZSH
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=500
export SAVEHIST="$HISTSIZE"

# Load SDK Man
export SDKMAN_DIR="$HOME/.sdkman"
[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# FZF
[ -s "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

# NIX
[ -s "$HOME/.nix-profile/etc/profile.d/nix.sh" ] && source "$HOME/.nix-profile/etc/profile.d/nix.sh"

# Brew
eval $(/opt/homebrew/bin/brew shellenv)

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_NDK_ROOT=$ANDROID_HOME/sdk/ndk/23.1.7779620
