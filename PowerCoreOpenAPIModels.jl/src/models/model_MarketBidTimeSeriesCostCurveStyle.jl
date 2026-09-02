@doc "    MarketBidTimeSeriesCostCurveStyle\n\nCurve-clearing style for the bid: 0 = CURVE (ordinary divisible price-setting curve, default); 1 = FIXED (clears as one indivisible all-or-nothing package over its period); 2 = VARIABLE (divisible quantity, block-priced, cannot set the settlement-point price). Corresponds to ERCOT's DAM PriceCurve curveStyle field (CURVE/FIXED/VARIABLE). A non-zero value is mutually exclusive with incremental_slope/decremental_slope."
struct MarketBidTimeSeriesCostCurveStyle
    value::Int64
    function MarketBidTimeSeriesCostCurveStyle(value::Int64)
        value in (0,1,2) || throw(ArgumentError("invalid MarketBidTimeSeriesCostCurveStyle value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{MarketBidTimeSeriesCostCurveStyle}, value) = _decode(MarketBidTimeSeriesCostCurveStyle, value, true)
function _decode(::Type{MarketBidTimeSeriesCostCurveStyle}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/MarketBidTimeSeriesCost/properties/curve_style"), value, "decoding MarketBidTimeSeriesCostCurveStyle"; direction = :neutral)
    return MarketBidTimeSeriesCostCurveStyle(_decode(Int64, value, _openapi_validate))
end
function _encode(value::MarketBidTimeSeriesCostCurveStyle)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/MarketBidTimeSeriesCost/properties/curve_style"), output, "encoding MarketBidTimeSeriesCostCurveStyle"; direction = :neutral)
end
Base.string(value::MarketBidTimeSeriesCostCurveStyle) = string(value.value)
