@doc "    InterconnectingConverterAcControl\n\nAC-side control mode of the converter."
struct InterconnectingConverterAcControl
    value::String
    function InterconnectingConverterAcControl(value::String)
        value in ("AC_REACTIVE_POWER","AC_VOLTAGE") || throw(ArgumentError("invalid InterconnectingConverterAcControl value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{InterconnectingConverterAcControl}, value) = _decode(InterconnectingConverterAcControl, value, true)
function _decode(::Type{InterconnectingConverterAcControl}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/InterconnectingConverter/properties/ac_control"), value, "decoding InterconnectingConverterAcControl"; direction = :neutral)
    return InterconnectingConverterAcControl(_decode(String, value, _openapi_validate))
end
function _encode(value::InterconnectingConverterAcControl)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/InterconnectingConverter/properties/ac_control"), output, "encoding InterconnectingConverterAcControl"; direction = :neutral)
end
Base.string(value::InterconnectingConverterAcControl) = string(value.value)
