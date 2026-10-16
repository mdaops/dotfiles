---
name: plan-sync
description: Synchronize plans and worker handoffs across checkouts, verify current PR evidence, and reconcile plan state.
---

# plan-sync

Locate the plans checkout from an explicit task path or the PLANS_DIR environment variable. If neither is available, use the current checkout only if it contains plan-spec.md and working-agreement.md; otherwise ask for its location. Read those two files in the plans checkout before acting. Resolve templates, context, plans, and handoffs against that checkout, never against the skill installation directory. Work on code in the separately identified repository checkouts.

Read plans and handoffs in scope, then check referenced commits, PRs, checks, or other artifacts where accessible. Reconcile actual progress with each completion criterion and current dependencies. Update current state and evidence, preserving uncertainty when sources are inaccessible. Keep blocked or awaiting-review work open. Move to done only when checks are satisfied and any required user acceptance is recorded. PR merge alone is insufficient; non-code work may finish without a PR. Discard only when abandonment is authorized and retain its reason. Repair links after moves. Report transitions and unresolved discrepancies without merging or deploying as a side effect.

Follow coordinators/updates.md. Reconcile changed handoffs and evidence, recording the latest reviewed timestamp/revision per assignment in the plan. Repeated notifications must not repeat dispatch or resolve still-open blockers. Herdr state alone never proves completion. When acting as the owning coordinator with runtime control, consider releasing finished worker tabs under the cleanup rules in coordinators/updates.md after durable reconciliation and required publication. Workers do not close other sessions.

Read coordinators/sync.md and execute its sync procedure, including configured remote/branch and handoff delivery refs. Fetch before reconciliation; preserve dirty/staged/diverged work. Inspect current PR heads and checks rather than trusting an old handoff. Publish authorized scoped changes through the configured route and verify remote refs; label failed or unauthorized publication local-only. Do not merge PRs as a side effect. Workers publish only their outputs; the owning coordinator writes shared lifecycle state. On a new machine rediscover local bindings and follow explicit ownership transfer rules; never infer takeover from local absence.
