#!/usr/bin/env julia
# Replace the per-call `eval(Base.Meta.parse(...))` OpenAPI.property_type mechanism that
# openapi-generator's julia-client template emits for every model with a precomputed,
# eagerly-built `Dict{Symbol,Type}` lookup.
#
# Root cause (see PowerOpenAPIModels#7): every generated model emits
#   const _property_types_M = Dict{Symbol,String}(Symbol("f")=>"T", ...)
#   OpenAPI.property_type(::Type{M}, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_M[name]))}
# so every field access on every from_json call re-parses and re-evaluates a type-name
# string from scratch. Profiling (see the PR body) found this dominates from_json: ~93% of
# a warm from_json(SingleTimeSeries, row) call and ~97% of its allocations, with the cost
# per field scaling with the type string's syntactic complexity (a bare "String" is ~2.3us;
# a nested "Dict{String, X}" is ~65us, because Meta.parse re-tokenizes the whole expression
# every call).
#
# This script parses each type string ONCE, here, and splices the resulting literal type
# expression into the const dict as an already-Union{Nothing,...}-wrapped `Type` value, so
# the property_type method becomes a plain, zero-parse Dict lookup:
#   const _property_types_M = Dict{Symbol,Type}(Symbol("f")=>Union{Nothing, T}, ...)
#   OpenAPI.property_type(::Type{M}, name::Symbol) = _property_types_M[name]
# Same 2-arg signature, same returned Union type for every field -- OpenAPI.jl call sites
# are unchanged.
#
# oneOf discriminator files (e.g. model_TimeSeriesAssociation.jl) use the same
# `eval(Base.Meta.parse("Literal"))` pattern inline, one call per discriminator branch, in
# the body of a 3-arg `OpenAPI.property_type(::Type{M}, name::Symbol, json::Dict)` method.
# Those calls are already inside a function body (resolved lazily, at call time, not at
# `include()` time), so they need no include-order care -- they are fixed by literal
# substitution of `eval(Base.Meta.parse("X"))` -> `(X)`.
#
# ORDERING HAZARD: the property-type dict entries are the ONLY reason a model's generated
# struct field is deliberately left widened (e.g. `features::Union{Nothing, Dict}` with the
# real `Dict{String, TimeSeriesFeatureValue}` only in a trailing comment) -- the generator
# cannot forward-reference a sibling model type that alphabetically sorts after the
# referencing file, so it defers to a runtime string instead. Splicing the literal type
# into a *top-level* `const` (evaluated at `include()` time, unlike a function body) makes
# that forward reference into a real problem: if `model_SingleTimeSeries.jl` is `include`d
# before `model_TimeSeriesFeatureValue.jl` (true under the current plain alphabetical
# order), `Union{Nothing, Dict{String, TimeSeriesFeatureValue}}` throws `UndefVarError`.
# So this script also computes, per package, a dependency-respecting topological order over
# the sibling-type references it finds in each file's property-type dict, and rewrites that
# package's module file's `include("models/...")` block to match (ties broken
# alphabetically, for a deterministic, reviewable diff). Checked empirically against every
# package in this repo: the sibling-reference graph is acyclic everywhere (Core needs the
# most reordering: 26 file pairs), so a valid order always exists; a genuine cycle is a hard
# error (see `topo_sort`), not something this script can paper over.
#
# Run by `make generate`, LAST -- strictly after scripts/reorganize.jl (places model files
# into their package dirs and writes each package's module file with a plain alphabetical
# include list) and after scripts/materialize_defaults.jl (patches composite field defaults
# using the *original* order-agnostic string/eval property_type mechanism -- it must run
# before this script flips that mechanism to an eager, order-sensitive one).
#
# Deterministic and idempotent: every entry point below distinguishes "already in the
# rewritten form" from "still in the original generator form" and treats the former as a
# no-op, not an error; re-running against already-rewritten files makes no further changes.
# Every string this script cannot account for (fails to parse, fails to load) is a hard
# error -- there is no "skip and warn" outcome.

const REPO = dirname(@__DIR__)

const DOMAIN_TO_PKG = Dict(
    "infrastructure-core" => "InfrastructureCoreOpenAPIModels.jl",
    "timeseries" => "InfrastructureTimeSeriesOpenAPIModels.jl",
    "core" => "PowerCoreOpenAPIModels.jl",
    "operations" => "PowerOperationsOpenAPIModels.jl",
    "investments" => "PowerInvestmentsOpenAPIModels.jl",
    "dynamics" => "PowerDynamicsOpenAPIModels.jl",
)
# Matches scripts/reorganize.jl's base chain: a base must be fully rewritten (and thus
# load-testable) before any domain that references its types.
const DOMAIN_ORDER =
    ["infrastructure-core", "timeseries", "core", "operations", "investments", "dynamics"]

