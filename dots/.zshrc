#============================================
# Interactive Shell
#============================================
export LS_COLORS="di=00;33:ow=01;32:*.js=00;36"


#============================================
# Shell Prompt
#============================================
eval "$(starship init zsh)"


#============================================
# Aliases
#============================================
[ -s "$HOME/.aliases" ] && source "$HOME/.aliases"


#============================================
# FPath
#============================================
fpath+=("$HOME/.zfunc")


#============================================
# Path
#============================================

# Python
path=("/usr/local/opt/python/libexec/bin" $path)

# Android
path+=("$ANDROID_SDK_ROOT/emulator")
path+=("$ANDROID_SDK_ROOT/platform-tools")

# Cargo
path+=("$HOME/.cargo/bin")

# Golang
path+=("`go env GOPATH`/bin")

# Android SDKs
path+=("$HOME/Library/Android/sdk/platform-tools")

# Brew
path+=("/opt/homebrew/bin")


# Other env
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"


#============================================
# Autocompletions
#============================================

# zsh-autosuggest
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source "$HOME/.cargo/env"
source <(go env)

eval "$(rbenv init - zsh)"


#============================================
# Vi in CLI Mode
#============================================
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/tomlingham/.sdkman"
[[ -s "/Users/tomlingham/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/tomlingham/.sdkman/bin/sdkman-init.sh"
