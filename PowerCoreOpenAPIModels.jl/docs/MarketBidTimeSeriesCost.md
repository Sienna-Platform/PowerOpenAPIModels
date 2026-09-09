# MarketBidTimeSeriesCost


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`cost_type`** | **`String`** |  | [default to "MARKET_BID_TIME_SERIES"]
**`minimum_energy_offer`** | [**`*TimeSeriesInputOutputCurve`**](TimeSeriesInputOutputCurve.md) |  | [default to nothing]
**`start_up_association_id`** | **`Int64`** | Store-minted id of a time series of three-stage (hot, warm, cold) start-up costs. | [default to nothing]
**`shut_down`** | [**`*TimeSeriesInputOutputCurve`**](TimeSeriesInputOutputCurve.md) |  | [default to nothing]
**`incremental_offer_curves`** | [**`*CostCurve`**](CostCurve.md) |  | [default to nothing]
**`decremental_offer_curves`** | [**`*CostCurve`**](CostCurve.md) |  | [default to nothing]
**`ancillary_service_offers`** | **`Vector{Int64}`** | IDs of the ancillary service components that this bid offers into. | [default to nothing]
**`incremental_slope`** | **`Bool`** | Linear-interpolation flag for the incremental offer curves; false (default) is the step interpretation. Mutually exclusive with block groups on the same curve. | [optional] [default to false]
**`decremental_slope`** | **`Bool`** | Linear-interpolation flag for the decremental offer curves; false (default) is the step interpretation. Mutually exclusive with block groups on the same curve. | [optional] [default to false]
**`curve_style`** | **`Int64`** | Curve-clearing style for the bid: 0 &#x3D; VARIABLE (default; continuous quantity with one or more segments); 1 &#x3D; FIXED (all-or-nothing block with a single segment). FIXED is mutually exclusive with incremental_slope/decremental_slope and requires a single-segment offer curve. | [optional] [default to 0]
**`curve_multistep`** | **`Int64`** | Multi-step block indicator for the bid: 0 &#x3D; SINGLE_STEP (default; each step of the bid clears independently); 1 &#x3D; MULTI_STEP (the bid must be awarded as one block across every step it covers). Counted in model steps so it applies at any resolution. Independent of curve_style: curve_style is the quantity structure, curve_multistep is the time structure, and they compose. | [optional] [default to 0]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


