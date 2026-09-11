# Re-establishes the abstract types that OpenAPI.jl 0.2 gave generated models and 1.x does
# not. The native generator emits every schema as a bare `struct X` / `Base.@kwdef struct X`
# with no supertype, which removed two dispatch points the rest of the Sienna stack was
# written against:
#
#   PowerSystems.jl  convert_cost(w::OpenAPI.OneOfAPIModel) = convert_cost(w.value)
#                    _unwrap_oneof(x::OpenAPI.OneOfAPIModel) = _unwrap_oneof(x.value)
#                    attribute_rows = OpenAPI.APIModel[]
#   PowerSystemsUpdater / PowerTableDataParser / PowerFlowFileParser
#                    Vector{OpenAPI.APIModel}, where {T <: OpenAPI.APIModel}
#
# Without a supertype those become `Vector{Any}` and untyped parameters, and the two
# `oneOf`-unwrapping methods above lose the only thing that selected them -- a consumer would
# have to fall back to `isa` chains or a hand-maintained `Union{...}` alias enumerating
# concrete generated types, both of which this stack explicitly rejects in favour of multiple
# dispatch. Emitting the supertypes here restores dispatch for every consumer at once instead
# of pushing a workaround into each of five repos.
#
# Purely additive: it changes no field, constructor, or serde behaviour, and `_decode`/
# `_encode` dispatch on `::Type{X}` either way.

# Definitions injected into InfrastructureCoreOpenAPIModels, the base every other package
# already `using`s, so the names are in scope wherever a model struct is defined.
const SUPERTYPE_DEFINITIONS = """
\"\"\"
Supertype of every generated transport struct, restoring the marker OpenAPI.jl 0.2 provided
as `OpenAPI.APIModel`. Lets a consumer hold a heterogeneous collection of components
(`APIModel[]`) and constrain a type parameter (`where {T <: APIModel}`) instead of falling
back to `Any`.
\"\"\"
abstract type APIModel end

\"\"\"
Supertype of the generated `oneOf`/`anyOf` wrapper structs, whose sole `value` field holds
the variant the document's discriminator selected. Dispatching on this is how a consumer
unwraps a wrapper without enumerating its members.
\"\"\"
abstract type OneOfAPIModel <: APIModel end

\"\"\"
Supertype of the generated enum wrapper structs, whose `value` field holds a validated
string. Kept distinct from `OneOfAPIModel` because both shapes carry a `value` field, and a
method meant to unwrap a discriminated union must not also catch an enum.
\"\"\"
abstract type EnumAPIModel <: APIModel end

\"\"\"
    decode(T, value[, validate])

Build a `T` from parsed JSON data (a scalar, `Vector`, or `AbstractDict`), replacing
OpenAPI.jl 0.2's `OpenAPI.from_json`. `validate` defaults to true, which checks the value
against the schema the generated package embeds.

A thin public alias for the runtime's `_decode`: consumers need this entry point (to read a
store's catalog rows, or to build a strictly-typed generated struct from hand-assembled
keyword arguments), and without it every one of them reaches into an underscore-internal of
another package.
\"\"\"
decode(::Type{T}, value) where {T} = _decode(T, value)
decode(::Type{T}, value, validate::Bool) where {T} = _decode(T, value, validate)

\"\"\"
    encode(value)

Reduce a generated model to JSON-ready data, replacing OpenAPI.jl 0.2's `OpenAPI.to_json`.
The public alias for the runtime's `_encode`, for the same reason as `decode`.
\"\"\"
encode(value) = _encode(value)
"""

const SUPERTYPE_EXPORTS =
    ["APIModel", "OneOfAPIModel", "EnumAPIModel", "decode", "encode"]

"""
Add the right supertype to a chunk's `struct` declaration.

Three generated shapes, told apart the same way `emit_docs.jl` does:

  - `Base.@kwdef struct X` -- an object schema -> `APIModel`
  - `struct X` with an `value in (...)` inner constructor -- a string enum -> `EnumAPIModel`
  - `struct X` with a bare `value::Union{...}` -- a `oneOf` wrapper -> `OneOfAPIModel`

A `const X = ...` chunk (a plain type alias) has no declaration to annotate and is returned
unchanged.
"""
function add_supertype(text::AbstractString)
    if occursin(r"^Base\.@kwdef struct \w+$"m, text)
        return replace(
            text,
            r"^(Base\.@kwdef struct \w+)$"m => s"\1 <: APIModel";
            count=1,
        )
    end
    occursin(r"^struct \w+$"m, text) || return text
    super = "OneOfAPIModel"
    if occursin(ENUM_CTOR_RE, text)
        super = "EnumAPIModel"
    end
    return replace(text, r"^(struct \w+)$"m => SubstitutionString("\\1 <: $super"); count=1)
end
