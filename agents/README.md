# Agent planning skills

Canonical skill sources live in `.agents/skills/` in this dotfiles repository.
Plans, initiatives, context, and execution records live in `mdaops/plans`.
Do not store task state or work transcripts in dotfiles.

## Locate your plans checkout

Set `PLANS_DIR` to the absolute plans checkout path in your local shell, or give
the path explicitly when invoking a skill. Do not commit machine-specific paths.

```sh
export PLANS_DIR="$HOME/gh/plans"
```

```powershell
$env:PLANS_DIR = 'C:\path\to\plans'
```

## Install on Linux

Run from the dotfiles root. Link each skill individually, preserving unrelated
skills. These commands skip any existing destination; inspect conflicts yourself.

```sh
mkdir -p "$HOME/.agents/skills" "$HOME/.claude/skills"
for source in "$PWD"/.agents/skills/plan-*; do
  name=$(basename "$source")
  for root in "$HOME/.agents/skills" "$HOME/.claude/skills"; do
    target="$root/$name"
    if [ ! -e "$target" ] && [ ! -L "$target" ]; then
      ln -s "$source" "$target"
    else
      printf 'Already exists; inspect: %s\n' "$target"
    fi
  done
done
```

Pi discovers the shared user `.agents/skills` directory. Claude Code uses
`.claude/skills`. Avoid installing a second copy in another Pi discovery path.

## Install on Windows

Run from the dotfiles root. Copying avoids requiring symlink privileges.
Existing destinations are skipped. After changing these sources, reconcile
installed copies deliberately; this command does not overwrite them.

```powershell
$roots = @(
  (Join-Path $env:USERPROFILE '.agents\skills'),
  (Join-Path $env:USERPROFILE '.claude\skills')
)
foreach ($root in $roots) {
  New-Item -ItemType Directory -Force -Path $root | Out-Null
  foreach ($skill in Get-ChildItem -Directory .agents\skills\plan-*) {
    $target = Join-Path $root $skill.Name
    if (Test-Path -LiteralPath $target) {
      Write-Output "Already exists; inspect: $target"
    } else {
      Copy-Item -LiteralPath $skill.FullName -Destination $target -Recurse
    }
  }
}
```

## Use

Claude Code: `/plan-add describe the outcome`.

Pi: `/skill:plan-add describe the outcome`.

The remaining names are `plan-init`, `plan-write`, `plan-dispatch`,
`plan-status`, `plan-sync`, and `plan-retro`. Reload or restart the runner
after installation and check that the skills appear. Pi supports `/reload`.

The skills do not install a background coordinator or automatically launch
workers. Start a coordinator session with the plans checkout available and
ask it to use plan-status, then dispatch specific authorized work.

Runner installation has not been tested in live Pi or Claude Code sessions on
this Windows machine. Skill files have been checked with the skill validator.

References: [Pi skills](https://github.com/badlogic/pi-mono/blob/main/packages/coding-agent/docs/skills.md)
and [Claude Code skills](https://code.claude.com/docs/en/skills).
