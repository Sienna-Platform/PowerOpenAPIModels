# PowerOpenAPIModels — generated transport types

Seven Julia packages (`InfrastructureCoreOpenAPIModels.jl`, `InfrastructureTimeSeriesOpenAPIModels.jl`,
`PowerCoreOpenAPIModels.jl`, `PowerOperationsOpenAPIModels.jl`, `PowerDynamicsOpenAPIModels.jl`,
`PowerInvestmentsOpenAPIModels.jl`, and the `PowerOpenAPIModels.jl` umbrella) **generated from
SiennaSchemas by OpenAPI.jl 1.0's native pure-Julia generator** (`OpenAPI.client`, via
`scripts/generate_native.jl` — no Java/Docker toolchain required for a local run; see
`PATCHES.md` for the superseded openapi-generator-based pipeline). They have zero PSY/IS
dependencies by design — keep it that way.

The two `Infrastructure*` packages must never gain a `Power*` dependency; `test/validate.jl`
enforces it.

**Never hand-edit the generated sources.** Fixes belong in one of two upstream places:

1. the schemas in `SiennaSchemas/` (source of truth for fields, types, and `x-unit` annotations), or
2. the generator config / post-processing in `scripts/` and the `Makefile`.

An edit made here disappears the next time anyone regenerates, and the schema↔generated drift check
will not catch it as intentional.

**This package IS already consumed by the rest of the stack.** InfrastructureSystems.jl,
PowerSystems.jl, PowerNetworkMatrices.jl, PowerFlows.jl, PowerOperationsModels.jl,
PowerSystemsInvestmentsPortfolios.jl, InfrastructureOptimizationModels.jl,
PowerTableDataParser.jl, PowerFlowFileParser.jl, and PowerSystemsUpdater.jl all depend on these
packages (git-pinned to this repo's `main`) and carry hand-written `System ⇄ OpenAPI ⇄ GridDB`
converter code (each repo's own `src/openapi*` files). A breaking change to a generated type's
shape ripples into all of them — check before assuming a change here is contained.
