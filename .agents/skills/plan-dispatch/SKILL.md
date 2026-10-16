---
name: plan-dispatch
description: Assign a ready plan to workers and record ownership and dependencies.
---

# plan-dispatch

Locate the plans checkout from an explicit task path or the PLANS_DIR environment variable. If neither is available, use the current checkout only if it contains plan-spec.md and working-agreement.md; otherwise ask for its location. Read those two files in the plans checkout before acting. Resolve templates, context, plans, and handoffs against that checkout, never against the skill installation directory. Work on code in the separately identified repository checkouts.

Read the selected next plan and all open plans for conflicting ownership, affected repositories, and dependencies. Check the user's authorization and available runner capabilities. Prepare a bounded assignment containing the plan ID, plans checkout location, relevant context, scope, completion checks, and expected handoff path. Record a single owner before starting each assignment and move the plan to open when assigned. Launch or message a worker only when authorized and supported by the runner. If launch is unavailable, provide the prepared assignment and clearly label it not launched; keep unassigned work in next. Record launch failures and release or explain retained claims. Do not claim a worker is running without confirmation.
