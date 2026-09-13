"""
    GenericOperationCost

Operating cost of a generation technology, selected by `cost_type` among the thermal (`THERMAL`), renewable (`RENEWABLE`), and hydro (`HYDRO_GEN`) generation cost representations.
"""
struct GenericOperationCost <: OneOfAPIModel
    value::Union{HydroGenerationCost, RenewableGenerationCost, ThermalGenerationCost}
end
_decode(::Type{GenericOperationCost}, value) = _decode(GenericOperationCost, value, true)
function _decode(::Type{GenericOperationCost}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/GenericOperationCost",
        ),
        value,
        "decoding GenericOperationCost";
        direction=:neutral,
    )
    object = _object(value, "GenericOperationCost")
    tag = get(object, "cost_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(DecodeError("discriminator value must be a string for GenericOperationCost"))
    selected = get(
        Dict(
            "HYDRO_GEN" => (
                HydroGenerationCost,
                (
                    resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
                    pointer="/\$defs/HydroGenerationCost",
                ),
            ),
            "RENEWABLE" => (
                RenewableGenerationCost,
                (
                    resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
                    pointer="/\$defs/RenewableGenerationCost",
                ),
            ),
            "THERMAL" => (
                ThermalGenerationCost,
                (
                    resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
                    pointer="/\$defs/ThermalGenerationCost",
                ),
            ),
        ),
        tag isa Absent ? "" : String(tag),
        nothing,
    )
    selected === nothing && throw(
        DecodeError("unknown discriminator value $(repr(tag)) for GenericOperationCost"),
    )
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for GenericOperationCost",
            ),
        )
    return GenericOperationCost(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::GenericOperationCost)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/GenericOperationCost",
        ),
        output,
        "encoding GenericOperationCost";
        direction=:neutral,
    )
end
