# config.nu
#
# Installed by:
# version = "0.110.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

# Environment
$env.XDG_CONFIG_HOME = ($env.HOME | path join ".config")
$env.EDITOR = "nvim"
$env.BUN_INSTALL = ($env.HOME | path join ".bun")
$env.PATH = ($env.PATH | prepend ($env.BUN_INSTALL | path join "bin"))

# fnm (Fast Node Manager)
$env.FNM_PATH = ($env.HOME | path join ".local" "share" "fnm")
if ($env.FNM_PATH | path exists) {
  $env.PATH = ($env.PATH | prepend $env.FNM_PATH)
  ^fnm env --json | from json | load-env
  $env.PATH = ($env.PATH | prepend ($env.FNM_MULTISHELL_PATH | path join "bin"))
}

# Direnv
$env.config = ($env.config | upsert hooks.pre_prompt (
  $env.config.hooks.pre_prompt | append {||
    let direnv = (direnv export json | from json | default {})
    if ($direnv | is-not-empty) { $direnv | load-env }
  }
))

# fnm use-on-cd hook
$env.config = ($env.config | upsert hooks.env_change.PWD (
  ($env.config.hooks.env_change | get -o PWD | default []) | append {|before, after|
    if ('FNM_DIR' in $env) and ([.nvmrc .node-version] | any {|f| ($after | path join $f | path exists)}) {
      ^fnm use --silent-if-unchanged
    }
  }
))

# Aliases
alias vim = nvim
alias v = nvim
alias tf = terraform
alias k = kubectl
alias ns = kubens
alias cx = kubectx
source "~/.cargo/env.nu"
