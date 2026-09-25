"""
    FromTo

A pair of values, one at the `from` end and one at the `to` end of a directed edge.
"""
Base.@kwdef struct FromTo <: APIModel
    from::Union{Absent, Float64, Nothing} = ABSENT
    to::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{FromTo}, value) = _decode(FromTo, value, true)
function _decode(::Type{FromTo}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-50d5243393bb9d77da58.json",
            pointer="/\$defs/FromTo",
        ),
        _openapi_raw,
        "decoding FromTo";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "FromTo")
    _openapi_field_from =
        haskey(_openapi_object, "from") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["from"], false) : ABSENT
    _openapi_field_to =
        haskey(_openapi_object, "to") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["to"], false) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("from", "to") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return FromTo(;
        from=_openapi_field_from,
        to=_openapi_field_to,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::FromTo)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.from isa Absent ||
        (_openapi_output["from"] = _encode_unvalidated(_openapi_value.from))
    _openapi_value.to isa Absent ||
        (_openapi_output["to"] = _encode_unvalidated(_openapi_value.to))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(
            ArgumentError(
                "additional property conflicts with declared field: " * _openapi_key,
            ),
        )
        _openapi_output[_openapi_key] = _encode_unvalidated(_openapi_item)
    end
    return _openapi_output
end
_encode(_openapi_value::FromTo) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-50d5243393bb9d77da58.json",
        pointer="/\$defs/FromTo",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding FromTo";
    direction=:neutral,
)

function _form_fields(_openapi_value::FromTo)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.from isa Absent || push!(_openapi_output, "from" => _openapi_value.from)
    _openapi_value.to isa Absent || push!(_openapi_output, "to" => _openapi_value.to)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
