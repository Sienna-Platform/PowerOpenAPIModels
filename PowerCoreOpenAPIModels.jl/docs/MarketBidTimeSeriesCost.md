# MarketBidTimeSeriesCost

Cost representation for time-varying market bids of energy and ancillary services. The static counterpart is MarketBidCost.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`ancillary_service_offers`** | **`Vector{Int64}`** | IDs of the ancillary service components that this bid offers into. | [required]
**`cost_type`** | **`String`** |  | [required]
**`curve_multistep`** | **`Union{Absent,CurveMultiStep,Nothing}`** | Multi-step block indicator: 0 = SINGLE_STEP (default; independent steps), 1 = MULTI_STEP (one block across every step). Independent of curve_style. | [optional]
**`curve_style`** | **`Union{Absent,CurveStyles,Nothing}`** | Curve-clearing style for the bid: 0 = VARIABLE (default; continuous, one or more segments), 1 = FIXED (all-or-nothing, single segment). | [optional]
**`decremental_offer_curves`** | **`CostCurve`** | Buy offer curves as time-series-backed piecewise incremental curves. Only the TIME_SERIES_INCREMENTAL variant is admissible; others are rejected. | [required]
**`decremental_slope`** | **`Union{Absent,Bool,Nothing}`** | Linear-interpolation flag for the decremental offer curves; false (default) is the step interpretation. Mutually exclusive with block groups on the same curve. | [optional]
**`incremental_offer_curves`** | **`CostCurve`** | Sell offer curves as time-series-backed piecewise incremental curves. Only the TIME_SERIES_INCREMENTAL variant is admissible; others are rejected. | [required]
**`incremental_slope`** | **`Union{Absent,Bool,Nothing}`** | Linear-interpolation flag for the incremental offer curves; false (default) is the step interpretation. Mutually exclusive with block groups on the same curve. | [optional]
**`minimum_energy_offer`** | **`TimeSeriesInputOutputCurve`** | Minimum-energy offer as a time-series-backed linear curve, in $/MWh at the curve's minimum power. Only the TIME_SERIES_LINEAR variant is admissible. | [required]
**`shut_down`** | **`TimeSeriesInputOutputCurve`** | Shut-down cost as a time-series-backed linear curve. Only the TIME_SERIES_LINEAR variant is admissible. | [required]
**`start_up_association_id`** | **`Int64`** | Store-minted id of a time series of three-stage (hot, warm, cold) start-up costs. | [required]
