source ~/.bash_alias

# Load configuration dependant on the system if available
if [ -f $HOME/.custom ]; then
  source $HOME/.custom
fi

# Ignore these files & folders in Silver Searcher
declare -a ag_ignore_list=(
  'compiled_lib'
  'node_modules'
  '.git'
  '_build'
  'deps'
  'src/main'
  'target'
  '.DS_Store'
);

for i in "${ag_ignore_list[@]}"; do
  ag_ignore_string="${ag_ignore_string:-} --ignore ${i}"
done

export EDITOR="$VISUAL"
export FZF_DEFAULT_COMMAND="ag ${ag_ignore_string} --hidden -i -g \"\""
export FZF_PATH="$HOME/.fzf/bin"
export LC_ALL=C
export LS_COLORS='di=00;33:ow=01;32:*.js=00;36'
export PATH=$PATH:$GOROOT/bin
export VISUAL=nvim


# Load NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Load SDK Man
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Load bash git prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
