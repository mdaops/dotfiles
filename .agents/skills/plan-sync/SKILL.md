---
name: plan-sync
description: Synchronize plans and worker handoffs across checkouts, verify current PR evidence, and
  reconcile plan state.
---

# plan-sync

Read coordinators/runtime.md when available. Reconcile the requested durable coordinator's owned
assignments, not every coordinator sharing its context. Recover work from published source and
reviewed revisions, independently of wake history. Runtime bindings and review URLs are local;
refresh them on machine/session changes rather than syncing them. The coordinator owns sync;
unpublished work may be unavailable after leaving a machine.

Herdsman is optional: reconcile durable evidence even when its runtime is absent. Read its
installed/canonical skill only when local runtime integration is available and the requested
operation is authorized. Do not require a live receiver to read saved decisions, silently install
missing tools, or retry notifications as a substitute for reconciliation. A specifically requested
unavailable runtime operation remains reported as blocked, not completed by a fallback.

Treat Plannotator output as evidence tied to the reviewed source revision. Classify the returned
decision field; preserve feedback, unresolved questions and approval boundaries in the plan.
Do not infer approval from dismissal, absent output or an old review of newer code. Review
completion may wake the owning coordinator after the result is saved. It grants no merge or
deployment authority. A live review link is not a checkpoint or a published decision.

Before writing planning Markdown, read [formatting rules](../plan-write/formatting.md).
Run its readability checker on all task-changed Markdown before reporting completion or
publication. Include these rules/checks in worker handoff instructions. A read-only
startup or status pass does not trigger a repository-wide formatting audit.

Locate the plans checkout from an explicit task path or the PLANS_DIR environment variable. If
neither is available, use the current checkout only if it contains plan-spec.md and
working-agreement.md; otherwise ask for its location. Read those two files in the plans checkout
before acting. Resolve templates, context, plans, and handoffs against that checkout, never against
the skill installation directory. Work on code in the separately identified repository checkouts.

Read plans and handoffs in scope, then check referenced commits, PRs, checks, or other artifacts
where accessible. Reconcile actual progress with each completion criterion and current dependencies.
Before the final progress report after a material return, apply the coordinator's
[review checkpoint](../coordinator-start/review-checkpoint.md). Decide whether the human now needs
plan feedback or a code-review surface, then record Review disposition for the exact source revision
in the existing plan: open, already reviewed, blocked, deferred or not needed, with evidence
and next
action. Ready code normally requires a live review link, not merely your own inspection or a PR URL.
Deployment prerequisites do not block source review. Reuse matching reviews and never reopen on a
duplicate wake. Missing tooling must be an explicit opening blocker, not a silent omission.

Update current state and evidence, preserving uncertainty when sources are inaccessible. Keep
blocked or awaiting-review work open. Move to done only when checks are satisfied and any required
user acceptance is recorded. PR merge alone is insufficient; non-code work may finish without a PR.
Discard only when abandonment is authorized and retain its reason. Repair links after moves. Report
transitions and unresolved discrepancies without merging or deploying as a side effect.

Follow coordinators/updates.md, including user-decision checkpoints. Material user changes and
worker answers/permissions trigger reconciliation and publication before dependent continuation,
without waiting for another handoff or explicit plan-sync request. Record exact authority, verify
publication, and report failed sync while holding dependent work unless the user explicitly
authorizes offline continuation. Reconcile changed handoffs and evidence, recording the latest
reviewed timestamp/revision per assignment in the plan. As the owning coordinator, maintain relevant
shared context during reconciliation using the context rules in coordinators/updates.md, and publish
those changes alongside the plan through the configured route. Repeated notifications must not
repeat dispatch or resolve still-open blockers. Herdr state alone never proves completion. When
acting as the owning coordinator with runtime control, consider releasing finished worker tabs under
the cleanup rules in coordinators/updates.md after durable reconciliation and required publication.
Workers do not close other sessions.

Read coordinators/sync.md and execute its sync procedure, including configured remote/branch and
handoff delivery refs. Fetch before reconciliation; preserve dirty/staged/diverged work. Inspect
current PR heads and checks rather than trusting an old handoff. Publish authorized scoped changes
through the configured route and verify remote refs; label failed or unauthorized publication
local-only. Do not merge PRs as a side effect. Workers publish only their outputs; the owning
coordinator writes shared lifecycle state. On a new machine rediscover local bindings and follow
explicit ownership transfer rules; never infer takeover from local absence.
