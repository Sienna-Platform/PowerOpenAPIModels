"""
    BilateralProduct

Traded product of a bilateral transaction. ENERGY: energy. CAPACITY: capacity. ANCILLARY_SERVICE: an ancillary service. LOAD_OBLIGATION: a load obligation transfer.
"""
struct BilateralProduct <: EnumAPIModel
    value::String
    function BilateralProduct(value::String)
        value in ("ENERGY", "CAPACITY", "ANCILLARY_SERVICE", "LOAD_OBLIGATION") ||
            throw(ArgumentError("invalid BilateralProduct value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{BilateralProduct}, value) = _decode(BilateralProduct, value, true)
function _decode(::Type{BilateralProduct}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-452260947985e8a3e864.json",
            pointer="/\$defs/BilateralProduct",
        ),
        value,
        "decoding BilateralProduct";
        direction=:neutral,
    )
    return BilateralProduct(_decode(String, value, false))
end
function _encode_unvalidated(value::BilateralProduct)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::BilateralProduct) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-452260947985e8a3e864.json",
        pointer="/\$defs/BilateralProduct",
    ),
    _encode_unvalidated(value),
    "encoding BilateralProduct";
    direction=:neutral,
)
Base.string(value::BilateralProduct) = string(value.value)
