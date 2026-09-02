struct StorageCostStartUp
    value::Union{Float64,StorageCostStartUp2}
end
_decode(::Type{StorageCostStartUp}, value) = _decode(StorageCostStartUp, value, true)
function _decode(::Type{StorageCostStartUp}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/StorageCost/properties/start_up"), value, "decoding StorageCostStartUp"; direction = :neutral)
    matches = Any[]
    if !_openapi_validate || _schema_valid(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/StorageCost/properties/start_up/oneOf/0"), value; direction = :neutral)
        try
            push!(matches, _decode(Float64, value, _openapi_validate))
        catch error
            error isa DecodeError || rethrow()
        end
    end
    if !_openapi_validate || _schema_valid(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/StorageCost/properties/start_up/oneOf/1"), value; direction = :neutral)
        try
            push!(matches, _decode(StorageCostStartUp2, value, _openapi_validate))
        catch error
            error isa DecodeError || rethrow()
        end
    end
    length(matches) == 1 || throw(DecodeError("oneOf value did not select exactly one variant of StorageCostStartUp"))
    return StorageCostStartUp(first(matches))
end
function _encode(value::StorageCostStartUp)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/StorageCost/properties/start_up"), output, "encoding StorageCostStartUp"; direction = :neutral)
end
