---
name: coordinator-start
description: Start or resume a coordinator from synced plans and handoffs, and group its workers in
  a Herdr workspace.
---

# Coordinator startup

Before writing planning Markdown, read [formatting rules](../plan-write/formatting.md).
Run its readability checker on all task-changed Markdown before reporting completion or
publication. Include these rules/checks in worker handoff instructions. A read-only
startup or status pass does not trigger a repository-wide formatting audit.

Locate PLANS_DIR or the explicit plans checkout and determine the durable coordinator ID/remit.
Read coordinators/runtime.md when available. The coordinator is not an initiative or product
repository: several IDs may share context and one ID may span initiatives. Discover its profile
by ID; do not infer ownership from the currently focused Herdr space. Startup is a compact
status/recovery pass, not permission to research or implement every draft. Read the scope profile
first and honor repository instructions already loaded; do not reread them. Inspect Git status and
fetch the configured plans remote without modifying local work. Report unavailable remotes as stale;
do not require old conversation history.

Discover scoped plan IDs, lifecycle directories and Current state sections with targeted searches.
Read full active plans only when needed to recover assignments/blockers. For drafts, list titles and
next actions; do not open product source, machine inventories, completed plans, historical handoffs
or trial logs unless an active task requires them. Read only new or changed handoffs for active
assignments, using recorded review revisions. Do not create a second manually maintained status
index.

Check the synced owner/transfer record. Read coordinators/sync.md and use plan-sync when
reconciliation, publication or ownership changes are needed, rather than loading that procedure on
every boot. Before changing plans read working-agreement.md and plan-spec.md. Absence on this
machine does not prove another machine's coordinator stopped; record authorized ownership changes
before dispatch.

When runtime setup is authorized and needed, read the herdr skill and the relevant workspace section
of coordinators/updates.md: inspect/reuse or create one named workspace, keep a dedicated
coordinator tab and by default, a separate labelled tab per worker in that workspace. This
user-selected topology overrides the generic Herdr sibling-pane default; the coordinator may choose
a split pane when it judges that layout better suited to the work, without additional approval. Use
targeted command help, not every command group. Record returned identities locally and preserve user
focus. External control requires explicit named-session authorization; do not fake HERDR_ENV.
Otherwise report runtime setup pending.

Herdsman is optional. Use it only when a verified local checkout, dependencies and supported
adapter are available and runtime setup is authorized. A skill file alone is not availability.
Read the installed herdsman skill, or skills/herdsman/SKILL.md in the verified HERDSMAN_DIR
checkout.
If software is unavailable, continue durable startup/reconciliation without it.
Installed but unbound is different: within authorized runtime setup, the coordinator must use its
current receiver context to verify/bind its assigned identity before dispatch. Normal Pi package
installation supplies a fresh endpoint per session; CC supplies it through its channel server.
Do not require a per-session loader or make the human choose socket paths.
Coordinator receiver readiness covers only inbound reporting. For managed interactive workers,
follow the herdsman skill's bidirectional launch/readiness procedure before product dispatch;
verify their receiving endpoints too, without changing their role into a durable coordinator.
Ask only for actual
reload/consent/permission blockers and report them explicitly rather than silently skipping
wakes. If the user has explicitly delegated the exact local Herdsman development-channel warning,
follow the canonical skill's narrowly checked confirmation procedure and record local evidence.
Verify the machine/install-specific grant; do not infer it from tool availability. All unrelated
consent prompts remain human decisions. Report a specifically requested
runtime action as unavailable; do not silently install, bind or substitute terminal
notifications. Follow its binding/review procedure
rather than duplicating it here. Use the adapter and named CLI to bind this exact session/instance
to its plans-repository ID and coordinator ID. Keep local
paths and live review links out of durable profiles. A required reload/consent or unavailable
adapter is a reported setup step, never a reason to inject terminal input. Discover and reuse
verified local bindings; do not overwrite stale registrations without explicit expected-instance
removal. Group only this coordinator and its assigned workers in its own space, leaving unrelated
occupants of a shared space intact. After moves rediscover live IDs and refresh bindings.

During ongoing coordination, after material worker returns and before reporting review-ready work,
apply the [review checkpoint](review-checkpoint.md). Open the appropriate plan/code surface or
record
an explicit revision-scoped disposition and reason. Your own source review is not the human review.
Deployment prerequisites do not postpone reviewable code. At read-only startup, report missing
review dispositions for recovery without expanding the requested startup scope.

For authorized reviews, use Herdsman's owned-review procedure when its local runtime, binding and
Plannotator are available. Otherwise use Plannotator directly only if independently available,
without claiming automatic result wakes; if neither is available, continue discussion in
conversation.
Read the available Plannotator skill before using that tool. Open/reopen the correct
review, retain its local URL with coordinator/task identity, and notify the user with that link.
Use feedback-only annotation for iteration, explicit gate mode for requested acceptance. Save
source revision and returned decisions as durable evidence; do not treat a stale URL as recovery.

Finish startup with a short brief: active assignments, user decisions, available drafts and next
action. Stop there unless the user also requested refinement or execution. Do not run plan-write or
product investigation implicitly. Load fallback guidance in coordinators/updates.md only when
configuring it: one owner, five-minute default, explicit scheduler authority and cancellation when
inactive/transferred. An idle session cannot check files by itself.

During ongoing coordination, material user changes to plans and answers or permissions for workers
are sync checkpoints. Follow the user-decision checkpoint rules in coordinators/updates.md: record,
reconcile and publish before dependent continuation. This trigger does not expand startup into
implementation or dispatch.
