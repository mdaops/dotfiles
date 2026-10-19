#!/usr/bin/env python3
"""Read-only, dependency-free readability checks for explicitly named Markdown files."""

import argparse
from pathlib import Path
import re
import sys


FENCE = re.compile(r"^ {0,3}(`{3,}|~{3,})(.*)$")
HEADING = re.compile(r"^ {0,3}#{1,6}\s+\S")
REFERENCE = re.compile(r"^ {0,3}\[[^]]+\]:\s*<?\S+>?(?:\s+[\"'(].*)?$")
URL = re.compile(r"^<?https?://\S+>?$")


def check(text):
    """Return (one-based line, diagnostic) pairs; never change the input."""
    issues = []
    raw_lines = text.split("\n")
    lines = [line.removesuffix("\r") for line in raw_lines]
    if text.endswith("\n"):
        lines.pop()
    if not text:
        return [(1, "empty Markdown file")]
    if not text.endswith("\n"):
        issues.append((len(lines), "missing final newline"))
    fence = None
    previous_blank = False
    for index, line in enumerate(lines):
        number = index + 1
        if "\r" in raw_lines[index]:
            issues.append((number, "use LF line endings"))
        match = FENCE.match(line)
        if fence:
            if match and match[1][0] == fence[0] and len(match[1]) >= len(fence):
                if not match[2].strip():
                    fence = None
            previous_blank = False
            continue
        if match:
            fence = match[1]
            previous_blank = False
            continue
        if line.rstrip() != line:
            issues.append((number, "trailing whitespace"))
        if "\t" in line:
            issues.append((number, "tab outside fenced code"))
        blank = not line.strip()
        if blank and previous_blank:
            issues.append((number, "consecutive blank lines"))
        previous_blank = blank
        if HEADING.match(line):
            if index and lines[index - 1].strip():
                issues.append((number, "blank line required before heading"))
            if index + 1 < len(lines) and lines[index + 1].strip():
                issues.append((number, "blank line required after heading"))
        stripped = line.strip()
        exempt = (
            REFERENCE.match(line)
            or URL.fullmatch(stripped)
            or (stripped and not re.search(r"\s", stripped))
        )
        limit = 160 if stripped.startswith("|") and stripped.endswith("|") else 100
        if len(line) > limit and not exempt:
            issues.append((number, f"line is {len(line)} characters; limit is {limit}"))
    if fence:
        issues.append((len(lines), "unclosed code fence"))
    return issues


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("files", nargs="+", type=Path, help="changed Markdown files")
    args = parser.parse_args()
    failed = False
    for path in args.files:
        try:
            with path.open(encoding="utf-8", newline="") as source:
                issues = check(source.read())
        except (OSError, UnicodeError) as error:
            print(f"{path}: {error}", file=sys.stderr)
            failed = True
            continue
        for line, message in issues:
            print(f"{path}:{line}: {message}", file=sys.stderr)
        failed |= bool(issues)
    if not failed:
        print(f"Markdown checks passed ({len(args.files)} files).")
    return int(failed)


if __name__ == "__main__":
    sys.exit(main())
