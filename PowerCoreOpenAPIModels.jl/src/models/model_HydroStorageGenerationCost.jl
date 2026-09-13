"""
    HydroStorageGenerationCost

Operating cost of hydro generation with storage, selected by `cost_type` between the hydro generation (`HYDRO_GEN`) and storage (`STORAGE`) cost representations.
"""
struct HydroStorageGenerationCost <: OneOfAPIModel
    value::Union{HydroGenerationCost, StorageCost}
end
_decode(::Type{HydroStorageGenerationCost}, value) =
    _decode(HydroStorageGenerationCost, value, true)
function _decode(::Type{HydroStorageGenerationCost}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/HydroStorageGenerationCost",
        ),
        value,
        "decoding HydroStorageGenerationCost";
        direction=:neutral,
    )
    object = _object(value, "HydroStorageGenerationCost")
    tag = get(object, "cost_type", ABSENT)
    tag isa Absent ||
        tag isa AbstractString ||
        throw(
            DecodeError(
                "discriminator value must be a string for HydroStorageGenerationCost",
            ),
        )
    selected = get(
        Dict(
            "HYDRO_GEN" => (
                HydroGenerationCost,
                (
                    resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
                    pointer="/\$defs/HydroGenerationCost",
                ),
            ),
            "STORAGE" => (
                StorageCost,
                (
                    resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
                    pointer="/\$defs/StorageCost",
                ),
            ),
        ),
        tag isa Absent ? "" : String(tag),
        nothing,
    )
    selected === nothing && throw(
        DecodeError(
            "unknown discriminator value $(repr(tag)) for HydroStorageGenerationCost",
        ),
    )
    !_openapi_validate ||
        _schema_valid(_SPEC, selected[2], value; direction=:neutral) ||
        throw(
            DecodeError(
                "discriminator-selected schema did not validate for HydroStorageGenerationCost",
            ),
        )
    return HydroStorageGenerationCost(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::HydroStorageGenerationCost)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/HydroStorageGenerationCost",
        ),
        output,
        "encoding HydroStorageGenerationCost";
        direction=:neutral,
    )
end
