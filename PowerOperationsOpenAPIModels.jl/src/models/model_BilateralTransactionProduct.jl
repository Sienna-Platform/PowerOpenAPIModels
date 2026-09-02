@doc "    BilateralTransactionProduct\n\nTraded product."
struct BilateralTransactionProduct
    value::String
    function BilateralTransactionProduct(value::String)
        value in ("ENERGY","CAPACITY","ANCILLARY_SERVICE","LOAD_OBLIGATION") || throw(ArgumentError("invalid BilateralTransactionProduct value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{BilateralTransactionProduct}, value) = _decode(BilateralTransactionProduct, value, true)
function _decode(::Type{BilateralTransactionProduct}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/BilateralTransaction/properties/product"), value, "decoding BilateralTransactionProduct"; direction = :neutral)
    return BilateralTransactionProduct(_decode(String, value, _openapi_validate))
end
function _encode(value::BilateralTransactionProduct)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/BilateralTransaction/properties/product"), output, "encoding BilateralTransactionProduct"; direction = :neutral)
end
Base.string(value::BilateralTransactionProduct) = string(value.value)
