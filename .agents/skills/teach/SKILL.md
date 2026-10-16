---
name: teach
description: Teach how a code change, PR, design or agent decision works, including before-and-after behavior, relevant concepts, alternatives and tradeoffs.
---

# Teach

Read [the shared authoring philosophy](../authoring-philosophy/SKILL.md) unless already loaded. Use this with a worker for implementation understanding or a coordinator for the wider design and reviewed work.

Resolve the subject and infer the useful level of detail from the user's question and demonstrated knowledge. Inspect the actual change and relevant evidence before teaching it. Do not substitute a generic tutorial for an explanation of this code. Ask about background only when needed to make the explanation useful.

Start with what changes and why it matters. Build the explanation around a concrete example and the concepts needed to understand it. Explain before/after behavior for a PR; for a design choice, compare the chosen mechanism with material alternatives and explain the tradeoffs under the real constraints. For example, explain what a queue would add, its costs and when it would become worthwhile, rather than treating it as inherently better or worse.

Make domain variants, errors and responsibility boundaries visible where relevant. Separate observed behavior, documented intent, inference and uncertainty. Cite useful code or PR locations without narrating every changed line. A coordinator must not attribute an undocumented rationale to a worker.

Use plain language, define unfamiliar terms as needed, and let the explanation build progressively. Adapt to follow-up questions; do not impose a quiz or a fixed lesson format. Include why and how naturally without requiring separate commands. Recommend improvements if discovered, but do not edit code solely in response to a teaching request.
