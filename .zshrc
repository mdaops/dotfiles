export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/opt/homebrew/bin
export PATH="/usr/local/bin:$PATH"

ZSH_THEME=""

plugins=(git docker zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias tf="terraform"
alias k="kubectl"
alias ns="kubens"
alias cx="kubectx"
alias p="cd ~/gh/gbg/platform"
alias v="vim"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

if [ -f '/home/dev/google-cloud-sdk/path.zsh.inc' ]; then . '/home/dev/google-cloud-sdk/path.zsh.inc'; fi

if [ -f '/home/dev/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/dev/google-cloud-sdk/completion.zsh.inc'; fi

case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export REQUESTS_CA_BUNDLE="$HOME/.mac-ca-roots"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"
eval "$(devbox global shellenv)"

source <(fzf --zsh)


# bun completions
[ -s "/home/dev/.bun/_bun" ] && source "/home/dev/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