# --------------------------------------------------------------------------- #
# 1. Locate the model's own type name (struct or plain alias/enum) so we know
#    which dependency-graph node a file is, and can name it in error messages.
# --------------------------------------------------------------------------- #

function model_type_name(text)
    m = match(r"mutable struct (\w+)", text)
    m !== nothing && return m.captures[1]
    for line in split(text, '\n')
        m2 = match(r"^\s*const (\w+) = ", line)
        m2 !== nothing && return m2.captures[1]
    end
    return nothing
end

# --------------------------------------------------------------------------- #
# 2. Parse a model's `const _property_types_M = Dict{Symbol,String|Type}(...)`
#    line, in either the original (String values) or already-rewritten (Type
#    values) form. Returns `nothing` if the file has no such line at all
#    (oneOf/anyOf wrappers and plain enum aliases legitimately don't).
# --------------------------------------------------------------------------- #

function find_dict_line(lines)
    for (i, line) in enumerate(lines)
        m = match(r"^const (_property_types_\w+) = (Dict\{Symbol,\s*(?:String|Type)\}\(.*\))\s*$", line)
        m !== nothing && return (i, m.captures[1], m.captures[2])
    end
    return nothing
end

function parse_dict_entries(path, varname, rhs_text)
    ex = Meta.parse(rhs_text)
    (ex isa Expr && ex.head === :call) ||
        error("$path: $varname RHS is not a call expression: $rhs_text")
    dict_type_expr = ex.args[1]
    form = if dict_type_expr isa Expr && dict_type_expr.head === :curly &&
              dict_type_expr.args == [:Dict, :Symbol, :String]
        :old
    elseif dict_type_expr isa Expr && dict_type_expr.head === :curly &&
           dict_type_expr.args == [:Dict, :Symbol, :Type]
        :new
    else
        error("$path: $varname has an unexpected dict type parameterization: $dict_type_expr")
    end

    entries = Tuple{String, String}[]  # (field, canonical Julia source for the field's type)
    for a in ex.args[2:end]
        (a isa Expr && a.head === :call && length(a.args) == 3 && a.args[1] === :(=>)) ||
            error("$path: $varname has an unexpected dict entry shape: $a")
        key_expr, val_expr = a.args[2], a.args[3]
        (key_expr isa Expr && key_expr.head === :call && length(key_expr.args) == 2 &&
         key_expr.args[1] === :Symbol && key_expr.args[2] isa String) ||
            error("$path: $varname has an unexpected dict key shape: $key_expr")
        field = key_expr.args[2]

        type_string = if form === :old
            val_expr isa String ||
                error("$path: $varname.$field: expected a String literal type-name value, got: $val_expr")
            val_expr
        else
            (val_expr isa Expr && val_expr.head === :curly && length(val_expr.args) == 3 &&
             val_expr.args[1] === :Union && val_expr.args[2] === :Nothing) ||
                error("$path: $varname.$field: expected Union{Nothing, T}, got: $val_expr")
            string(val_expr.args[3])
        end

        # Fails loudly on a string this script cannot even parse as a type expression --
        # required by design, not just a nice-to-have: a bad string here would otherwise
        # surface later as a cryptic UndefVarError deep in the load-test or, worse, only at
        # package precompile time downstream.
        try
            Meta.parse(type_string)
        catch e
            error("$path: $varname.$field: type string $(repr(type_string)) does not parse " *
                  "as a Julia expression: $e")
        end

        push!(entries, (field, type_string))
    end
    return form, entries
end

render_new_dict(varname, entries) =
    "const " * varname * " = Dict{Symbol,Type}(" *
    join(("Symbol(\"$field\")=>Union{Nothing, $type_string}" for (field, type_string) in entries), ", ") *
    ", )"

# --------------------------------------------------------------------------- #
# 3. The property_type method line itself (2-arg, non-discriminator form).
# --------------------------------------------------------------------------- #

function fix_method_line!(path, lines, type_name, varname)
    old_line = "OpenAPI.property_type(::Type{ $type_name }, name::Symbol) = " *
               "Union{Nothing,eval(Base.Meta.parse($varname[name]))}"
    new_line = "OpenAPI.property_type(::Type{ $type_name }, name::Symbol) = $varname[name]"
    for i in eachindex(lines)
        if lines[i] == old_line
            lines[i] = new_line
            return :applied
        elseif lines[i] == new_line
            return :already_ok
        end
    end
    error("$path: found $varname dict but neither the old- nor new-form " *
          "OpenAPI.property_type method line for $type_name -- generator output shape " *
          "changed, or this file was hand-edited.")
end

