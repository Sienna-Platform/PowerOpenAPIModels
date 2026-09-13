#!/usr/bin/env julia
# Generate all 7 packages with OpenAPI.jl 1.0's native pure-Julia generator
# (`OpenAPI.client`), replacing the Java openapi-generator + Docker pipeline.
#
# One `OpenAPI.client()` call produces a single self-contained module per domain: every
# struct plus the domain's whole schema document embedded (for runtime JSON-Schema
# validation), with no per-model files and no mechanism to dedup a struct shared across
# domains. This script reproduces `reorganize.jl`'s dedup at the struct level instead of the
# file level: generate each domain's raw single file, then for every domain keep only the
# structs not already owned by one of its base packages (mirroring the DOMAINS base chain
# below), replacing dropped structs with `using <BasePackage>` plus the same dynamic
# re-export loop `reorganize.jl` used. `core` additionally adopts any struct shared by 2+ of
# {timeseries, core, operations, investments, dynamics} even when core's own document does
# not reference it -- same promotion rule as `_scan_shared` in `reorganize.jl`.

import JSON
import OpenAPI

const REPO = dirname(@__DIR__)
const SCHEMA_DIR = get(ENV, "SCHEMA_DIR", joinpath(dirname(REPO), "SiennaSchemas"))
const RAW_DIR = joinpath(REPO, ".native_raw") # scratch: one unsplit file per domain

include(joinpath(@__DIR__, "selector.jl"))
include(joinpath(@__DIR__, "emit_units.jl"))
include(joinpath(@__DIR__, "emit_docs.jl"))
include(joinpath(@__DIR__, "registered_names.jl"))
include(joinpath(@__DIR__, "prettify.jl"))
include(joinpath(@__DIR__, "supertypes.jl"))

const UNIT_VOCAB = load_unit_vocabulary(joinpath(SCHEMA_DIR, "Core", "units.json"))
const UNIT_FACTORS = UNIT_VOCAB[1]
const UNIT_BY_UNIT = UNIT_VOCAB[2]

# (domain, package dir, module name, base domains). Order is load-bearing, same reason as
# reorganize.jl: a domain's bases must already be resolved before it is processed.
const DOMAINS = [
    (
        "infrastructure-core",
        "InfrastructureCoreOpenAPIModels.jl",
        "InfrastructureCoreOpenAPIModels",
        String[],
    ),
    (
        "timeseries",
        "InfrastructureTimeSeriesOpenAPIModels.jl",
        "InfrastructureTimeSeriesOpenAPIModels",
        ["infrastructure-core"],
    ),
    (
        "core",
        "PowerCoreOpenAPIModels.jl",
        "PowerCoreOpenAPIModels",
        ["infrastructure-core"],
    ),
    (
        "operations",
        "PowerOperationsOpenAPIModels.jl",
        "PowerOperationsOpenAPIModels",
        ["infrastructure-core", "core"],
    ),
    (
        "investments",
        "PowerInvestmentsOpenAPIModels.jl",
        "PowerInvestmentsOpenAPIModels",
        ["infrastructure-core", "core"],
    ),
    (
        "dynamics",
        "PowerDynamicsOpenAPIModels.jl",
        "PowerDynamicsOpenAPIModels",
        ["infrastructure-core", "core"],
    ),
]
const PKG_FOR_DOMAIN = Dict(d => pkg for (d, pkg, _, _) in DOMAINS)
const MODULE_FOR_DOMAIN = Dict(d => mod for (d, _, mod, _) in DOMAINS)
const BASES_FOR_DOMAIN = Dict(d => bases for (d, _, _, bases) in DOMAINS)

struct Chunk
    name::String
    text::String
end

# Included after `Chunk`: its signatures dispatch on it.
include(joinpath(@__DIR__, "dedup_structs.jl"))
# Included after dedup_structs.jl: reuses its `generated_type_name`.
include(joinpath(@__DIR__, "const_defaults.jl"))
include(joinpath(@__DIR__, "primitive_oneof_decode.jl"))

"""
Run OpenAPI.client() on `domain`'s selector; return the raw generated module text.
"""
function generate_raw(domain, modname)
    mkpath(RAW_DIR)
    outpath = joinpath(RAW_DIR, "$domain.jl")
    OpenAPI.client(selector_path(SCHEMA_DIR, domain); name=modname, path=outpath)
    return read(outpath, String)
end

const DECL_RE = r"^(?:Base\.@kwdef\s+)?(?:mutable\s+)?struct\s+(\w+)|^const\s+(\w+)\s*="m

