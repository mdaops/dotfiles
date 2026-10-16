# Starting a coordinator

A coordinator manages related plans and agent assignments. Its continuity comes from plans, context, and handoffs in the shared checkout.

Start with coordinator-start and a scope, or tell an agent: "Act as the Oxlev coordinator. Read coordinators/oxlev.md in PLANS_DIR, reconstruct current work, and recommend the next action."

Read AGENTS.md, working-agreement.md, plan-spec.md, the scope profile, and [the update procedure](updates.md). Inspect local changes before synchronization; distinguish local state from remotely verified state.

Read scoped active plans and latest handoffs, then ready plans and relevant drafts. Report decisions waiting on the user, blockers, evidenced progress, and next actions. Preserve one active dispatcher per scope and check overlapping assignments before launching work.

Use templates/assignment.md to supply enough context to a worker, including reporting triggers, the handoff destination, and the coordinator's actual Herdr binding. Reconcile updates on notifications and periodically during active runs. Verify evidence before closing work.

Herdr manages workers and notifications. It does not replace durable files. No background notification loop is installed by these instructions. If runtime control is unavailable, prepare assignments and report them as not launched. Explicit external named-session authorization is handled in updates.md.

Follow [sync.md](sync.md) before ownership or dispatch, and [updates.md](updates.md) for the dedicated scope workspace and optional five-minute fallback. On another machine recover from published state and rediscover local runtime bindings.