# --------------------------------------------------------------------------- #
# 4. oneOf/anyOf discriminator branches: `eval(Base.Meta.parse("Literal"))` ->
#    `(Literal)`. These are already inside a function body (lazy), so no
#    include-order concern -- straight literal substitution.
# --------------------------------------------------------------------------- #

const DISCRIMINATOR_EVAL_RE = r"eval\(Base\.Meta\.parse\(\"([^\"]*)\"\)\)"

function fix_discriminator_evals(path, text)
    n = 0
    for m in eachmatch(DISCRIMINATOR_EVAL_RE, text)
        n += 1
        s = m.captures[1]
        try
            Meta.parse(s)
        catch e
            error("$path: discriminator literal $(repr(s)) does not parse as a Julia " *
                  "expression: $e")
        end
    end
    new_text = replace(text, DISCRIMINATOR_EVAL_RE => s"(\1)")
    return new_text, n
end

# --------------------------------------------------------------------------- #
# 5. Per-file driver.
# --------------------------------------------------------------------------- #

struct FileResult
    path::String
    type_name::Union{Nothing, String}
    entries::Vector{Tuple{String, String}}
    dict_status::Symbol      # :applied | :already_ok | :absent
    method_status::Symbol    # :applied | :already_ok | :absent
    n_discriminator_fixed::Int
end

function process_file!(path)
    text = read(path, String)
    original_text = text
    lines = String.(split(text, '\n'))

    type_name = model_type_name(text)

    entries = Tuple{String, String}[]
    dict_status = :absent
    method_status = :absent

    hit = find_dict_line(lines)
    if hit !== nothing
        i, varname, rhs = hit
        form, entries = parse_dict_entries(path, varname, rhs)
        if form === :old
            lines[i] = render_new_dict(varname, entries)
            dict_status = :applied
        else
            dict_status = :already_ok
        end
        type_name === nothing &&
            error("$path: found $varname dict but no `mutable struct` name in this file")
        method_status = fix_method_line!(path, lines, type_name, varname)
    end

    text = join(lines, '\n')
    text, n_disc = fix_discriminator_evals(path, text)

    text != original_text && write(path, text)

    return FileResult(path, type_name, entries, dict_status, method_status, n_disc)
end

# --------------------------------------------------------------------------- #
# 6. Per-package dependency graph + topological include order.
# --------------------------------------------------------------------------- #

function build_dependency_order(files, results_by_file)
    type_of_file = Dict{String, String}()
    for f in files
        tn = results_by_file[f].type_name
        tn === nothing && continue
        type_of_file[tn] = f
    end
    known_types = collect(keys(type_of_file))
    type_res = Dict(tn => Regex("\\b" * tn * "\\b") for tn in known_types)

    deps = Dict(f => Set{String}() for f in files)
    for f in files
        r = results_by_file[f]
        isempty(r.entries) && continue
        for (_, type_string) in r.entries
            for tn in known_types
                tn == r.type_name && continue
                occursin(type_res[tn], type_string) && push!(deps[f], type_of_file[tn])
            end
        end
    end
    return topo_sort(files, deps)
end

function topo_sort(files, deps)
    indeg = Dict(f => 0 for f in files)
    dependents = Dict(f => String[] for f in files)
    for f in files, dep in deps[f]
        push!(dependents[dep], f)
        indeg[f] += 1
    end
    ready = sort([f for f in files if indeg[f] == 0])
    order = String[]
    indeg2 = copy(indeg)
    while !isempty(ready)
        f = popfirst!(ready)
        push!(order, f)
        for nxt in sort(dependents[f])
            indeg2[nxt] -= 1
            indeg2[nxt] == 0 && push!(ready, nxt)
        end
        sort!(ready)
    end
    if length(order) != length(files)
        stuck = sort(basename.(setdiff(files, order)))
        error("Cyclic property-type dependency detected among: " * join(stuck, ", ") *
              " -- no include order can satisfy every forward reference. This would " *
              "require a lazy (not eager top-level const) property-type cache for the " *
              "types involved; investigate before re-running.")
    end
    return order
end

# --------------------------------------------------------------------------- #
# 7. Rewrite a package's module file's `include("models/...")` block to match
#    the computed order.
# --------------------------------------------------------------------------- #

