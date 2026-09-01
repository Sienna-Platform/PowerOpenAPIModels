# PowerOpenAPIModels.jl

Auto-generated Julia types from Sienna-Platform power system OpenAPI schemas.

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

Models are auto-generated from OpenAPI schemas in [SiennaSchemas](https://github.com/Sienna-Platform/SiennaSchemas). There are two ways to regenerate locally:

### Via local openapi-generator

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

Either `make validate` or

```bash
julia test/validate.jl
```

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
