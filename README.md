# PowerOpenAPIModels.jl

Auto-generated Julia types from NREL-Sienna power system OpenAPI schemas.

## Monorepo Structure

This repository contains five Julia packages:

| Package | Role |
|---------|------|
| `PowerCoreOpenAPIModels.jl` | Shared types, enums, base models |
| `PowerOperationsOpenAPIModels.jl` | Operations API stubs |
| `PowerInvestmentsOpenAPIModels.jl` | Investments API stubs |
| `PowerDynamicsOpenAPIModels.jl` | Dynamics API stubs |
| `PowerOpenAPIModels.jl` | Umbrella package (weak dependencies) |

## Installation

```julia
using Pkg

# Load only operations (core is always included)
Pkg.add(["PowerOpenAPIModels", "PowerOperationsOpenAPIModels"])
using PowerOpenAPIModels  # loads core + operations extension

# Load everything
Pkg.add([
  "PowerOpenAPIModels",
  "PowerOperationsOpenAPIModels",
  "PowerInvestmentsOpenAPIModels",
  "PowerDynamicsOpenAPIModels",
])
using PowerOpenAPIModels
```

## Regenerating Stubs

Models are auto-generated from OpenAPI schemas in [SiennaSchemas](https://github.com/NREL-Sienna/SiennaSchemas). There are two ways to regenerate locally:

### Via pre-built image (pulls from GHCR)

```bash
make generate
```

### Via local Docker build

```bash
make generate-local
```

### Manual Docker commands

```bash
# Build the codegen image
docker build -t poweropenapi-models-codegen .

# Run generation (mount schemas and repo root)
docker run --rm \
  -v $(pwd)/openapi:/schemas:ro \
  -v $(pwd):/output \
  poweropenapi-models-codegen \
  /schemas /output
```

## Development

```bash
julia -e '
  using Pkg
  Pkg.develop([
    PackageSpec(path="PowerCoreOpenAPIModels.jl"),
    PackageSpec(path="PowerOperationsOpenAPIModels.jl"),
    PackageSpec(path="PowerInvestmentsOpenAPIModels.jl"),
    PackageSpec(path="PowerDynamicsOpenAPIModels.jl"),
    PackageSpec(path="PowerOpenAPIModels.jl"),
  ])
  Pkg.test("PowerOpenAPIModels")
'
```
