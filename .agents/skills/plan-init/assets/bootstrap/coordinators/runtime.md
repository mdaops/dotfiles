# Coordinator identity, context and runtime

## Durable role, replaceable session

A coordinator is a durable identity with a remit, authority and owned work. It is not a
repository, initiative, process or transcript. It can own one task, span several initiatives,
or retire after a bounded outcome. Parent/delegation links are optional; no root runtime is
required. Different coordinators may share context and product repositories.

Use `coordinators/<id>.md` for the profile. The ID is a stable slug within the plans repository;
name the plans repository explicitly when routing. Existing scope profiles remain valid: their
scope is their remit, not an exclusive claim over every repository/context they mention.
Use `templates/coordinator.md` for new profiles; do not silently migrate active ownership.

Record remit, authority, context links, owned plan references, recovery checkpoint and
active/retired lifecycle. Keep progress in plans/handoffs, not a second status dashboard.
One owning coordinator is recorded per assignment. Check overlapping edits and runtime mutations
at dispatch; sharing read access to context is not a conflict.

## Shared context

Profiles link repository-relative context files rather than copying them. Plans and assignments
link only relevant context. Start with the profile, then expand context as the task requires;
do not load every coordinator's history or all context on startup.

A context file's maintainer or an explicit per-change agreement determines who writes shared
facts. Preserve contradictory evidence and unresolved decisions. A coordinator owning a plan
does not automatically own every shared file. When multiple coordinators share one checkout,
serialize Git index/commit/push operations through one agreed publisher, while keeping their
assignment ownership independent.

## Runtime binding and wake

Herdsman is optional and machine-local. Use it only when its checkout, dependencies and supported
adapter are available and setup/use is authorized. Read the installed herdsman skill or the
canonical
skills/herdsman/SKILL.md in that verified checkout; a skill alone is not a working runtime.
If unavailable, continue durable planning, handoff publication and reconciliation without automatic
wakes. Report specifically requested unavailable runtime actions; do not claim equivalent delivery,
install tools implicitly or substitute terminal input.

Installed but unbound is a setup step, not software absence. Normal Pi package installation
starts a private receiver in each fresh session and supplies its endpoint in agent context.
CC supplies its endpoint through MCP instructions; receiving also requires channel opt-in/consent.
Within authorized setup, the coordinator verifies/binds its own assigned role before dispatch.
No hand-written session loader is needed. Report reload/permission blockers explicitly.
A worker sending updates needs only the CLI and coordinator binding, not its own receiver.

Herdsman stores local routing hints, not durable ownership. Each receiver lifetime has a fresh
instance ID. A binding maps plans-repository ID plus coordinator ID to that instance, a local
socket, the local plans checkout/profile, and an optional verified Herdr pane.

The coordinator-start skill activates the installed harness adapter, verifies its readiness and
registers the binding only within existing ownership/runtime authority. It must report a missing
adapter or required user consent/reload, not fall back to terminal input. Startup itself does not
authorize dispatch or install a scheduler.

Use the Herdsman named-coordinator CLI from its verified local checkout:

```sh
npm --prefix "$HERDSMAN_DIR" run coordinator -- bind   mdaops/plans herdsman "$PLANS_DIR" /absolute/private/receiver.sock <live-pane>
npm --prefix "$HERDSMAN_DIR" run coordinator -- list mdaops/plans
npm --prefix "$HERDSMAN_DIR" run coordinator -- show mdaops/plans herdsman
npm --prefix "$HERDSMAN_DIR" run coordinator -- wake   mdaops/plans herdsman worker-id handoffs/<plan>--<assignment>.md <revision>
npm --prefix "$HERDSMAN_DIR" run coordinator -- unbind   mdaops/plans herdsman <expected-instance>
```

The local directory is `HERDSMAN_STATE_DIR`, defaulting to `~/.local/state/herdsman`.
Do not sync it. Registration refuses an existing binding; unbind requires the expected instance.
Unbind does not stop the receiver or transfer ownership. List shows registered runtime status;
discover durable, unbound coordinators from their profiles, not this runtime list alone.

Workers save the handoff and wake at every stop, including blocked or waiting; across checkouts
publish first. Optional Herdr observers wake the coordinator when a worker stops without reporting.
Named wakes use repository-relative source references resolved inside the receiver's plans checkout.
Pin the receiver instance so an old binding cannot silently deliver to a replacement session.
Offline, unbound, stale and uncertain-delivery outcomes remain distinct. Do not retry uncertain
sends.

