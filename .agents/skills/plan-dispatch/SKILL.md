---
name: plan-dispatch
description: Assign a ready plan to workers and record ownership and dependencies.
---

# plan-dispatch

Preserve the small functional boundaries agreed during planning. Choose one worker or several based
on dependencies, ownership and overlapping changes; do not assume parallel execution is better.
Workers execute the agreed design within existing authorization and report evidence that challenges
it. Do not add routine user approval gates or silently replace agreed contracts and invariants.

Before writing planning Markdown, read [formatting rules](../plan-write/formatting.md).
Run its readability checker on all task-changed Markdown before reporting completion or
publication. Include these rules/checks in worker handoff instructions. A read-only
startup or status pass does not trigger a repository-wide formatting audit.

Locate the plans checkout from an explicit task path or the PLANS_DIR environment variable. If
neither is available, use the current checkout only if it contains plan-spec.md and
working-agreement.md; otherwise ask for its location. Read those two files in the plans checkout
before acting. Resolve templates, context, plans, and handoffs against that checkout, never against
the skill installation directory. Work on code in the separately identified repository checkouts.

Read the selected next plan and all open plans for conflicting ownership, affected repositories, and
dependencies. Check the user's authorization and available runner capabilities. Apply the coding
runner/model rules in coordinators/updates.md: default new coding work to Claude Code with requested
Opus 5.5, honor explicit overrides, verify availability and exact model selection, and report
unavailable choices without silent substitution. Prepare a bounded assignment containing the plan
ID, plans checkout location, relevant context, scope, completion checks, and expected handoff path.
For coding assignments, include the available authoring-philosophy skill location among the worker
instructions and have the worker read it before authoring, alongside repository rules. Record a
single owner before starting each assignment and move the plan to open when assigned. Launch or
message a worker only when authorized and supported by the runner. If launch is unavailable, provide
the prepared assignment and clearly label it not launched; keep unassigned work in next. Record
launch failures and release or explain retained claims. Do not claim a worker is running without
confirmation.

Read coordinators/updates.md, coordinators/sync.md, coordinators/runtime.md when available, and
the owning coordinator profile. Include its durable ID and plans-repository namespace in the
assignment, plus relevant shared-context references and agreed shared-write boundaries. Context
sharing alone is not an ownership conflict. Establish authority to reconcile assignment wakes
before notification; do not rely on a wake to grant permission. Sync current ownership and
incoming handoffs before reserving an assignment. Supply templates/assignment.md with a durable
handoff delivery branch/PR, code publication permissions, reporting triggers and local binding
location. Publish reservations through the configured route before cross-checkout dispatch; an
unsynced claim cannot establish remote ownership.

Use the owning coordinator's named Herdr workspace, creating/reusing it through coordinator-start
when runtime
setup is authorized. Verify coordinator and worker membership; by default create a separate labelled
tab per worker there and launch into its returned root pane, preserving focus (or the returned pane
when choosing a split). This user-selected topology overrides the generic Herdr sibling-pane
default; the coordinator may choose a split pane when it judges that layout better suited to the
work, without additional approval. Record tab as well as pane/agent identities locally. The
coordinator owns tab cleanup under the lifecycle rules in coordinators/updates.md. Read the herdr
skill and discover installed syntax. External control requires explicit named-session authorization.
Verify returned live IDs and launch readiness, and inspect uncertain outcomes before retrying.
Outside available runtime control prepare the assignment and report it not launched.
Use Herdsman reporting only when the local runtime/dependencies are available, the receiving
binding is verified and its use is authorized. Read the installed herdsman skill or its canonical
skills/herdsman/SKILL.md in the verified HERDSMAN_DIR checkout; include that location in the
assignment. A skill file alone does not establish runtime availability. If unavailable, use the
assignment's authorized durable handoff/reporting route and later reconciliation, with no automatic
wake claim. Do not silently install Herdsman or block otherwise independent work.
If installed but the coordinator is unbound, complete authorized setup through coordinator-start
or report its concrete blocker before dispatch. The sender needs no receiver of its own; lack of
worker channel setup is not a reason to omit a named return wake to a ready coordinator.
Herdsman-managed interactive CC workers must launch bidirectionally by default when the runtime
is available and setup is authorized. Use the documented channel flag with the requested model;
verify consent/registration and a bounded receiving test before product dispatch. Sender-only is
an explicit exception, not the default. Assign one ignored runtime-record path for the worker to
publish its own socket/instance/session association; use the canonical skill's pinned worker route
for later updates and named wakes for returns. Do not invent a coordinator profile for a worker.
For an existing worker, an authorized stop/resume must preserve its exact session ID/cwd/model;
skill reload cannot add channel startup flags. Consent prompts remain blockers unless the user
has explicitly delegated this exact local Herdsman development-channel confirmation. Check the
machine-local grant and its authority source, then follow the canonical skill's identity/config/
prompt guards, single confirmation and evidence procedure. This never covers project trust,
MCP-server approval, tool permissions, other channels or a different prompt; ask for those.
Follow that
procedure rather
than copying it into assignments. A worker saves/publishes its handoff, then sends a named wake at
every stop: completed, blocked or waiting. Waiting never defers the wake. Runtime state is not
completion evidence. For a worker in a Herdr pane, start the canonical skill's worker stop observer
after dispatch when Herdr control is authorized; it wakes the coordinator if the worker stops
without reporting.
Never paste asynchronous updates into human-facing terminal editors.
Unbound/offline/stale delivery leaves durable work pending for startup/plan-sync recovery.
For review-ready work, give the owning coordinator the source revision and relevant review
artifact. Include the return checkpoint in the assignment: after reconciliation, the coordinator
applies the [review checkpoint](../coordinator-start/review-checkpoint.md), opens the appropriate
Plannotator surface and notifies the user with its live link, or records an explicit disposition
and concrete reason. A PR link or activation checklist alone is not the completed review handoff.
Workers do not open a duplicate owner review; they identify the exact reviewable revision and
limits.
