---
name: plan-sync
description: Reconcile worker handoffs and completion evidence with plan lifecycle state.
---

# plan-sync

Locate the plans checkout from an explicit task path or the PLANS_DIR environment variable. If neither is available, use the current checkout only if it contains plan-spec.md and working-agreement.md; otherwise ask for its location. Read those two files in the plans checkout before acting. Resolve templates, context, plans, and handoffs against that checkout, never against the skill installation directory. Work on code in the separately identified repository checkouts.

Read plans and handoffs in scope, then check referenced commits, PRs, checks, or other artifacts where accessible. Reconcile actual progress with each completion criterion and current dependencies. Update current state and evidence, preserving uncertainty when sources are inaccessible. Keep blocked or awaiting-review work open. Move to done only when checks are satisfied and any required user acceptance is recorded. PR merge alone is insufficient; non-code work may finish without a PR. Discard only when abandonment is authorized and retain its reason. Repair links after moves. Report transitions and unresolved discrepancies without merging or deploying as a side effect.
