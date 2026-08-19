#!/usr/bin/env julia
# Materialize composite (object/array) schema defaults that openapi-generator's
# julia-client silently drops.
#
# Root cause (see PATCHES.md for the full writeup and upstream file/line):
# `AbstractJuliaCodegen.toDefaultValue(Schema)` in openapi-generator 7.20.0 renders
# only scalar schema defaults; an object `$ref` or an array falls through to the
# literal string "nothing". Python's side of the pipeline uses
# datamodel-code-generator, which keeps the raw default, so the same document
# would load to a different effective value in each language.
#
# The defaults are read from the SiennaSchemas *bundled* specs -- the same
# `dist/openapi-<domain>-bundled.json` files emit_units.jl depends on -- because
# they resolve `$ref` while keeping the sibling `default` key, which is already
# gone by the time openapi-generator's own model layer sees the property.
#
# Rendering a composite default (including picking the right branch of a
# discriminated oneOf, e.g. ValueCurve -> InputOutputCurve) re-derives no Julia
# type names or discriminator rules: it `include()`s every already-generated
# model_*.jl and calls the `OpenAPI.property_type` methods openapi-generator
# itself emitted, which are authoritative by construction.
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
    "timeseries" => "PowerTimeSeriesOpenAPIModels.jl"
)

# --------------------------------------------------------------------------- #
# 1. Collect every (type, property) whose schema default is an object or
#    array -- the two kinds AbstractJuliaCodegen.toDefaultValue cannot render.
#    Scalar defaults are already correct and are left untouched.
# --------------------------------------------------------------------------- #

# The `property_type` methods emitted for oneOf wrappers are typed
# `::Dict{String,Any}` exactly, so JSON.jl's own `JSON.Object` has to be
# converted before it reaches them.
function to_plain(x::AbstractDict)
    Dict{String, Any}(String(k) => to_plain(v) for (k, v) in pairs(x))
end
to_plain(x::AbstractVector) = Any[to_plain(v) for v in x]
to_plain(x) = x

