@doc "    HydroTurbinePrimeMoverType\n\nPrime mover technology according to EIA 923."
struct HydroTurbinePrimeMoverType
    value::String
    function HydroTurbinePrimeMoverType(value::String)
        value in ("BA","BT","CA","CC","CE","CP","CS","CT","ES","FC","FW","GT","HA","HB","HK","HY","IC","PS","OT","ST","PVe","WT","WS") || throw(ArgumentError("invalid HydroTurbinePrimeMoverType value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{HydroTurbinePrimeMoverType}, value) = _decode(HydroTurbinePrimeMoverType, value, true)
function _decode(::Type{HydroTurbinePrimeMoverType}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/HydroTurbine/properties/prime_mover_type"), value, "decoding HydroTurbinePrimeMoverType"; direction = :neutral)
    return HydroTurbinePrimeMoverType(_decode(String, value, _openapi_validate))
end
function _encode(value::HydroTurbinePrimeMoverType)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/HydroTurbine/properties/prime_mover_type"), output, "encoding HydroTurbinePrimeMoverType"; direction = :neutral)
end
Base.string(value::HydroTurbinePrimeMoverType) = string(value.value)
