---
name: plan-status
description: Summarize current plans, worker progress, blockers, and user decisions.
---

# plan-status

Locate the plans checkout from an explicit task path or the PLANS_DIR environment variable. If neither is available, use the current checkout only if it contains plan-spec.md and working-agreement.md; otherwise ask for its location. Read those two files in the plans checkout before acting. Resolve templates, context, plans, and handoffs against that checkout, never against the skill installation directory. Work on code in the separately identified repository checkouts.

Read active plans and their latest handoffs; inspect next and drafts only as needed for the requested scope. Report meaningful completed work, active assignments, exact decisions waiting on the user with recommendations and impact, other blockers, and work that can proceed. Include plan IDs and sources. Flag missing or stale checkpoints and conflicting reports. Distinguish reported progress from verified evidence. This command is read-only; use plan-sync to reconcile stored state.

Include relevant handoff changes and decisions waiting on the user. Distinguish saved updates from verified work and known live session state. Do not notify or launch agents during this read-only operation.
