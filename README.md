# PowerOpenAPIModels.jl

Auto-generated Julia types from Sienna-Platform power system OpenAPI schemas.

**Documentation: <https://sienna-platform.github.io/PowerOpenAPIModels/>** — the API, and a
type reference for all seven packages. Each package also carries its own README in its
subdirectory.

> [!WARNING]
> **Pre-release.** Every version below `1.0` is a pre-release. These packages can change
> incompatibly in any release, and no API stability is promised until `1.0`. Julia's
> convention already treats a bump in `x` of `0.x.y` as breaking, so a `[compat]` entry of
> `"0.1"` resolves within `0.1.*` — pin accordingly.

## Monorepo Structure

This repository contains seven Julia packages, each registered separately so an
application loads only what it needs.

| Package                                    | Role                                              | Depends on          |
| ------------------------------------------ | -------------------------------------------------- | ------------------- |
| `InfrastructureCoreOpenAPIModels.jl`        | Domain-neutral types: units, function data, shapes | —                   |
| `InfrastructureTimeSeriesOpenAPIModels.jl`  | The six time series association types              | InfrastructureCore  |
| `PowerCoreOpenAPIModels.jl`                 | Power shared types: enums, curves, costs, document | InfrastructureCore  |
| `PowerOperationsOpenAPIModels.jl`           | Topology, branches, injections, services, market   | PowerCore           |
| `PowerInvestmentsOpenAPIModels.jl`          | Technologies, financials, requirements, regions    | PowerCore           |
| `PowerDynamicsOpenAPIModels.jl`             | Dynamic generator and inverter components          | PowerCore           |
| `PowerOpenAPIModels.jl`                     | Umbrella re-exporting all six                      | all                 |

## Installation

```julia
using Pkg

# Load only operations
Pkg.add("PowerOperationsOpenAPIModels")
using PowerOperationsOpenAPIModels

# Load everything
Pkg.add("PowerOpenAPIModels")
using PowerOpenAPIModels
```

## Regenerating Stubs

Models are auto-generated from OpenAPI schemas in [SiennaSchemas](https://github.com/Sienna-Platform/SiennaSchemas), via OpenAPI.jl 1.0's native pure-Julia generator (`OpenAPI.client`) -- no Java, no Docker required for a local run. There are two ways to regenerate:

### Locally

```bash
# Uses ../SiennaSchemas by default
make generate SCHEMA_DIR=/path/to/SiennaSchemas
```

### Via Docker build

```bash
make generate-docker
```

### Manual Docker commands

```bash
# Build the codegen image
docker build -t power-codegen .

# Run generation (mount schemas and repo root)
make generate-docker CODEGEN_IMAGE=power-codegen
```

## Testing

Every package owns its own suite under `<Package>.jl/test/runtests.jl`, so
`Pkg.test("<Package>")` works for anyone who installed it from the registry:

```julia
using Pkg
Pkg.test("PowerOperationsOpenAPIModels")
```

From the repository, one command runs all seven in dependency order:

```bash
make test          # or: make validate -- the same target
make precompile    # each package precompiles on its own
```

`make test` runs `test/validate.jl`, which devs the seven by path into the committed `test`
environment and calls `Pkg.test` on each. Two environment variables matter:

- `SCHEMA_DIR` points the umbrella's schema-drift checks at a SiennaSchemas checkout,
  defaulting to the sibling `../SiennaSchemas`. Without one those checks warn and skip.
- `COVERAGE=1` collects line coverage into `<Package>.jl/src/**.jl.cov`; CI sets it and
  uploads the result to Codecov.

Cross-package invariants — no type defined twice, no unresolved inline schema copy, no unit
method emitted by a package that does not own the type, no `Power*` dependency in the two
`Infrastructure*` packages — live in the umbrella `PowerOpenAPIModels` suite, the only one
that sees all seven at once.

## Documentation

```bash
make docs          # builds the site into docs/build
```

The site covers all seven packages: [the API](https://sienna-platform.github.io/PowerOpenAPIModels/dev/api/)
describes the type shape, `encode`/`decode`, enums and discriminated unions, the model-type
registry, the unit annotations, and the document containers; a per-package page documents
every generated type. CI builds it on every pull request and deploys `main` to GitHub Pages.

## Releasing

Seven packages, registered separately, in four dependency waves — see [RELEASING.md](RELEASING.md).

## Loading all models for testing

Dev and instantiate all models

```bash
julia --project=PowerOpenAPIModels.jl -e 'using Pkg
  Pkg.develop([
    PackageSpec(path="InfrastructureCoreOpenAPIModels.jl"),
    PackageSpec(path="InfrastructureTimeSeriesOpenAPIModels.jl"),
    PackageSpec(path="PowerCoreOpenAPIModels.jl"),
    PackageSpec(path="PowerOperationsOpenAPIModels.jl"),
    PackageSpec(path="PowerInvestmentsOpenAPIModels.jl"),
    PackageSpec(path="PowerDynamicsOpenAPIModels.jl"),
  ])
  Pkg.instantiate()'
```
