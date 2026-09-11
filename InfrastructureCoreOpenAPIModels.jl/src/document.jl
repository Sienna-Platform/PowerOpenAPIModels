# Hand-written (NOT generated): the cross-domain model-type registry.
#
# `SystemDocument` itself (and its JSON I/O) lives in the umbrella `PowerOpenAPIModels`
# package, not here: it references types from every domain (Operations, Investments,
# Dynamics, TimeSeries), and Core must stay dependency-free. This registry is the piece
# that genuinely belongs in Core: `scripts/emit_registry.jl` generates one `register.jl`
# per domain package (including Core's own) that calls `register_model_type!` in
# `__init__`, and every one of those calls — Core's own included, unqualified — targets
# THIS module. Moving the registry itself out of Core would break every domain package's
# ability to load standalone, independent of whether the umbrella is ever loaded.
#
# `scripts/reorganize.jl` emits the `include` for this file, so a regeneration keeps it.

"""
Raised for any malformed document: a missing required field, an unregistered type name,
an unresolved reference, or a duplicate id.
"""
struct DocumentFormatError <: Exception
    msg::String
end

Base.showerror(io::IO, e::DocumentFormatError) = print(io, "DocumentFormatError: ", e.msg)

# ── type registry ────────────────────────────────────────────────────────────────
# Type name -> OpenAPI model type, so `read_document` can turn a `components` bucket into
# concrete structs. Populated from each domain package's `__init__` rather than at include
# time: mutations another module makes to this Dict during its precompilation are not saved,
# so include-time registration would leave the registry empty at runtime.

const MODEL_TYPES = Dict{String, Type}()

"""
Register `T` under its bare type name so documents naming it can be deserialized.

Called from each domain package's generated `register.jl`, which enumerates a frozen name
set rather than filtering by a common supertype: the native (post-1.0) generator gives every
schema -- component and small value type alike -- the same plain `struct` shape, with no
marker like the old `OpenAPI.APIModel` distinguishing one from the other.

Re-registering the same type is a no-op; two different types with one name is a build error,
not something to resolve at read time.
"""
function register_model_type!(::Type{T}) where {T}
    name = string(nameof(T))
    if haskey(MODEL_TYPES, name) && MODEL_TYPES[name] !== T
        throw(
            DocumentFormatError(
                "two OpenAPI model types are named \"$name\": $(MODEL_TYPES[name]) and $T",
            ),
        )
    end
    MODEL_TYPES[name] = T
    return nothing
end

"""
Whether a model type is registered under `name`.
"""
has_model_type(name::AbstractString) = haskey(MODEL_TYPES, String(name))

"""
The model type registered under `name`.

Errors naming the value rather than skipping it: a document that names a type this build has
no model for cannot be read faithfully, and dropping the rows would lose data silently.
"""
function model_type(name::AbstractString)
    key = String(name)
    if !haskey(MODEL_TYPES, key)
        throw(
            DocumentFormatError(
                "no registered OpenAPI model type named \"$key\" — is the domain package " *
                "that defines it loaded? $(length(MODEL_TYPES)) type(s) are registered",
            ),
        )
    end
    return MODEL_TYPES[key]
end
