autoload -Uz compinit
compinit

# Enable an interactive menu when pressing Tab
zstyle ':completion:*' menu select

# Make completion case-insensitive (e.g., 'cd dow' matches 'Downloads')
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Use colors in the completion menu
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source_file() {
    local file="$1"

    if [ -e "$file" ]; then
        source $file
    fi
}

source_file ~/.secrets
source_file ~/.aliases
source_file ~/.aliases_local
source_file ~/.functions
source_file ~/nvims

# Where should I put you?
bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^n "tmux-notes\n"

# make back-i-search work in vi mode-keys to 
bindkey "^R" history-incremental-search-backward

export EDITOR='nvim'

export ANDROID_HOME="$HOME/Library/Android/sdk"
export FLUTTER_HOME="$HOME/sdk/flutter"
export LOCAL="$HOME/.local"
export RUBY_PATH="/opt/homebrew/opt/ruby"
export MAESTRO_HOME="$HOME/.maestro"
export PURR_HOME="/Users/lucas/src/purr/scripts"
export PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$FLUTTER_HOME/bin:$LOCAL/bin:$RUBY_PATH/bin:$MAESTRO_HOME/bin:$PURR_HOME:$(go env GOPATH)/bin"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# SDKMAN!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

source <(fzf --zsh)

eval "$(rbenv init - zsh)"

# eval "$(jump shell zsh)"
eval "$(zoxide init zsh)"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# bun completions
[ -s "/Users/lucas/.bun/_bun" ] && source "/Users/lucas/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(starship init zsh)"

# Composables CLI
export PATH="$HOME/.composables/bin:$PATH"

# Added by Antigravity
export PATH="/Users/lucas/.antigravity/antigravity/bin:$PATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/lucas/.lmstudio/bin"
# End of LM Studio CLI section

export HOMEBREW_REQUIRE_TAP_TRUST=1

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
