# Updates, workspaces and fallback

Durable plans and assignment handoffs hold work state. Herdr manages running agents and notifications. No mailbox or message queue is required. Read [sync.md](sync.md) for publication, PR reconciliation and coordinator transfer.

## Workspace per scope

Use a clearly named Herdr workspace for each coordinator scope (for example, the scope ID). A scope may span initiatives and repositories; products are optional grouping. Inspect existing workspaces and verified bindings before creating one. Reuse the matching workspace on resumption; do not create one per plan. Record machine/session/workspace/coordinator identity in ignored local configuration. A matching name alone is insufficient to assume ownership.

When runtime setup is authorized, create the scope workspace if missing and keep a dedicated coordinator tab and by default, a separate labelled tab per worker in it. This user-selected topology overrides the generic Herdr sibling-pane default; the coordinator may choose a split pane when it judges that layout better suited to the work, without additional approval. Use the assigned checkout as cwd and preserve user focus; launch into the returned root pane for a tab or the returned pane for a split. Record tab, pane and agent identities locally. Use installed Herdr help for workspace creation and pane movement; preserve the coordinator process/history and the user's focus where possible. After moving a pane, use returned live IDs and refresh bindings. Verify all assigned workers belong to the intended workspace before dispatch. If control is unavailable, report grouping as pending rather than claiming it happened.

## Coding runner and model

For new coding implementation, fixes and refactoring assignments, default to Claude Code as the runner and Opus 5.5 as the requested model (user preference recorded 2026-10-17). An explicit user-approved scope or assignment override takes precedence. Keep the current coordinator runner and existing workers unchanged; this preference does not authorize launching or replacing agents.

Before dispatch, verify the installed Claude Code runner, the account's access to the requested model, and the exact supported model identifier using current runner/provider evidence. The display name here is a preference, not proof of model availability or a CLI identifier. Do not invent an identifier or use an unverified floating alias. If unavailable or unverifiable, report the specific limitation and ask for an alternative; do not silently substitute another model or runner.

Record the requested runner/model, verified identifier and availability evidence in the assignment. Launch through Herdr using discovered runner syntax and explicit model selection, then verify the selected model from available runtime evidence before sending coding work. If runtime identity cannot be verified, report it and hold dispatch. Apply the same plans, authoring philosophy, handoff and checkpoint rules regardless of runner.

## Worker updates

An assigned agent is a worker. Give it the plan, context, completion checks, handoff path, publication route and the coordinator's verified live binding. Save the handoff before notification; across checkouts publish it first. Include plan/assignment IDs, revision/time, evidence, blockers and next action. Notify for actionable blockers, scope decisions, overlapping work or review-ready results. Routine progress stays in the handoff.

Verify the target's machine, session and current agent identity before sending. Send a non-waiting notification with the handoff path and published ref when applicable; the worker must not wait for a coordinator that is itself waiting on the worker. Acknowledged submission is not proof of reconciliation. On failure retain the update, record failed delivery and let sync/fallback recover it. Do not target a stale binding or retry uncertain sends blindly.

## Coordinator reconciliation

Sync and read active plans/handoffs on startup, resumption, before dispatch and after notifications. Verify evidence and record each assignment's latest reviewed revision/time. Already-reviewed updates cause no duplicate dispatch or lifecycle action. Acknowledgement does not resolve an outstanding user decision. Herdr idle/done means a settled UI state, not proof of task completion.

During reconciliation of new handoffs, verified findings or agreed user decisions, the owning coordinator updates relevant context/ files without a separate prompt. Promote only knowledge reusable beyond the current assignment, with source links/paths, relevant revisions and verification dates. Correct or explicitly supersede outdated facts; retain unresolved contradictions and hypotheses as uncertain rather than silently choosing a claim. Keep task progress and blockers in plans, detailed evidence in handoffs, and machine-specific details in local/. Workers report candidate findings in their handoffs; the coordinator owns shared context edits. Read only affected context, avoid duplicating existing knowledge, and leave it unchanged when there is nothing reusable. Publish context changes alongside the reconciled plan through the scope route. This is part of active reconciliation, not a full context audit on every startup.

