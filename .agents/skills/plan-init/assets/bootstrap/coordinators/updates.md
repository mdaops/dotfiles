# Updates, workspaces and fallback

Durable plans and assignment handoffs hold work state. Herdr manages running agents and notifications. No mailbox or message queue is required. Read [sync.md](sync.md) for publication, PR reconciliation and coordinator transfer.

## Workspace per scope

Use a clearly named Herdr workspace for each coordinator scope (for example, the scope ID). A scope may span initiatives and repositories; products are optional grouping. Inspect existing workspaces and verified bindings before creating one. Reuse the matching workspace on resumption; do not create one per plan. Record machine/session/workspace/coordinator identity in ignored local configuration. A matching name alone is insufficient to assume ownership.

When runtime setup is authorized, create the scope workspace if missing and keep a dedicated coordinator tab and a separate labelled tab per worker in it. This user-selected topology overrides the generic Herdr sibling-pane default; use splits only when explicitly useful or requested. Create each worker tab with its assigned checkout as cwd and preserve user focus; launch into the returned root pane. Record tab, pane and agent identities locally. Use installed Herdr help for workspace creation and pane movement; preserve the coordinator process/history and the user's focus where possible. After moving a pane, use returned live IDs and refresh bindings. Verify all assigned workers belong to the intended workspace before dispatch. If control is unavailable, report grouping as pending rather than claiming it happened.

## Worker updates

An assigned agent is a worker. Give it the plan, context, completion checks, handoff path, publication route and the coordinator's verified live binding. Save the handoff before notification; across checkouts publish it first. Include plan/assignment IDs, revision/time, evidence, blockers and next action. Notify for actionable blockers, scope decisions, overlapping work or review-ready results. Routine progress stays in the handoff.

Verify the target's machine, session and current agent identity before sending. Send a non-waiting notification with the handoff path and published ref when applicable; the worker must not wait for a coordinator that is itself waiting on the worker. Acknowledged submission is not proof of reconciliation. On failure retain the update, record failed delivery and let sync/fallback recover it. Do not target a stale binding or retry uncertain sends blindly.

## Coordinator reconciliation

Sync and read active plans/handoffs on startup, resumption, before dispatch and after notifications. Verify evidence and record each assignment's latest reviewed revision/time. Already-reviewed updates cause no duplicate dispatch or lifecycle action. Acknowledgement does not resolve an outstanding user decision. Herdr idle/done means a settled UI state, not proof of task completion.

## Worker tab lifecycle

The coordinator chooses when to close its managed worker tabs without asking for approval each time. After reconciliation and required publication, close a finished worker tab when its handoff, evidence, decisions and next action are durable and no session-dependent work remains. Preserve uncommitted files and unsaved terminal/editor content before closing; closure does not authorize deleting a checkout or discarding work. Idle/done alone never establishes completion.

Keep tabs with active commands or background jobs, unresolved blockers, or pending review/approval that requires the session. Reassess after those needs resolve; closing a tab does not itself complete a plan. Workers report readiness and leave cleanup to the coordinator.

Before closing, rediscover and verify the machine/session, tab, all contained panes and agent identities against the assignment's local bindings. Close only a worker tab created for this scope or explicitly transferred into its management, with no unrelated occupants. Use installed Herdr help for the close operation, verify the result, and retire its local binding. On uncertain outcomes inspect before retrying. Never close the coordinator tab, unrelated tabs, application window or server as worker cleanup; retain the workspace while the scope is active. If runtime access is unavailable, report cleanup pending.

## Optional fallback

Notifications are primary. When a recurring fallback is authorized, default to a five-minute interval during active assignments, scoped to one coordinator. No background process is installed by these documents. Verify the chosen scheduler exists and record schedule ID, owner identity, scope, interval and expiry locally. Do not replace it with an LLM sleep loop or silently install a dependency.

Pi's existing pi-scheduler extension was trialled; it is optional and runs only while Pi is open. Its store is cwd-scoped (.pi/scheduler.json), not protected by a cross-process ownership lock. Load it only into the owning coordinator, never into every worker or competing coordinator sharing that cwd. Inspect schedules before creating one; reuse only the verified matching schedule. Do not commit scheduler state. Other runners may use an equivalent explicitly configured scheduler.

Each scheduled run performs plan-sync for the scope, reconciles unreviewed updates and stays quiet when nothing actionable changed. Do not launch new work from a fallback without existing dispatch authority. Cancel the owned schedule when no active assignments remain, on transfer, or at the agreed stop/expiry. Verify deletion. Busy sessions defer scheduled work; the interval is not a latency guarantee. Prompt-based stop times are not process-level deadlines. Report paused/offline checks and sync failures honestly.

## Runtime access

Read the installed herdr skill before control. Its default is HERDR_ENV=1. An explicit user instruction to inspect/control a named session externally can override that default: record the authorization, target the named session and explicit live IDs, and never spoof environment variables or rely on the focused pane. Otherwise work on files and report runtime control unavailable. Do not answer login/approval dialogs on behalf of the user.