"""
Split a generated module's text into (preamble, chunks, epilogue).
"""
function split_module(text)
    lines = collect(split(text, '\n'))
    first_doc = findfirst(l -> startswith(l, "@doc \""), lines)
    last_end = findlast(l -> startswith(l, "end # module"), lines)
    first_doc === nothing && error("no @doc block found in generated module")
    last_end === nothing && error("no closing `end # module` found in generated module")

    preamble = join(lines[1:(first_doc - 1)], '\n')
    body = lines[first_doc:(last_end - 1)]
    epilogue = lines[last_end]

    # A new chunk starts at every `@doc "..."` line (the normal, documented case) AND at
    # every top-level type declaration not already opened by one: synthesized nested schemas
    # (e.g. a discriminated field's anonymous union type, `AverageRateCurveFunctionData`)
    # generate with no docstring at all, so relying on `@doc` boundaries alone silently
    # merges them into whatever chunk happens to precede them -- and drops them along with
    # it if that chunk turns out to be a cross-domain duplicate.
    boundaries = Int[]
    open_decl = false
    for (i, l) in enumerate(body)
        if startswith(l, "@doc \"")
            push!(boundaries, i)
            open_decl = false
        elseif occursin(DECL_RE, l)
            if open_decl
                push!(boundaries, i)
            end
            open_decl = true
        end
    end
    push!(boundaries, length(body) + 1)

    chunks = Chunk[]
    for i in 1:(length(boundaries) - 1)
        chunk_lines = body[boundaries[i]:(boundaries[i + 1] - 1)]
        chunk_text = rstrip(join(chunk_lines, '\n')) * "\n"
        m = match(DECL_RE, chunk_text)
        m === nothing && error("could not find a type name in chunk:\n$chunk_text")
        name = m.captures[1] === nothing ? m.captures[2] : m.captures[1]
        push!(chunks, Chunk(name, chunk_text))
    end
    return preamble, chunks, epilogue
end

# ── Phase 1: raw generation for every domain ────────────────────────────────────────
const RAW = Dict{String, Tuple{String, Vector{Chunk}, String}}()
for (domain, _, modname, _) in DOMAINS
    text = generate_raw(domain, modname)
    RAW[domain] = split_module(text)
end
const RAW_NAMES = Dict(d => Set(c.name for c in chunks) for (d, (_, chunks, _)) in RAW)

# ── Phase 2: cross-domain sharing, mirrors reorganize.jl's _scan_shared ────────────
# Every domain but infrastructure-core participates in the shared-name scan; a name in 2+
# of them is promoted into `core` regardless of whether core's own document has it.
const SHARE_SCAN_DOMAINS = [d for (d, _, _, _) in DOMAINS if d != "infrastructure-core"]
const NAME_DOMAIN_COUNT = Dict{String, Int}()
const NAME_SOURCE_CHUNK = Dict{String, Chunk}()
for d in SHARE_SCAN_DOMAINS
    for c in RAW[d][2]
        NAME_DOMAIN_COUNT[c.name] = get(NAME_DOMAIN_COUNT, c.name, 0) + 1
        haskey(NAME_SOURCE_CHUNK, c.name) || (NAME_SOURCE_CHUNK[c.name] = c)
    end
end
const SHARED_NAMES = Set(n for (n, cnt) in NAME_DOMAIN_COUNT if cnt > 1)

# ── Phase 3: per-domain KEPT sets and final chunk lists, in DOMAINS (base-chain) order ──
const KEPT_NAMES = Dict{String, Set{String}}()   # domain -> names this domain owns
const KEPT_CHUNKS = Dict{String, Vector{Chunk}}() # domain -> chunks this domain emits

for (domain, _, _, bases) in DOMAINS
    base_names = union(Set{String}(), (KEPT_NAMES[b] for b in bases)...)
    _, raw_chunks, _ = RAW[domain]

    kept = Chunk[]
    for c in raw_chunks
        c.name in base_names && continue
        if domain != "core" && domain != "infrastructure-core" && c.name in SHARED_NAMES
            continue # owned by core instead, even though this domain's own doc has it
        end
        push!(kept, c)
    end
    if domain == "core"
        have = Set(c.name for c in kept)
        for name in SHARED_NAMES
            name in base_names && continue
            name in have && continue
            push!(kept, NAME_SOURCE_CHUNK[name])
        end
    end

    KEPT_CHUNKS[domain] = kept
    KEPT_NAMES[domain] = Set(c.name for c in kept)
