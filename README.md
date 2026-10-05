# Dotfiles

## Neovim on macOS

Use **Neovim 0.12 or newer**: this configuration uses the current
`nvim-treesitter` API and native LSP configuration. Install the Command Line
Tools for native plugin/parser builds, plus the common runtime dependencies:

```sh
xcode-select --install
brew install neovim ripgrep fd tree-sitter node python go
```

Check `nvim --version` before starting. Link this repository's `.config/nvim`
to `~/.config/nvim`, backing up any existing configuration first. Lazy installs
plugins on first launch; Mason installs configured language servers and formatters.
Run `:checkhealth base` and `:checkhealth mason` afterwards.

- Homebrew's bin directory must be on `PATH` (`/opt/homebrew/bin` on Apple Silicon,
  `/usr/local/bin` on Intel). The same applies to Nix and language toolchains.
- Zig/ZLS and WIT servers are optional, separately installed tools. Zig and ZLS
  are resolved from `PATH`, with `~/.local/bin` fallbacks. WIT also checks
  `~/.cargo/bin` and is enabled only when installed.
- Elixir and KCL integrations have been removed.
- Terraform documentation links use macOS `open` rather than Linux `xdg-open`.
- Clipboard access uses Neovim's automatic provider selection (`pbcopy`/`pbpaste`
  on macOS); no Linux clipboard utility is required.
- `~/brain` is the optional Obsidian vault. Workspace shortcuts reference personal
  directories; adjust them to suit the machine. Tmux shortcuts require tmux.
- Install the language toolchains you use (for example Rust via rustup, Terraform,
  or a JDK for Metals) and a Nerd Font for icons.

The portability changes were smoke-tested on Linux, not on a macOS host.
Hyprland configuration elsewhere in this repository is Linux-only; do not load
it on macOS. Shell plugins below use Nix on either platform, independently of
Homebrew's Neovim installation.

## Zsh tooling

Install the shell integrations into your user Nix profile:

```sh
nix profile add nixpkgs#fzf nixpkgs#fd nixpkgs#zoxide \
  nixpkgs#zsh-autosuggestions nixpkgs#zsh-syntax-highlighting \
  nixpkgs#zsh-completions nixpkgs#zsh-history-substring-search \
  nixpkgs#bat nixpkgs#delta
```

With `~/.zshrc` linked to this repository's `.zshrc`, open a new shell or run
`exec zsh` to load them. Oh My Zsh is optional.

- **Ctrl-R**: fuzzy search command history.
- **Ctrl-T**: fuzzy select files with syntax-highlighted bat previews, including
  hidden files but excluding `.git`. **Ctrl-/** toggles the preview.
- **Alt-C**: fuzzy select a directory.
- **Right arrow** at the end of the line: accept a history autosuggestion.
- **Tab**: case-insensitive completion with an arrow-key menu and extra definitions.
  **Shift-Tab** moves backwards through the menu.
- **↑/↓**: search history for the text you've typed, skipping duplicate matches.
- **`z <name>`**: jump to a frequently visited directory; **`zi`** selects interactively.
- Syntax highlighting marks commands as you type.

The integrations are loaded only when installed. Syntax highlighting loads last
so that it can wrap the other integrations' editing widgets.

## Git diffs

After installing delta, include the shared configuration once (adjust the path if
this repository lives elsewhere):

```sh
git config --global --add include.path "$HOME/gh/dotfiles/.config/git/delta.gitconfig"
```

Git diffs use delta with syntax highlighting and line numbers. In its pager,
**n/N** jump between files. Interactive staging retains Git's normal controls.
Use `git --no-pager diff` for unpaged output. Your Git identity is left unchanged.
