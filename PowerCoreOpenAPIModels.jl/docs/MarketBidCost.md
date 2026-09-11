# MarketBidCost

Cost representation for static (non-time-varying) market bids of energy and ancillary services.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`ancillary_service_offers`** | **`Vector{Int64}`** | IDs of the ancillary service components that this market bid offers into. | [required]
**`cost_type`** | **`Union{Absent,Nothing,String}`** |  | [optional]
**`curve_multistep`** | **`Union{Absent,CurveMultiStep,Nothing}`** | Multi-step block indicator: 0 = SINGLE_STEP (default; independent steps), 1 = MULTI_STEP (one block across every step). Independent of curve_style. | [optional]
**`curve_style`** | **`Union{Absent,CurveStyles,Nothing}`** | Curve-clearing style for the bid: 0 = VARIABLE (default; continuous, one or more segments), 1 = FIXED (all-or-nothing, single segment). | [optional]
**`decremental_offer_curves`** | **`CostCurve`** | Buy offer curves data as a `CostCurve` of `PiecewiseIncrementalCurve`. | [required]
**`decremental_slope`** | **`Union{Absent,Bool,Nothing}`** | Linear-interpolation flag for the decremental offer curves; false (default) is the step interpretation. Mutually exclusive with block groups on the same curve. | [optional]
**`incremental_offer_curves`** | **`CostCurve`** | Sell offer curves data as a `CostCurve` of `PiecewiseIncrementalCurve`. | [required]
**`incremental_slope`** | **`Union{Absent,Bool,Nothing}`** | Linear-interpolation flag for the incremental offer curves; false (default) is the step interpretation. Mutually exclusive with block groups on the same curve. | [optional]
**`minimum_energy_offer`** | **`InputOutputCurve`** | Minimum-energy offer: cost to run at minimum stable level, in $/MWh at the curve's minimum power. A bare scalar `s` promotes to constant_term = s. | [required]
**`shut_down`** | **`InputOutputCurve`** | Shut-down cost. A bare scalar `s` promotes to an InputOutputCurve with constant_term = s, proportional_term = 0. | [required]
**`start_up`** | **`StartUpStages`** | Start-up cost at different stages of the thermal cycle (hot, warm, cold). | [required]
