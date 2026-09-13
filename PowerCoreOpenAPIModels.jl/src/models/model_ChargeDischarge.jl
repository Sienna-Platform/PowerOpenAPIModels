"""
    ChargeDischarge

A pair of values, one for the charging (`charge`) and one for the discharging (`discharge`) direction of a quantity.
"""
Base.@kwdef struct ChargeDischarge <: APIModel
    charge::Float64
    discharge::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{ChargeDischarge}, value) = _decode(ChargeDischarge, value, true)
function _decode(::Type{ChargeDischarge}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/ChargeDischarge",
        ),
        _openapi_raw,
        "decoding ChargeDischarge";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "ChargeDischarge")
    _openapi_field_charge = _decode(
        Float64,
        _required(_openapi_object, "charge", "ChargeDischarge"),
        _openapi_validate,
    )
    _openapi_field_discharge = _decode(
        Float64,
        _required(_openapi_object, "discharge", "ChargeDischarge"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("charge", "discharge") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return ChargeDischarge(;
        charge=_openapi_field_charge,
        discharge=_openapi_field_discharge,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::ChargeDischarge)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.charge isa Absent ||
        (_openapi_output["charge"] = _encode(_openapi_value.charge))
    _openapi_value.discharge isa Absent ||
        (_openapi_output["discharge"] = _encode(_openapi_value.discharge))
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
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/ChargeDischarge",
        ),
        _openapi_output,
        "encoding ChargeDischarge";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::ChargeDischarge)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.charge isa Absent ||
        push!(_openapi_output, "charge" => _openapi_value.charge)
    _openapi_value.discharge isa Absent ||
        push!(_openapi_output, "discharge" => _openapi_value.discharge)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
