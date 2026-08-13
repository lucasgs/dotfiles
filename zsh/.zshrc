autoload -Uz compinit
compinit

# Enable an interactive menu when pressing Tab
zstyle ':completion:*' menu select

# Make completion case-insensitive (e.g., 'cd dow' matches 'Downloads')
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

# Use colors in the completion menu
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# OS detection (used to gate platform-specific config)
case "$(uname -s)" in
    Darwin) export OS=macos ;;
    Linux)  export OS=linux  ;;
    *)      export OS=unix   ;;
esac

# zsh-autosuggestions / zsh-syntax-highlighting (Homebrew on macOS, system on Linux)
if [ "$OS" = macos ]; then
    source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
else
    for _f in /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
              /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
              /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh \
              /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh; do
        [ -s "$_f" ] && source "$_f"
    done
    unset _f
fi

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

# Accept the entire suggestion with Ctrl + Space
bindkey '^ ' autosuggest-accept

# Accept suggestion with Ctrl + F
#bindkey '^F' autosuggest-accept

export EDITOR='nvim'
export VISUAL='nvim'

export FLUTTER_HOME="$HOME/sdk/flutter"
export LOCAL="$HOME/.local"
export MAESTRO_HOME="$HOME/.maestro"
export PURR_HOME="$HOME/src/purr/scripts"

[ "$OS" = macos ] && export ANDROID_HOME="$HOME/Library/Android/sdk"
[ "$OS" = linux ]  && export ANDROID_HOME="$HOME/Android/Sdk"

# Ruby: Homebrew on macOS, rbenv/asdf elsewhere
if [ "$OS" = macos ] && [ -d /opt/homebrew/opt/ruby ]; then
    export RUBY_PATH="/opt/homebrew/opt/ruby"
    _ruby_bin="$RUBY_PATH/bin"
else
    unset RUBY_PATH
    _ruby_bin=""
fi

export PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$FLUTTER_HOME/bin:$LOCAL/bin:${_ruby_bin:+$_ruby_bin:}$MAESTRO_HOME/bin:$PURR_HOME:$(go env GOPATH)/bin"
unset _ruby_bin

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
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(starship init zsh)"

# Composables CLI
export PATH="$HOME/.composables/bin:$PATH"

# Added by Antigravity IDE
[ -d "$HOME/.antigravity-ide/antigravity-ide/bin" ] && export PATH="$HOME/.antigravity-ide/antigravity-ide/bin:$PATH"

# Added by LM Studio CLI (lms)
[ -d "$HOME/.lmstudio/bin" ] && export PATH="$PATH:$HOME/.lmstudio/bin"
# End of LM Studio CLI section

# Mason lsp server path
export PATH="$PATH:$HOME/.local/share/nvim/mason/bin"

# Homebrew-only env vars
[ "$OS" = macos ] && export HOMEBREW_REQUIRE_TAP_TRUST=1

# tmux-tools 
export PATH="$PATH:$HOME/.tmux-tools"

# Docker (Docker Desktop app bundle on macOS, system docker on Linux)
[ -d /Applications/Docker.app/Contents/Resources/bin ] && export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin"
