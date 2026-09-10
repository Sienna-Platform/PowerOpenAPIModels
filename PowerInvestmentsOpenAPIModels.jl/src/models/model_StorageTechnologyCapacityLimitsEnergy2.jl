Base.@kwdef struct StorageTechnologyCapacityLimitsEnergy2 <: APIModel
    additional_properties::Dict{String, MinMax} = Dict{String, MinMax}()
end
_decode(::Type{StorageTechnologyCapacityLimitsEnergy2}, value) =
    _decode(StorageTechnologyCapacityLimitsEnergy2, value, true)
function _decode(
    ::Type{StorageTechnologyCapacityLimitsEnergy2},
    _openapi_raw,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-384713fc06a7c2e0ea0f.json",
            pointer="/components/schemas/StorageTechnology/properties/capacity_limits_energy/anyOf/1",
        ),
        _openapi_raw,
        "decoding StorageTechnologyCapacityLimitsEnergy2";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "StorageTechnologyCapacityLimitsEnergy2")
    _openapi_additional_properties = Dict{String, MinMax}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in () && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(MinMax, _openapi_item, _openapi_validate)
    end
    return StorageTechnologyCapacityLimitsEnergy2(;
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::StorageTechnologyCapacityLimitsEnergy2)
    _openapi_output = JSON.Object{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(
            ArgumentError(
                "additional property conflicts with declared field: " * _openapi_key,
            ),
        )
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-384713fc06a7c2e0ea0f.json",
            pointer="/components/schemas/StorageTechnology/properties/capacity_limits_energy/anyOf/1",
        ),
        _openapi_output,
        "encoding StorageTechnologyCapacityLimitsEnergy2";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::StorageTechnologyCapacityLimitsEnergy2)
    _openapi_output = Pair{String, Any}[]
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
