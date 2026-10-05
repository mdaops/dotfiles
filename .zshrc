export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/opt/homebrew/bin
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$HOME/.nix-profile/bin:$HOME/.pulumi/bin:$HOME/.wash/bin:$PATH"
[ -r "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

ZSH_THEME=""

# Nix-provided completions must be on fpath before compinit runs.
if [[ -d "$HOME/.nix-profile/share/zsh/site-functions" ]]; then
  fpath=("$HOME/.nix-profile/share/zsh/site-functions" $fpath)
fi

plugins=(git docker)

if [ -r "$ZSH/oh-my-zsh.sh" ]; then
  source "$ZSH/oh-my-zsh.sh"
else
  autoload -Uz compinit
  compinit
  HISTFILE="$HOME/.zsh_history"
  HISTSIZE=10000
  SAVEHIST=10000
  setopt APPEND_HISTORY SHARE_HISTORY HIST_IGNORE_DUPS
  bindkey -e
fi

# Case-insensitive completion, with an arrow-key menu after Tab.
zmodload zsh/complist
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}%d%f'
bindkey -M menuselect '^[[Z' reverse-menu-complete

alias vim="nvim"
alias tf="terraform"
alias k="kubectl"
alias ns="kubens"
alias cx="kubectx"
alias p="cd ~/gh/gbg/platform"
alias v="vim"

export PATH="$HOME/.local/share/fnm:$PATH"
if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --use-on-cd --shell zsh)"
else
  export NVM_DIR="${XDG_CONFIG_HOME}/nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
fi

if [ -f '/home/dev/google-cloud-sdk/path.zsh.inc' ]; then . '/home/dev/google-cloud-sdk/path.zsh.inc'; fi

if [ -f '/home/dev/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/dev/google-cloud-sdk/completion.zsh.inc'; fi

case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

if [ -f "$HOME/.mac-ca-roots" ]; then
  export REQUESTS_CA_BUNDLE="$HOME/.mac-ca-roots"
fi

if command -v devbox >/dev/null 2>&1; then
  eval "$(devbox global shellenv)"
fi

# Fuzzy history (Ctrl-R), files (Ctrl-T) and directories (Alt-C).
if command -v fzf >/dev/null 2>&1; then
  if command -v fd >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'
  fi
  if command -v bat >/dev/null 2>&1; then
    export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --paging=never --line-range=:300 -- {}' --preview-window 'right,60%,border-left' --bind 'ctrl-/:toggle-preview'"
  fi
  source <(fzf --zsh)
elif [[ -r "$HOME/.fzf.zsh" ]]; then
  source "$HOME/.fzf.zsh"
fi

# Jump to frequently visited directories with z, or choose one with zi.
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# bun completions
[ -s "/home/dev/.bun/_bun" ] && source "/home/dev/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# Load suggestions after integrations, and syntax highlighting last so that
# it can wrap all widgets. These do not require Oh My Zsh.
if [[ -r "$HOME/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
  source "$HOME/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi
if [[ -r "$HOME/.nix-profile/share/zsh-history-substring-search/zsh-history-substring-search.zsh" ]]; then
  source "$HOME/.nix-profile/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
  HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=yellow,bold'
  HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=red,bold'
  HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
  # Cover normal and application cursor-key sequences.
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
  bindkey '^[OA' history-substring-search-up
  bindkey '^[OB' history-substring-search-down
fi
if [[ -r "$HOME/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "$HOME/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
