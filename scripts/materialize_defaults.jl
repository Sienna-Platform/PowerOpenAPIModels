#!/usr/bin/env julia
# Materialize composite (object/array) schema defaults that openapi-generator's
# julia-client silently drops.
#
# Root cause (see PATCHES.md for the full writeup and upstream file/line):
# `AbstractJuliaCodegen.toDefaultValue(Schema)` in openapi-generator 7.20.0 only
# renders boolean / date / date-time / integer / long / number / string schema
# defaults; every other schema kind (an object `$ref`, an array) falls through
# to the literal string "nothing" -- the method never even inspects
# `schema.getDefault()` for those kinds. Python's side of this pipeline uses
# datamodel-code-generator, not openapi-generator, and keeps the raw default,
# so the exact same document (with the field omitted) loads to a different
# effective value in each language.
#
# This reads the SiennaSchemas *bundled* specs -- the same
# `dist/openapi-<domain>-bundled.json` files emit_units.jl already depends on,
# which fully resolve `$ref` and keep the sibling `default`/`x-unit*` keys that
# get lost by the time openapi-generator's own model layer sees the property
# (verified with `--global-property debugModels=true`: the CodegenProperty for
# a `$ref`-typed field carries no default at all, only `x-unit*` vendor
# extensions survive that path) -- for the real default value, then rewrites
# the generated field initializer to construct it.
#
# To render a composite default correctly (including picking the right branch
# of a discriminated oneOf, e.g. ValueCurve -> InputOutputCurve) this does not
# re-derive Julia type names or discriminator rules: it `include()`s every
# already-generated model_*.jl file and calls the `OpenAPI.property_type`
# methods openapi-generator already emitted per struct. Whatever those methods
# say is authoritative, by construction.
#
# Run by `make generate` right after scripts/reorganize.jl, against the final
# per-package `src/models/*.jl` files (not the scratch `generated/` tree,
# which reorganize.jl deletes at the end of its run).

import JSON

const REPO = dirname(@__DIR__)
const SCHEMA_DIR = get(ENV, "SCHEMA_DIR", joinpath(dirname(REPO), "SiennaSchemas"))

const DOMAIN_TO_PKG = Dict(
    "core" => "PowerCoreOpenAPIModels.jl",
    "operations" => "PowerOperationsOpenAPIModels.jl",
    "investments" => "PowerInvestmentsOpenAPIModels.jl",
    "dynamics" => "PowerDynamicsOpenAPIModels.jl",
)

# --------------------------------------------------------------------------- #
# 1. Collect every (type, property) whose schema default is an object or
#    array -- the two kinds AbstractJuliaCodegen.toDefaultValue cannot render.
#    Scalar defaults are already correct and are left untouched.
# --------------------------------------------------------------------------- #

# JSON.jl parses objects into its own `JSON.Object` type, not `Dict`. The
# `property_type` methods openapi-generator emits for oneOf wrappers are typed
# `::Dict{String,Any}` exactly (see model_ValueCurve.jl), so every nested
# object has to be a plain `Dict{String,Any}` before it reaches them.
to_plain(x::AbstractDict) =
    Dict{String, Any}(String(k) => to_plain(v) for (k, v) in pairs(x))
to_plain(x::AbstractVector) = Any[to_plain(v) for v in x]
to_plain(x) = x

