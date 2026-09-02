@doc "    EmissionsDataPollutant\n\nPollutant identity (CO2, CO2E, CH4, N2O, NOX, SO2, PM25, PM10, HG, HAP, CUSTOM)"
struct EmissionsDataPollutant
    value::String
    function EmissionsDataPollutant(value::String)
        value in ("CO2","CO2E","CH4","N2O","NOX","SO2","CO","VOC","PM25","PM10","HG","HAP","CUSTOM") || throw(ArgumentError("invalid EmissionsDataPollutant value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{EmissionsDataPollutant}, value) = _decode(EmissionsDataPollutant, value, true)
function _decode(::Type{EmissionsDataPollutant}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/EmissionsData/properties/pollutant"), value, "decoding EmissionsDataPollutant"; direction = :neutral)
    return EmissionsDataPollutant(_decode(String, value, _openapi_validate))
end
function _encode(value::EmissionsDataPollutant)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/EmissionsData/properties/pollutant"), output, "encoding EmissionsDataPollutant"; direction = :neutral)
end
Base.string(value::EmissionsDataPollutant) = string(value.value)
