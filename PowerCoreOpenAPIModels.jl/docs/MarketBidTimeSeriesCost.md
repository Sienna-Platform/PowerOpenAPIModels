# MarketBidTimeSeriesCost

Cost representation for time-varying market bids of energy and ancillary services. The static counterpart is MarketBidCost.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`cost_type`** | **`String`** |  | [required]
**`minimum_energy_offer`** | **`TimeSeriesInputOutputCurve`** | Minimum-energy offer: cost to operate at minimum stable level, in $/MWh at the curve's minimum power, stored as submitted. $/h sources convert at parse (MEO = no-load cost / P_min). Time-series-backed linear curve; only the TIME_SERIES_LINEAR function-data variant is admissible here — the consuming constructor rejects any other. | [required]
**`start_up_association_id`** | **`Int64`** | Store-minted id of a time series of three-stage (hot, warm, cold) start-up costs. | [required]
**`shut_down`** | **`TimeSeriesInputOutputCurve`** | Shut-down cost as a time-series-backed linear curve. Only the TIME_SERIES_LINEAR function-data variant is admissible here; the consuming constructor rejects any other. | [required]
**`incremental_offer_curves`** | **`CostCurve`** | Sell offer curves whose value curve is a time-series-backed piecewise incremental curve. Only the TIME_SERIES_INCREMENTAL variant is admissible here; any other variant is rejected by the consuming constructor. | [required]
**`decremental_offer_curves`** | **`CostCurve`** | Buy offer curves whose value curve is a time-series-backed piecewise incremental curve. Only the TIME_SERIES_INCREMENTAL variant is admissible here; any other variant is rejected by the consuming constructor. | [required]
**`ancillary_service_offers`** | **`Vector{Int64}`** | IDs of the ancillary service components that this bid offers into. | [required]
**`incremental_slope`** | **`Union{Absent,Bool,Nothing}`** | Linear-interpolation flag for the incremental offer curves; false (default) is the step interpretation. Mutually exclusive with block groups on the same curve. | [optional]
**`decremental_slope`** | **`Union{Absent,Bool,Nothing}`** | Linear-interpolation flag for the decremental offer curves; false (default) is the step interpretation. Mutually exclusive with block groups on the same curve. | [optional]
**`curve_style`** | **`Union{Absent,CurveStyles,Nothing}`** | Curve-clearing style for the bid: 0 = VARIABLE (default; continuous quantity with one or more segments); 1 = FIXED (all-or-nothing block with a single segment). FIXED is mutually exclusive with incremental_slope/decremental_slope and requires a single-segment offer curve. | [optional]
**`curve_multistep`** | **`Union{Absent,CurveMultiStep,Nothing}`** | Multi-step block indicator for the bid: 0 = SINGLE_STEP (default; each step of the bid clears independently); 1 = MULTI_STEP (the bid must be awarded as one block across every step it covers). Counted in model steps so it applies at any resolution. Independent of curve_style: curve_style is the quantity structure, curve_multistep is the time structure, and they compose. | [optional]
