#!/usr/bin/env julia
# Emit unit annotations from SiennaSchemas into each generated package.
#
# openapi-generator drops x-unit / x-units / x-unit-base vendor extensions, so the
# generated structs carry units only as prose in docstrings. This reads the bundled
# specs plus Core/units.json and emits the annotations as methods, keeping units and
# structs in lockstep because both come out of the same generation run.
#
# Non-core packages emit QUALIFIED definitions. An unqualified `has_declared_unit(...)`
# inside a package that only does `using PowerCoreOpenAPIModels` defines a new local
# function instead of extending Core's, and every lookup through PC would miss it.

import JSON

const DOMAIN_TO_PKG = Dict(
    "infrastructure-core" => "InfrastructureCoreOpenAPIModels.jl",
    "timeseries" => "InfrastructureTimeSeriesOpenAPIModels.jl",
    "core" => "PowerCoreOpenAPIModels.jl",
    "operations" => "PowerOperationsOpenAPIModels.jl",
    "investments" => "PowerInvestmentsOpenAPIModels.jl",
    "dynamics" => "PowerDynamicsOpenAPIModels.jl",
)

const UNIT_EXPORTS = [
    "has_declared_unit",
    "declared_unit",
    "declared_quantity",
    "has_unit_base",
    "unit_base",
    "has_conversion_factor",
    "conversion_factor",
    "UNIT_VOCABULARY",
]

# A unit string can belong to several quantity types with DIFFERENT conversion
# factors ("m": Length 0.001, Elevation 1.0), so the unit alone cannot always
# identify the quantity. The schemas declare the answer with `x-quantity` --
# see SiennaSchemas docs/UNIT_ANNOTATIONS.md rule 7 -- and this file no longer
# carries a lookup table of its own. Where no declaration is present, an
# ambiguous branch is resolved from the unambiguous branches beside it in the
# same `x-units` map; generation still fails rather than guessing when neither
# route settles it.

_is_convertible(::Nothing) = false
_is_convertible(factor::Real) = !iszero(factor)

"""
Read Core/units.json into a `(quantity_type, unit) => factor` map plus a
`unit => [quantity_type]` index used to resolve a property's quantity.
"""
function load_unit_vocabulary(units_path)
    raw = JSON.parsefile(units_path)
    factors = Dict{Tuple{String, String}, Float64}()
    by_unit = Dict{String, Vector{String}}()
    for entry in raw["allowed_units"]
        quantity = String(entry["quantity_type"])
        unit = String(entry["unit"])
        factor = entry["to_default"]
        push!(get!(by_unit, unit, String[]), quantity)
        if _is_convertible(factor)
            factors[(quantity, unit)] = Float64(factor)
        end
    end
    return factors, by_unit
end

"""
Quantities inferable from the unambiguous branches of one `x-units` map.

A branch whose unit names exactly one quantity pins that quantity for the map;
an ambiguous branch beside it then means the same thing. `{NATURAL_UNITS: MW, COMPONENT_BASE: pu}` is the pattern every power-family field uses, and it needs
no declaration.

The pin must also be a candidate for every ambiguous branch in the map, or
nothing is inferred. Without that guard the COMPONENT_MVAR shunt bases mislead
it: a magnetizing shunt's `{S, MVAr, pu}` pins ReactivePower off the MVAr
branch, but the property is a Susceptance. Those declare `x-quantity`.
"""
function infer_quantities(by_unit, xunits)
    leaves = [v for v in values(xunits) if v isa AbstractString]
    pins = unique([
        unique(by_unit[v])[1] for
        v in leaves if haskey(by_unit, v) && length(unique(by_unit[v])) == 1
    ])
    ambiguous = [v for v in leaves if haskey(by_unit, v) && length(unique(by_unit[v])) > 1]
    resolved = Dict{String, String}()
    usable = length(pins) == 1 && all(pins[1] in unique(by_unit[v]) for v in ambiguous)
    for v in values(xunits)
        if v isa AbstractDict && haskey(v, "x-units")
            merge!(resolved, infer_quantities(by_unit, v["x-units"]))
        elseif usable && v isa AbstractString && v in ambiguous
            resolved[String(v)] = pins[1]
        end
    end
    return resolved
end

"""
The quantity a property declares for `unit`, or `nothing`.

`x-quantity` is either a quantity-type string — every ambiguous unit on the
property means that quantity — or a unit-to-quantity object, for a property
whose branches disagree: a VSC setpoint reads as a power factor on one control
mode and a per-unit voltage on another.
"""
declared_quantity_for(declared::Nothing, unit) = nothing
declared_quantity_for(declared::AbstractString, unit) = String(declared)
function declared_quantity_for(declared::AbstractDict, unit)
    if haskey(declared, unit)
        return String(declared[unit])
    end
    return nothing
end

