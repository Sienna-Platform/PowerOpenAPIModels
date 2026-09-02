@doc "    BilateralProduct\n\nTraded product of a bilateral transaction. ENERGY: energy. CAPACITY: capacity. ANCILLARY_SERVICE: an ancillary service. LOAD_OBLIGATION: a load obligation transfer."
struct BilateralProduct
    value::String
    function BilateralProduct(value::String)
        value in ("ENERGY","CAPACITY","ANCILLARY_SERVICE","LOAD_OBLIGATION") || throw(ArgumentError("invalid BilateralProduct value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{BilateralProduct}, value) = _decode(BilateralProduct, value, true)
function _decode(::Type{BilateralProduct}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/BilateralProduct"), value, "decoding BilateralProduct"; direction = :neutral)
    return BilateralProduct(_decode(String, value, _openapi_validate))
end
function _encode(value::BilateralProduct)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/BilateralProduct"), output, "encoding BilateralProduct"; direction = :neutral)
end
Base.string(value::BilateralProduct) = string(value.value)
