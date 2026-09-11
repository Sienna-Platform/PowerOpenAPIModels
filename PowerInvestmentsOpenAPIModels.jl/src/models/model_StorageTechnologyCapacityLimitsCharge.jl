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
            resource="https://openapi.invalid/schema/root-a1f5f591f1f8e26e922b.json",
            pointer="/components/schemas/StorageTechnology/properties/capacity_limits_charge",
        ),
        value,
        "decoding StorageTechnologyCapacityLimitsCharge";
        direction=:neutral,
    )
    matches = Any[]
    if !_openapi_validate || _schema_valid(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-a1f5f591f1f8e26e922b.json",
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
            resource="https://openapi.invalid/schema/root-a1f5f591f1f8e26e922b.json",
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
            "anyOf value did not select a variant of StorageTechnologyCapacityLimitsCharge",
        ),
    )
    return StorageTechnologyCapacityLimitsCharge(first(matches))
end
function _encode(value::StorageTechnologyCapacityLimitsCharge)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-a1f5f591f1f8e26e922b.json",
            pointer="/components/schemas/StorageTechnology/properties/capacity_limits_charge",
        ),
        output,
        "encoding StorageTechnologyCapacityLimitsCharge";
        direction=:neutral,
    )
end
