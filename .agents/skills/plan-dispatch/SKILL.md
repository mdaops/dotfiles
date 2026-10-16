---
name: plan-dispatch
description: Assign a ready plan to workers and record ownership and dependencies.
---

# plan-dispatch

Locate the plans checkout from an explicit task path or the PLANS_DIR environment variable. If neither is available, use the current checkout only if it contains plan-spec.md and working-agreement.md; otherwise ask for its location. Read those two files in the plans checkout before acting. Resolve templates, context, plans, and handoffs against that checkout, never against the skill installation directory. Work on code in the separately identified repository checkouts.

Read the selected next plan and all open plans for conflicting ownership, affected repositories, and dependencies. Check the user's authorization and available runner capabilities. Prepare a bounded assignment containing the plan ID, plans checkout location, relevant context, scope, completion checks, and expected handoff path. Record a single owner before starting each assignment and move the plan to open when assigned. Launch or message a worker only when authorized and supported by the runner. If launch is unavailable, provide the prepared assignment and clearly label it not launched; keep unassigned work in next. Record launch failures and release or explain retained claims. Do not claim a worker is running without confirmation.


Read coordinators/updates.md, coordinators/sync.md and the scope profile. Sync current ownership and incoming handoffs before reserving an assignment. Supply templates/assignment.md with a durable handoff delivery branch/PR, code publication permissions, reporting triggers and local binding location. Publish reservations through the configured route before cross-checkout dispatch; an unsynced claim cannot establish remote ownership.

Use the scope's named Herdr workspace, creating/reusing it through coordinator-start when runtime setup is authorized. Verify coordinator and worker membership; create a separate labelled tab per worker there and launch into its returned root pane, preserving focus. This user-selected topology overrides the generic Herdr sibling-pane default; use splits only when explicitly useful or requested. Record tab as well as pane/agent identities locally. The coordinator owns tab cleanup under the lifecycle rules in coordinators/updates.md. Read the herdr skill and discover installed syntax. External control requires explicit named-session authorization. Verify returned live IDs and launch readiness, and inspect uncertain outcomes before retrying. Outside available runtime control prepare the assignment and report it not launched. A worker saves/publishes its handoff before a non-waiting notification; runtime state is not completion evidence.
