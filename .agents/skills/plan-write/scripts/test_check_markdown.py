import contextlib
import io
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from check_markdown import check, main


class MarkdownChecks(unittest.TestCase):
    def test_readable_markdown(self):
        self.assertEqual(check("# Plan\n\nA short paragraph.\n\n- Item\n  continuation.\n"), [])

    def test_prose_boundary(self):
        self.assertEqual(check("a " + "b" * 98 + "\n"), [])
        self.assertIn("limit is 100", check("a " + "b" * 99 + "\n")[0][1])

    def test_long_references_urls_and_tokens(self):
        url = "https://example.com/" + "x" * 200
        self.assertEqual(check(f"{url}\n\n[ref]: {url}\n\n{'x' * 200}\n"), [])
        self.assertTrue(check("This is a long inline link " + url + "\n"))

    def test_tables_have_a_bound(self):
        self.assertEqual(check("| " + "x" * 150 + " |\n"), [])
        self.assertIn("limit is 160", check("| " + "x" * 160 + " |\n")[0][1])

    def test_fences_preserve_code_and_match_delimiters(self):
        text = "````sh\n" + "long " * 100 + "\t  \n```\n~~~~\n````\n"
        self.assertEqual(check(text), [])
        self.assertTrue(check("~~~\ntext\n```\n"))
        self.assertTrue(check("```\ntext\n``` not a closing fence\n"))

    def test_whitespace_headings_and_final_newline(self):
        messages = [message for _, message in check("text  \n# Title\n\ttext\n\n\nend")]
        for expected in ["trailing whitespace", "tab outside fenced code",
                         "blank line required before heading", "blank line required after heading",
                         "consecutive blank lines", "missing final newline"]:
            self.assertIn(expected, messages)

    def test_crlf_and_empty(self):
        self.assertIn("use LF line endings", check("text\r\n")[0][1])
        self.assertTrue(check(""))

    def test_cli_checks_multiple_files_without_writing(self):
        with tempfile.TemporaryDirectory() as directory:
            good = Path(directory) / "good.md"
            bad = Path(directory) / "bad.md"
            good.write_text("# Good\n\nReadable.\n")
            bad.write_text("long " * 30 + "\n")
            before = bad.read_bytes()
            with patch("sys.argv", ["check", str(good), str(bad)]):
                with contextlib.redirect_stderr(io.StringIO()):
                    self.assertEqual(main(), 1)
            self.assertEqual(before, bad.read_bytes())
            with patch("sys.argv", ["check", str(good)]):
                with contextlib.redirect_stdout(io.StringIO()):
                    self.assertEqual(main(), 0)
            with patch("sys.argv", ["check", str(good.with_name("missing.md"))]):
                with contextlib.redirect_stderr(io.StringIO()):
                    self.assertEqual(main(), 1)


if __name__ == "__main__":
    unittest.main()