end

# ── Phase 3a: collapse per-reference-site copies onto the shared type ──────────────
# See dedup_structs.jl for why these copies exist and what evidence a merge requires.
const PUBLISHED_NAMES = published_schema_names(SCHEMA_DIR, [d for (d, _, _, _) in DOMAINS])
const DUPLICATE_RENAMES = build_rename_map(KEPT_CHUNKS, PUBLISHED_NAMES)

# Source of truth for the const-default pass (Phase 4): generated struct name -> its const
# fields, read from the same selectors.
const CONST_FIELDS = load_const_fields(SCHEMA_DIR, [d for (d, _, _, _) in DOMAINS])

if !isempty(DUPLICATE_RENAMES)
    for (domain, _, _, _) in DOMAINS
        kept = Chunk[]
        for c in KEPT_CHUNKS[domain]
            haskey(DUPLICATE_RENAMES, c.name) && continue
            push!(kept, Chunk(c.name, apply_renames(c.text, DUPLICATE_RENAMES)))
        end
        KEPT_CHUNKS[domain] = topo_order(kept)
        KEPT_NAMES[domain] = Set(c.name for c in kept)
    end
    by_survivor = Dict{String, Vector{String}}()
    for (from, to) in DUPLICATE_RENAMES
        push!(get!(by_survivor, to, String[]), from)
    end
    println("Collapsed $(length(DUPLICATE_RENAMES)) duplicate type(s) onto shared types:")
    for survivor in sort!(collect(keys(by_survivor)))
        println("  $survivor <- ", join(sort!(by_survivor[survivor]), ", "))
    end
end

# ── Phase 3b: reconcile the frozen registered-name set with what exists now ────────
# `REGISTERED_NAMES` is frozen from the pre-1.0 `register.jl` files, so it goes stale as the
# schemas move: a type the schemas delete would be registered anyway and `register.jl` would
# fail to load (`UndefVarError: TwoTerminalLoss`, after the loss-curve wrappers collapsed),
# and a type that moves between packages would be registered from the package that no longer
# owns it. Reconcile against the names actually generated, and say out loud what moved or
# went away -- silently dropping a name would hide a real schema deletion.
const OWNER_OF_NAME = Dict{String, String}()
for (domain, _, _, _) in DOMAINS
    for name in KEPT_NAMES[domain]
        OWNER_OF_NAME[name] = domain
    end
end

const FROZEN_ALL = Set{String}(name for names in values(REGISTERED_NAMES) for name in names)

"""
Names `domain`'s `register.jl` should register: every frozen name the generated output says
this domain now owns, wherever it was frozen.
"""
function registered_for(domain)
    return sort!([n for n in FROZEN_ALL if get(OWNER_OF_NAME, n, "") == domain])
end

let
    vanished = sort!([n for n in FROZEN_ALL if !haskey(OWNER_OF_NAME, n)])
    isempty(vanished) || println(
        "Frozen registered name(s) no longer generated, dropped from register.jl: " *
        join(vanished, ", "),
    )
    moved = String[]
    for (frozen_domain, names) in REGISTERED_NAMES, name in names
        haskey(OWNER_OF_NAME, name) || continue
        owner = OWNER_OF_NAME[name]
        owner == frozen_domain || push!(moved, "$name: $frozen_domain -> $owner")
    end
    isempty(moved) || println(
        "Frozen registered name(s) that changed package: " * join(sort!(moved), ", "),
    )
end

# ── Phase 4: assemble and write each package ────────────────────────────────────────
# One file per struct, same layout as the old openapi-generator pipeline
# (src/models/model_<Name>.jl, included from the top module file) so a regeneration diffs
# type-by-type instead of replacing one giant file. The `_SPEC`/`ABSENT`/`_decode`/`_encode`
# preamble that a chunk's code needs is only ever emitted once, in the top module file, same
# as it always was for `using OpenAPI, JSON3, HTTP`.
#
# The preamble already names the module `modname` -- that's what was passed to
# OpenAPI.client -- so nothing to rewrite there.
const TOTAL_DEFAULTED = Ref(0)

