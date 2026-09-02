@doc "    GroupReserveReserveDirection\n\nWhether the reserve is an upward, downward, or symmetric reserve product."
struct GroupReserveReserveDirection
    value::String
    function GroupReserveReserveDirection(value::String)
        value in ("UP","DOWN","SYMMETRIC") || throw(ArgumentError("invalid GroupReserveReserveDirection value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{GroupReserveReserveDirection}, value) = _decode(GroupReserveReserveDirection, value, true)
function _decode(::Type{GroupReserveReserveDirection}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/GroupReserve/properties/reserve_direction"), value, "decoding GroupReserveReserveDirection"; direction = :neutral)
    return GroupReserveReserveDirection(_decode(String, value, _openapi_validate))
end
function _encode(value::GroupReserveReserveDirection)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/GroupReserve/properties/reserve_direction"), output, "encoding GroupReserveReserveDirection"; direction = :neutral)
end
Base.string(value::GroupReserveReserveDirection) = string(value.value)
