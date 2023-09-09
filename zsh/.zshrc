export EDITOR='nvim'

# oh-my-zsh config
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
ZSH_THEME=""

# plugins=(git)

source $ZSH/oh-my-zsh.sh

# pure theme
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

source ~/.aliases
source ~/.functions
source ~/.vars
source ~/nvims

# Where should I put you?
bindkey -s ^f "tmux-sessionizer\n"

# make back-i-search work in vi mode-keys to 
bindkey "^R" history-incremental-search-backward

export ANDROID_HOME="$HOME/Library/Android/sdk"
export FLUTTER_HOME="$HOME/sdk/flutter"
export LOCAL="$HOME/.local"
export RUBY_PATH="/opt/homebrew/opt/ruby"
export MAESTRO_HOME="$HOME/.maestro"
export PURR_HOME="/Users/lucas/src/purr/scripts"
export PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$FLUTTER_HOME/bin:$LOCAL/bin:$RUBY_PATH/bin:$MAESTRO_HOME/bin:$PURR_HOME"

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

# nnn
export NNN_PLUG='d:trash;c:fzcd;j:autojump;u:getplugs'

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(rbenv init - zsh)"

eval "$(jump shell zsh)"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