function resolve_quantity(
    by_unit,
    type_name,
    prop,
    unit;
    declared=nothing,
    inferred=nothing,
)
    if !haskey(by_unit, unit)
        error("$type_name.$prop declares x-unit=\"$unit\", which is absent from units.json")
    end
    quantities = unique(by_unit[unit])
    if length(quantities) == 1
        return quantities[1]
    end
    # More than one quantity is registered for this unit. A shared conversion
    # factor would make the arithmetic work out the same either way, but it does
    # not make the label correct, so it is not grounds for a guess. The schema's
    # own x-quantity settles it; failing that, the sibling branches may.
    from_schema = declared_quantity_for(declared, unit)
    if !isnothing(from_schema)
        return from_schema
    end
    if !isnothing(inferred) && haskey(inferred, unit)
        return inferred[unit]
    end
    error(
        "$type_name.$prop declares ambiguous x-unit=\"$unit\" across quantities " *
        "[$(join(quantities, ", "))], and no sibling branch settles it. " *
        "Declare \"x-quantity\" on that property in the schemas.",
    )
end

function emit_vocabulary(io, factors)
    println(io, "const UNIT_VOCABULARY = Dict{Tuple{String, String}, Float64}(")
    for key in sort!(collect(keys(factors)))
        println(io, "    (\"", key[1], "\", \"", key[2], "\") => ", factors[key], ",")
    end
    println(io, ")")
    println(io)
    println(
        io,
        "has_conversion_factor(q::AbstractString, u::AbstractString) = " *
        "haskey(UNIT_VOCABULARY, (String(q), String(u)))",
    )
    println(
        io,
        "conversion_factor(q::AbstractString, u::AbstractString) = " *
        "UNIT_VOCABULARY[(String(q), String(u))]",
    )
    println(io)
    return
end

function emit_fallbacks(io)
    # Unconstrained: the native (post-1.0) generator gives every schema the same plain
    # `struct` shape, with no common supertype like the old `OpenAPI.APIModel` to bound
    # these against. The fallback only ever needs to lose to a more specific method a
    # domain package defines for its own concrete type, so an unconstrained `Type`/free `T`
    # is exactly as selective as `<: OpenAPI.APIModel` was in practice.
    println(io, "has_declared_unit(::Type, ::Val) = false")
    println(io, "has_unit_base(::Type, ::Val) = false")
    println(io, "has_declared_unit(o::T, v::Val) where {T} = has_declared_unit(T, v)")
    println(io)
    # The accessors need a generic method in Core even though it only ever
    # throws: the domain packages extend them by qualified name, which requires
    # the binding to already exist here. Guard with the has_* predicate.
    for (accessor, subject) in (
        ("declared_unit", "no declared unit"),
        ("declared_quantity", "no declared quantity"),
        ("unit_base", "no unit base"),
    )
        println(io, "function $accessor(::Type{T}, ::Val{P}) where {T, P}")
        println(io, "    error(\"\$(nameof(T)).\$P has $subject\")")
        println(io, "end")
    end
    println(io)
    for accessor in ("declared_unit", "declared_quantity", "unit_base")
        println(io, "$accessor(o::T, v::Val) where {T} = $accessor(T, v)")
    end
    println(io)
    return
end

function emit_fixed(io, prefix, type_name, prop, unit, quantity)
    println(io, "$(prefix)has_declared_unit(::Type{$type_name}, ::Val{:$prop}) = true")
    println(io, "$(prefix)declared_unit(::Type{$type_name}, ::Val{:$prop}) = \"$unit\"")
    println(
        io,
        "$(prefix)declared_quantity(::Type{$type_name}, ::Val{:$prop}) = \"$quantity\"",
    )
    return
end

"""
One resolved `x-units` branch that bottoms out at a concrete unit/quantity
pair, keyed by its own discriminator value. With `NestedBranch` below, this
lets the walk resolve an `x-units` map to any depth, not just the two levels
every property uses today.
"""
struct LeafBranch
    key::String
    unit::String
    quantity::String
end

"""
One resolved `x-units` branch whose value is itself a nested
`{x-unit-discriminator, x-units}` object rather than a leaf unit string — the
VSC converter setpoints being the schema's current example, where control mode
selects a further `voltage_units` discriminator on its voltage-control branches.
"""
struct NestedBranch
    key::String
    discriminator::String
    branches::Vector{Any}
end

build_branch(by_unit, type_name, prop, key, unit::AbstractString, declared, inferred) =
    LeafBranch(
        key,
        String(unit),
        resolve_quantity(
            by_unit,
            type_name,
            prop,
            String(unit);
            declared=declared,
            inferred=inferred,
        ),
    )

function build_branch(
    by_unit,
    type_name,
    prop,
    key,
    nested::AbstractDict,
    declared,
    inferred,
)
    disc = nested["x-unit-discriminator"]
    return NestedBranch(
        key,
        disc,
        build_branches(by_unit, type_name, prop, nested["x-units"], declared),
    )
end

"""
Inference is scoped to one `x-units` map, so each nesting level recomputes it
from its own branches before resolving them.
"""
function build_branches(by_unit, type_name, prop, xunits, declared=nothing)
    inferred = infer_quantities(by_unit, xunits)
    branches = Any[]
    for (key, value) in pairs(xunits)
        push!(
            branches,
            build_branch(by_unit, type_name, prop, String(key), value, declared, inferred),
        )
    end
    return branches
end

