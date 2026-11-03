---
name: review-gate
description: Run the pre-push review gate, log kept review feedback to the plans feedback ledger, and turn repeated feedback into a lint rule. Use before pushing a branch or opening a PR, or when the user asks for the final review.
---

# Review gate

Read [the shared authoring philosophy](../authoring-philosophy/SKILL.md) unless it is already loaded.

Locate the plans checkout from an explicit task path or the PLANS_DIR environment variable. If neither is available, ask for it. Ledger entries live in `feedback/` there and follow `templates/feedback.md`. Work on code in the reviewed repository's own checkout.

This gate precedes a push; it does not authorize the push, a PR, a merge or plans publication.

## 1. Automated review

Fetch, then review the branch diff against `origin/<default branch>`. Use whichever runs here:

- Claude Code: the `code-review` skill on the branch.
- Codex: `codex review --base origin/<default branch>`.

One must run. If neither is available, stop and report the gate as blocked. Check each finding against the code before acting on it, and tell the user what you fixed or dismissed. Automated findings are not logged unless the user keeps them in step 2.

## 2. Final Plannotator review

Open the user's review: `plannotator review --base origin/<default branch>`, or the Herdsman coordinator-owned review when the assignment uses one. The review ID is the Herdsman review directory name; a direct session has none.

Treat every annotation tied to a file and lines as kept feedback. General comments are not logged.

## 3. Log before acting

For each kept code annotation, write one ledger entry before changing code:

- Fill every field of `templates/feedback.md`. Copy the feedback verbatim.
- Language is the language of the annotated code, such as `go`, `typescript` or `python`.
- Label: list existing labels with `grep -h '^Label:' feedback/*.md | sort -u`. Reuse one when it names the same pattern; otherwise add a short kebab-case label naming the pattern, not the instance.
- File name: `feedback/YYYY-MM-DD-<label>-<n>.md` with the lowest unused `n`.
- Outcome starts as `open`. Set it to `fixed` once the change addresses it.

Then act on the feedback as usual.

## 4. Repeat check

For each entry, find other entries with the same `Label` and `Language` on a different repository and branch pair.

- Any match with outcome `declined: ...`: do not ask. Set this entry's outcome to the same decline, citing the declining entry.
- Any match with outcome `rule: ...`: the rule missed this occurrence. Tell the user and name the rule; do not ask again.
- Otherwise, on a match, ask the user in the conversation: "`<label>` (`<language>`) recurred on `<branch>` and `<other branch>`. Should it be a lint rule?" Quote both feedback texts.

## 5. Answer

No: set every matching entry's outcome to `declined: <user's reason>`. Future occurrences inherit it through step 4.

Yes: write the rule in the reviewed code's repository and language, on its own branch from the default branch, under the assignment's PR authority. The user approves it through the PR.

- Choose by shape: a pattern ban (Go: `forbidigo` or `ruleguard`; TypeScript: `oxlint`; Python: `ruff`) for "do not write X"; a custom analyzer for structural rules; a review-skill check only when no deterministic rule can express it.
- Extend the repository's existing lint configuration. If the language has no linter there, report that as a blocker instead of introducing one.
- Build tests from both occurrences: reduce each annotated snippet to a minimal failing case, and add the corrected form as a passing case.
- Run the linter on the whole repository and fix every existing finding. The rule lands with zero findings; do not add exclusions to reach that.
- Put a comment beside the rule's config citing both ledger entries by plans path, such as `feedback/2026-11-03-functional-options-1.md`.
- Set both entries' outcome to `rule: <rule name>, <PR URL>`.

## Publish entries

Ledger entries are plans changes. Publish them through the scope's route in `coordinators/sync.md`. In a shared checkout, or without that authority, leave them uncommitted and list their paths in your handoff or report.
