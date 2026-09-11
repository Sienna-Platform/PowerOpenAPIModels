# Gives a discriminated `oneOf` wrapper's `_decode` a short-circuit for a bare primitive
# alternative, before it falls into the object/discriminator path.
#
# OpenAPI.jl's native generator represents every `oneOf` alternative uniformly as a Julia type
# in `value::Union{...}`, but its `_decode` body takes two different shapes depending on
# whether any alternative carries a discriminator:
#
#   - No discriminator at all (`TimeSeriesFeatureValue`, `anyOf: [integer, number, boolean,
#     string]`): the generator emits a decode-and-catch-`DecodeError` try per alternative, in
#     order, which already handles a bare primitive correctly.
#   - A discriminator on (at least) one object alternative (`ThermalGenerationCost.start_up`,
#     `oneOf: [number, StartUpStages]`, discriminated by `startup_stages_type`): the generator
#     instead emits `object = _object(value, "<Name>")` unconditionally, followed by
#     discriminator dispatch -- even though the schema also allows a bare primitive
#     alternative that carries no discriminator and is never an object. A legitimate
#     primitive value then fails to decode with "expected an object", which is wrong: Python's
#     datamodel-codegen output for the same schema (a plain `float | StartUpStages` union)
#     decodes it without issue, so this is a Julia-codegen gap, not a schema or fixture one.
#
# Scoped narrowly: only patches a wrapper whose decode body still has the unconditional
# `object = _object(value, "<Name>")` line (proves it takes the discriminated shape) and whose
# `value::Union{...}` carries exactly one alternative from `PRIMITIVE_ONEOF_TYPES` alongside at
# least one non-primitive (object) alternative. A `oneOf`/`anyOf` of two or more primitives, or
# of object alternatives only, is left untouched.

const PRIMITIVE_ONEOF_TYPES = ("Float64", "Int64", "Int32", "Bool", "String")

"""
Patch `text` (one generated model chunk) so `name`'s `_decode` tries the primitive branch of
its `value::Union{...}` before requiring an object. No-op unless the chunk is exactly the
one-primitive-plus-object-alternatives, discriminated-`_object`-call shape described above.
"""
function patch_primitive_oneof(text::AbstractString, name::AbstractString)
    struct_match = match(
        Regex(
            "struct\\s+$(name)\\s*<:\\s*OneOfAPIModel\\s*\\n\\s*value::Union\\{([^}]*)\\}",
        ),
        text,
    )
    struct_match === nothing && return text

    members = strip.(split(struct_match.captures[1], ","))
    primitives = filter(m -> m in PRIMITIVE_ONEOF_TYPES, members)
    length(primitives) == 1 || return text
    length(members) > 1 || return text

    anchor = "    object = _object(value, \"$(name)\")\n"
    occursin(anchor, text) || return text

    guard =
        "    value isa AbstractDict ||\n" *
        "        return $(name)(_decode($(primitives[1]), value, _openapi_validate))\n"
    return replace(text, anchor => guard * anchor; count=1)
end