for (domain, pkgdir, modname, bases) in DOMAINS
    preamble, _, _ = RAW[domain]
    chunks = KEPT_CHUNKS[domain]
    dest = joinpath(REPO, pkgdir, "src")
    models_dest = joinpath(dest, "models")
    rm(models_dest; force=true, recursive=true)
    mkpath(models_dest)

    # `rewrite_docstring` runs here rather than on the chunk itself: `emit_docs_for` below
    # parses the generator's original `@doc "…"` one-liner to rebuild docs/<Name>.md.
    written = String[]
    domain_defaulted = 0
    for c in chunks
        path = joinpath(models_dest, "model_$(c.name).jl")
        text, n = default_const_fields(
            add_supertype(c.text),
            get(CONST_FIELDS, c.name, EMPTY_CONST_FIELDS),
        )
        domain_defaulted += n
        text = patch_primitive_oneof(text, c.name)
        write(path, rewrite_docstring(text))
        push!(written, path)
    end
    TOTAL_DEFAULTED[] += domain_defaulted

    lines_out = IOBuffer()
    println(lines_out, preamble)
    for b in bases
        println(lines_out, "using $(MODULE_FOR_DOMAIN[b])")
    end
    println(lines_out)
    # The model supertypes have to exist before the first `include` that uses one. In the
    # base package that means emitting them here; every other package inherits them through
    # the `using` above.
    if domain == "infrastructure-core"
        println(lines_out, SUPERTYPE_DEFINITIONS)
    end
    # Original (dependency) order, not alphabetical: a synthesized nested type like
    # `DataSourceExtra` is generated immediately before the struct that references it
    # (`DataSource`), and Julia needs that type to exist by the time the referencing struct's
    # `include` runs.
    for c in chunks
        println(lines_out, "include(\"models/model_$(c.name).jl\")")
    end
    println(lines_out)

    has_units =
        emit_units_for(domain, dest, SCHEMA_DIR, UNIT_FACTORS, UNIT_BY_UNIT;
            bases=BASES_FOR_DOMAIN[domain])
    has_document = domain == "infrastructure-core" && isfile(joinpath(dest, "document.jl"))
    registered = registered_for(domain)
    has_registry = !isempty(registered)
    if has_registry
        accessor = domain == "infrastructure-core" ? "" : "InfrastructureCoreOpenAPIModels."
        open(joinpath(dest, "register.jl"), "w") do io
            println(
                io,
                "# Generated from the frozen pre-1.0 registered-name set. Do not edit.",
            )
            println(io, "#")
            println(
                io,
                "# Runs in __init__ because the registry lives in another module: state",
            )
            println(io, "# mutated there during precompilation would not be saved.")
            println(io)
            println(io, "function __init__()")
            for name in sort(registered)
                println(io, "    $(accessor)register_model_type!($name)")
            end
            println(io, "    return nothing")
            println(io, "end")
        end
    end
    has_units && println(lines_out, "include(\"units.jl\")")
    has_document && println(lines_out, "include(\"document.jl\")")
    has_registry && println(lines_out, "include(\"register.jl\")")
    println(lines_out)
    for c in sort(chunks; by=x -> x.name)
        println(lines_out, "export $(c.name)")
    end
    if domain == "infrastructure-core"
        for name in UNIT_EXPORTS
            println(lines_out, "export $name")
        end
        for name in SUPERTYPE_EXPORTS
            println(lines_out, "export $name")
        end
    end
    if !isempty(bases)
        println(lines_out)
        for b in bases
            m = MODULE_FOR_DOMAIN[b]
            println(
                lines_out,
                "for n in names($m); n === :$m && continue; @eval export \$n; end",
            )
        end
    end
    println(lines_out)
    println(lines_out, "end # module $modname")

    module_path = joinpath(dest, "$modname.jl")
    write(module_path, String(take!(lines_out)))
    push!(written, module_path)
    rm(joinpath(dest, "apis"); force=true, recursive=true)

    for extra in ("units.jl", "document.jl", "register.jl")
        path = joinpath(dest, extra)
        isfile(path) && push!(written, path)
    end
    format_paths(written)

    docs_dest = joinpath(REPO, pkgdir, "docs")
    rm(docs_dest; force=true, recursive=true)
    emit_docs_for(chunks, docs_dest)

    println(
        "Wrote $pkgdir/src/$modname.jl: $(length(chunks)) new type(s), " *
        "$(length(bases)) base package(s), $(length(written)) file(s) formatted, " *
        "$domain_defaulted const field(s) defaulted",
    )
end

println("Defaulted $(TOTAL_DEFAULTED[]) const discriminator field(s) across all packages")

get(ENV, "KEEP_RAW", "") == "1" || rm(RAW_DIR; force=true, recursive=true)
