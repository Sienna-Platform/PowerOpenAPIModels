# HybridSystemOperationCost

`MarketBidCost` of operating the hybrid system.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`ancillary_service_offers`** | **`Vector{Int64}`** | IDs of the ancillary service components that this market bid offers into. | [required]
**`cost_type`** | **`Union{Absent,Nothing,String}`** |  | [optional]
**`curve_style`** | **`Union{Absent,HybridSystemOperationCostCurveStyle,Nothing}`** | Curve-clearing style for the bid: 0 = CURVE (ordinary divisible price-setting curve, default); 1 = FIXED (clears as one indivisible all-or-nothing package over its period); 2 = VARIABLE (divisible quantity, block-priced, cannot set the settlement-point price). Corresponds to ERCOT's DAM PriceCurve curveStyle field (CURVE/FIXED/VARIABLE). A non-zero value is mutually exclusive with incremental_slope/decremental_slope. | [optional]
**`decremental_offer_curves`** | **`CostCurve`** | Buy offer curves data as a `CostCurve` of `PiecewiseIncrementalCurve`. | [required]
**`decremental_slope`** | **`Union{Absent,Bool,Nothing}`** | Linear-interpolation flag for the decremental offer curves; false (default) is the step interpretation. Mutually exclusive with block groups on the same curve. | [optional]
**`incremental_offer_curves`** | **`CostCurve`** | Sell offer curves data as a `CostCurve` of `PiecewiseIncrementalCurve`. | [required]
**`incremental_slope`** | **`Union{Absent,Bool,Nothing}`** | Linear-interpolation flag for the incremental offer curves; false (default) is the step interpretation. Mutually exclusive with block groups on the same curve. | [optional]
**`minimum_energy_offer`** | **`InputOutputCurve`** | Minimum-energy offer: cost to operate at minimum stable level, in $/MWh at the curve's minimum power, stored as submitted. $/h sources convert at parse (MEO = no-load cost / P_min). Legacy scalar promotion: a bare scalar value `s` from a legacy source converts to an `InputOutputCurve` of `LinearFunctionData` with `constant_term = s` and `proportional_term = 0`. | [required]
**`shut_down`** | **`InputOutputCurve`** | Shut-down cost. Legacy scalar promotion: a bare scalar value `s` from a legacy source converts to an `InputOutputCurve` of `LinearFunctionData` with `constant_term = s` and `proportional_term = 0`. | [required]
**`start_up`** | **`StartUpStages`** | Start-up cost at different stages of the thermal cycle (hot, warm, cold). | [required]
