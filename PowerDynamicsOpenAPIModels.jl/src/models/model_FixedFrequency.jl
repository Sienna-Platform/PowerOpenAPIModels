"""
    FixedFrequency

Parameters of a Fixed Frequency Estimator (i.e. no PLL)

  - `frequency`: Reference frequency
"""
Base.@kwdef struct FixedFrequency <: APIModel
    frequency::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{FixedFrequency}, value) = _decode(FixedFrequency, value, true)
function _decode(::Type{FixedFrequency}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-6f9b5c0d55fa44829a42.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding FixedFrequency";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "FixedFrequency")
    _openapi_field_frequency =
        haskey(_openapi_object, "frequency") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["frequency"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("frequency",) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return FixedFrequency(;
        frequency=_openapi_field_frequency,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::FixedFrequency)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.frequency isa Absent ||
        (_openapi_output["frequency"] = _encode(_openapi_value.frequency))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(
            ArgumentError(
                "additional property conflicts with declared field: " * _openapi_key,
            ),
        )
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-6f9b5c0d55fa44829a42.json",
            pointer="",
        ),
        _openapi_output,
        "encoding FixedFrequency";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::FixedFrequency)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.frequency isa Absent ||
        push!(_openapi_output, "frequency" => _openapi_value.frequency)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
