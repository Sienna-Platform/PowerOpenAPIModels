@doc "    ThermalMultiStartPrimeMoverType\n\nPrime mover technology according to EIA 923."
struct ThermalMultiStartPrimeMoverType
    value::String
    function ThermalMultiStartPrimeMoverType(value::String)
        value in ("BA","BT","CA","CC","CE","CP","CS","CT","ES","FC","FW","GT","HA","HB","HK","HY","IC","PS","OT","ST","PVe","WT","WS") || throw(ArgumentError("invalid ThermalMultiStartPrimeMoverType value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ThermalMultiStartPrimeMoverType}, value) = _decode(ThermalMultiStartPrimeMoverType, value, true)
function _decode(::Type{ThermalMultiStartPrimeMoverType}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ThermalMultiStart/properties/prime_mover_type"), value, "decoding ThermalMultiStartPrimeMoverType"; direction = :neutral)
    return ThermalMultiStartPrimeMoverType(_decode(String, value, _openapi_validate))
end
function _encode(value::ThermalMultiStartPrimeMoverType)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ThermalMultiStart/properties/prime_mover_type"), output, "encoding ThermalMultiStartPrimeMoverType"; direction = :neutral)
end
Base.string(value::ThermalMultiStartPrimeMoverType) = string(value.value)
