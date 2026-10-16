---
name: why
description: Examine why code, a design or an agent decision exists, what justified it, and whether that justification still holds.
---

# Why

Read [the shared authoring philosophy](../authoring-philosophy/SKILL.md) unless already loaded. Apply this to existing code, proposed designs, PRs or your own decisions, as either worker or coordinator.

Resolve the target from the request and conversation. Inspect the relevant implementation and, when historical intent matters, available PR discussion, commits, design records or handoffs. Ask for the target only when ambiguity would materially change the answer. Use focused evidence, not a whole-repository survey.

Explain the problem or constraint behind the choice, what supports that explanation, and whether the constraint still applies. Separate original documented intent from your present-day assessment and inferred rationale. State when the original reason is unknown.

Compare material alternatives when they illuminate the decision, including deletion or a simpler approach. Explain what each gains and costs under the actual constraints; do not fabricate rejected alternatives or claim they were considered historically. A queue, abstraction or retry requires a concrete benefit that justifies its complexity.

Lead with the answer and support it with precise references where available. Conclude with whether the choice remains justified, should be reconsidered, or needs specific evidence. Recommend changes when warranted; do not edit code solely because the user asked why. Answer overlapping how/teach questions naturally without requiring another invocation.
