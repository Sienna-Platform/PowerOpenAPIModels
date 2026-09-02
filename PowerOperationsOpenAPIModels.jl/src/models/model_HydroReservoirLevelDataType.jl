struct HydroReservoirLevelDataType
    value::String
    function HydroReservoirLevelDataType(value::String)
        value in ("USABLE_VOLUME","TOTAL_VOLUME","HEAD","ENERGY") || throw(ArgumentError("invalid HydroReservoirLevelDataType value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{HydroReservoirLevelDataType}, value) = _decode(HydroReservoirLevelDataType, value, true)
function _decode(::Type{HydroReservoirLevelDataType}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/HydroReservoir/properties/level_data_type"), value, "decoding HydroReservoirLevelDataType"; direction = :neutral)
    return HydroReservoirLevelDataType(_decode(String, value, _openapi_validate))
end
function _encode(value::HydroReservoirLevelDataType)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/HydroReservoir/properties/level_data_type"), output, "encoding HydroReservoirLevelDataType"; direction = :neutral)
end
Base.string(value::HydroReservoirLevelDataType) = string(value.value)