leaf_value(b::LeafBranch, ::Val{:unit}) = b.unit
leaf_value(b::LeafBranch, ::Val{:quantity}) = b.quantity

function emit_branch_interior(io, type_name, prop, b::LeafBranch, kind, level)
    pad = "    "^level
    println(io, "$(pad)return \"$(leaf_value(b, kind))\"")
    return
end

function emit_branch_interior(io, type_name, prop, b::NestedBranch, kind, level)
    emit_branches(io, type_name, prop, b.branches, b.discriminator, kind, level)
    pad = "    "^level
    println(
        io,
        "$(pad)error(\"$type_name.$prop: no unit declared for $(b.discriminator)=\$(o.$(b.discriminator))\")",
    )
    return
end

function emit_branches(io, type_name, prop, branches, disc, kind, level)
    pad = "    "^level
    for b in branches
        println(io, "$(pad)if string(o.$disc) == \"$(b.key)\"")
        emit_branch_interior(io, type_name, prop, b, kind, level + 1)
        println(io, "$(pad)end")
    end
    return
end

"""
Emit instance-dispatched unit and quantity accessors for an `x-units`
property, recursing through any nested discriminators. TransformerCircuit's
controlled_quantity_limits (flat) maps pu / MVAr / MW to Voltage,
ReactivePower and ActivePower; a VSC converter setpoint (nested) additionally
resolves an inner voltage-basis discriminator for its voltage-control
branches.
"""
function emit_discriminated(io, prefix, by_unit, type_name, prop, spec)
    disc = spec["x-unit-discriminator"]
    branches = build_branches(
        by_unit,
        type_name,
        prop,
        spec["x-units"],
        get(spec, "x-quantity", nothing),
    )
    if isempty(branches)
        return false
    end

    println(io, "$(prefix)has_declared_unit(::Type{$type_name}, ::Val{:$prop}) = true")
    for (accessor, kind) in
        (("declared_unit", Val(:unit)), ("declared_quantity", Val(:quantity)))
        println(io, "function $(prefix)$(accessor)(o::$type_name, ::Val{:$prop})")
        emit_branches(io, type_name, prop, branches, disc, kind, 1)
        println(
            io,
            "    error(\"$type_name.$prop: no unit declared for $disc=\$(o.$disc)\")",
        )
        println(io, "end")
    end
    return true
end

function emit_type(io, prefix, by_unit, type_name, schema)
    properties = get(schema, "properties", nothing)
    if isnothing(properties)
        return
    end
    for (prop, spec) in pairs(properties)
        if !(spec isa AbstractDict)
            continue
        end
        discriminated = false
        if haskey(spec, "x-units") && haskey(spec, "x-unit-discriminator")
            discriminated = emit_discriminated(io, prefix, by_unit, type_name, prop, spec)
        end
        if !discriminated && haskey(spec, "x-unit") && spec["x-unit"] isa AbstractString
            unit = String(spec["x-unit"])
            emit_fixed(
                io,
                prefix,
                type_name,
                prop,
                unit,
                resolve_quantity(
                    by_unit,
                    type_name,
                    prop,
                    unit;
                    declared=get(spec, "x-quantity", nothing),
                ),
            )
        end
        if haskey(spec, "x-unit-base")
            println(io, "$(prefix)has_unit_base(::Type{$type_name}, ::Val{:$prop}) = true")
            println(
                io,
                "$(prefix)unit_base(::Type{$type_name}, ::Val{:$prop}) = :$(spec["x-unit-base"])",
            )
        end
    end
    return
end

"""
Write `<package>/src/units.jl` for one domain. Returns true if a file was written.
"""
function emit_units_for(
    domain,
    dest_dir,
    schema_dir,
    factors,
    by_unit;
    accessor_module="InfrastructureCoreOpenAPIModels",
)
    bundle = joinpath(schema_dir, "dist", "openapi-$domain-bundled.json")
    if !isfile(bundle)
        @warn "No bundled spec for $domain at $bundle; skipping unit emission"
        return false
    end
    spec = JSON.parsefile(bundle)
    prefix = ""
    if domain != "infrastructure-core"
        prefix = "$accessor_module."
    end
    open(joinpath(dest_dir, "units.jl"), "w") do io
        println(io, "# Generated from SiennaSchemas x-unit annotations. Do not edit.")
        println(io)
        if domain == "infrastructure-core"
            emit_vocabulary(io, factors)
            emit_fallbacks(io)
        end
        for (type_name, schema) in pairs(spec["components"]["schemas"])
            emit_type(io, prefix, by_unit, type_name, schema)
        end
    end
    return true
end

"""
Standalone entry point: emit units.jl for every domain without running codegen.
"""
function emit_units(schema_dir, repo_root)
    factors, by_unit = load_unit_vocabulary(joinpath(schema_dir, "Core", "units.json"))
    for (domain, pkg) in DOMAIN_TO_PKG
        dest = joinpath(repo_root, pkg, "src")
        isdir(dest) || continue
        if emit_units_for(domain, dest, schema_dir, factors, by_unit)
            @info "Wrote $(joinpath(dest, "units.jl"))"
        end
    end
    return
end
