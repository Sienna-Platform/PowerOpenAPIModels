# Releasing

Seven packages live in this repository and each is registered in the General registry on its
own, from its own subdirectory. That shapes everything below: the order they go out in, and
why the tags are not just `v0.1.0`.

## Before you start

- `main` is green: the **Test** workflow runs `test/validate.jl` on the `[compat]` floor and
  the current Julia release, and `test/precompile.jl` on every package.
- `.schema-version` names a SiennaSchemas **release tag**, not a commit. The generated code
  has to be reproducible from a released schema version, or a consumer cannot regenerate it.
  Confirm with a regeneration that changes nothing:

  ```bash
  make generate SCHEMA_DIR=../SiennaSchemas   # against a checkout at that tag
  git status --short                          # expect no output
  ```

- Every `version` in the seven `Project.toml` files is the version you intend to publish.
  They move together: a consumer that mixes versions across these packages gets types from
  one generation run and methods from another.

## Registration order

A package can only be registered once everything it depends on is already in the registry,
so the seven go out in four waves. Within a wave they are independent and can be registered
together.

| Wave | Packages | Waiting on |
| --- | --- | --- |
| 1 | `InfrastructureCoreOpenAPIModels` | nothing |
| 2 | `InfrastructureTimeSeriesOpenAPIModels`, `PowerCoreOpenAPIModels` | wave 1 |
| 3 | `PowerOperationsOpenAPIModels`, `PowerInvestmentsOpenAPIModels`, `PowerDynamicsOpenAPIModels` | wave 2 |
| 4 | `PowerOpenAPIModels` | wave 3 |

Wave *n* starts only after wave *n−1*'s registry pull requests have **merged**, not just
opened. Registering out of order does not corrupt anything — the registry rejects it,
because the dependency it names does not exist yet — but it costs a round trip.

The waves are derived from the `[deps]` of each `Project.toml`, so recompute them rather
than trusting this table if the dependency graph changes:

```bash
python3 - <<'EOF'
import re, pathlib
ours, deps = {}, {}
for f in sorted(pathlib.Path('.').glob('*OpenAPIModels.jl/Project.toml')):
    ours[re.search(r'^name = "(.+)"', f.read_text(), re.M).group(1)] = f
for name, f in ours.items():
    block = re.search(r'\[deps\](.*?)(\n\[|\Z)', f.read_text(), re.S).group(1)
    deps[name] = {d for d in re.findall(r'^(\w+) =', block, re.M) if d in ours}
done, wave = set(), 1
while len(done) < len(deps):
    ready = sorted(n for n, d in deps.items() if n not in done and d <= done)
    print(f"wave {wave}: {', '.join(ready)}")
    done |= set(ready); wave += 1
EOF
```

## Registering a wave

Registration is triggered by commenting on the commit you want released, once per package:

```
@JuliaRegistrator register subdir=InfrastructureCoreOpenAPIModels.jl
```

Every package in a wave gets its own comment on the same commit. The comment must be on a
commit on `main`.

Two things to know about a **first** registration:

- The General registry holds new packages for a three-day waiting period before AutoMerge
  will merge them. Wave 1 therefore gates the other three waves by roughly that long, and
  the whole sequence is a multi-day process rather than an afternoon.
- AutoMerge checks the things this repository already satisfies — a `[compat]` entry for
  every dependency including the standard library and `julia`, a UUID, a version, a license,
  and that the package loads. It does not run the test suite, which is why the Test workflow
  above is the gate that matters.

## Tags

TagBot creates the tags, one per package, from the merged registry pull request — do not tag
by hand. `.github/workflows/TagBot.yml` runs one job per subdirectory so each package's tag
names the package it belongs to; seven packages sharing one repository cannot all be
`v0.1.0`.

TagBot runs on its trigger comment, and can be run manually from the Actions tab
(**Run workflow**) with a `lookback` in days if a registry pull request merged while it was
failing.

## Afterwards

Downstream repositories pin these packages with `[sources]` entries pointing at a branch of
this repository. Once a version is registered, those entries come out and a plain `[compat]`
bound takes over — see the comment on the `[sources]` block in `PowerSystems.jl/Project.toml`,
which names this as the condition for removing them.
