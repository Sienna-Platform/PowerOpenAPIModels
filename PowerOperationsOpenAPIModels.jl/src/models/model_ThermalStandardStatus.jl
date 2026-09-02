@doc "    ThermalStandardStatus\n\nOperating state of the unit at the start of a simulation."
struct ThermalStandardStatus
    value::String
    function ThermalStandardStatus(value::String)
        value in ("OFFLINE","STARTUP","ONLINE","SHUTDOWN") || throw(ArgumentError("invalid ThermalStandardStatus value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ThermalStandardStatus}, value) = _decode(ThermalStandardStatus, value, true)
function _decode(::Type{ThermalStandardStatus}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ThermalStandard/properties/status"), value, "decoding ThermalStandardStatus"; direction = :neutral)
    return ThermalStandardStatus(_decode(String, value, _openapi_validate))
end
function _encode(value::ThermalStandardStatus)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ThermalStandard/properties/status"), output, "encoding ThermalStandardStatus"; direction = :neutral)
end
Base.string(value::ThermalStandardStatus) = string(value.value)
