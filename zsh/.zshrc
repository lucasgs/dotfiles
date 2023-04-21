export EDITOR='nvim'

# oh-my-zsh config
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# pure theme
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

source ~/.aliases
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
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$FLUTTER_HOME/bin:$LOCAL/bin:$RUBY_PATH/bin"

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
