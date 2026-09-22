"""
    InOut

A pair of values, one for the inbound (`in`) and one for the outbound (`out`) direction of a quantity.
"""
Base.@kwdef struct InOut <: APIModel
    in::Union{Absent, Float64, Nothing} = ABSENT
    out::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{InOut}, value) = _decode(InOut, value, true)
function _decode(::Type{InOut}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-50d5243393bb9d77da58.json",
            pointer="/\$defs/InOut",
        ),
        _openapi_raw,
        "decoding InOut";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "InOut")
    _openapi_field_in =
        haskey(_openapi_object, "in") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["in"], false) : ABSENT
    _openapi_field_out =
        haskey(_openapi_object, "out") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["out"], false) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("in", "out") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return InOut(;
        in=_openapi_field_in,
        out=_openapi_field_out,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::InOut)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.in isa Absent ||
        (_openapi_output["in"] = _encode_unvalidated(_openapi_value.in))
    _openapi_value.out isa Absent ||
        (_openapi_output["out"] = _encode_unvalidated(_openapi_value.out))
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
_encode(_openapi_value::InOut) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-50d5243393bb9d77da58.json",
        pointer="/\$defs/InOut",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding InOut";
    direction=:neutral,
)

function _form_fields(_openapi_value::InOut)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.in isa Absent || push!(_openapi_output, "in" => _openapi_value.in)
    _openapi_value.out isa Absent || push!(_openapi_output, "out" => _openapi_value.out)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
