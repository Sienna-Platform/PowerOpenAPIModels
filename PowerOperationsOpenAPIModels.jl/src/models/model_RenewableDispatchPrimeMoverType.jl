@doc "    RenewableDispatchPrimeMoverType\n\nPrime mover technology according to EIA 923."
struct RenewableDispatchPrimeMoverType
    value::String
    function RenewableDispatchPrimeMoverType(value::String)
        value in ("BA","BT","CA","CC","CE","CP","CS","CT","ES","FC","FW","GT","HA","HB","HK","HY","IC","PS","OT","ST","PVe","WT","WS") || throw(ArgumentError("invalid RenewableDispatchPrimeMoverType value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{RenewableDispatchPrimeMoverType}, value) = _decode(RenewableDispatchPrimeMoverType, value, true)
function _decode(::Type{RenewableDispatchPrimeMoverType}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/RenewableDispatch/properties/prime_mover_type"), value, "decoding RenewableDispatchPrimeMoverType"; direction = :neutral)
    return RenewableDispatchPrimeMoverType(_decode(String, value, _openapi_validate))
end
function _encode(value::RenewableDispatchPrimeMoverType)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/RenewableDispatch/properties/prime_mover_type"), output, "encoding RenewableDispatchPrimeMoverType"; direction = :neutral)
end
Base.string(value::RenewableDispatchPrimeMoverType) = string(value.value)
