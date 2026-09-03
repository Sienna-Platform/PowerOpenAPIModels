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
**`curve_style`** | **`Int64`** | Curve-clearing style for the bid: 0 &#x3D; CURVE (ordinary divisible price-setting curve, default); 1 &#x3D; FIXED (clears as one indivisible all-or-nothing package over its period); 2 &#x3D; VARIABLE (divisible quantity, block-priced, cannot set the settlement-point price). A non-zero value is mutually exclusive with incremental_slope/decremental_slope. | [optional] [default to 0]
**`curve_multihour`** | **`Int64`** | Multi-hour block indicator for the bid: 0 &#x3D; SINGLE_HOUR (default; each hour of the bid clears independently); 1 &#x3D; MULTI_HOUR (the bid must be awarded as one block across every hour it covers). Independent of curve_style: curve_style is the quantity structure, curve_multihour is the time structure, and they compose. | [optional] [default to 0]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


