# Plans

Shared plans and agent coordination for mdaops, including work in Oxlev.

This repository holds durable context and progress across related repositories. Herdr remains useful for finding sessions; this repository records what those sessions have established.

## Start here

1. Read [the working agreement](working-agreement.md).
2. Read [the plan specification](plan-spec.md).
3. Read only the context linked from your plan.
4. Use the skills maintained in mdaops/dotfiles under .agents/skills/ to capture, refine, dispatch, and reconcile work.

The repository is already initialized. Start with plan-add for a real task.

## Layout

- context/: reusable project, system, and repository knowledge.
- initiatives/: optional grouping for outcomes spanning several plans.
- plans/drafts/: captured ideas and unresolved investigations.
- plans/next/: actionable plans ready for assignment.
- plans/open/: assigned work, including blocked and awaiting review.
- plans/done/: work with completion evidence.
- plans/discarded/: abandoned work with a reason.
- handoffs/: worker checkpoints named by plan ID and assignment ID.
- templates/: plan, initiative, and handoff starting points.
- local/: ignored machine paths and tool availability.

Product grouping is optional. One coordinator can manage multiple initiatives and workers within a related scope. A plan may stand alone.

## Commands

| Skill | Purpose |
| --- | --- |
| plan-init | Initialize missing structure without overwriting existing work |
| plan-add | Capture a draft with relevant context |
| plan-write | Refine a draft into an executable plan |
| plan-dispatch | Record ownership and hand work to an agent |
| plan-status | Report progress, blockers, and decisions waiting on you |
| plan-sync | Reconcile evidence and update lifecycle state |
| plan-retro | Propose improvements based on repeated friction |

Read [plan-spec.md](plan-spec.md) for the shared contract.

Skills are installed from mdaops/dotfiles; see its agents/README.md for Pi and Claude Code setup. Set PLANS_DIR to this checkout. The skills provide workflow instructions; worker launch and monitoring depend on available runner capabilities and are not installed by this repository.

## Portability

Keep repository identifiers and relative links in committed files. Put actual checkout paths and available tools in local/machine.md using [the machine template](templates/machine.md). Do not commit credentials or private session transcripts.

For use from another repository, give the agent the absolute path to this checkout and the plan ID. This avoids assuming the current working directory is the plans repository.

## First trial

Capture one real task, refine it, and assign one worker. Have the worker write a checkpoint. Start a fresh session using only the linked context and checkpoint, then ask plan-status what is waiting on you. Adjust the workflow based on what was missing.

Inspired by [Fatih Arslan's agent workflow](https://arslan.io/2026/09/11/how-i-manage-my-agents/), adapted for related repositories, experiments, Pi, Claude Code, and Windows/Linux environments.
