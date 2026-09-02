@doc "    HybridSystemOperationCostCurveStyle\n\nCurve-clearing style for the bid: 0 = CURVE (ordinary divisible price-setting curve, default); 1 = FIXED (clears as one indivisible all-or-nothing package over its period); 2 = VARIABLE (divisible quantity, block-priced, cannot set the settlement-point price). Corresponds to ERCOT's DAM PriceCurve curveStyle field (CURVE/FIXED/VARIABLE). A non-zero value is mutually exclusive with incremental_slope/decremental_slope."
struct HybridSystemOperationCostCurveStyle
    value::Int64
    function HybridSystemOperationCostCurveStyle(value::Int64)
        value in (0,1,2) || throw(ArgumentError("invalid HybridSystemOperationCostCurveStyle value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{HybridSystemOperationCostCurveStyle}, value) = _decode(HybridSystemOperationCostCurveStyle, value, true)
function _decode(::Type{HybridSystemOperationCostCurveStyle}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/HybridSystem/properties/operation_cost/properties/curve_style"), value, "decoding HybridSystemOperationCostCurveStyle"; direction = :neutral)
    return HybridSystemOperationCostCurveStyle(_decode(Int64, value, _openapi_validate))
end
function _encode(value::HybridSystemOperationCostCurveStyle)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/HybridSystem/properties/operation_cost/properties/curve_style"), output, "encoding HybridSystemOperationCostCurveStyle"; direction = :neutral)
end
Base.string(value::HybridSystemOperationCostCurveStyle) = string(value.value)
