# Synchronization and ownership

Plans, context, assignments, handoffs and decisions must be recoverable from the plans remote. Product branches and PRs live in their code repositories. Pi histories, checkout paths, Herdr IDs and scheduler state are machine-local hints, not durable ownership or completion evidence. Use local/ for these bindings. Never require an old conversation to resume work.

## Sync contract

Record in each scope profile: plans remote and integration branch, permitted publication route, logical coordinator owner, and assignment handoff branches or PRs when separate clones are used. Configure these once from existing user authorization. If publication authority is absent, prepare the change and identify the missing permission; do not repeatedly ask for permission already granted. Product-code pushes/PR creation require the assignment's authority; plan synchronization never grants merge or deployment permission.

Workers save their own handoff after meaningful progress, blockers, decisions and before stopping. Publish authorized code commits/branches and PR updates first, then record their exact repository, branch, commit and PR URL in the handoff. Publish that handoff and report the plans branch/commit or PR containing it. A local save or failed push is explicitly unsynced, not delivered. Never put secrets, machine paths or required evidence only in ignored local/ files. Compact durable evidence belongs in the handoff; large artifacts need a reachable stable reference.

With a shared checkout, serialize Git index/commit/push operations through the coordinator; workers save handoffs but do not race shared Git operations. With separate clones, workers publish only their assigned handoffs to distinct branches or the agreed review route. The coordinator fetches those branches/PRs and integrates reviewed handoff changes according to the agreed policy. Record handoff delivery refs in the assignment so another coordinator can discover them.

## plan-sync procedure

1. Inspect status, staged changes, remotes, branch and tracking state in plans and relevant code repositories. Fetch named remotes and assigned delivery branches. Offline/auth failures retain local work and produce an explicit unsynced/stale result.
2. Fast-forward a clean plans branch when possible. Never stash, reset, rebase or overwrite someone else's work automatically. With dirty or diverged state, inspect remote changes through Git or a temporary checkout, preserve all local edits and report conflicts. Integrate non-conflicting known changes deliberately; ambiguous edits need resolution, not a force push.
3. Read incoming handoffs and authoritative PR metadata: open/closed/merged state, current head SHA, merge commit when present, checks for that head, and outstanding review requirements. Fetch referenced commits and compare claims to the actual revision. Old checks do not verify a newer head; inaccessible evidence stays unverified. A merged PR alone is not completion of the plan.
4. The owning coordinator reconciles criteria, dependencies and user blockers. Record the latest reviewed handoff revision/time, source PR head/check observation time and remaining uncertainty. Repeated updates do not repeat dispatch. Workers sync their own outputs and do not edit shared lifecycle state.
5. Stage only intended task paths; inspect the staged diff, commit and push through the configured route. Confirm remote refs contain the published commits. On a rejected push, fetch and re-evaluate once; leave unresolved conflict explicit rather than retrying indefinitely. Report published, local-only, stale and blocked items separately. No PR merge is implied by this procedure.

## Coordinator transfer

Use one logical coordinator owner per scope. Record current owner, ownership revision, last checkpoint, and any explicit release/transfer in the synced scope profile. Before transfer, publish outstanding decisions and assignments, stop dispatch and cancel that owner's fallback schedule. The receiver fetches the checkpoint, confirms release or explicit user reassignment, verifies current PRs, records new ownership and discovers fresh local bindings before dispatch.

An absent local pane or stale timestamp does not establish that a coordinator on another machine stopped. If the prior owner is unreachable and no transfer is authorized, continue read-only review and report ownership uncertainty. Git is not a distributed lock; concurrent conflicting claims block dispatch until resolved. A normal restart on the same machine can use verified old-process absence within the assigned scope plus existing restart authorization.
