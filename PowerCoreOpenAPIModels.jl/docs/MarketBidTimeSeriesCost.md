# MarketBidTimeSeriesCost

Cost representation for time-varying market bids of energy and ancillary services. The static counterpart is MarketBidCost.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`ancillary_service_offers`** | **`Vector{Int64}`** | IDs of the ancillary service components that this bid offers into. | [required]
**`cost_type`** | **`String`** |  | [required]
**`curve_style`** | **`Union{Absent,MarketBidTimeSeriesCostCurveStyle,Nothing}`** | Curve-clearing style for the bid: 0 = CURVE (ordinary divisible price-setting curve, default); 1 = FIXED (clears as one indivisible all-or-nothing package over its period); 2 = VARIABLE (divisible quantity, block-priced, cannot set the settlement-point price). Corresponds to ERCOT's DAM PriceCurve curveStyle field (CURVE/FIXED/VARIABLE). A non-zero value is mutually exclusive with incremental_slope/decremental_slope. | [optional]
**`decremental_offer_curves`** | **`CostCurve`** | Buy offer curves whose value curve is a time-series-backed piecewise incremental curve. Only the TIME_SERIES_INCREMENTAL variant is admissible here; any other variant is rejected by the consuming constructor. | [required]
**`decremental_slope`** | **`Union{Absent,Bool,Nothing}`** | Linear-interpolation flag for the decremental offer curves; false (default) is the step interpretation. Mutually exclusive with block groups on the same curve. | [optional]
**`incremental_offer_curves`** | **`CostCurve`** | Sell offer curves whose value curve is a time-series-backed piecewise incremental curve. Only the TIME_SERIES_INCREMENTAL variant is admissible here; any other variant is rejected by the consuming constructor. | [required]
**`incremental_slope`** | **`Union{Absent,Bool,Nothing}`** | Linear-interpolation flag for the incremental offer curves; false (default) is the step interpretation. Mutually exclusive with block groups on the same curve. | [optional]
**`minimum_energy_offer`** | **`TimeSeriesInputOutputCurve`** | Minimum-energy offer: cost to operate at minimum stable level, in $/MWh at the curve's minimum power, stored as submitted. $/h sources convert at parse (MEO = no-load cost / P_min). Time-series-backed linear curve; only the TIME_SERIES_LINEAR function-data variant is admissible here — the consuming constructor rejects any other. | [required]
**`shut_down`** | **`TimeSeriesInputOutputCurve`** | Shut-down cost as a time-series-backed linear curve. Only the TIME_SERIES_LINEAR function-data variant is admissible here; the consuming constructor rejects any other. | [required]
**`start_up_association_id`** | **`Int64`** | Store-minted id of a time series of three-stage (hot, warm, cold) start-up costs. | [required]
