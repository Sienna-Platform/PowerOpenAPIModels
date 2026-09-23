#!/usr/bin/env julia
# Run all seven packages' test suites from one command.
#
# Each package owns its own suite under `<Package>.jl/test/runtests.jl`, so that
# `Pkg.test("<Package>")` works for anyone who installed it from the registry. This driver
# is the repository-level entry point: it devs the seven by path into the committed `test`
# environment -- so they resolve against each other rather than against whatever versions
# the registry happens to hold -- and runs every suite in dependency order.
#
# Run: julia --project=test test/validate.jl   (from the repository root)
#
# `SCHEMA_DIR` points the umbrella's schema-drift checks at a SiennaSchemas checkout; it
# defaults to the sibling `../SiennaSchemas`, and those checks warn and skip without one.
# `COVERAGE=1` collects line coverage into `<Package>.jl/src/**.jl.cov`.

using Pkg

const PACKAGES = [
    "InfrastructureCoreOpenAPIModels",
    "InfrastructureTimeSeriesOpenAPIModels",
    "PowerCoreOpenAPIModels",
    "PowerOperationsOpenAPIModels",
    "PowerInvestmentsOpenAPIModels",
    "PowerDynamicsOpenAPIModels",
    "PowerOpenAPIModels",
]

const REPO = dirname(@__DIR__)

Pkg.activate(@__DIR__)
# The seven are already declared in test/Project.toml, so develop updates only the manifest
# and `git status` stays clean between runs.
Pkg.develop([PackageSpec(; path=joinpath(REPO, "$p.jl")) for p in PACKAGES])
Pkg.test(PACKAGES; coverage=get(ENV, "COVERAGE", "") == "1")
