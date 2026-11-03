---
name: review-to-rule
description: Log code review feedback to the plans feedback ledger and turn feedback that recurs across branches into a lint rule. Use when the user's code review returns annotations on code, such as a final Plannotator review.
---

# Review to rule

Read [the shared authoring philosophy](../authoring-philosophy/SKILL.md) unless it is already loaded.

Locate the plans checkout from an explicit task path or the PLANS_DIR environment variable. If neither is available, ask for it. Ledger entries live in `feedback/` there and follow `templates/feedback.md`. Work on code in the reviewed repository's own checkout.

Input is the user's code review: each annotation tied to a file and lines. Automated review findings count only when the user keeps them as annotations. General comments are not logged. For a Herdsman coordinator-owned review, the review ID is its review directory name; a direct session has none.

## 1. Log before acting

For each code annotation, write one ledger entry before changing code:

- Fill every field of `templates/feedback.md`. Copy the feedback verbatim.
- Language is the language of the annotated code, such as `go`, `typescript` or `python`.
- Label: list existing labels with `grep -h '^Label:' feedback/*.md | sort -u`. Reuse one when it names the same pattern; otherwise add a short kebab-case label naming the pattern, not the instance.
- File name: `feedback/YYYY-MM-DD-<label>-<n>.md` with the lowest unused `n`.
- Outcome starts as `open`. Set it to `fixed` once the change addresses it.

Then act on the feedback as usual.

## 2. Repeat check

For each entry, find other entries with the same `Label` and `Language` on a different repository and branch pair.

- Any match with outcome `declined: ...`: do not ask. Set this entry's outcome to the same decline, citing the declining entry.
- Any match with outcome `rule: ...`: the rule missed this occurrence. Tell the user and name the rule; do not ask again.
- Otherwise, on a match, ask the user in the conversation: "`<label>` (`<language>`) recurred on `<branch>` and `<other branch>`. Should it be a lint rule?" Quote both feedback texts.

## 3. Answer

No: set every matching entry's outcome to `declined: <user's reason>`. Future occurrences inherit it through step 2.

Yes: write the rule in the reviewed code's repository and language, on its own branch from the default branch, under the assignment's PR authority. The user approves it through the PR.

- Fix at the highest level that works. When the repository owns the code involved, first prefer a type or API change that makes the bad code unwritable, such as a constructor-only type. Otherwise choose a rule by shape: a pattern ban (Go: `forbidigo` or `ruleguard`; TypeScript: `oxlint`; Python: `ruff`) for "do not write X"; a custom analyzer for structural rules; a review-skill check only when no deterministic rule can express it. Say why a higher level did not work.
- Extend the repository's existing lint configuration, and make sure CI runs the same lint command as local runs. If the language has no linter there, or CI does not run it, report that as a blocker instead of introducing one.
- Make the error message name the fix: the function, type or pattern to use instead.
- Build tests from both occurrences: reduce each annotated snippet to a minimal failing case, and add the corrected form as a passing case.
- Prove the rule on the real code: run it on each occurrence's reviewed revision and confirm it reports the annotated lines, then on the revision that fixed it and confirm it is clean. Record the commands and results in the PR. A rule that has not been seen to fail on a real occurrence is not done.
- Run the linter on the whole repository and fix every existing finding. The rule lands with zero findings; do not add exclusions to reach that. If the existing findings are too many to fix in one PR, ask the user before changing the approach.
- Put a comment beside the rule's config citing both ledger entries by plans path, such as `feedback/2026-11-03-functional-options-1.md`.
- Set both entries' outcome to `rule: <rule or type change>, <PR URL>`.

## Publish entries

Ledger entries are plans changes. Publish them through the scope's route in `coordinators/sync.md`. In a shared checkout, or without that authority, leave them uncommitted and list their paths in your handoff or report. This skill does not authorize a push, merge or plans publication beyond that.
