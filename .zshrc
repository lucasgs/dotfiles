# set default editor
export EDITOR='nvim'

# pure theme
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

source ~/.aliases

# Where should I put you?
bindkey -s ^f "tmux-sessionizer\n"

export ANDROID_HOME="$HOME/Library/Android/sdk"
export FLUTTER_HOME="$HOME/sdk/flutter"
export LOCAL="$HOME/.local"
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$FLUTTER_HOME/bin:$LOCAL/bin"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# SDKMAN!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
