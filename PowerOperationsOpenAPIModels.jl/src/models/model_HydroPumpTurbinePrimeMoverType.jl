@doc "    HydroPumpTurbinePrimeMoverType\n\nPrime mover technology according to EIA 923."
struct HydroPumpTurbinePrimeMoverType
    value::String
    function HydroPumpTurbinePrimeMoverType(value::String)
        value in ("BA","BT","CA","CC","CE","CP","CS","CT","ES","FC","FW","GT","HA","HB","HK","HY","IC","PS","OT","ST","PVe","WT","WS") || throw(ArgumentError("invalid HydroPumpTurbinePrimeMoverType value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{HydroPumpTurbinePrimeMoverType}, value) = _decode(HydroPumpTurbinePrimeMoverType, value, true)
function _decode(::Type{HydroPumpTurbinePrimeMoverType}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/HydroPumpTurbine/properties/prime_mover_type"), value, "decoding HydroPumpTurbinePrimeMoverType"; direction = :neutral)
    return HydroPumpTurbinePrimeMoverType(_decode(String, value, _openapi_validate))
end
function _encode(value::HydroPumpTurbinePrimeMoverType)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/HydroPumpTurbine/properties/prime_mover_type"), output, "encoding HydroPumpTurbinePrimeMoverType"; direction = :neutral)
end
Base.string(value::HydroPumpTurbinePrimeMoverType) = string(value.value)
