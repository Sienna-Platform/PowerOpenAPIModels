"""
    OperationalFlowLimit

Operator-set flow limits on a directed branch: a minimum and a maximum flow in each direction, applied in addition to the branch's thermal rating.
"""
Base.@kwdef struct OperationalFlowLimit <: APIModel
    from_to_min::Float64
    from_to_max::Float64
    to_from_min::Float64
    to_from_max::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{OperationalFlowLimit}, value) = _decode(OperationalFlowLimit, value, true)
function _decode(::Type{OperationalFlowLimit}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-c81497f0bf964a0b130d.json",
            pointer="/\$defs/OperationalFlowLimit",
        ),
        _openapi_raw,
        "decoding OperationalFlowLimit";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "OperationalFlowLimit")
    _openapi_field_from_to_min = _decode(
        Float64,
        _required(_openapi_object, "from_to_min", "OperationalFlowLimit"),
        false,
    )
    _openapi_field_from_to_max = _decode(
        Float64,
        _required(_openapi_object, "from_to_max", "OperationalFlowLimit"),
        false,
    )
    _openapi_field_to_from_min = _decode(
        Float64,
        _required(_openapi_object, "to_from_min", "OperationalFlowLimit"),
        false,
    )
    _openapi_field_to_from_max = _decode(
        Float64,
        _required(_openapi_object, "to_from_max", "OperationalFlowLimit"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in
        ("from_to_min", "from_to_max", "to_from_min", "to_from_max") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return OperationalFlowLimit(;
        from_to_min=_openapi_field_from_to_min,
        from_to_max=_openapi_field_from_to_max,
        to_from_min=_openapi_field_to_from_min,
        to_from_max=_openapi_field_to_from_max,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::OperationalFlowLimit)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.from_to_min isa Absent ||
        (_openapi_output["from_to_min"] = _encode_unvalidated(_openapi_value.from_to_min))
    _openapi_value.from_to_max isa Absent ||
        (_openapi_output["from_to_max"] = _encode_unvalidated(_openapi_value.from_to_max))
    _openapi_value.to_from_min isa Absent ||
        (_openapi_output["to_from_min"] = _encode_unvalidated(_openapi_value.to_from_min))
    _openapi_value.to_from_max isa Absent ||
        (_openapi_output["to_from_max"] = _encode_unvalidated(_openapi_value.to_from_max))
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
_encode(_openapi_value::OperationalFlowLimit) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-c81497f0bf964a0b130d.json",
        pointer="/\$defs/OperationalFlowLimit",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding OperationalFlowLimit";
    direction=:neutral,
)

function _form_fields(_openapi_value::OperationalFlowLimit)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.from_to_min isa Absent ||
        push!(_openapi_output, "from_to_min" => _openapi_value.from_to_min)
    _openapi_value.from_to_max isa Absent ||
        push!(_openapi_output, "from_to_max" => _openapi_value.from_to_max)
    _openapi_value.to_from_min isa Absent ||
        push!(_openapi_output, "to_from_min" => _openapi_value.to_from_min)
    _openapi_value.to_from_max isa Absent ||
        push!(_openapi_output, "to_from_max" => _openapi_value.to_from_max)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
