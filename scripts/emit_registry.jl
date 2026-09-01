# Emits `register.jl` for one domain package: the calls that make that domain's model types
# resolvable by name when reading a SystemDocument.
#
# Sibling of emit_units.jl, and included by reorganize.jl the same way.
#
# Why registration happens in `__init__` rather than at include time: the registry Dict lives
# in InfrastructureCoreOpenAPIModels, and mutations one module makes to another module's
# global state during precompilation are not saved. Registering at include time would leave
# the registry empty at runtime.

"""
Model types a generated file declares: `mutable struct <Name> <: OpenAPI.<Something>`.

Matches the declaration rather than the filename because the generator emits three shapes
into `models/`, and only structs are registrable:

  * `Base.@kwdef mutable struct ACBus <: OpenAPI.APIModel` — an ordinary component
  * `mutable struct ValueCurve <: OpenAPI.OneOfAPIModel` — a oneOf wrapper (still an APIModel)
  * `const ACBusType = String` — an enum alias, not a model

Deliberately unanchored, so the `Base.@kwdef ` prefix does not hide a match. This mirrors how
reorganize.jl extracts its export list from the same files.
"""
function model_types_in(path)
    names = String[]
    for line in eachline(path)
        m = match(r"mutable struct ([A-Za-z0-9_]+) *<: *OpenAPI\.", line)
        m === nothing && continue
        push!(names, m.captures[1])
    end
    return names
end

"""
Write `register.jl` into `dest_dir` for `domain`, registering every model type the package's
`models/` directory declares.

Scans the copied files rather than the generator's output, so a type skipped as a Core
duplicate is not re-registered by the domain that also declares it.

Returns whether a file was written.
"""
function emit_registry_for(domain, dest_dir; accessor_module = "InfrastructureCoreOpenAPIModels")
    models_dir = joinpath(dest_dir, "models")
    isdir(models_dir) || return false

    type_names = String[]
    for f in sort(readdir(models_dir))
        endswith(f, ".jl") || continue
        append!(type_names, model_types_in(joinpath(models_dir, f)))
    end
    isempty(type_names) && return false

    prefix = ""
    if domain != "infrastructure-core"
        prefix = "$accessor_module."
    end
    open(joinpath(dest_dir, "register.jl"), "w") do io
        println(io, "# Generated from the declared model types. Do not edit.")
        println(io, "#")
        println(io, "# Runs in __init__ because the registry lives in another module: state")
        println(io, "# mutated there during precompilation would not be saved.")
        println(io)
        println(io, "function __init__()")
        for name in sort(unique(type_names))
            println(io, "    $(prefix)register_model_type!($name)")
        end
        println(io, "    return nothing")
        println(io, "end")
    end
    return true
end
