# PowerOpenAPIModels.jl

Auto-generated Julia types from Sienna-Platform power system OpenAPI schemas.

## Monorepo Structure

This repository contains five Julia packages:

| Package                            | Role                             |
| ---------------------------------- | -------------------------------- |
| `PowerCoreOpenAPIModels.jl`        | Shared types, enums, base models |
| `PowerOperationsOpenAPIModels.jl`  | Operations API stubs             |
| `PowerInvestmentsOpenAPIModels.jl` | Investments API stubs            |
| `PowerDynamicsOpenAPIModels.jl`    | Dynamics API stubs               |
| `PowerOpenAPIModels.jl`            | Umbrella package                 |

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
    PackageSpec(path="PowerCoreOpenAPIModels.jl"),
    PackageSpec(path="PowerOperationsOpenAPIModels.jl"),
    PackageSpec(path="PowerInvestmentsOpenAPIModels.jl"),
    PackageSpec(path="PowerDynamicsOpenAPIModels.jl"),
  ])
  Pkg.instantiate()'
```
