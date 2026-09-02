@doc "    PollutantType\n\nPollutant an emission rate is reported for, spanning greenhouse gases (`CO2`, `CO2E`, `CH4`, `N2O`), criteria pollutants (`NOX`, `SO2`, `CO`, `VOC`, `PM25`, `PM10`), and toxics (`HG`, `HAP`), with `CUSTOM` for a user-defined pollutant."
struct PollutantType
    value::String
    function PollutantType(value::String)
        value in ("CO2","CO2E","CH4","N2O","NOX","SO2","CO","VOC","PM25","PM10","HG","HAP","CUSTOM") || throw(ArgumentError("invalid PollutantType value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{PollutantType}, value) = _decode(PollutantType, value, true)
function _decode(::Type{PollutantType}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/PollutantType"), value, "decoding PollutantType"; direction = :neutral)
    return PollutantType(_decode(String, value, _openapi_validate))
end
function _encode(value::PollutantType)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/PollutantType"), output, "encoding PollutantType"; direction = :neutral)
end
Base.string(value::PollutantType) = string(value.value)
