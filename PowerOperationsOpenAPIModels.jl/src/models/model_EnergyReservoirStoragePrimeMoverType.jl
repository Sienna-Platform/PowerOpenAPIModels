@doc "    EnergyReservoirStoragePrimeMoverType\n\nPrime mover technology according to EIA 923."
struct EnergyReservoirStoragePrimeMoverType
    value::String
    function EnergyReservoirStoragePrimeMoverType(value::String)
        value in ("BA","BT","CA","CC","CE","CP","CS","CT","ES","FC","FW","GT","HA","HB","HK","HY","IC","PS","OT","ST","PVe","WT","WS") || throw(ArgumentError("invalid EnergyReservoirStoragePrimeMoverType value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{EnergyReservoirStoragePrimeMoverType}, value) = _decode(EnergyReservoirStoragePrimeMoverType, value, true)
function _decode(::Type{EnergyReservoirStoragePrimeMoverType}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/EnergyReservoirStorage/properties/prime_mover_type"), value, "decoding EnergyReservoirStoragePrimeMoverType"; direction = :neutral)
    return EnergyReservoirStoragePrimeMoverType(_decode(String, value, _openapi_validate))
end
function _encode(value::EnergyReservoirStoragePrimeMoverType)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/EnergyReservoirStorage/properties/prime_mover_type"), output, "encoding EnergyReservoirStoragePrimeMoverType"; direction = :neutral)
end
Base.string(value::EnergyReservoirStoragePrimeMoverType) = string(value.value)
