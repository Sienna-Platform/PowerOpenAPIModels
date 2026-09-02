@doc "    BilateralTransactionMarket\n\nMarket stage the transaction was reported against."
struct BilateralTransactionMarket
    value::String
    function BilateralTransactionMarket(value::String)
        value in ("DAY_AHEAD","REAL_TIME") || throw(ArgumentError("invalid BilateralTransactionMarket value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{BilateralTransactionMarket}, value) = _decode(BilateralTransactionMarket, value, true)
function _decode(::Type{BilateralTransactionMarket}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/BilateralTransaction/properties/market"), value, "decoding BilateralTransactionMarket"; direction = :neutral)
    return BilateralTransactionMarket(_decode(String, value, _openapi_validate))
end
function _encode(value::BilateralTransactionMarket)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/BilateralTransaction/properties/market"), output, "encoding BilateralTransactionMarket"; direction = :neutral)
end
Base.string(value::BilateralTransactionMarket) = string(value.value)