A wake grants no authority. Establish autonomous reconciliation authority in the coordinator and
worker assignments before relying on wakes. Acknowledged transport is not reviewed evidence.
On notification, reconcile through plan-sync and record the reviewed source revision. Duplicates
must not repeat dispatch, publication or decisions. Pi queues a follow-up; CC may receive the
event between tool steps within its current turn.

Never use Herdr agent prompt, send-text, send-keys or equivalent terminal input to deliver
asynchronous updates into a human-facing agent. Initial setup of a dedicated worker is separate
from notification: inspect its editor and do not submit a user's unfinished draft.

## One Herdr space per coordinator

Default to a workspace named for the coordinator ID, with a coordinator tab and labelled worker
tabs. Prefix with a short plans-repository label when IDs collide across repositories. Preserve
focus for background setup. A space name is navigation, not ownership proof.

Do not rename or claim a shared existing space just because the current session is inside it.
When authorized, move only this coordinator and its assigned workers to their own space. Keep
their sessions/history; use returned pane IDs after moves and refresh local bindings. Other
coordinators and workers remain untouched. Use discovered live agent names/pane IDs to focus
a coordinator; focusing is a user-navigation action, not a wake.

## Moving machines

Arch Linux, macOS and Windows via WSL use the Unix-socket transport. Verify tools and adapter
support on each installation; Linux tests do not prove macOS/WSL behavior. Keep executable paths,
Herdr IDs, sockets, sessions and live review URLs local.

The coordinator owns sync. Before leaving a machine, publish checkpoints, handoffs, decisions
and reviewed revisions, then stop/release the old runtime as applicable. On another machine,
coordinator-start fetches durable state, confirms ownership and creates fresh local bindings.
Git is not a distributed lock; cross-machine exclusivity is an operating rule, not a guarantee.
Unpublished work may be unavailable on the next machine; the user accepts that limitation.

A receiver that does not exist is not auto-launched. Reconcile newer published handoffs on
startup even if no wake was delivered. No remote wake transport, durable event mailbox or
automatic takeover is implied. Retiring a coordinator removes its local binding and records
its durable lifecycle; do not erase checkpoints needed for recovery.

## Plannotator is part of coordination

At each material worker-return reconciliation and before reporting ready code, apply the installed
coordinator-start/review-checkpoint.md guidance. Open code review for a coherent completed revision;
open feedback-only plan annotation when a substantive proposal needs human input. Use an approval
gate only when explicitly required. Your own review and a PR link do not replace the human surface.
Deployment credentials, live validation and activation prerequisites do not block source review.

Record Review disposition against the exact revision in the existing plan/current state: open
(with durable review ID and local URL pointer), already reviewed (saved matching decision), blocked
(concrete opening failure), deferred (owner and next trigger), or not needed (reason/user waiver).
Do not stop with review-ready work and no disposition. Reuse matching reviews, preserve unresolved
feedback and avoid duplicate sessions. Report missing tooling explicitly; do not silently omit
review.

Use Herdsman's owned-review wrapper when its runtime, binding and Plannotator are available and
authorized. Otherwise use direct Plannotator only if independently available; direct sessions have
no automatic Herdsman result wake. If neither is available, discuss the work in conversation and
record decisions normally. Do not invent a review result or install missing tools implicitly.

Read the available Plannotator skill before launching a review. The coordinator opens the
relevant surface, associates it with its ID and task, and tells the user where to interact.

- Code: `plannotator review --json` from the code checkout. Use an explicit base or a frozen
  patch when the intended comparison requires it.
- Plan iteration: `plannotator annotate <plan.md> --json` for feedback, without an approval gate.
- Explicit plan acceptance: `plannotator annotate <plan.md> --gate --json`.
- Existing session: `plannotator sessions`, then reopen the verified matching session rather
  than spawning duplicates. Concurrent sessions in one checkout need explicit URL/ID tracking.

Record the live URL, local process/session and owning coordinator in ignored local/ state.
Notify the user with the coordinator ID, task, what feedback is needed, and the working link,
using a Herdr notification when available. Do not inject a review request into their editor.
Plan discussion may continue in the annotated document; apply returned feedback to the durable
plan, preserving unresolved choices, and reopen/refresh the relevant review when needed.

Keep the source revision or snapshot and the returned decision/annotations as durable evidence.
Classify JSON by its decision field, not message text. Approval with notes is not a denial;
dismissal, missing output or process failure is not approval. A live URL is not a durable
artifact. On another machine, reconstruct the source and open a fresh local review.

A review completion can notify its owning coordinator through the same wake mechanism after
saving the result. The review launcher must remain running to capture completion; do not treat
a detached browser as a durable worker or claim a missing result was processed. Review approval
does not authorize merge/deployment, and approval of one snapshot does not approve later edits.
