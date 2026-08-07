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
        # A missing bundle means this domain's composite defaults are entirely
        # invisible to the sweep below -- silently skipping it would leave
        # every one of that domain's fields unmaterialized without a trace.
        # `make generate` now rebuilds these right before this script runs
        # (see Makefile); if one is still missing here, that rebuild step
        # itself is broken and must not be treated as "no defaults to fix".
        isfile(bundle) || error(
            "No bundled spec for domain \"$domain\" at $bundle. Run " *
            "`python3 scripts/bundle_specs.py` in $schema_dir (or let " *
            "`make generate` do it) before materialize_defaults.jl.",
        )
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
#
# Every line is classified into exactly one of three outcomes -- there is no
# fourth "skip and warn" outcome. A field whose current text is neither the
# unpatched `nothing` nor already exactly the rendered default is a sign this
# script's assumptions about the generator's output shape no longer hold, and
# that must stop the run, not print a warning next to an exit code of 0: that
# is precisely the silent-divergence failure mode this whole effort exists to
# eliminate.
#   :applied     -- was `nothing`; now holds `rendered` (line mutated).
#   :already_ok  -- already holds exactly `rendered` (idempotent re-run).
#   :mismatch    -- holds some OTHER expression (unexpected; hard error).
#   :not_found   -- no line in the file matches the field pattern at all
#                   (unexpected; hard error).
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

    # The annotation itself can nest braces (`Vector{Int64}`, `Dict{String,
    # MinMax}`), so it is matched greedily rather than with a `[^}]*`
    # character class, which would stop at the first, inner, closing brace.
    # Group 4 (the current default expression) is intentionally non-greedy so
    # backtracking hands the trailing `# spec type: ...` comment, if any, to
    # group 5 instead of swallowing it into the value.
    body_re =
        Regex("^(\\s*" * prop_name * ")(::Union\\{.*\\})?(\\s*=\\s*)(.*?)(\\s*(?:#.*)?)\$")
    doc_re = Regex("^(\\s*" * prop_name * "=)(.*?)(,)\$")

    # A rendered composite default is itself a comma-bearing expression (e.g.
    # `MinMax(; min=0.9, max=1.1)`), so once group 4 above is allowed to match
    # anything (needed to detect "already correct", not just literal
    # `nothing`), `body_re` alone can no longer tell its own trailing-comment
    # tail apart from the docstring line's trailing `,` -- both would let
    # group 4 swallow up to end-of-line. The docstring line always ends in a
    # bare comma and the struct-body line never does, so skip any
    # comma-terminated line in the body scan; `doc_re` is what that line
    # belongs to.
    body_status = match_and_classify!(
        lines,
        body_re,
        4,
        rendered;
        skip_if=line -> endswith(rstrip(line), ","),
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
    # `load_all_models` ran via `include()` inside `main`'s own call frame, so
    # the methods those files add (every struct's `property_type`) exist in a
    # world age newer than the one `main`'s compiled body was specialized
    # against. `invokelatest` re-dispatches against the current world age.
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
    total = applied + already_ok
    if total != length(defaults)
        error(
            "Accounted for $total/$(length(defaults)) composite defaults but " *
            "expected all of them -- this indicates a bug in this script's " *
            "own bookkeeping, not a data problem, since every iteration " *
            "above either errors or increments one of the two counters.",
        )
    end
    @info "Composite defaults: $applied newly applied, $already_ok already " *
          "correct, $total/$(length(defaults)) accounted for"
    return
end

function main(repo_root, schema_dir)
    defaults = collect_composite_defaults(schema_dir)
    if isempty(defaults)
        error(
            "No composite/array defaults found in the SiennaSchemas bundles " *
            "-- expected at least the known TransformerCircuit/Source/" *
            "*.requirements cases. An empty result here is far more likely " *
            "to mean the bundled specs are missing or stale than that the " *
            "defect this script exists to fix has disappeared.",
        )
    end

    load_all_models(repo_root)
    Base.invokelatest(patch_all, repo_root, defaults)
    return
end

if abspath(PROGRAM_FILE) == @__FILE__
    main(REPO, SCHEMA_DIR)
end
