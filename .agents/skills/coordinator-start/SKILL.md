---
name: coordinator-start
description: Start or resume a coordinator from synced plans and handoffs, and group its workers in a Herdr workspace.
---

# Coordinator startup

Locate PLANS_DIR or the explicit plans checkout and determine scope. Read working-agreement.md, plan-spec.md, coordinators/README.md, coordinators/updates.md, coordinators/sync.md and the scope profile. Use plan-sync to fetch durable context and current PR evidence before claiming ownership or dispatching. Preserve local edits; report unavailable remotes as stale. Do not require old conversation history.

Recover assignments, reviewed handoff revisions, user decisions, blockers and dependencies. Check the synced owner/transfer record and live local identities. Absence on this machine does not prove another machine's coordinator stopped. Use the transfer rules in coordinators/sync.md; record authorized ownership changes before dispatch.

When runtime setup is authorized, read the herdr skill and apply the scope workspace procedure in coordinators/updates.md: inspect/reuse or create one named workspace, place the coordinator there, and keep its workers in that workspace. Discover actual CLI syntax and record returned session/workspace/pane identities in local configuration. Preserve user focus. External control requires explicit user authorization for the named session; do not fake HERDR_ENV. If unavailable, report grouping pending.

Summarize recovered progress, required user decisions and next action. Starting a coordinator does not itself dispatch workers. Optional fallback follows coordinators/updates.md: one owner, five-minute default, explicit scheduler availability/authority and cancellation when inactive or transferred. Never claim an idle session checks files by itself.
