#!/usr/bin/env python3
"""Re-stamp the vendored fixtures' `schema_version` to the one in PowerOpenAPIModels.jl/schema-version.

A reader rejects any stamp outside its compatibility line, so a schema bump that leaves the
fixtures at the old stamp breaks every test that reads them. Rewrites the stamp with a regex,
not a JSON dump, so formatting and number literals stay byte-identical.
"""

import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PKG = ROOT / "PowerOpenAPIModels.jl"
STAMP = re.compile(r'^(  "schema_version": )"[^"]*"', re.MULTILINE)


def main() -> int:
    version = (PKG / "schema-version").read_text().strip().removeprefix("v")
    for path in sorted((PKG / "test" / "fixtures").glob("case14_operations.*.json")):
        text = path.read_text()
        stamped, count = STAMP.subn(rf'\1"{version}"', text, count=1)
        if count != 1:
            print(f"{path}: no top-level schema_version to re-stamp", file=sys.stderr)
            return 1
        assert json.loads(stamped)["schema_version"] == version
        if stamped != text:
            path.write_text(stamped)
    return 0


if __name__ == "__main__":
    sys.exit(main())
