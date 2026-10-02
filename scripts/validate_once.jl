# Makes schema validation run once per decoded or encoded value instead of once per nesting
# level.
#
# OpenAPI.jl's native generator validates at every level of a value. `_decode(X, raw, true)`
# checks `raw` against X's schema and then decodes each field with the same `true`, so every
# nested model checks its own subtree again; `_encode` checks the finished object after its
# fields' `_encode` calls have each checked theirs. X's schema already `$ref`s every nested
# schema, so the first check covers the whole subtree and the rest repeat it: a
# `ThermalStandard` row's `operation_cost` was checked four times on decode (row, oneOf
# wrapper, discriminator-selected variant, variant's own decode). On ACTIVSg10k that made
# reading a System document 23 s and writing it 17 s, against 0.2 s and 0.3 s for the JSON
# parse and print themselves.
#
# After this patch:
#   - decode: the outermost `_decode(X, raw, validate)` checks once, and every nested
#     `_decode` receives `false`.
#   - encode: each model gets `_encode_unvalidated`, which builds the JSON object with
#     nested `_encode_unvalidated` calls; `_encode` is that plus one check of the result.
#
# Two things keep this sound:
#   - discriminated `oneOf` wrappers skip their "selected variant validates" check when
#     nested. Every variant schema pins its discriminator with `const`, so a value that
#     passed the enclosing check cannot carry a tag naming a different variant.
#   - undiscriminated `oneOf` wrappers select their variant by schema check, so that check
#     is made unconditional; with the old `!_openapi_validate ||` guard, a nested wrapper
#     would fall back to structural decoding, which cannot tell `MinMax` from `MinMaxByKey`.
#   - an all-object tagged `oneOf` checks a value against its tag-selected variant only, on
#     decode and encode; SiennaSchemas' `check_refs.py` makes that the `oneOf` check.

"""
Shared definitions, injected into InfrastructureCoreOpenAPIModels.
"""
const ENCODE_UNVALIDATED_DEFINITIONS = """
\"\"\"
    _encode_unvalidated(value)

`_encode` without the schema check. A generated model's `_encode` builds its fields with this
and checks the finished object once, since that object's schema covers every nested one.
\"\"\"
_encode_unvalidated(value) = _encode(value)
_encode_unvalidated(value::AbstractVector{UInt8}) = _encode(value)
_encode_unvalidated(value::AbstractVector) = Any[_encode_unvalidated(item) for item in value]
function _encode_unvalidated(value::AbstractDict)
    output = JSON.Object{String, Any}()
    for (key, item) in value
        output[String(key)] = _encode_unvalidated(item)
    end
    return output
end
"""

"""
Import line for every package built on InfrastructureCoreOpenAPIModels.
"""
const ENCODE_UNVALIDATED_IMPORT = "import InfrastructureCoreOpenAPIModels: _encode_unvalidated"

const _TAGGED_WRAPPER_CHECK =
    r"(function _decode\(::Type\{(\w+)\}, value, _openapi_validate::Bool\)\n)    _openapi_validate && _validate_schema\(_SPEC, .*?, value, \"decoding \2\"; direction = :\w+\)\n"
const _TAGGED_VARIANT_CHECK =
    r"    !_openapi_validate \|\| _schema_valid\(_SPEC, selected\[2\], value; direction = (:\w+)\) \|\| throw\(DecodeError\(\"discriminator-selected schema did not validate for (\w+)\"\)\)"

"""
Whether `text` holds an all-object tagged oneOf: its variant is chosen by tag, with no
primitive branch decoded by shape.
"""
_is_object_tagged(text::AbstractString) =
    occursin("discriminator-selected schema did not validate", text) &&
    !occursin("value isa AbstractDict ||", text)

"""
Check an all-object tagged oneOf's decode against its selected variant only. SiennaSchemas'
`check_refs.py` guarantees each variant pins the tag with `const`, which makes that check the
oneOf check.
"""
function select_variant_once(text::AbstractString, name::AbstractString)
    count(_TAGGED_WRAPPER_CHECK, text) == 1 && count(_TAGGED_VARIANT_CHECK, text) == 1 ||
        error("select_variant_once: $name has a tagged decode this does not recognize")
    text = replace(text, _TAGGED_WRAPPER_CHECK => s"\1")
    return replace(
        text,
        _TAGGED_VARIANT_CHECK =>
            s"    _openapi_validate && _validate_schema(_SPEC, selected[2], value, \"decoding \2\"; direction = \1)",
    )
end

const _ENCODE_BLOCK =
    r"function _encode\((\w+)::(\w+)\)\n(.*?)    return _validate_schema\(_SPEC, (.*?), (\w+), (\"encoding \w+\"); direction = (:\w+)\)\nend\n"s

"""
Patch one raw generated chunk (`name`'s struct and methods) as described at the top of this
file. Errors when the chunk has an `_encode` this does not recognize, so a generator change
fails here rather than leaving a model validating at every level again.
"""
function validate_once(text::AbstractString, name::AbstractString)
    object_tagged = _is_object_tagged(text)
    object_tagged && (text = select_variant_once(text, name))
    text = replace(
        text,
        ", _openapi_validate)" => ", false)",
        "if !_openapi_validate || _schema_valid(" => "if _schema_valid(",
    )
    expected = count("function _encode(", text)
    patched = 0
    text = replace(
        text,
        _ENCODE_BLOCK => function (block)
            m = match(_ENCODE_BLOCK, block)
            arg, type, body, schema, output, context, direction = m.captures
            patched += 1
            checked = if object_tagged && type == name
                "_encode($arg::$type) = _encode($arg.value)\n"
            else
                "_encode($arg::$type) = _validate_schema(_SPEC, $schema, " *
                "_encode_unvalidated($arg), $context; direction = $direction)\n"
            end
            return "function _encode_unvalidated($arg::$type)\n" *
                   replace(body, "_encode(" => "_encode_unvalidated(") *
                   "    return $output\nend\n" * checked
        end,
    )
    patched == expected ||
        error("validate_once: $name has $expected _encode method(s), patched $patched")
    return text
end
