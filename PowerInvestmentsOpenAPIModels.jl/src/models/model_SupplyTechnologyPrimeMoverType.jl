@doc "    SupplyTechnologyPrimeMoverType\n\nPrime mover for generator."
struct SupplyTechnologyPrimeMoverType
    value::String
    function SupplyTechnologyPrimeMoverType(value::String)
        value in ("BA","BT","CA","CC","CE","CP","CS","CT","ES","FC","FW","GT","HA","HB","HK","HY","IC","PS","OT","ST","PVe","WT","WS") || throw(ArgumentError("invalid SupplyTechnologyPrimeMoverType value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{SupplyTechnologyPrimeMoverType}, value) = _decode(SupplyTechnologyPrimeMoverType, value, true)
function _decode(::Type{SupplyTechnologyPrimeMoverType}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/SupplyTechnology/properties/prime_mover_type"), value, "decoding SupplyTechnologyPrimeMoverType"; direction = :neutral)
    return SupplyTechnologyPrimeMoverType(_decode(String, value, _openapi_validate))
end
function _encode(value::SupplyTechnologyPrimeMoverType)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/SupplyTechnology/properties/prime_mover_type"), output, "encoding SupplyTechnologyPrimeMoverType"; direction = :neutral)
end
Base.string(value::SupplyTechnologyPrimeMoverType) = string(value.value)
