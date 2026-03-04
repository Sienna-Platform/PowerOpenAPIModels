#!/usr/bin/env julia
# Move generated stubs into monorepo packages and generate module files.
# Core gets all models; domain packages skip models already in Core.

const REPO = dirname(@__DIR__)
const GENERATED = joinpath(REPO, "generated")
const CORE_MODELS = joinpath(REPO, "PowerCoreOpenAPIModels.jl", "src", "models")

const DOMAINS = [
    "core"        => "PowerCoreOpenAPIModels.jl",
    "operations"  => "PowerOperationsOpenAPIModels.jl",
    "investments" => "PowerInvestmentsOpenAPIModels.jl",
    "dynamics"    => "PowerDynamicsOpenAPIModels.jl",
]

for (domain, pkg) in DOMAINS
    gen = joinpath(GENERATED, domain)
    dest = joinpath(REPO, pkg, "src")
    isdir(gen) || continue

    # Clean and create directories
    rm(joinpath(dest, "models"), force=true, recursive=true)
    rm(joinpath(dest, "apis"), force=true, recursive=true)
    mkpath(joinpath(dest, "models"))
    mkpath(joinpath(dest, "apis"))

    # Copy models (skip Core duplicates for domain packages)
    for f in readdir(joinpath(gen, "src", "models"), join=true)
        endswith(f, ".jl") || continue
        name = basename(f)
        domain != "core" && isfile(joinpath(CORE_MODELS, name)) && continue
        cp(f, joinpath(dest, "models", name))
    end

    # Copy APIs
    apis_dir = joinpath(gen, "src", "apis")
    if isdir(apis_dir)
        for f in readdir(apis_dir, join=true)
            endswith(f, ".jl") || continue
            cp(f, joinpath(dest, "apis", basename(f)))
        end
    end

    # Generate module file
    mod = replace(pkg, ".jl" => "")
    models = sort([basename(f) for f in readdir(joinpath(dest, "models")) if endswith(f, ".jl")])
    apis = sort([basename(f) for f in readdir(joinpath(dest, "apis")) if endswith(f, ".jl")])

    # Extract exported type names from files
    exports = Set{String}()
    for dir in [joinpath(dest, "models"), joinpath(dest, "apis")]
        for f in readdir(dir, join=true)
            endswith(f, ".jl") || continue
            for line in eachline(f)
                m = match(r"^mutable struct ([A-Za-z0-9_]+)", line)
                m !== nothing && push!(exports, m.captures[1])
                m = match(r"^const ([A-Z][A-Za-z0-9_]*)", line)
                m !== nothing && !startswith(m.captures[1], "_") && push!(exports, m.captures[1])
            end
        end
    end

    open(joinpath(dest, "$mod.jl"), "w") do io
        println(io, "module $mod")
        println(io)
        println(io, "using OpenAPI, JSON3, HTTP")
        domain != "core" && println(io, "using PowerCoreOpenAPIModels")
        println(io)
        for f in models; println(io, "include(\"models/$f\")"); end
        for f in apis; println(io, "include(\"apis/$f\")"); end
        println(io)
        for name in sort(collect(exports)); println(io, "export $name"); end
        if domain != "core"
            println(io)
            println(io, "for n in names(PowerCoreOpenAPIModels); n === :PowerCoreOpenAPIModels && continue; @eval export \$n; end")
        end
        println(io)
        println(io, "end")
    end
end

rm(GENERATED, force=true, recursive=true)
