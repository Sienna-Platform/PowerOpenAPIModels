@doc "    OnlineReserveReserveDirection\n\nWhether the reserve is an upward, downward, or symmetric reserve product."
struct OnlineReserveReserveDirection
    value::String
    function OnlineReserveReserveDirection(value::String)
        value in ("UP","DOWN","SYMMETRIC") || throw(ArgumentError("invalid OnlineReserveReserveDirection value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{OnlineReserveReserveDirection}, value) = _decode(OnlineReserveReserveDirection, value, true)
function _decode(::Type{OnlineReserveReserveDirection}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/OnlineReserve/properties/reserve_direction"), value, "decoding OnlineReserveReserveDirection"; direction = :neutral)
    return OnlineReserveReserveDirection(_decode(String, value, _openapi_validate))
end
function _encode(value::OnlineReserveReserveDirection)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/OnlineReserve/properties/reserve_direction"), output, "encoding OnlineReserveReserveDirection"; direction = :neutral)
end
Base.string(value::OnlineReserveReserveDirection) = string(value.value)
