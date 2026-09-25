"""
    BilateralConfirmation

Confirmation status a bilateral transaction settled under. DUAL_CONFIRM: both counterparties confirmed. UNILATERAL_BUYER: only the buyer confirmed. UNILATERAL_SELLER: only the seller confirmed. FIRST_REPORTER_DEEMED: the first-reported side is deemed confirmed. EXACT_MATCH_OR_REJECT: accepted only on an exact match between counterparties, otherwise rejected.
"""
struct BilateralConfirmation <: EnumAPIModel
    value::String
    function BilateralConfirmation(value::String)
        value in (
            "DUAL_CONFIRM",
            "UNILATERAL_BUYER",
            "UNILATERAL_SELLER",
            "FIRST_REPORTER_DEEMED",
            "EXACT_MATCH_OR_REJECT",
        ) || throw(ArgumentError("invalid BilateralConfirmation value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{BilateralConfirmation}, value) = _decode(BilateralConfirmation, value, true)
function _decode(::Type{BilateralConfirmation}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-452260947985e8a3e864.json",
            pointer="/\$defs/BilateralConfirmation",
        ),
        value,
        "decoding BilateralConfirmation";
        direction=:neutral,
    )
    return BilateralConfirmation(_decode(String, value, false))
end
function _encode_unvalidated(value::BilateralConfirmation)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::BilateralConfirmation) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-452260947985e8a3e864.json",
        pointer="/\$defs/BilateralConfirmation",
    ),
    _encode_unvalidated(value),
    "encoding BilateralConfirmation";
    direction=:neutral,
)
Base.string(value::BilateralConfirmation) = string(value.value)
