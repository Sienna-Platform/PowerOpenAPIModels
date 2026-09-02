@doc "    ThermalStandardPrimeMoverType\n\nPrime mover technology according to EIA 923."
struct ThermalStandardPrimeMoverType
    value::String
    function ThermalStandardPrimeMoverType(value::String)
        value in ("BA","BT","CA","CC","CE","CP","CS","CT","ES","FC","FW","GT","HA","HB","HK","HY","IC","PS","OT","ST","PVe","WT","WS") || throw(ArgumentError("invalid ThermalStandardPrimeMoverType value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ThermalStandardPrimeMoverType}, value) = _decode(ThermalStandardPrimeMoverType, value, true)
function _decode(::Type{ThermalStandardPrimeMoverType}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ThermalStandard/properties/prime_mover_type"), value, "decoding ThermalStandardPrimeMoverType"; direction = :neutral)
    return ThermalStandardPrimeMoverType(_decode(String, value, _openapi_validate))
end
function _encode(value::ThermalStandardPrimeMoverType)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ThermalStandard/properties/prime_mover_type"), output, "encoding ThermalStandardPrimeMoverType"; direction = :neutral)
end
Base.string(value::ThermalStandardPrimeMoverType) = string(value.value)
