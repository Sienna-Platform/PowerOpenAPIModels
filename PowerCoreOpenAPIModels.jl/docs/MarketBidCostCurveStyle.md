# MarketBidCostCurveStyle

Curve-clearing style for the bid: 0 = CURVE (ordinary divisible price-setting curve, default); 1 = FIXED (clears as one indivisible all-or-nothing package over its period); 2 = VARIABLE (divisible quantity, block-priced, cannot set the settlement-point price). Corresponds to ERCOT's DAM PriceCurve curveStyle field (CURVE/FIXED/VARIABLE). A non-zero value is mutually exclusive with incremental_slope/decremental_slope.

## Allowed values
- `0`
- `1`
- `2`
