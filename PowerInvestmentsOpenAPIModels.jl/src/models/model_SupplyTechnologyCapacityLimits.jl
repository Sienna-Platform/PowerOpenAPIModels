"""
    SupplyTechnologyCapacityLimits

Minimum and maximum allowable installed capacity for a technology, given either as a single bound applied to all capacity or as a mapping from a float key (stringified) to the bound that applies at that key. Units: MW.
"""
struct SupplyTechnologyCapacityLimits <: OneOfAPIModel
    value::Union{MinMax, SupplyTechnologyCapacityLimits2}
end
_decode(::Type{SupplyTechnologyCapacityLimits}, value) =
    _decode(SupplyTechnologyCapacityLimits, value, true)
function _decode(::Type{SupplyTechnologyCapacityLimits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-384713fc06a7c2e0ea0f.json",
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
            resource="https://openapi.invalid/schema/root-384713fc06a7c2e0ea0f.json",
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
            resource="https://openapi.invalid/schema/root-384713fc06a7c2e0ea0f.json",
            pointer="/components/schemas/SupplyTechnology/properties/capacity_limits/anyOf/1",
        ),
        value;
        direction=:neutral,
    )
        try
            push!(
                matches,
                _decode(SupplyTechnologyCapacityLimits2, value, _openapi_validate),
            )
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
            resource="https://openapi.invalid/schema/root-384713fc06a7c2e0ea0f.json",
            pointer="/components/schemas/SupplyTechnology/properties/capacity_limits",
        ),
        output,
        "encoding SupplyTechnologyCapacityLimits";
        direction=:neutral,
    )
end
