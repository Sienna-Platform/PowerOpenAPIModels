"""
    StorageTechnologyCapacityLimitsCharge

Allowable installed power capacity for charging of a storage technology, given either as a single bound applied to all capacity or as a mapping from a float key (stringified) to the bound that applies at that key. Units: MW.
"""
struct StorageTechnologyCapacityLimitsCharge <: OneOfAPIModel
    value::Union{MinMax, MinMaxByKey}
end
_decode(::Type{StorageTechnologyCapacityLimitsCharge}, value) =
    _decode(StorageTechnologyCapacityLimitsCharge, value, true)
function _decode(
    ::Type{StorageTechnologyCapacityLimitsCharge},
    value,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-218cbbe3f72d2ba463db.json",
            pointer="/properties/capacity_limits_charge",
        ),
        value,
        "decoding StorageTechnologyCapacityLimitsCharge";
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
            "anyOf value did not select a variant of StorageTechnologyCapacityLimitsCharge",
        ),
    )
    return StorageTechnologyCapacityLimitsCharge(first(matches))
end
function _encode_unvalidated(value::StorageTechnologyCapacityLimitsCharge)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::StorageTechnologyCapacityLimitsCharge) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-218cbbe3f72d2ba463db.json",
        pointer="/properties/capacity_limits_charge",
    ),
    _encode_unvalidated(value),
    "encoding StorageTechnologyCapacityLimitsCharge";
    direction=:neutral,
)
