# Working in this repository

Read working-agreement.md and plan-spec.md before changing plans or coordination state. They are the canonical workflow rules. Read only linked context needed for the current assignment.

Reusable skills are maintained in mdaops/dotfiles under .agents/skills/<name>/SKILL.md. Set PLANS_DIR to this checkout or give its absolute path in the task. Skill references to templates and state resolve within this plans repository, not the skill installation or worker code checkout.

Keep machine-specific paths in ignored local/machine.md. Record evidence and uncertainty faithfully. Do not infer permission to launch other sessions, send messages, merge, deploy, or expand a task merely from a plan's existence.
