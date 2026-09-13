# MarketBidCost

Cost representation for static (non-time-varying) market bids of energy and ancillary services.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`cost_type`** | **`Union{Absent,Nothing,String}`** |  | [optional]
**`minimum_energy_offer`** | **`InputOutputCurve`** | Minimum-energy offer: cost to operate at minimum stable level, in $/MWh at the curve's minimum power, stored as submitted. $/h sources convert at parse (MEO = no-load cost / P_min). Legacy scalar promotion: a bare scalar value `s` from a legacy source converts to an `InputOutputCurve` of `LinearFunctionData` with `constant_term = s` and `proportional_term = 0`. | [required]
**`start_up`** | **`StartUpStages`** | Start-up cost at different stages of the thermal cycle (hot, warm, cold). | [required]
**`shut_down`** | **`InputOutputCurve`** | Shut-down cost. Legacy scalar promotion: a bare scalar value `s` from a legacy source converts to an `InputOutputCurve` of `LinearFunctionData` with `constant_term = s` and `proportional_term = 0`. | [required]
**`incremental_offer_curves`** | **`CostCurve`** | Sell offer curves data as a `CostCurve` of `PiecewiseIncrementalCurve`. | [required]
**`decremental_offer_curves`** | **`CostCurve`** | Buy offer curves data as a `CostCurve` of `PiecewiseIncrementalCurve`. | [required]
**`ancillary_service_offers`** | **`Vector{Int64}`** | IDs of the ancillary service components that this market bid offers into. | [required]
**`incremental_slope`** | **`Union{Absent,Bool,Nothing}`** | Linear-interpolation flag for the incremental offer curves; false (default) is the step interpretation. Mutually exclusive with block groups on the same curve. | [optional]
**`decremental_slope`** | **`Union{Absent,Bool,Nothing}`** | Linear-interpolation flag for the decremental offer curves; false (default) is the step interpretation. Mutually exclusive with block groups on the same curve. | [optional]
**`curve_style`** | **`Union{Absent,CurveStyles,Nothing}`** | Curve-clearing style for the bid: 0 = VARIABLE (default; continuous quantity with one or more segments); 1 = FIXED (all-or-nothing block with a single segment). FIXED is mutually exclusive with incremental_slope/decremental_slope and requires a single-segment offer curve. | [optional]
**`curve_multistep`** | **`Union{Absent,CurveMultiStep,Nothing}`** | Multi-step block indicator for the bid: 0 = SINGLE_STEP (default; each step of the bid clears independently); 1 = MULTI_STEP (the bid must be awarded as one block across every step it covers). Counted in model steps so it applies at any resolution. Independent of curve_style: curve_style is the quantity structure, curve_multistep is the time structure, and they compose. | [optional]
