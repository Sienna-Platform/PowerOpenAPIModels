#!/usr/bin/env julia
# Every package precompiles on its own.
#
# Registration publishes each package separately, so each has to precompile separately. The
# failure this catches is quiet: a method one package defines on a type another package owns
# makes Julia abort that package's precompilation with "Method overwriting is not permitted",
# but the package still *loads* -- uncached, slowly, printing a warning to every downstream
# user. `using` therefore succeeds, and so does `Pkg.precompile`, which reports the error
# and exits 0 either way. `Base.isprecompiled` is what actually distinguishes a cached
# package from one that failed and fell back.
#
# Run: julia test/precompile.jl   (from the repository root)

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

Pkg.activate(mktempdir())
Pkg.develop([PackageSpec(; path=joinpath(REPO, "$p.jl")) for p in PACKAGES])

# Reports failures without throwing, so the real check is `isprecompiled` below.
try
    Pkg.precompile()
catch
end

stale = String[]
for (uuid, info) in Pkg.dependencies()
    info.name in PACKAGES || continue
    if !Base.isprecompiled(Base.PkgId(uuid, info.name))
        push!(stale, info.name)
    end
end

if !isempty(stale)
    println()
    println("FAILED to precompile: ", join(sort(stale), ", "))
    println("Look above for `Method overwriting is not permitted` -- the usual cause is a")
    println("method emitted for a type a base package owns. See `owned_definitions` in")
    println("scripts/selector.jl.")
    exit(1)
end

println("all $(length(PACKAGES)) packages precompiled")
