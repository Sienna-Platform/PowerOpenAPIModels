@doc "    VSCACControlModes\n\nAC-side control mode of a voltage-source-converter (VSC) terminal. AC_REACTIVE_POWER: converter controls reactive power / fixed power factor. AC_VOLTAGE: converter controls the AC-side voltage magnitude."
struct VSCACControlModes
    value::String
    function VSCACControlModes(value::String)
        value in ("AC_REACTIVE_POWER","AC_VOLTAGE") || throw(ArgumentError("invalid VSCACControlModes value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{VSCACControlModes}, value) = _decode(VSCACControlModes, value, true)
function _decode(::Type{VSCACControlModes}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/VSCACControlModes"), value, "decoding VSCACControlModes"; direction = :neutral)
    return VSCACControlModes(_decode(String, value, _openapi_validate))
end
function _encode(value::VSCACControlModes)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/VSCACControlModes"), output, "encoding VSCACControlModes"; direction = :neutral)
end
Base.string(value::VSCACControlModes) = string(value.value)
