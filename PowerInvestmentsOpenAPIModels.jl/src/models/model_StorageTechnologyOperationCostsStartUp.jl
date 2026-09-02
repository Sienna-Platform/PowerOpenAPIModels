struct StorageTechnologyOperationCostsStartUp
    value::Union{Float64,StorageTechnologyOperationCostsStartUp2}
end
_decode(::Type{StorageTechnologyOperationCostsStartUp}, value) = _decode(StorageTechnologyOperationCostsStartUp, value, true)
function _decode(::Type{StorageTechnologyOperationCostsStartUp}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/StorageTechnology/properties/operation_costs/properties/start_up"), value, "decoding StorageTechnologyOperationCostsStartUp"; direction = :neutral)
    matches = Any[]
    if !_openapi_validate || _schema_valid(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/StorageTechnology/properties/operation_costs/properties/start_up/oneOf/0"), value; direction = :neutral)
        try
            push!(matches, _decode(Float64, value, _openapi_validate))
        catch error
            error isa DecodeError || rethrow()
        end
    end
    if !_openapi_validate || _schema_valid(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/StorageTechnology/properties/operation_costs/properties/start_up/oneOf/1"), value; direction = :neutral)
        try
            push!(matches, _decode(StorageTechnologyOperationCostsStartUp2, value, _openapi_validate))
        catch error
            error isa DecodeError || rethrow()
        end
    end
    length(matches) == 1 || throw(DecodeError("oneOf value did not select exactly one variant of StorageTechnologyOperationCostsStartUp"))
    return StorageTechnologyOperationCostsStartUp(first(matches))
end
function _encode(value::StorageTechnologyOperationCostsStartUp)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/StorageTechnology/properties/operation_costs/properties/start_up"), output, "encoding StorageTechnologyOperationCostsStartUp"; direction = :neutral)
end
