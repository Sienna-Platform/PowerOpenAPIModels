"""
    ThermalGenerationCostStartUp

Start-up cost can take linear or multi-stage cost
"""
struct ThermalGenerationCostStartUp <: OneOfAPIModel
    value::Union{Float64, StartUpStages}
end
_decode(::Type{ThermalGenerationCostStartUp}, value) =
    _decode(ThermalGenerationCostStartUp, value, true)
function _decode(::Type{ThermalGenerationCostStartUp}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/ThermalGenerationCost/properties/start_up",
        ),
        value,
        "decoding ThermalGenerationCostStartUp";
        direction=:neutral,
    )
    value isa AbstractDict ||
        return ThermalGenerationCostStartUp(_decode(Float64, value, false))
    object = _object(value, "ThermalGenerationCostStartUp")
    tag = get(object, "startup_stages_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(
            DecodeError(
                "discriminator value must be a string for ThermalGenerationCostStartUp",
            ),
        )
    selected = get(
        Dict(
            "STAGES" => (
                StartUpStages,
                (
                    resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
                    pointer="/\$defs/StartUpStages",
                ),
            ),
        ),
        tag isa Absent ? "" : String(tag),
        nothing,
    )
    selected === nothing && throw(
        DecodeError(
            "unknown discriminator value $(repr(tag)) for ThermalGenerationCostStartUp",
        ),
    )
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for ThermalGenerationCostStartUp",
            ),
        )
    return ThermalGenerationCostStartUp(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::ThermalGenerationCostStartUp)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::ThermalGenerationCostStartUp) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
        pointer="/\$defs/ThermalGenerationCost/properties/start_up",
    ),
    _encode_unvalidated(value),
    "encoding ThermalGenerationCostStartUp";
    direction=:neutral,
)
