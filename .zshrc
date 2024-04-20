export ZSH="$HOME/.oh-my-zsh"
export GOROOT=/usr/local/go
export GOPATH=$HOME/go


export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
export WIN_HOME=`wslpath $(powershell.exe -c "Write-Host \\$env:USERPROFILE")`

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
export ANDROID_HOME=/home/dev/Android
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/bin

ZSH_THEME=""

plugins=(git docker zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias vim="nvim"
alias tf="terraform"
alias k="kubectl"
alias ns="kubens"
alias cx="kubectx"
alias pbcopy="clip.exe"
alias pbpaste="powershell.exe -command 'Get-Clipboard' | tr -d '\r' | head -n -1"
alias p="cd ~/gh/gbg/platform"
alias go="go1.22.0"
alias v="vim"
alias oo="/mnt/c/Users/dev/Documents/second-brain/"
alias oov="v /mnt/c/Users/dev/Documents/second-brain/"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/dev/google-cloud-sdk/path.zsh.inc' ]; then . '/home/dev/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/dev/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/dev/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(starship init zsh)"

. "$HOME/.asdf/asdf.sh"

wsl.exe -d wsl-vpnkit service wsl-vpnkit start

export PNPM_HOME="/home/dev/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
