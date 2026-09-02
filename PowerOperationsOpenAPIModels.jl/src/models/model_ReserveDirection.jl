@doc "    ReserveDirection\n\nDirection a reserve product is procured in. `UP` increases generation or reduces load when demand exceeds its expected level; `DOWN` decreases generation or increases load when demand falls below it; `SYMMETRIC` procures the same quantity in both directions. Upstream this distinction is a type parameter on the reserve; here it is flattened into a property."
struct ReserveDirection
    value::String
    function ReserveDirection(value::String)
        value in ("UP","DOWN","SYMMETRIC") || throw(ArgumentError("invalid ReserveDirection value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ReserveDirection}, value) = _decode(ReserveDirection, value, true)
function _decode(::Type{ReserveDirection}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ReserveDirection"), value, "decoding ReserveDirection"; direction = :neutral)
    return ReserveDirection(_decode(String, value, _openapi_validate))
end
function _encode(value::ReserveDirection)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ReserveDirection"), output, "encoding ReserveDirection"; direction = :neutral)
end
Base.string(value::ReserveDirection) = string(value.value)
