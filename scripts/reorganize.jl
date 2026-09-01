#!/usr/bin/env julia
# Move generated stubs into monorepo packages and generate module files.
# Core gets all models; domain packages skip models already in Core, and any type shared
# across 2+ domains is promoted into Core even when Core's own generator run skipped it.

const REPO = dirname(@__DIR__)
const GENERATED = joinpath(REPO, "generated")
const CORE_MODELS = joinpath(REPO, "PowerCoreOpenAPIModels.jl", "src", "models")
const CORE_DOCS = joinpath(REPO, "PowerCoreOpenAPIModels.jl", "docs")
const SCHEMA_DIR = get(ENV, "SCHEMA_DIR", joinpath(dirname(REPO), "SiennaSchemas"))

include(joinpath(@__DIR__, "emit_units.jl"))
include(joinpath(@__DIR__, "emit_registry.jl"))
const UNIT_VOCAB = load_unit_vocabulary(joinpath(SCHEMA_DIR, "Core", "units.json"))
const UNIT_FACTORS = UNIT_VOCAB[1]
const UNIT_BY_UNIT = UNIT_VOCAB[2]

const DOMAINS = [
    "core" => "PowerCoreOpenAPIModels.jl",
    "operations" => "PowerOperationsOpenAPIModels.jl",
    "investments" => "PowerInvestmentsOpenAPIModels.jl",
    "dynamics" => "PowerDynamicsOpenAPIModels.jl",
    "timeseries" => "PowerTimeSeriesOpenAPIModels.jl",
]

# SiennaSchemas generates its purely-administrative/association schemas (Supplemental-
# AttributeAssociation, GeographicInfo, DataSource, the shared MinMax/InOut/UpDown/... value
# types) as a separate `infrastructure-core` bundle, gated by its own scripts/check_layering.py
# for staying power-semantics-free -- but no Julia package here corresponds to that split yet,
# so its raw generator output is merged into core's own before anything below (the per-domain
# loop, the shared-type scan) ever looks at `generated/core`. Not a DOMAINS entry: it has no
# destination package of its own, only a source directory to fold into core's.
let infra_core = joinpath(GENERATED, "infrastructure-core")
    if isdir(infra_core)
        for sub in ("src/models", "src/apis", "docs")
            src_dir = joinpath(infra_core, sub)
            isdir(src_dir) || continue
            dst_dir = joinpath(GENERATED, "core", sub)
            mkpath(dst_dir)
            for f in readdir(src_dir, join=true)
                cp(f, joinpath(dst_dir, basename(f)); force=true)
            end
        end
    end
end

# A schema shared across domains (MinMax, InOut, UpDown, ...) lands in every domain whose
# own document references it, independent of whether Core's own document does. Core is
# still its one canonical home, so this scans every domain's raw generator output up front
# and flags any name occurring in more than one domain, recording one representative source
# path per name (first domain in DOMAINS order that has it) for Core to adopt even when
# Core's own generator run produced no copy of it.
function _scan_shared(subpath, suffix)
    domain_count = Dict{String, Int}()
    source = Dict{String, String}()
    for (domain, _) in DOMAINS
        dir = joinpath(GENERATED, domain, subpath)
        isdir(dir) || continue
        for f in readdir(dir, join=true)
            endswith(f, suffix) || continue
            name = basename(f)
            domain_count[name] = get(domain_count, name, 0) + 1
            haskey(source, name) || (source[name] = f)
        end
    end
    shared = Set(name for (name, n) in domain_count if n > 1)
    return shared, source
end

const SHARED_MODELS, MODEL_SOURCE = _scan_shared(joinpath("src", "models"), ".jl")
const SHARED_DOCS, DOC_SOURCE = _scan_shared("docs", ".md")

