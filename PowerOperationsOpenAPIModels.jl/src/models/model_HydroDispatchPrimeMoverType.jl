@doc "    HydroDispatchPrimeMoverType\n\nPrime mover technology according to EIA 923."
struct HydroDispatchPrimeMoverType
    value::String
    function HydroDispatchPrimeMoverType(value::String)
        value in ("BA","BT","CA","CC","CE","CP","CS","CT","ES","FC","FW","GT","HA","HB","HK","HY","IC","PS","OT","ST","PVe","WT","WS") || throw(ArgumentError("invalid HydroDispatchPrimeMoverType value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{HydroDispatchPrimeMoverType}, value) = _decode(HydroDispatchPrimeMoverType, value, true)
function _decode(::Type{HydroDispatchPrimeMoverType}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HydroDispatch/properties/prime_mover_type"), value, "decoding HydroDispatchPrimeMoverType"; direction = :neutral)
    return HydroDispatchPrimeMoverType(_decode(String, value, _openapi_validate))
end
function _encode(value::HydroDispatchPrimeMoverType)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/HydroDispatch/properties/prime_mover_type"), output, "encoding HydroDispatchPrimeMoverType"; direction = :neutral)
end
Base.string(value::HydroDispatchPrimeMoverType) = string(value.value)