function collect_composite_defaults(schema_dir)
    # A domain's bundle inlines schemas cross-referenced from other domains, so the
    # same (type, property) can appear in more than one spec. Agreeing copies collapse;
    # a real conflict means the schemas disagree with themselves and must error.
    seen = Dict{Tuple{String, String}, Any}()
    for domain in keys(DOMAIN_TO_PKG)
        bundle = joinpath(schema_dir, "dist", "openapi-$domain-bundled.json")
        # A missing bundle would leave every one of that domain's fields
        # unmaterialized with no trace, so it must stop the run rather than
        # read as "no defaults to fix".
        isfile(bundle) || error(
            "No bundled spec for domain \"$domain\" at $bundle. Run " *
            "`python3 scripts/bundle_specs.py` in $schema_dir (or let " *
            "`make generate` do it) before materialize_defaults.jl.",
        )
        spec = JSON.parsefile(bundle)
        # A type reused by more than one other schema (MinMax, CostCurve, ...) is
        # bundled under the legacy `definitions` bucket, with `components.schemas`
        # holding only a `$ref` to it, so both buckets have to be swept.
        schema_maps = (
            get(spec, "components", Dict())["schemas"],
            get(spec, "definitions", Dict{String, Any}())
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
#    cleanly without the real OpenAPI.jl / JSON3 / HTTP / TimeZones stack.
#    Only `property_type` does real work, and its methods come from the
#    model_*.jl files themselves.
# --------------------------------------------------------------------------- #

module OpenAPI
abstract type APIModel end
abstract type OneOfAPIModel end
abstract type AnyOfAPIModel end
validate_properties(::Any) = nothing
validate_property(::Any, ::Any, ::Any) = nothing
check_required(::Any) = true
function property_type end
end

# Stubbed so TimeSeriesAssociation's model file `include`s without TimeZones.jl.
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
#    constructor-signature block and the `Base.@kwdef` field line write the
#    un-renderable default as the literal text "nothing". Matching is
#    line-based so the two shapes model.mustache emits -- a scalar-array field
#    carrying its parametrized type in the annotation
#    (`prop::Union{Nothing, Vector{Int64}} = nothing`) versus a `$ref`/oneOf
#    field with the type only in a trailing comment
#    (`prop = nothing # spec type: ...`) -- are both hit without guessing at
#    every container type spelling.
#
# There is deliberately no "skip and warn" outcome: text that is neither the
# unpatched `nothing` nor already the rendered default means this script's
# assumptions about the generator's output no longer hold, which must stop the
# run rather than exit 0.
#   :applied     -- was `nothing`; now holds `rendered` (line mutated).
#   :already_ok  -- already holds exactly `rendered` (idempotent re-run).
#   :mismatch    -- holds some OTHER expression (hard error).
#   :not_found   -- no line matches the field pattern at all (hard error).
# --------------------------------------------------------------------------- #

function match_and_classify!(lines, regex, value_idx, rendered; skip_if=(_ -> false))
    for i in eachindex(lines)
        skip_if(lines[i]) && continue
        m = match(regex, lines[i])
        m === nothing && continue
        current = strip(m.captures[value_idx])
        if current == "nothing"
            groups = [g === nothing ? "" : g for g in m.captures]
            groups[value_idx] = rendered
            lines[i] = join(groups)
            return :applied
        elseif current == rendered
            return :already_ok
        else
            return :mismatch
        end
    end
    return :not_found
end

function patch_field_default!(path, prop_name, rendered)
    lines = split(read(path, String), '\n')

    # The annotation can nest braces (`Vector{Int64}`), so it is matched greedily
    # rather than with `[^}]*`, which would stop at the inner closing brace. Group 4
    # is non-greedy so a trailing `# spec type: ...` comment lands in group 5.
    body_re = Regex("^(\\s*" * prop_name *
                    ")(::Union\\{.*\\})?(\\s*=\\s*)(.*?)(\\s*(?:#.*)?)\$")
    doc_re = Regex("^(\\s*" * prop_name * "=)(.*?)(,)\$")

    # A rendered composite default is itself comma-bearing (`MinMax(; min=0.9,
    # max=1.1)`), so `body_re` cannot tell its own trailing-comment tail apart from
    # the docstring line's trailing `,`. The docstring line always ends in a bare
    # comma and the struct-body line never does, so skip those here; `doc_re` owns
    # them.
    body_status = match_and_classify!(
        lines,
        body_re,
        4,
        rendered;
        skip_if=line -> endswith(rstrip(line), ",")
    )
    doc_status = match_and_classify!(lines, doc_re, 2, rendered)

    if body_status === :applied || doc_status === :applied
        write(path, join(lines, '\n'))
    end
    return (body=body_status, doc=doc_status)
end

# --------------------------------------------------------------------------- #
# Entry point
# --------------------------------------------------------------------------- #

const OK_STATUSES = (:applied, :already_ok)

function patch_all(repo_root, defaults)
    applied = 0
    already_ok = 0
    for (type_name, prop_name, json_default) in defaults
        path = find_model_file(repo_root, type_name)
        isnothing(path) && error(
            "$type_name.$prop_name: no generated model_$type_name.jl found " *
            "under any package's src/models -- the generator did not emit " *
            "this type (renamed? domain config changed?), so its composite " *
            "default cannot be materialized.",
        )
        T = getfield(Main, Symbol(type_name))
        ftype = _unwrap(OpenAPI.property_type(T, Symbol(prop_name)))
        rendered = render_default(ftype, json_default)
        status = patch_field_default!(path, prop_name, rendered)
        if !(status.body in OK_STATUSES) || !(status.doc in OK_STATUSES)
            error(
                "$type_name.$prop_name in $path: could not account for this " *
                "field's default. Expected its current text to be either the " *
                "unpatched literal `nothing` (then rewritten to `$rendered`) " *
                "or already exactly `$rendered` (idempotent re-run). Got " *
                "struct-body status=$(status.body), docstring status=" *
                "$(status.doc). The generator's output shape likely changed, " *
                "or this file was hand-edited -- this is not safe to paper " *
                "over with a warning.",
            )
        end
        if status.body === :applied || status.doc === :applied
            applied += 1
        else
            already_ok += 1
        end
    end
    @info "Composite defaults: $applied newly applied, $already_ok already " *
          "correct, $(applied + already_ok)/$(length(defaults)) accounted for"
    return
end

function main(repo_root, schema_dir)
    defaults = collect_composite_defaults(schema_dir)
    if isempty(defaults)
        error(
            "No composite/array defaults found in the SiennaSchemas bundles -- " *
            "expected at least the known TransformerCircuit/Source/*.requirements " *
            "cases, so this almost certainly means the bundles are missing or stale.",
        )
    end

    load_all_models(repo_root)
    # `include()` above adds every struct's `property_type` in a world age newer than
    # the one this body was specialized against, so `patch_all` must re-dispatch.
    Base.invokelatest(patch_all, repo_root, defaults)
    return
end

if abspath(PROGRAM_FILE) == @__FILE__
    main(REPO, SCHEMA_DIR)
end
