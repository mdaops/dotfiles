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

plugins=(git docker zsh-autosuggestions)

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if command -v devbox >/dev/null 2>&1; then
  eval "$(devbox global shellenv)"
fi

if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
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
