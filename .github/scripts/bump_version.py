#!/usr/bin/env python3
"""Bump all seven packages by the same level as a SiennaSchemas release.

  python3 .github/scripts/bump_version.py v0.1.0 v0.2.0

Prints the new version. The SDK mirrors the schema's bump LEVEL, not its number:
a schema minor bump is an SDK minor bump, a schema patch an SDK patch. The two
numbers drift apart once a generator-only fix ships as a hand-bumped SDK patch;
.schema-version records which schema each SDK version came from.

Every intra-package [compat] entry is raised to the new version as well, patch
bumps included. The seven come from one generation run, and a consumer that
mixes versions gets types from one run and methods from another (RELEASING.md).
"""

import re
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[2]
PROJECTS = sorted(REPO_ROOT.glob("*OpenAPIModels.jl/Project.toml"))

TAG = re.compile(r"^v(\d+)\.(\d+)\.(\d+)")


def fail(message: str) -> None:
    print(f"ERROR: {message}", file=sys.stderr)
    sys.exit(1)


def parse_tag(tag: str) -> tuple[int, int, int]:
    match = TAG.match(tag)
    if match is None:
        fail(f"{tag!r} is not a vMAJOR.MINOR.PATCH release tag")
    return tuple(int(part) for part in match.groups())


def bumped(version: str, old_tag: str, new_tag: str) -> str:
    old, new = parse_tag(old_tag), parse_tag(new_tag)
    if new <= old:
        fail(f"schema {new_tag} is not newer than {old_tag}")
    major, minor, patch = (int(part) for part in version.split("."))
    if new[0] > old[0]:
        return f"{major + 1}.0.0"
    if new[1] > old[1]:
        return f"{major}.{minor + 1}.0"
    return f"{major}.{minor}.{patch + 1}"


def field(text: str, key: str, path: Path) -> str:
    match = re.search(rf'^{key} = "([^"]+)"$', text, re.MULTILINE)
    if match is None:
        fail(f"{path.relative_to(REPO_ROOT)}: no top-level {key}")
    return match.group(1)


def main() -> int:
    if len(sys.argv) != 3:
        fail("usage: bump_version.py <old schema tag> <new schema tag>")
    old_tag, new_tag = sys.argv[1:]

    texts = {path: path.read_text() for path in PROJECTS}
    ours = {field(text, "name", path) for path, text in texts.items()}
    versions = {field(text, "version", path) for path, text in texts.items()}
    if len(PROJECTS) != 7 or len(versions) != 1:
        fail(f"expected 7 packages at one version, found {len(PROJECTS)} at {sorted(versions)}")
    new = bumped(versions.pop(), old_tag, new_tag)

    for path, text in texts.items():
        text = re.sub(
            r'^version = "[^"]+"$', f'version = "{new}"', text, count=1, flags=re.MULTILINE
        )
        compat = re.search(r"^\[compat\]\n(.*?)(?=^\[|\Z)", text, re.MULTILINE | re.DOTALL)
        if compat is None:
            fail(f"{path.relative_to(REPO_ROOT)}: no [compat] section")
        block = re.sub(
            rf'^({"|".join(sorted(ours))}) = "[^"]+"$',
            lambda m: f'{m.group(1)} = "{new}"',
            compat.group(1),
            flags=re.MULTILINE,
        )
        path.write_text(text[: compat.start(1)] + block + text[compat.end(1) :])

    print(new)
    return 0


if __name__ == "__main__":
    sys.exit(main())
