"""
    SupplyTechnologyCapacityLimits

Minimum and maximum allowable installed capacity: a single bound applied to all capacity, or a mapping from a stringified float key to the bound at that key. Units: MW.
"""
struct SupplyTechnologyCapacityLimits <: OneOfAPIModel
    value::Union{MinMax, MinMaxByKey}
end
_decode(::Type{SupplyTechnologyCapacityLimits}, value) =
    _decode(SupplyTechnologyCapacityLimits, value, true)
function _decode(::Type{SupplyTechnologyCapacityLimits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-ad22d6f45caa296f80ba.json",
            pointer="/components/schemas/SupplyTechnology/properties/capacity_limits",
        ),
        value,
        "decoding SupplyTechnologyCapacityLimits";
        direction=:neutral,
    )
    matches = Any[]
    if !_openapi_validate || _schema_valid(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-ad22d6f45caa296f80ba.json",
            pointer="/components/schemas/MinMax",
        ),
        value;
        direction=:neutral,
    )
        try
            push!(matches, _decode(MinMax, value, _openapi_validate))
        catch error
            error isa DecodeError || rethrow()
        end
    end
    if !_openapi_validate || _schema_valid(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-ad22d6f45caa296f80ba.json",
            pointer="/components/schemas/MinMaxByKey",
        ),
        value;
        direction=:neutral,
    )
        try
            push!(matches, _decode(MinMaxByKey, value, _openapi_validate))
        catch error
            error isa DecodeError || rethrow()
        end
    end
    isempty(matches) && throw(
        DecodeError(
            "anyOf value did not select a variant of SupplyTechnologyCapacityLimits",
        ),
    )
    return SupplyTechnologyCapacityLimits(first(matches))
end
function _encode(value::SupplyTechnologyCapacityLimits)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-ad22d6f45caa296f80ba.json",
            pointer="/components/schemas/SupplyTechnology/properties/capacity_limits",
        ),
        output,
        "encoding SupplyTechnologyCapacityLimits";
        direction=:neutral,
    )
end
