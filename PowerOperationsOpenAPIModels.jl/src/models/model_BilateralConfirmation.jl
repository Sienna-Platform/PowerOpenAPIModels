"""
    BilateralConfirmation

Confirmation status a bilateral transaction settled under. DUAL_CONFIRM: both confirmed. UNILATERAL_BUYER/SELLER: only that side. FIRST_REPORTER_DEEMED: first-reported side deemed confirmed. EXACT_MATCH_OR_REJECT: exact match only.
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
            resource="https://openapi.invalid/schema/root-93346ccf4b7969b6d994.json",
            pointer="/components/schemas/BilateralConfirmation",
        ),
        value,
        "decoding BilateralConfirmation";
        direction=:neutral,
    )
    return BilateralConfirmation(_decode(String, value, _openapi_validate))
end
function _encode(value::BilateralConfirmation)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-93346ccf4b7969b6d994.json",
            pointer="/components/schemas/BilateralConfirmation",
        ),
        output,
        "encoding BilateralConfirmation";
        direction=:neutral,
    )
end
Base.string(value::BilateralConfirmation) = string(value.value)
