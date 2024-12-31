export ZSH="$HOME/.oh-my-zsh"

export GOPATH=$HOME/go
export GOROOT=/opt/homebrew/opt/go/libexec
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT
export PATH=$PATH:$GOBIN
export PATH=$PATH:/opt/homebrew/bin
export PATH="$HOME/.asdf/shims:$PATH"

export PNPM_HOME="/home/dev/.local/share/pnpm"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export ZSCALER_CERT=$HOME/zscaler_root_ca.crt
export ZSCALER_CERT_CONTENT="$(cat $ZSCALER_CERT)" 

# export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

ZSH_THEME=""

plugins=(git docker zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias tf="terraform"
alias k="kubectl"
alias ns="kubens"
alias cx="kubectx"
alias p="cd ~/gh/gbg/platform"
alias v="vim"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/dev/google-cloud-sdk/path.zsh.inc' ]; then . '/home/dev/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/dev/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/dev/google-cloud-sdk/completion.zsh.inc'; fi

case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export REQUESTS_CA_BUNDLE="$HOME/.mac-ca-roots"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

source /Users/michael.abbott/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(fzf --zsh)

. "$HOME/.asdf/asdf.sh"
