# Coordinator review checkpoint

Plannotator gives the human a concrete place to inspect an artifact and return anchored feedback.
Your own code inspection, passing CI and a PR link do not replace that human review surface.
Opening a surface is not approval, a new merge gate, or permission to merge or deploy.

## When to decide

During authorized ongoing coordination, run this checkpoint after reconciling each material worker
return, after a material plan/design revision needing human input, and before reporting a coherent
implementation as ready. Do it at the end of reconciliation, not only at dispatch or on explicit
"open Plannotator" requests. A read-only startup reports a missing checkpoint for recovery; it does
not expand into new implementation or unrequested reviews. Explicit user directions take precedence.

Ask: "Is there now an artifact the human should inspect or a concrete decision they need to make?"

- **Code delivery:** after your own triage, open a code review for a coherent review-ready revision.
  This is the default for a completed coding assignment. Verify the current PR head and intended
  base; use that exact frozen diff, not an older handoff revision or an unrelated working tree.
- **Plan/design input:** when presenting a substantive proposal, changed scope, risky tradeoff or
  unresolved user choice, save the proposal and open feedback-only plan annotation. Say what input
  is needed. Do not turn routine implementation details into new human approval requirements.
- **Explicit acceptance:** use an approval gate only when the user or existing assignment requires
  acceptance. Otherwise collect feedback, without inventing a new permission gate.
- **Partial implementation:** if known required repairs are still assigned, finish those first
  unless human input is needed now. Record the next review trigger, not just "review later".
- **No new reviewable artifact:** runtime probes, duplicate wakes and status-only updates normally
  need no new surface. Record that reason. They must not hide an earlier outstanding code review.

Deployment prerequisites are separate. Missing credentials, tailnet administration, production
access or live acceptance tests do not prevent review of a coherent source diff. List these limits
in the review context instead of using them to postpone the code review. Pending CI can likewise
be disclosed; defer only when a specific result is needed to make the artifact meaningfully
reviewable.

## Before opening

Check the plan's existing review disposition and the owned review's source revision and lifecycle.
Reuse/reopen a live matching surface instead of duplicating it. A completed review applies only to
its recorded snapshot; material subsequent changes need a new review or an explicit deferral.
Reconcile feedback already returned before reopening. Do not reopen the same completed snapshot
merely because a duplicate notification arrived, or silently supersede an active review.

Read the installed Plannotator skill. Prefer Herdsman's owned-review procedure when available and
authorized; otherwise use direct Plannotator if available, without claiming automatic return wakes.
Keep the launcher alive, verify the actual URL/session, and notify the human with the coordinator,
task, revision, requested feedback and link. Readiness is not established by a launcher exit code
alone. Do not inject terminal notifications, install missing tools or grant new permissions
silently.

## Required outcome before the final progress report

Record one explicit **Review disposition** in the existing plan/current-state checkpoint for the
artifact revision. This is not a separate dashboard. Include the reason and next action:

- **Open:** durable review ID and exact source revision, plus a pointer to the ignored local URL/
  process record. Verify the surface is live and tell the human where to review.
- **Already reviewed:** exact source revision and saved decision reference. Preserve unresolved
  feedback and acceptance requirements; this label does not turn annotations into approval.
- **Blocked:** the concrete launch/tool/permission failure, evidence and who can unblock it.
  Keep the review pending and explicitly tell the human it was not opened.
- **Deferred:** why this artifact is not ready or the user's explicit pause, the owner and concrete
  next trigger. Deployment prerequisites alone are not a valid code-review deferral.
- **Not needed:** no new reviewable artifact or an explicit user waiver. A coordinator's own
  inspection, green CI, or "the user did not ask again" is not a waiver for ready code delivery.

A coherent review-ready delivery cannot end with only a PR link or activation checklist. It needs
an open/current review, an already-reviewed matching revision, an explicit user deferral/waiver,
or a concrete opening blocker. Report any missing review rather than implying the workflow is done.
Opening a review need not block unrelated authorized work while waiting for feedback.

## Calibration examples

- Worker revises database access, CI passes, and deployment still needs tailnet/Doppler setup:
  **open code review now**; include deployment prerequisites and unverified live behavior.
- Worker returns a flawed routing workaround and you assign a focused correction:
  **defer**, naming that worker's corrected revision as the trigger; open a plan annotation now
  only if a genuine human design choice is needed before the correction can proceed.
- A resumed worker completes a receiver-only fixture: **not needed** for the fixture; do not let
  this erase a pending review of its actual product changes.
- The same worker revision wakes you twice: **reuse** the matching open review or its saved
  decision. Do not start a second session or reinterpret the old decision as approval of new code.
- Plannotator fails to launch: **blocked**, with the actual failure and recovery owner. Do not
  replace the missing surface with an unlabelled chat summary and call the review complete.

These are coordinator instructions, not an enforced harness stop hook. A stronger runtime gate
would require structured lifecycle state and explicit authorization; do not claim this document
prevents every missed step. Verify adoption through the next real reconciliation and review link.
