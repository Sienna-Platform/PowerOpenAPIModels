@doc "    StorageTech\n\ndefines the storage technology used in an energy Storage system, based on the options in EIA form 923."
struct StorageTech
    value::String
    function StorageTech(value::String)
        value in ("PTES","LIB","LAB","FLWB","SIB","ZIB","HGS","LAES","OTHER_CHEM","OTHER_MECH","OTHER_THERM") || throw(ArgumentError("invalid StorageTech value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{StorageTech}, value) = _decode(StorageTech, value, true)
function _decode(::Type{StorageTech}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/StorageTech"), value, "decoding StorageTech"; direction = :neutral)
    return StorageTech(_decode(String, value, _openapi_validate))
end
function _encode(value::StorageTech)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/StorageTech"), output, "encoding StorageTech"; direction = :neutral)
end
Base.string(value::StorageTech) = string(value.value)
