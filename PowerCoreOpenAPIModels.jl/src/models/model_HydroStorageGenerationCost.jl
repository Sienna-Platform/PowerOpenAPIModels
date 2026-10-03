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
    _openapi_validate && _validate_schema(
        _SPEC,
        selected[2],
        value,
        "decoding HydroStorageGenerationCost";
        direction=:neutral,
    )
    return HydroStorageGenerationCost(_decode(selected[1], value, false))
end
function _encode_unvalidated(value::HydroStorageGenerationCost)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::HydroStorageGenerationCost) = _encode(value.value)
