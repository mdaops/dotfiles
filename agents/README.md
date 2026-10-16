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
for source in "$PWD"/.agents/skills/*; do
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
  foreach ($skill in Get-ChildItem -Directory .agents\skills) {
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

The remaining workflow skills are plan-init, plan-write, plan-dispatch,
plan-status, plan-sync, plan-retro, and coordinator-start. The herdr skill
provides runtime control. Reload or restart after installation; Pi supports /reload.

Start with /coordinator-start oxlev in Claude Code or /skill:coordinator-start oxlev
in Pi. Plans and handoffs synchronize through the plans remote. Herdr groups each coordinator and its workers in a named scope workspace.
See [Herdr setup](herdr.md). No background watcher is installed.

Pi on Windows was trialled for dispatch, handoff, idle wakeup, duplicate handling and fresh-session recovery. Claude Code runtime behaviour has not been trialled here. Skills are checked with the skill validator.

References: [Pi skills](https://github.com/badlogic/pi-mono/blob/main/packages/coding-agent/docs/skills.md)
and [Claude Code skills](https://code.claude.com/docs/en/skills).

Use plan-sync before dispatch, after worker updates and before moving machines. Configure publication authority once in the scope profile. Optional fallback uses an explicitly configured existing scheduler; default to five minutes while work is active, one owner, and cancellation on completion/transfer. See the plans repository coordinators/sync.md and coordinators/updates.md.
