@doc "    ACBusBustype\n\nUsed to describe the connectivity and behavior of this bus. in psy5 a required param with an option to be nothing"
struct ACBusBustype
    value::String
    function ACBusBustype(value::String)
        value in ("PQ","PV","REF","ISOLATED","SLACK") || throw(ArgumentError("invalid ACBusBustype value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ACBusBustype}, value) = _decode(ACBusBustype, value, true)
function _decode(::Type{ACBusBustype}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ACBus/properties/bustype"), value, "decoding ACBusBustype"; direction = :neutral)
    return ACBusBustype(_decode(String, value, _openapi_validate))
end
function _encode(value::ACBusBustype)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ACBus/properties/bustype"), output, "encoding ACBusBustype"; direction = :neutral)
end
Base.string(value::ACBusBustype) = string(value.value)
