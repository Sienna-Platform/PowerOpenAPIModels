@doc "    EnergyReservoirStorageStorageTechnologyType\n\nStorage Technology Complementary to EIA 923."
struct EnergyReservoirStorageStorageTechnologyType
    value::String
    function EnergyReservoirStorageStorageTechnologyType(value::String)
        value in ("PTES","LIB","LAB","FLWB","SIB","ZIB","HGS","LAES","OTHER_CHEM","OTHER_MECH","OTHER_THERM") || throw(ArgumentError("invalid EnergyReservoirStorageStorageTechnologyType value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{EnergyReservoirStorageStorageTechnologyType}, value) = _decode(EnergyReservoirStorageStorageTechnologyType, value, true)
function _decode(::Type{EnergyReservoirStorageStorageTechnologyType}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/EnergyReservoirStorage/properties/storage_technology_type"), value, "decoding EnergyReservoirStorageStorageTechnologyType"; direction = :neutral)
    return EnergyReservoirStorageStorageTechnologyType(_decode(String, value, _openapi_validate))
end
function _encode(value::EnergyReservoirStorageStorageTechnologyType)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/EnergyReservoirStorage/properties/storage_technology_type"), output, "encoding EnergyReservoirStorageStorageTechnologyType"; direction = :neutral)
end
Base.string(value::EnergyReservoirStorageStorageTechnologyType) = string(value.value)
