---
name: plan-write
description: Refine a draft into an actionable plan with scope and completion checks.
---

# plan-write

Locate the plans checkout from an explicit task path or the PLANS_DIR environment variable. If
neither is available, use the current checkout only if it contains plan-spec.md and
working-agreement.md; otherwise ask for its location. Read those two files in the plans checkout
before acting. Resolve templates, context, plans, and handoffs against that checkout, never against
the skill installation directory. Work on code in the separately identified repository checkouts.

Read the draft, linked context, related handoffs and relevant source material. Apply the installed
authoring-philosophy skill during design. Start with a brief understanding of the problem and the
most important unresolved choice, not a complete plan.

Refine the work through focused exchanges. Investigate questions that code or evidence can answer;
use the conversation for engineering judgment, product intent and tradeoffs. Use plain technical
English. Bring a recommendation and a concrete example where useful. Ask a focused question rather
than requesting general approval of a long proposal. Do not manufacture questions when the work is
already clear.

Discuss actual interfaces, contracts, domain invariants and failure behaviour when needed. Match
detail to uncertainty and consequence. Code sketches or scoped edits to real code and tests can
help settle a question, but are not mandatory planning artifacts. Agree product-edit scope first.

Record agreed decisions and their reasons incrementally. Keep proposals and unresolved questions
distinct from decisions, and hypotheses separate from confirmed facts. Show the user relevant
changes and the next question, not the full plan after every exchange.

Shape the work into small, executable pieces of functionality with clear outcomes, scope, approach,
dependencies and observable completion checks. Split larger outcomes into linked plans where useful.
The coordinator recommends whether execution needs one worker or several, based on dependencies and
overlapping changes, not task count.

Keep plans in drafts while material execution decisions remain unresolved. Move agreed, executable
work to next and repair relative links. Do not treat silence as agreement or reopen settled choices
unnecessarily. External dependencies need not be completed before readiness, but must be explicit.
Experiments need a hypothesis and stopping condition. Do not launch workers during refinement.
