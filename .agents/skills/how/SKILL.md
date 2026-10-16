---
name: how
description: Explain and assess how an implementation or proposed change achieves an outcome, tracing concrete behavior and checking the supporting evidence.
---

# How

Read [the shared authoring philosophy](../authoring-philosophy/SKILL.md) unless already loaded. Use this as a worker or coordinator to establish whether a mechanism actually addresses the stated issue, not to advocate for an unproven solution.

Identify the intended outcome and the relevant implementation or proposal from the request. Inspect focused code, diff, tests and evidence. Trace a representative scenario from trigger through important boundaries, state changes and domain outcomes to the result. Include consequential failure or concurrency behavior when relevant to the claim, without enumerating imaginary edge cases.

Connect each important claim to evidence. Distinguish behavior inferred from code, tests actually run, test coverage merely inspected, and proposed behavior not yet implemented. Passing tests only support what they exercise. Perform proportionate checks when safe and available; explain material gaps rather than implying verification.

Assess whether the underlying issue is solved, whether entry points can bypass the mechanism, and whether a simpler implementation would achieve the same outcome where those questions matter. If the mechanism is insufficient, say so and explain the remaining gap.

Lead with the conclusion, then give the concrete trace and its verification limits. Use a small example or diagram only when it improves understanding. This is explanation and assessment, not implicit authorization to change code. Address rationale or teaching needs within the same answer when useful.