for (domain, pkg) in DOMAINS
    gen = joinpath(GENERATED, domain)
    dest = joinpath(REPO, pkg, "src")
    isdir(gen) || continue

    # Clean and create directories
    rm(joinpath(dest, "models"), force=true, recursive=true)
    rm(joinpath(dest, "apis"), force=true, recursive=true)
    docs_dest = joinpath(REPO, pkg, "docs")
    rm(docs_dest, force=true, recursive=true)
    mkpath(joinpath(dest, "models"))
    mkpath(joinpath(dest, "apis"))
    mkpath(docs_dest)

    # Copy models (skip Core duplicates, and cross-domain shared types, for domain packages)
    for f in readdir(joinpath(gen, "src", "models"), join=true)
        endswith(f, ".jl") || continue
        name = basename(f)
        domain != "core" &&
            (isfile(joinpath(CORE_MODELS, name)) || name in SHARED_MODELS) &&
            continue
        cp(f, joinpath(dest, "models", name))
    end
    if domain == "core"
        # Adopt every cross-domain shared type Core's own generator run did not produce.
        for name in SHARED_MODELS
            isfile(joinpath(CORE_MODELS, name)) ||
                cp(MODEL_SOURCE[name], joinpath(CORE_MODELS, name))
        end
    end

    # Copy APIs
    apis_dir = joinpath(gen, "src", "apis")
    if isdir(apis_dir)
        for f in readdir(apis_dir, join=true)
            endswith(f, ".jl") || continue
            cp(f, joinpath(dest, "apis", basename(f)))
        end
    end

    # Copy docs (skip Core duplicates, and cross-domain shared types, for domain packages)
    docs_dir = joinpath(gen, "docs")
    if isdir(docs_dir)
        for f in readdir(docs_dir, join=true)
            endswith(f, ".md") || continue
            name = basename(f)
            domain != "core" &&
                (isfile(joinpath(CORE_DOCS, name)) || name in SHARED_DOCS) &&
                continue
            cp(f, joinpath(docs_dest, name))
        end
    end
    if domain == "core"
        for name in SHARED_DOCS
            isfile(joinpath(CORE_DOCS, name)) ||
                cp(DOC_SOURCE[name], joinpath(CORE_DOCS, name))
        end
    end

    # Generate module file
    mod = replace(pkg, ".jl" => "")
    models =
        sort([basename(f) for f in readdir(joinpath(dest, "models")) if endswith(f, ".jl")])
    apis =
        sort([basename(f) for f in readdir(joinpath(dest, "apis")) if endswith(f, ".jl")])

    # Extract exported type names from files
    exports = Set{String}()
    for dir in [joinpath(dest, "models"), joinpath(dest, "apis")]
        for f in readdir(dir, join=true)
            endswith(f, ".jl") || continue
            for line in eachline(f)
                m = match(r"mutable struct ([A-Za-z0-9_]+)", line)
                m !== nothing && push!(exports, m.captures[1])
                m = match(r"^const ([A-Z][A-Za-z0-9_]*)", line)
                m !== nothing &&
                    !startswith(m.captures[1], "_") &&
                    push!(exports, m.captures[1])
            end
        end
    end

    # openapi-generator's julia-client template emits ZonedDateTime for
    # date-time formatted fields but never imports TimeZones for it.
    needs_timezones = any(
        occursin("ZonedDateTime", read(joinpath(dest, "models", f), String)) for
        f in models
    )

    # Units must be emitted before the module file so the include below is valid.
    has_units = emit_units_for(domain, dest, SCHEMA_DIR, UNIT_FACTORS, UNIT_BY_UNIT)
    # Same ordering reason: register.jl is included below, so it must exist first.
    has_registry = emit_registry_for(domain, dest)
    # Hand-written, not emitted -- the one file in these packages that is not generated.
    # Included only where it lives (Core), and only if present, so a checkout that predates
    # it still reorganizes cleanly.
    has_document = domain == "core" && isfile(joinpath(dest, "document.jl"))

    open(joinpath(dest, "$mod.jl"), "w") do io
        println(io, "module $mod")
        println(io)
        print(io, "using OpenAPI, JSON3, HTTP")
        # document.jl encodes a whole document in one pass and relies on
        # JSON.lower(::OpenAPI.APIModel) to skip unset fields, which is JSON.jl behavior
        # that JSON3 does not provide.
        has_document && print(io, ", JSON")
        needs_timezones && print(io, ", TimeZones")
        println(io)
        domain != "core" && println(io, "using PowerCoreOpenAPIModels")
        println(io)
        for f in models
            println(io, "include(\"models/$f\")")
        end
        for f in apis
            println(io, "include(\"apis/$f\")")
        end
        # units.jl extends Core's accessors for the types just included, so it
        # has to come after every model include.
        has_units && println(io, "include(\"units.jl\")")
        # document.jl holds the association tables as typed fields, so it needs those model
        # types defined, and register.jl calls into it -- hence document before registry.
        has_document && println(io, "include(\"document.jl\")")
        has_registry && println(io, "include(\"register.jl\")")
        println(io)
        for name in sort(collect(exports))
            println(io, "export $name")
        end
        if domain == "core"
            for name in UNIT_EXPORTS
                println(io, "export $name")
            end
        end
        if domain != "core"
            println(io)
            println(
                io,
                "for n in names(PowerCoreOpenAPIModels); n === :PowerCoreOpenAPIModels && continue; @eval export \$n; end",
            )
        end
        println(io)
        println(io, "end")
    end
end

rm(GENERATED, force=true, recursive=true)
