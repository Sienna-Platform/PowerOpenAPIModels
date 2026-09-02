@doc "    ThermalMultiStartStatus\n\nOperating state of the unit at the start of a simulation."
struct ThermalMultiStartStatus
    value::String
    function ThermalMultiStartStatus(value::String)
        value in ("OFFLINE","STARTUP","ONLINE","SHUTDOWN") || throw(ArgumentError("invalid ThermalMultiStartStatus value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ThermalMultiStartStatus}, value) = _decode(ThermalMultiStartStatus, value, true)
function _decode(::Type{ThermalMultiStartStatus}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ThermalMultiStart/properties/status"), value, "decoding ThermalMultiStartStatus"; direction = :neutral)
    return ThermalMultiStartStatus(_decode(String, value, _openapi_validate))
end
function _encode(value::ThermalMultiStartStatus)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ThermalMultiStart/properties/status"), output, "encoding ThermalMultiStartStatus"; direction = :neutral)
end
Base.string(value::ThermalMultiStartStatus) = string(value.value)
