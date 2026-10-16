# Working agreement

## Scope and roles

The user works across related repositories, sometimes with experiments, usually with four to six worker sessions. Repeated setup context, uncertain progress, overlapping work, and decisions waiting on the user are the main problems to solve.

A coordinator manages multiple initiatives and their assignments. Workers carry out bounded assignments. The user may work directly with a worker; material decisions from those conversations must reach its handoff.

The coordinator is replaceable. Durable files, linked evidence, and checkpoints must be enough for a new session to resume.



## Context

Read this agreement, the plan, its relevant shared context, and the latest assignment handoff. Verify changeable facts against current sources. Keep hypotheses separate from established decisions.

Use context files for reusable knowledge, initiatives for optional multi-plan grouping, and plans for finishable outcomes. Products are optional context, not a mandatory hierarchy.

## Ownership and updates

Use one coordinator as the writer of plan lifecycle state and assignment ownership within a scope. Workers write their own handoffs and assigned code. A person acting manually may take the coordinator role.

Record ownership before dispatch. Check overlapping repositories and files; use separate branches or checkouts where appropriate and agree on integration order.

Do not let several coordinators concurrently claim work in independent clones. Git is a history and exchange mechanism, not a distributed lock. Start with one dispatcher.

Update handoffs after meaningful progress, a blocker, a changed decision, or before ending a session. Record timestamps with a timezone. Separate implemented from verified and discussed from decided.

## Decisions and authority

For a user blocker, state the exact decision or action needed, the recommended answer if supported, what it blocks, and what can continue.

Work within the user's authorized scope. Existing authorization persists. Ask only when a material choice or action lacks authorization; do useful independent work while waiting.

A ready plan is not blanket permission for publishing, deploying, merging, contacting people, or launching sessions. Respect the current request and runner permissions.

## Completion and learning

Check the plan's completion criteria against evidence. An agent stopping, a PR opening, or a PR merging does not by itself prove the whole outcome.

Experiments need a hypothesis, stopping condition, and findings. Negative results can satisfy an experiment plan.

Retrospectives propose specific, evidence-backed changes. Do not silently rewrite working preferences based on one incident.

## Coordination and publication

Follow coordinators/updates.md for workspace grouping, handoffs, notifications and optional fallback; follow coordinators/sync.md for durable publication and ownership transfer. Configure the scope publication route from user authorization once. Machine-local runtime hints never replace synced evidence. No watcher is installed by these files.
