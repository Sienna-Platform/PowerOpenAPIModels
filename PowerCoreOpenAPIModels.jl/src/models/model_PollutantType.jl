"""
    PollutantType

Pollutant an emission rate is reported for, spanning greenhouse gases (`CO2`, `CO2E`, `CH4`, `N2O`), criteria pollutants (`NOX`, `SO2`, `CO`, `VOC`, `PM25`, `PM10`), and toxics (`HG`, `HAP`), with `CUSTOM` for a user-defined pollutant.
"""
struct PollutantType <: EnumAPIModel
    value::String
    function PollutantType(value::String)
        value in (
            "CO2",
            "CO2E",
            "CH4",
            "N2O",
            "NOX",
            "SO2",
            "CO",
            "VOC",
            "PM25",
            "PM10",
            "HG",
            "HAP",
            "CUSTOM",
        ) || throw(ArgumentError("invalid PollutantType value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{PollutantType}, value) = _decode(PollutantType, value, true)
function _decode(::Type{PollutantType}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/PollutantType",
        ),
        value,
        "decoding PollutantType";
        direction=:neutral,
    )
    return PollutantType(_decode(String, value, false))
end
function _encode_unvalidated(value::PollutantType)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::PollutantType) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
        pointer="/\$defs/PollutantType",
    ),
    _encode_unvalidated(value),
    "encoding PollutantType";
    direction=:neutral,
)
Base.string(value::PollutantType) = string(value.value)