## User-decision checkpoints

A material user update is a checkpoint even without a new worker handoff: changes to the plan, scope, priorities, constraints or acceptance criteria, and answers or permissions for a worker. Record the decision, timestamp, source, exact authorization boundaries and affected assignments in the plan; update reusable context when relevant. Reconcile and publish through the configured route, verifying remote delivery, before forwarding the decision or resuming dependent work. Do not wait for completion, another handoff or an explicit plan-sync invocation. Existing publication authority applies; do not ask again for it.

When a worker needs user input, first reconcile its handoff and record progress, the exact question, what it blocks and what can continue. Publish this checkpoint before presenting the question; if sync fails, still surface the question promptly and explicitly report the unsynced checkpoint. After the user answers, publish the decision before continuation. On failed or unavailable publication, preserve local records, report the failure, and hold work dependent on that unpublished decision while unrelated authorized work can continue. An explicit user instruction to continue offline can override that hold; record the exception and outstanding sync.

Send the worker the decision and published checkpoint ref using its verified binding. Track whether continuation was submitted so duplicate messages or sync retries do not launch it twice. A permission answer authorizes only the stated action; it does not establish that the action ran or succeeded. Ordinary discussion that changes no work state needs no checkpoint. Publication through a configured PR route means publishing the checkpoint to that route; it does not grant merge authority.

## Worker tab and pane lifecycle

The coordinator chooses when to close its managed worker tabs or panes without asking for approval each time. For a worker in a shared tab, close only its owned pane and preserve the other occupants; close the whole tab only when every occupant belongs to finished managed work. After reconciliation and required publication, close a finished worker tab when its handoff, evidence, decisions and next action are durable and no session-dependent work remains. Preserve uncommitted files and unsaved terminal/editor content before closing; closure does not authorize deleting a checkout or discarding work. Idle/done alone never establishes completion.

Keep tabs with active commands or background jobs, unresolved blockers, or pending review/approval that requires the session. Reassess after those needs resolve; closing a tab does not itself complete a plan. Workers report readiness and leave cleanup to the coordinator.

Before closing, rediscover and verify the machine/session, tab, all contained panes and agent identities against the assignment's local bindings. Close only a worker tab or pane created for this scope or explicitly transferred into its management, with no unrelated occupants in the closure target. Use installed Herdr help for the close operation, verify the result, and retire its local binding. On uncertain outcomes inspect before retrying. Never close the coordinator tab, unrelated tabs, application window or server as worker cleanup; retain the workspace while the scope is active. If runtime access is unavailable, report cleanup pending.

## Optional fallback

Notifications are primary. When a recurring fallback is authorized, default to a five-minute interval during active assignments, scoped to one coordinator. No background process is installed by these documents. Verify the chosen scheduler exists and record schedule ID, owner identity, scope, interval and expiry locally. Do not replace it with an LLM sleep loop or silently install a dependency.

Pi's existing pi-scheduler extension was trialled; it is optional and runs only while Pi is open. Its store is cwd-scoped (.pi/scheduler.json), not protected by a cross-process ownership lock. Load it only into the owning coordinator, never into every worker or competing coordinator sharing that cwd. Inspect schedules before creating one; reuse only the verified matching schedule. Do not commit scheduler state. Other runners may use an equivalent explicitly configured scheduler.

Each scheduled run performs plan-sync for the scope, reconciles unreviewed updates and stays quiet when nothing actionable changed. Do not launch new work from a fallback without existing dispatch authority. Cancel the owned schedule when no active assignments remain, on transfer, or at the agreed stop/expiry. Verify deletion. Busy sessions defer scheduled work; the interval is not a latency guarantee. Prompt-based stop times are not process-level deadlines. Report paused/offline checks and sync failures honestly.

## Runtime access

Read the installed herdr skill before control. Its default is HERDR_ENV=1. An explicit user instruction to inspect/control a named session externally can override that default: record the authorization, target the named session and explicit live IDs, and never spoof environment variables or rely on the focused pane. Otherwise work on files and report runtime control unavailable. Do not answer login/approval dialogs on behalf of the user.