function collect_composite_defaults(schema_dir)
    seen = Dict{Tuple{String, String}, Any}()  # a domain's bundle inlines schemas
    # cross-referenced from other domains (e.g. a dynamics model pointing at
    # an operations static injector), so the same (type, property) can turn
    # up in more than one bundled spec. Silently keep one copy when they
    # agree; a real conflict (the schemas disagreeing with themselves) is a
    # data error, not something to paper over by picking one arbitrarily.
    for domain in keys(DOMAIN_TO_PKG)
        bundle = joinpath(schema_dir, "dist", "openapi-$domain-bundled.json")
        if !isfile(bundle)
            @warn "No bundled spec for $domain at $bundle; skipping"
            continue
        end
        spec = JSON.parsefile(bundle)
        # A type reused by more than one other schema (MinMax, CostCurve,
        # RenewableGenerationCost, ...) is bundled once under the legacy
        # Swagger2-style `definitions` bucket, with `components.schemas`
        # holding only a bare `$ref` pointer to it -- so both have to be
        # swept, or a property defined only on the `definitions` side (e.g.
        # RenewableGenerationCost.curtailment_cost) is silently missed.
        schema_maps = (
            get(spec, "components", Dict())["schemas"],
            get(spec, "definitions", Dict{String, Any}()),
        )
        for schemas in schema_maps
            for (type_name, schema) in pairs(schemas)
                schema isa AbstractDict || continue
                props = get(schema, "properties", nothing)
                isnothing(props) && continue
                for (prop_name, pspec) in pairs(props)
                    pspec isa AbstractDict || continue
                    haskey(pspec, "default") || continue
                    default = pspec["default"]
                    (default isa AbstractDict || default isa AbstractVector) || continue
                    default = to_plain(default)
                    key = (type_name, prop_name)
                    if haskey(seen, key) && seen[key] != default
                        error(
                            "$type_name.$prop_name: conflicting composite defaults across " *
                            "domain bundles: $(seen[key]) vs $default",
                        )
                    end
                    seen[key] = default
                end
            end
        end
    end
    return [(k[1], k[2], v) for (k, v) in pairs(seen)]
end

# --------------------------------------------------------------------------- #
# 2. Minimal OpenAPI stand-in so every generated model_*.jl file `include`s
#    cleanly, without depending on the real OpenAPI.jl / JSON3 / HTTP /
#    TimeZones stack these packages normally run against. Only
#    `property_type` does real work: its methods are the ones each
#    model_*.jl file itself defines (the plain 2-arg form for `@kwdef`
#    structs, the discriminator-dispatching 3-arg form for oneOf wrappers),
#    so branch/type resolution is openapi-generator's own, not re-derived.
# --------------------------------------------------------------------------- #

module OpenAPI
abstract type APIModel end
abstract type OneOfAPIModel end
validate_properties(::Any) = nothing
validate_property(::Any, ::Any, ::Any) = nothing
check_required(::Any) = true
function property_type end
end

# The one field in this repo typed `ZonedDateTime` (TimeSeriesAssociation) is
# unrelated to every composite default collected above; stub the name so that
# file still `include`s without pulling in TimeZones.jl.
const ZonedDateTime = Nothing

function load_all_models(repo_root)
    for pkg in values(DOMAIN_TO_PKG)
        dir = joinpath(repo_root, pkg, "src", "models")
        isdir(dir) || continue
        for f in sort(readdir(dir, join=true))
            endswith(f, ".jl") || continue
            include(f)
        end
    end
end

function find_model_file(repo_root, type_name)
    for pkg in values(DOMAIN_TO_PKG)
        path = joinpath(repo_root, pkg, "src", "models", "model_$type_name.jl")
        isfile(path) && return path
    end
    return nothing
end

# --------------------------------------------------------------------------- #
# 3. Render a JSON default as Julia source text for a given (already-unwrapped)
#    target type, recursing through nested objects, arrays, and oneOf
#    branches via `OpenAPI.property_type`.
# --------------------------------------------------------------------------- #

_unwrap(T) = T                      # concrete type: nothing to unwrap
_unwrap(T::Union) = T.a === Nothing ? T.b : T.a   # Union{Nothing, X} -> X

render_default(::Type{Float64}, json) = string(Float64(json))
render_default(::Type{Int64}, json) = string(Int64(json))
render_default(::Type{Bool}, json) = string(Bool(json))
render_default(::Type{String}, json) = repr(String(json))

function render_default(::Type{Vector{E}}, json) where {E}
    items = [render_default(E, x) for x in json]
    return string(E) * "[" * join(items, ", ") * "]"
end

function render_default(::Type{T}, json::AbstractDict) where {T <: OpenAPI.APIModel}
    parts = String[]
    for f in fieldnames(T)
        key = String(f)
        haskey(json, key) || continue
        ftype = _unwrap(OpenAPI.property_type(T, f))
        push!(parts, string(f) * "=" * render_default(ftype, json[key]))
    end
    return string(nameof(T)) * "(; " * join(parts, ", ") * ")"
