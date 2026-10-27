"""
    SupplyTechnologyCapacityLimits

Minimum and maximum allowable installed capacity for a technology, given either as a single bound applied to all capacity or as a mapping from a float key (stringified) to the bound that applies at that key. Units: MW.
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
            resource="https://openapi.invalid/schema/external-ad19715a084dd2bcf1cf.json",
            pointer="/properties/capacity_limits",
        ),
        value,
        "decoding SupplyTechnologyCapacityLimits";
        direction=:neutral,
    )
    matches = Any[]
    if _schema_valid(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-8c6756d537f0626fc160.json",
            pointer="/\$defs/MinMax",
        ),
        value;
        direction=:neutral,
    )
        try
            push!(matches, _decode(MinMax, value, false))
        catch error
            error isa DecodeError || rethrow()
        end
    end
    if _schema_valid(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-8c6756d537f0626fc160.json",
            pointer="/\$defs/MinMaxByKey",
        ),
        value;
        direction=:neutral,
    )
        try
            push!(matches, _decode(MinMaxByKey, value, false))
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
function _encode_unvalidated(value::SupplyTechnologyCapacityLimits)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::SupplyTechnologyCapacityLimits) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-ad19715a084dd2bcf1cf.json",
        pointer="/properties/capacity_limits",
    ),
    _encode_unvalidated(value),
    "encoding SupplyTechnologyCapacityLimits";
    direction=:neutral,
)
