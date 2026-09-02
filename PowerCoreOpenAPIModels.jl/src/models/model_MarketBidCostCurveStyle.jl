@doc "    MarketBidCostCurveStyle\n\nCurve-clearing style for the bid: 0 = CURVE (ordinary divisible price-setting curve, default); 1 = FIXED (clears as one indivisible all-or-nothing package over its period); 2 = VARIABLE (divisible quantity, block-priced, cannot set the settlement-point price). Corresponds to ERCOT's DAM PriceCurve curveStyle field (CURVE/FIXED/VARIABLE). A non-zero value is mutually exclusive with incremental_slope/decremental_slope."
struct MarketBidCostCurveStyle
    value::Int64
    function MarketBidCostCurveStyle(value::Int64)
        value in (0,1,2) || throw(ArgumentError("invalid MarketBidCostCurveStyle value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{MarketBidCostCurveStyle}, value) = _decode(MarketBidCostCurveStyle, value, true)
function _decode(::Type{MarketBidCostCurveStyle}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/MarketBidCost/properties/curve_style"), value, "decoding MarketBidCostCurveStyle"; direction = :neutral)
    return MarketBidCostCurveStyle(_decode(Int64, value, _openapi_validate))
end
function _encode(value::MarketBidCostCurveStyle)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/MarketBidCost/properties/curve_style"), output, "encoding MarketBidCostCurveStyle"; direction = :neutral)
end
Base.string(value::MarketBidCostCurveStyle) = string(value.value)
