# Plan specification

## Identity and lifecycle

Name plans YYYY-MM-DD-short-slug.md. Keep the basename stable when moving between lifecycle directories. Check for duplicate IDs across all directories before creating one; add a descriptive suffix when necessary.

The containing directory is the canonical lifecycle state. Do not maintain a second status field. Resolve references by stable plan ID across plans/*/; update relative links when a file moves.

- drafts: captured work or investigation with unresolved execution decisions.
- next: outcome, scope, approach, dependencies, and completion checks are clear enough to assign.
- open: ownership recorded and work assigned; includes blocked, in progress, and awaiting review.
- done: completion checks satisfied with evidence and any required user acceptance recorded.
- discarded: abandoned, with a reason and any useful findings retained.

Moving a file is a state transition. Preserve its contents and history. Reopen done work only with an explicit reason; use a new plan for a new outcome.

## Plan contents

Use templates/plan.md. Drafts may contain only an outcome and initial context. Before next, fill the substantive planning sections; before open, record assignment ownership and dependencies.

Repository references use owner/repository or verified remote URLs. Local paths belong in local/machine.md. Initiative is optional. A plan may have multiple assignments but each assignment has one owner.

Current state summarizes completed work, active work, user decisions, other blockers, and next action. Evidence identifies the source, revision or timestamp, result, and limitations. Unchecked completion items are not satisfied.

## Assignment handoffs

Use handoffs/<plan-id>--<assignment-id>.md and templates/handoff.md. Each worker owns only its handoff. Keep the latest state concise and preserve important decisions and evidence; Git retains earlier versions.

Handoffs record actual branch, commit, PR, tests, changed decisions, blockers, and next action. Unknown or inaccessible sources remain explicitly unverified.

## Coordination and synchronization

The coordinator reads handoffs, checks evidence where accessible, and updates plans. A handoff is a report, not proof of completion.

Before dispatch, check all open plans for conflicting ownership or edits. Reserve the assignment before starting work. If launch fails, record it and release the claim or retain it with an explicit retry action.

Use one coordinator checkout initially. Workers with separate clones can deliver handoff commits or patches for the coordinator to integrate. Do not overwrite others' uncommitted work or force-push to reconcile state.

README is navigation, not a manually duplicated status dashboard. plan-status derives its report from plan files and handoffs.

## Shared context

Context files should identify scope, source, last verification date, established facts, decisions, and open questions. Read only relevant context. Do not promote experimental claims into established facts without evidence.

Initiatives group related plans and carry shared goals or dependencies; plans remain the source of execution status.
