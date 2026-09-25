struct StorageCostStartUp <: OneOfAPIModel
    value::Union{ChargeDischarge, Float64}
end
_decode(::Type{StorageCostStartUp}, value) = _decode(StorageCostStartUp, value, true)
function _decode(::Type{StorageCostStartUp}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/StorageCost/properties/start_up",
        ),
        value,
        "decoding StorageCostStartUp";
        direction=:neutral,
    )
    matches = Any[]
    if _schema_valid(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/StorageCost/properties/start_up/oneOf/0",
        ),
        value;
        direction=:neutral,
    )
        try
            push!(matches, _decode(Float64, value, false))
        catch error
            error isa DecodeError || rethrow()
        end
    end
    if _schema_valid(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/ChargeDischarge",
        ),
        value;
        direction=:neutral,
    )
        try
            push!(matches, _decode(ChargeDischarge, value, false))
        catch error
            error isa DecodeError || rethrow()
        end
    end
    length(matches) == 1 || throw(
        DecodeError("oneOf value did not select exactly one variant of StorageCostStartUp"),
    )
    return StorageCostStartUp(first(matches))
end
function _encode_unvalidated(value::StorageCostStartUp)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::StorageCostStartUp) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
        pointer="/\$defs/StorageCost/properties/start_up",
    ),
    _encode_unvalidated(value),
    "encoding StorageCostStartUp";
    direction=:neutral,
)
