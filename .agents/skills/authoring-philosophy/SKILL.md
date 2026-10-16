---
name: authoring-philosophy
description: Apply the user's language-independent coding philosophy when designing, authoring, changing or reviewing code, or explaining implementation decisions.
---

# Authoring philosophy

Aim for the simplest, smallest change that fully achieves the goal. Minimize necessary complexity, not merely changed lines. Prefer deleting obsolete code, abstractions and dependencies when that preserves the required behavior. Do not broaden a bounded change into unrelated cleanup.

Require a concrete reason for complexity. Account for domain rules, actual dependency contracts and credible operating conditions, including consequential failures. Do not invent unreachable error cases, speculative extension points or defensive machinery without explaining the condition that requires them. Uncertainty calls for investigation, not an assumption that a failure is impossible.

Model domain variants and errors explicitly using the language's idioms. Make meaningful states and failure outcomes distinguishable; avoid ambiguous sentinel values, stringly typed states and catch-all errors that erase useful meaning. This does not require a new error hierarchy for every function. Represent real failures precisely and handle them at the boundary that can make the relevant decision.

Make boundaries deliberate: inputs, trust, ownership, invariants and error translation should be clear. Validate where responsibility changes, preserve useful causes, and avoid leaking internal details through external contracts. Follow repository conventions unless they conflict with the requested outcome; explain a warranted departure.

Explain choices through the goal, constraints, mechanism, evidence and material tradeoffs. Distinguish documented intent, verified behavior and inferred rationale. Do not invent a historical reason or defend your own implementation merely because you wrote it. Reconsider or recommend removing code when its justification no longer holds.

Apply this philosophy during authoring; the why, how and teach skills are complementary ways to examine work. Their explanation requests do not independently authorize code edits. If the user also requests a change, honor that scope.

## Workers and coordinators

Use these principles in either role. Workers explain implementation from code, tests and their decisions. Coordinators explain scope, dependencies, cross-worker choices and reviewed evidence; inspect relevant artifacts before asserting implementation details. Identify missing evidence rather than pretending to know another agent's reasoning. Do not automatically launch or message another agent just to answer an explanation request.

When dispatching coding work, include this skill's location in the worker's relevant instructions if available. Workers should read it before authoring, alongside repository instructions. Do not copy its full text into every plan or handoff.
