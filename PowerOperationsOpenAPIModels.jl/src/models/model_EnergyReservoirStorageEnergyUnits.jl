@doc "    EnergyReservoirStorageEnergyUnits\n\nUnit basis for `storage_capacity`. MWH is the default interchange form; MWMIN records the same energy on the minutes basis used by operational durations."
struct EnergyReservoirStorageEnergyUnits
    value::String
    function EnergyReservoirStorageEnergyUnits(value::String)
        value in ("MWH","MWMIN") || throw(ArgumentError("invalid EnergyReservoirStorageEnergyUnits value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{EnergyReservoirStorageEnergyUnits}, value) = _decode(EnergyReservoirStorageEnergyUnits, value, true)
function _decode(::Type{EnergyReservoirStorageEnergyUnits}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/EnergyReservoirStorage/properties/energy_units"), value, "decoding EnergyReservoirStorageEnergyUnits"; direction = :neutral)
    return EnergyReservoirStorageEnergyUnits(_decode(String, value, _openapi_validate))
end
function _encode(value::EnergyReservoirStorageEnergyUnits)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/EnergyReservoirStorage/properties/energy_units"), output, "encoding EnergyReservoirStorageEnergyUnits"; direction = :neutral)
end
Base.string(value::EnergyReservoirStorageEnergyUnits) = string(value.value)
