@doc "    BilateralTransactionConfirmation\n\nConfirmation status the transaction settled under."
struct BilateralTransactionConfirmation
    value::String
    function BilateralTransactionConfirmation(value::String)
        value in ("DUAL_CONFIRM","UNILATERAL_BUYER","UNILATERAL_SELLER","FIRST_REPORTER_DEEMED","EXACT_MATCH_OR_REJECT") || throw(ArgumentError("invalid BilateralTransactionConfirmation value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{BilateralTransactionConfirmation}, value) = _decode(BilateralTransactionConfirmation, value, true)
function _decode(::Type{BilateralTransactionConfirmation}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/BilateralTransaction/properties/confirmation"), value, "decoding BilateralTransactionConfirmation"; direction = :neutral)
    return BilateralTransactionConfirmation(_decode(String, value, _openapi_validate))
end
function _encode(value::BilateralTransactionConfirmation)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/BilateralTransaction/properties/confirmation"), output, "encoding BilateralTransactionConfirmation"; direction = :neutral)
end
Base.string(value::BilateralTransactionConfirmation) = string(value.value)