function fix_module_include_order!(pkg_dir, mod_name, ordered_basenames)
    modfile = joinpath(pkg_dir, "src", "$mod_name.jl")
    isfile(modfile) || error("$modfile: module file not found")
    text = read(modfile, String)
    lines = String.(split(text, '\n'))

    idxs = findall(l -> match(r"^include\(\"models/.*\.jl\"\)$", l) !== nothing, lines)
    isempty(idxs) && error("$modfile: no models/ include lines found")
    idxs == collect(minimum(idxs):maximum(idxs)) ||
        error("$modfile: models/ include lines are not contiguous -- unexpected module " *
              "file shape.")

    existing = [match(r"^include\(\"models/(.*\.jl)\"\)$", lines[i]).captures[1] for i in idxs]
    Set(existing) == Set(ordered_basenames) ||
        error("$modfile: models/ include list ($(length(existing)) files) does not match " *
              "the models/ directory contents ($(length(ordered_basenames)) files) -- " *
              "regenerate before re-running this script.")

    new_lines = ["include(\"models/$b\")" for b in ordered_basenames]
    [lines[i] for i in idxs] == new_lines && return :already_ok

    lines[first(idxs):last(idxs)] = new_lines
    write(modfile, join(lines, '\n'))
    return :applied
end

# --------------------------------------------------------------------------- #
# 8. Load-test: include every rewritten model file, across every package, in
#    the computed dependency order, against a minimal OpenAPI stand-in (same
#    technique as materialize_defaults.jl). If any file's now-eager property
#    type dict references a type not yet defined, this fails loudly here --
#    the intended backstop for "fails loudly on a string it cannot resolve".
# --------------------------------------------------------------------------- #

const STUB_SOURCE = """
module OpenAPI
abstract type APIModel end
abstract type OneOfAPIModel end
abstract type AnyOfAPIModel end
struct ValidationException <: Exception
    msg::String
end
validate_properties(::Any) = nothing
validate_property(::Any, ::Any, ::Any) = nothing
check_required(::Any) = true
function property_type end
end

# Stubbed so ZonedDateTime-typed fields `include` without TimeZones.jl.
const ZonedDateTime = Nothing
"""

function make_load_test_module()
    mod = Module(:PropertyTypeLoadTest)
    # A `module` expression can only be eval'd as a standalone top-level form, not nested
    # inside a `quote` block passed to `Core.eval` -- so the stub is written out and
    # `include`d instead, exactly as any of these model files would be.
    mktemp() do path, io
        write(io, STUB_SOURCE)
        close(io)
        stub_path = path * ".jl"
        mv(path, stub_path)
        Base.include(mod, stub_path)
        rm(stub_path)
    end
    return mod
end

function load_test!(mod, ordered_paths)
    for path in ordered_paths
        try
            Base.include(mod, path)
        catch e
            @error "Load-test failed while including a rewritten model file" path
            rethrow(e)
        end
    end
end

# --------------------------------------------------------------------------- #
# Entry point
# --------------------------------------------------------------------------- #

function main(repo_root)
    n_dict_applied = 0
    n_dict_already_ok = 0
    n_method_applied = 0
    n_method_already_ok = 0
    n_discriminator_fixed = 0
    combined_test_files = String[]

    for domain in DOMAIN_ORDER
        pkg = DOMAIN_TO_PKG[domain]
        pkg_dir = joinpath(repo_root, pkg)
        model_dir = joinpath(pkg_dir, "src", "models")
        isdir(model_dir) || continue
        mod_name = replace(pkg, ".jl" => "")

        files = sort(readdir(model_dir, join = true))
        filter!(f -> endswith(f, ".jl"), files)
        isempty(files) && continue

        results_by_file = Dict{String, FileResult}()
        for f in files
            r = process_file!(f)
            results_by_file[f] = r
            r.dict_status === :applied && (n_dict_applied += 1)
            r.dict_status === :already_ok && (n_dict_already_ok += 1)
            r.method_status === :applied && (n_method_applied += 1)
            r.method_status === :already_ok && (n_method_already_ok += 1)
            n_discriminator_fixed += r.n_discriminator_fixed
        end

        ordered_files = build_dependency_order(files, results_by_file)
        status = fix_module_include_order!(pkg_dir, mod_name, basename.(ordered_files))
        @info "$pkg" files = length(files) include_order = status

        append!(combined_test_files, ordered_files)
    end

    remaining = filter(combined_test_files) do f
        occursin("eval(Base.Meta.parse", read(f, String))
    end
    isempty(remaining) || error(
        "eval(Base.Meta.parse still present after rewrite in: " * join(remaining, ", "),
    )

    @info "Property-type rewrite summary" dict_applied = n_dict_applied dict_already_ok =
        n_dict_already_ok method_applied = n_method_applied method_already_ok =
        n_method_already_ok discriminator_literals_fixed = n_discriminator_fixed

    @info "Load-testing $(length(combined_test_files)) rewritten model files in dependency order..."
    mod = make_load_test_module()
    load_test!(mod, combined_test_files)
    @info "Load-test OK: every eager property-type Dict resolved with no forward-reference errors."
    return
end

if abspath(PROGRAM_FILE) == @__FILE__
    main(REPO)
end
