---
name: plan-write
description: Refine a draft into an actionable plan with scope and completion checks.
---

# plan-write

Locate the plans checkout from an explicit task path or the PLANS_DIR environment variable. If neither is available, use the current checkout only if it contains plan-spec.md and working-agreement.md; otherwise ask for its location. Read those two files in the plans checkout before acting. Resolve templates, context, plans, and handoffs against that checkout, never against the skill installation directory. Work on code in the separately identified repository checkouts.

Read the draft, linked context, and relevant source material. Establish the outcome, scope, approach, dependencies, and observable completion checks. Separate hypotheses from confirmed facts. Ask for missing material decisions while continuing independent investigation. Split assignments only when ownership or dependencies justify it. Experiments need a hypothesis and stopping condition. Keep the plan in drafts while execution decisions remain unresolved; otherwise move it to next and repair relative links. Readiness does not require every external dependency to be completed, but dependencies must be explicit.
