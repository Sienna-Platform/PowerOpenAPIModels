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
            resource="https://openapi.invalid/schema/external-7b4dcc53473d04c21ad5.json",
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
            resource="https://openapi.invalid/schema/external-207c3896c96d98ecaf37.json",
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
            resource="https://openapi.invalid/schema/external-207c3896c96d98ecaf37.json",
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
        resource="https://openapi.invalid/schema/external-7b4dcc53473d04c21ad5.json",
        pointer="/properties/capacity_limits",
    ),
    _encode_unvalidated(value),
    "encoding SupplyTechnologyCapacityLimits";
    direction=:neutral,
)
