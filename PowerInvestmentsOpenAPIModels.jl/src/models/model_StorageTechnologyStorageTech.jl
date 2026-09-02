@doc "    StorageTechnologyStorageTech\n\nStorage Technology Type."
struct StorageTechnologyStorageTech
    value::String
    function StorageTechnologyStorageTech(value::String)
        value in ("PTES","LIB","LAB","FLWB","SIB","ZIB","HGS","LAES","OTHER_CHEM","OTHER_MECH","OTHER_THERM") || throw(ArgumentError("invalid StorageTechnologyStorageTech value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{StorageTechnologyStorageTech}, value) = _decode(StorageTechnologyStorageTech, value, true)
function _decode(::Type{StorageTechnologyStorageTech}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/StorageTechnology/properties/storage_tech"), value, "decoding StorageTechnologyStorageTech"; direction = :neutral)
    return StorageTechnologyStorageTech(_decode(String, value, _openapi_validate))
end
function _encode(value::StorageTechnologyStorageTech)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/StorageTechnology/properties/storage_tech"), output, "encoding StorageTechnologyStorageTech"; direction = :neutral)
end
Base.string(value::StorageTechnologyStorageTech) = string(value.value)
