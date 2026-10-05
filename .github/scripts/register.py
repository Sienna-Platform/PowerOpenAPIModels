#!/usr/bin/env python3
"""Register every package whose version on this commit is not yet in General.

  python3 .github/scripts/register.py            # comment, then wait out each wave
  python3 .github/scripts/register.py --dry-run  # print the waves and what is registered

Waves follow [deps] (the same derivation as RELEASING.md): a package is
registered only once every package of ours it depends on has its version in
General, because AutoMerge resolves [compat] against the registry. Packages
already registered are skipped, so re-running a failed job resumes at the first
unfinished wave.

Comments go out as github-actions[bot] (GITHUB_TOKEN): Registrator accepts that
login by name, and would reject a GitHub App's bot, which is neither a
collaborator nor an org member.
"""

import argparse
import os
import subprocess
import sys
import time
import tomllib
import urllib.error
import urllib.request
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[2]
GENERAL = "https://raw.githubusercontent.com/JuliaRegistries/General/master"
WAVE_TIMEOUT_S = 60 * 60
POLL_S = 60


def fail(message: str) -> None:
    print(f"ERROR: {message}", file=sys.stderr)
    sys.exit(1)


def packages() -> dict[str, tuple[str, str, set[str]]]:
    """name -> (subdir, version, deps on our other packages)."""
    found = {}
    for path in sorted(REPO_ROOT.glob("*OpenAPIModels.jl/Project.toml")):
        project = tomllib.loads(path.read_text())
        found[project["name"]] = (
            path.parent.name,
            project["version"],
            set(project.get("deps", {})),
        )
    return {
        name: (subdir, version, deps & found.keys())
        for name, (subdir, version, deps) in found.items()
    }


def waves(pkgs: dict[str, tuple[str, str, set[str]]]) -> list[list[str]]:
    done, out = set(), []
    while len(done) < len(pkgs):
        ready = sorted(n for n, (_, _, deps) in pkgs.items() if n not in done and deps <= done)
        if not ready:
            fail(f"dependency cycle among {sorted(set(pkgs) - done)}")
        out.append(ready)
        done |= set(ready)
    return out


def registered(name: str, version: str) -> bool:
    # raw.githubusercontent.com caches for about five minutes, well inside a poll budget.
    url = f"{GENERAL}/{name[0].upper()}/{name}/Versions.toml"
    try:
        with urllib.request.urlopen(url, timeout=30) as response:
            return version in tomllib.loads(response.read().decode())
    except urllib.error.HTTPError as err:
        if err.code == 404:
            return False
        raise


def comment(sha: str, subdir: str) -> None:
    subprocess.run(
        [
            "gh",
            "api",
            f"repos/{os.environ['GITHUB_REPOSITORY']}/commits/{sha}/comments",
            "-f",
            f"body=@JuliaRegistrator register subdir={subdir}",
        ],
        check=True,
        stdout=subprocess.DEVNULL,
    )


def registry_pr_search(name: str, version: str) -> str:
    return (
        "https://github.com/JuliaRegistries/General/pulls?q=is%3Apr+"
        f"%22New+version%3A+{name}+v{version}%22"
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--dry-run", action="store_true", help="report only; comment on nothing")
    args = parser.parse_args()

    pkgs = packages()
    versions = {version for _, version, _ in pkgs.values()}
    if len(versions) != 1:
        fail(f"the packages move together but carry {sorted(versions)}")
    sha = (
        os.environ.get("GITHUB_SHA")
        or subprocess.check_output(["git", "rev-parse", "HEAD"], text=True).strip()
    )

    for number, wave in enumerate(waves(pkgs), start=1):
        pending = [n for n in wave if not registered(n, pkgs[n][1])]
        print(
            f"wave {number}: {', '.join(wave)}; pending: {', '.join(pending) or 'none'}", flush=True
        )
        if args.dry_run or not pending:
            continue

        for name in pending:
            comment(sha, pkgs[name][0])
        deadline = time.monotonic() + WAVE_TIMEOUT_S
        while pending:
            if time.monotonic() > deadline:
                links = "\n".join(
                    f"  {n} v{pkgs[n][1]}: {registry_pr_search(n, pkgs[n][1])}" for n in pending
                )
                fail(
                    f"wave {number} not in General after {WAVE_TIMEOUT_S // 60} min. Check the "
                    f"registry PRs, fix the cause, and re-run this job:\n{links}"
                )
            time.sleep(POLL_S)
            try:
                pending = [n for n in pending if not registered(n, pkgs[n][1])]
            except urllib.error.URLError as err:
                print(f"  registry unreachable ({err}); retrying", flush=True)
                continue
            print(f"  still waiting on: {', '.join(pending) or 'none'}", flush=True)
    return 0


if __name__ == "__main__":
    sys.exit(main())