end

function render_default(::Type{T}, json::AbstractDict) where {T <: OpenAPI.OneOfAPIModel}
    branch = _unwrap(OpenAPI.property_type(T, :value, json))
    return string(nameof(T)) * "(" * render_default(branch, json) * ")"
end

# --------------------------------------------------------------------------- #
# 4. Rewrite the generated field initializer in place. Both the docstring's
#    constructor-signature block and the actual `Base.@kwdef` field line
#    write the un-renderable default as the literal text "nothing"; replace
#    both occurrences. Line-based (rather than a single multi-line regex over
#    the whole file) so the two shapes model.mustache emits -- a scalar-array
#    field carries its full parametrized type in the annotation itself
#    (`prop::Union{Nothing, Vector{Int64}} = nothing`, since openapi-generator
#    treats an array of primitives as `isPrimitiveType`), while a `$ref`/oneOf
#    field is untyped with the type only in a trailing comment
#    (`prop = nothing # spec type: Union{ Nothing, MinMax }`) -- are matched
#    exactly, without guessing at every container type spelling.
# --------------------------------------------------------------------------- #

function patch_field_default!(path, prop_name, rendered)
    lines = split(read(path, String), '\n')
    changed = false

    # The annotation itself can nest braces (`Vector{Int64}`, `Dict{String,
    # MinMax}`), so it is matched greedily rather than with a `[^}]*`
    # character class, which would stop at the first, inner, closing brace.
    body_re = Regex(
        "^(\\s*" * prop_name * ")(::Union\\{.*\\})?(\\s*=\\s*)nothing(\\s*(?:#.*)?)\$",
    )
    doc_re = Regex("^(\\s*" * prop_name * "=)nothing(,)\$")

    for i in eachindex(lines)
        m = match(body_re, lines[i])
        if m !== nothing
            typeann = m.captures[2] === nothing ? "" : m.captures[2]
            trailing = m.captures[4] === nothing ? "" : m.captures[4]
            lines[i] = m.captures[1] * typeann * m.captures[3] * rendered * trailing
            changed = true
            continue
        end
        m2 = match(doc_re, lines[i])
        if m2 !== nothing
            lines[i] = m2.captures[1] * rendered * m2.captures[2]
            changed = true
        end
    end

    changed && write(path, join(lines, '\n'))
    return changed
end

# --------------------------------------------------------------------------- #
# Entry point
# --------------------------------------------------------------------------- #

function patch_all(repo_root, defaults)
    # `load_all_models` ran via `include()` inside `main`'s own call frame, so
    # the methods those files add (every struct's `property_type`) exist in a
    # world age newer than the one `main`'s compiled body was specialized
    # against. `invokelatest` re-dispatches against the current world age.
    patched = 0
    for (type_name, prop_name, json_default) in defaults
        path = find_model_file(repo_root, type_name)
        if isnothing(path)
            @warn "No generated model_$type_name.jl for a composite default on $type_name.$prop_name; skipping"
            continue
        end
        T = getfield(Main, Symbol(type_name))
        ftype = _unwrap(OpenAPI.property_type(T, Symbol(prop_name)))
        rendered = render_default(ftype, json_default)
        if patch_field_default!(path, prop_name, rendered)
            patched += 1
        else
            @warn "$type_name.$prop_name: expected pattern not found in $path (already patched, or generator output changed shape)"
        end
    end
    @info "Materialized $patched / $(length(defaults)) composite defaults"
    return
end

function main(repo_root, schema_dir)
    defaults = collect_composite_defaults(schema_dir)
    if isempty(defaults)
        @info "No composite/array defaults found; nothing to materialize"
        return
    end

    load_all_models(repo_root)
    Base.invokelatest(patch_all, repo_root, defaults)
    return
end

if abspath(PROGRAM_FILE) == @__FILE__
    main(REPO, SCHEMA_DIR)
end
