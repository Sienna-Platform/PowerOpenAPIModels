"""
    StorageTechnologyCapacityLimitsEnergy

Allowable installed energy capacity for a storage technology, given either as a single bound applied to all capacity or as a mapping from a float key (stringified) to the bound that applies at that key. Units: MWh.
"""
struct StorageTechnologyCapacityLimitsEnergy <: OneOfAPIModel
    value::Union{MinMax, MinMaxByKey}
end
_decode(::Type{StorageTechnologyCapacityLimitsEnergy}, value) =
    _decode(StorageTechnologyCapacityLimitsEnergy, value, true)
function _decode(
    ::Type{StorageTechnologyCapacityLimitsEnergy},
    value,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-ef4e31f6f400bd4ddf6d.json",
            pointer="/properties/capacity_limits_energy",
        ),
        value,
        "decoding StorageTechnologyCapacityLimitsEnergy";
        direction=:neutral,
    )
    matches = Any[]
    if !_openapi_validate || _schema_valid(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0c77f7276093a5d31ba5.json",
            pointer="/\$defs/MinMax",
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
            resource="https://openapi.invalid/schema/external-0c77f7276093a5d31ba5.json",
            pointer="/\$defs/MinMaxByKey",
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
            "anyOf value did not select a variant of StorageTechnologyCapacityLimitsEnergy",
        ),
    )
    return StorageTechnologyCapacityLimitsEnergy(first(matches))
end
function _encode(value::StorageTechnologyCapacityLimitsEnergy)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-ef4e31f6f400bd4ddf6d.json",
            pointer="/properties/capacity_limits_energy",
        ),
        output,
        "encoding StorageTechnologyCapacityLimitsEnergy";
        direction=:neutral,
    )
end
