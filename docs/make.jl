#!/usr/bin/env julia
# Build the documentation for all seven packages as one site.
#
# Run: julia --project=docs docs/make.jl
#
# Seven packages share this repository, so the tags TagBot creates are prefixed with the
# package they belong to. `tag_prefix` below tells Documenter which of the seven versions
# this site follows: the umbrella, which moves with the other six.

using Documenter

using InfrastructureCoreOpenAPIModels
using InfrastructureTimeSeriesOpenAPIModels
using PowerCoreOpenAPIModels
using PowerOperationsOpenAPIModels
using PowerInvestmentsOpenAPIModels
using PowerDynamicsOpenAPIModels
using PowerOpenAPIModels

const MODULES = [
    InfrastructureCoreOpenAPIModels,
    InfrastructureTimeSeriesOpenAPIModels,
    PowerCoreOpenAPIModels,
    PowerOperationsOpenAPIModels,
    PowerInvestmentsOpenAPIModels,
    PowerDynamicsOpenAPIModels,
    PowerOpenAPIModels,
]

makedocs(;
    modules=MODULES,
    sitename="PowerOpenAPIModels.jl",
    authors="Sienna-Platform contributors",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        edit_link="main",
        canonical="https://sienna-platform.github.io/PowerOpenAPIModels",
        # A domain page documents every type in its package -- a hundred of them for
        # operations -- which is past the default page-size limit by design.
        size_threshold=nothing,
        size_threshold_warn=nothing,
        # The repository root holds no Project.toml (seven packages, seven of them), so the
        # inventory version has to be named rather than discovered.
        inventory_version=string(pkgversion(PowerOpenAPIModels)),
    ),
    pages=[
        "Home" => "index.md",
        "The API" => "api.md",
        "Type reference" => [
            "InfrastructureCoreOpenAPIModels" => "packages/infrastructure_core.md",
            "InfrastructureTimeSeriesOpenAPIModels" => "packages/infrastructure_timeseries.md",
            "PowerCoreOpenAPIModels" => "packages/power_core.md",
            "PowerOperationsOpenAPIModels" => "packages/power_operations.md",
            "PowerInvestmentsOpenAPIModels" => "packages/power_investments.md",
            "PowerDynamicsOpenAPIModels" => "packages/power_dynamics.md",
            "PowerOpenAPIModels" => "packages/umbrella.md",
        ],
    ],
)

deploydocs(;
    repo="github.com/Sienna-Platform/PowerOpenAPIModels.git",
    target="build",
    branch="gh-pages",
    devbranch="main",
    devurl="dev",
    push_preview=true,
    tag_prefix="PowerOpenAPIModels.jl-",
)
