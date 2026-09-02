@doc "    StorageTechnologyPrimeMoverType\n\nPrime mover for generator."
struct StorageTechnologyPrimeMoverType
    value::String
    function StorageTechnologyPrimeMoverType(value::String)
        value in ("BA","BT","CA","CC","CE","CP","CS","CT","ES","FC","FW","GT","HA","HB","HK","HY","IC","PS","OT","ST","PVe","WT","WS") || throw(ArgumentError("invalid StorageTechnologyPrimeMoverType value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{StorageTechnologyPrimeMoverType}, value) = _decode(StorageTechnologyPrimeMoverType, value, true)
function _decode(::Type{StorageTechnologyPrimeMoverType}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/StorageTechnology/properties/prime_mover_type"), value, "decoding StorageTechnologyPrimeMoverType"; direction = :neutral)
    return StorageTechnologyPrimeMoverType(_decode(String, value, _openapi_validate))
end
function _encode(value::StorageTechnologyPrimeMoverType)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/StorageTechnology/properties/prime_mover_type"), output, "encoding StorageTechnologyPrimeMoverType"; direction = :neutral)
end
Base.string(value::StorageTechnologyPrimeMoverType) = string(value.value)
