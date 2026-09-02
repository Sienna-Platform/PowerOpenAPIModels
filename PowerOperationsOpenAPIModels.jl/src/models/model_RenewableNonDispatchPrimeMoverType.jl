@doc "    RenewableNonDispatchPrimeMoverType\n\nPrime mover technology according to EIA 923."
struct RenewableNonDispatchPrimeMoverType
    value::String
    function RenewableNonDispatchPrimeMoverType(value::String)
        value in ("BA","BT","CA","CC","CE","CP","CS","CT","ES","FC","FW","GT","HA","HB","HK","HY","IC","PS","OT","ST","PVe","WT","WS") || throw(ArgumentError("invalid RenewableNonDispatchPrimeMoverType value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{RenewableNonDispatchPrimeMoverType}, value) = _decode(RenewableNonDispatchPrimeMoverType, value, true)
function _decode(::Type{RenewableNonDispatchPrimeMoverType}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/RenewableNonDispatch/properties/prime_mover_type"), value, "decoding RenewableNonDispatchPrimeMoverType"; direction = :neutral)
    return RenewableNonDispatchPrimeMoverType(_decode(String, value, _openapi_validate))
end
function _encode(value::RenewableNonDispatchPrimeMoverType)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/RenewableNonDispatch/properties/prime_mover_type"), output, "encoding RenewableNonDispatchPrimeMoverType"; direction = :neutral)
end
Base.string(value::RenewableNonDispatchPrimeMoverType) = string(value.value)
