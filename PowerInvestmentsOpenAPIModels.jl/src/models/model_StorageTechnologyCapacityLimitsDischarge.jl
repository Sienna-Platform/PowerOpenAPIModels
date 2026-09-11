"""
    StorageTechnologyCapacityLimitsDischarge

Allowable installed power capacity for discharging of a storage technology, given either as a single bound applied to all capacity or as a mapping from a float key (stringified) to the bound that applies at that key. Units: MW.
"""
struct StorageTechnologyCapacityLimitsDischarge <: OneOfAPIModel
    value::Union{MinMax, MinMaxByKey}
end
_decode(::Type{StorageTechnologyCapacityLimitsDischarge}, value) =
    _decode(StorageTechnologyCapacityLimitsDischarge, value, true)
function _decode(
    ::Type{StorageTechnologyCapacityLimitsDischarge},
    value,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-af9d0b5f8a5342306720.json",
            pointer="/components/schemas/StorageTechnology/properties/capacity_limits_discharge",
        ),
        value,
        "decoding StorageTechnologyCapacityLimitsDischarge";
        direction=:neutral,
    )
    matches = Any[]
    if !_openapi_validate || _schema_valid(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-af9d0b5f8a5342306720.json",
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
            resource="https://openapi.invalid/schema/root-af9d0b5f8a5342306720.json",
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
            "anyOf value did not select a variant of StorageTechnologyCapacityLimitsDischarge",
        ),
    )
    return StorageTechnologyCapacityLimitsDischarge(first(matches))
end
function _encode(value::StorageTechnologyCapacityLimitsDischarge)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-af9d0b5f8a5342306720.json",
            pointer="/components/schemas/StorageTechnology/properties/capacity_limits_discharge",
        ),
        output,
        "encoding StorageTechnologyCapacityLimitsDischarge";
        direction=:neutral,
    )
end
