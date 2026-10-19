# Human-readable planning Markdown

Apply this to Markdown you create or change in the plans checkout: plans, context,
handoffs, coordinator profiles and shared workflow documents. Do not reformat unrelated
files or historical records as a side effect.

- Wrap prose at 100 characters, using continuation indentation for lists. Keep paragraphs
  short and use bullets for distinct findings, decisions and blockers.
- Separate headings, paragraphs, lists and code fences with blank lines. Do not compress
  words, dates or identifiers together to meet a width limit.
- Keep tables compact, at most 160 characters per source line. Move narrative evidence
  into bullets or subsections rather than long table cells.
- Preserve URLs, identifiers, inline code and commands exactly. For long links, prefer
  reference links with the destination on its own definition line. Standalone URLs,
  reference-link definitions, single unbreakable tokens and fenced code are width-exempt.
  Exemptions are not permission to put prose or whole plans inside code fences.
- No tabs or trailing whitespace outside code fences; use LF and one final newline.
  Use a blank line, not trailing spaces, for paragraph breaks. At most one consecutive
  blank line. Keep existing Markdown semantics when wrapping.

## Required check

Before reporting a plan edit complete, committing or publishing it, run the checker on
all Markdown files changed by your task, including new/untracked files. Resolve this
script relative to this formatting document's directory, not the product/plans checkout:

```sh
python3 <plan-write-skill-directory>/scripts/check_markdown.py <changed.md> [<changed.md> ...]
```

The checker is read-only and dependency-free apart from Python 3. It reports file/line
failures and exits nonzero; fix and rerun. If Python is unavailable, report the check as
blocked rather than claiming it passed. Do not install a formatter implicitly.

This is a focused readability check, not a full Markdown parser. Review the diff as well:
ensure list nesting, links, tables and fenced examples still render correctly, and that
facts, permissions, timestamps and revision identifiers did not change. Do not ignore
failures just because they predate this edit: reformat the touched file without changing
its meaning, or report an explicit blocker. Do not rewrite another worker's active
handoff concurrently; have its owner format it before publication.

When dispatching, include this document and check command in worker handoff instructions.
