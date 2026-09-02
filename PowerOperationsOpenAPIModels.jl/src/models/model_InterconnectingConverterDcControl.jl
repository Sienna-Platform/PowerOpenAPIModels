@doc "    InterconnectingConverterDcControl\n\nDC-side control mode of the converter."
struct InterconnectingConverterDcControl
    value::String
    function InterconnectingConverterDcControl(value::String)
        value in ("DC_POWER","DC_VOLTAGE","DC_VOLTAGE_DROOP") || throw(ArgumentError("invalid InterconnectingConverterDcControl value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{InterconnectingConverterDcControl}, value) = _decode(InterconnectingConverterDcControl, value, true)
function _decode(::Type{InterconnectingConverterDcControl}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/InterconnectingConverter/properties/dc_control"), value, "decoding InterconnectingConverterDcControl"; direction = :neutral)
    return InterconnectingConverterDcControl(_decode(String, value, _openapi_validate))
end
function _encode(value::InterconnectingConverterDcControl)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/InterconnectingConverter/properties/dc_control"), output, "encoding InterconnectingConverterDcControl"; direction = :neutral)
end
Base.string(value::InterconnectingConverterDcControl) = string(value.value)
