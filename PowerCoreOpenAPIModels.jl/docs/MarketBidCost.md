# MarketBidCost


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`cost_type`** | **`String`** |  | [optional] [default to "MARKET_BID"]
**`minimum_energy_offer`** | [**`*InputOutputCurve`**](InputOutputCurve.md) |  | [default to nothing]
**`start_up`** | [**`*StartUpStages`**](StartUpStages.md) |  | [default to nothing]
**`shut_down`** | [**`*InputOutputCurve`**](InputOutputCurve.md) |  | [default to nothing]
**`incremental_offer_curves`** | [**`*CostCurve`**](CostCurve.md) |  | [default to nothing]
**`decremental_offer_curves`** | [**`*CostCurve`**](CostCurve.md) |  | [default to nothing]
**`ancillary_service_offers`** | **`Vector{Int64}`** | IDs of the ancillary service components that this market bid offers into. | [default to nothing]
**`incremental_slope`** | **`Bool`** | Linear-interpolation flag for the incremental offer curves; false (default) is the step interpretation. Mutually exclusive with block groups on the same curve. | [optional] [default to false]
**`decremental_slope`** | **`Bool`** | Linear-interpolation flag for the decremental offer curves; false (default) is the step interpretation. Mutually exclusive with block groups on the same curve. | [optional] [default to false]
**`curve_style`** | **`Int64`** | Curve-clearing style for the bid: 0 &#x3D; CURVE (ordinary divisible price-setting curve, default); 1 &#x3D; FIXED (clears as one indivisible all-or-nothing package over its period); 2 &#x3D; VARIABLE (divisible quantity, block-priced, cannot set the settlement-point price). Corresponds to ERCOT&#39;s DAM PriceCurve curveStyle field (CURVE/FIXED/VARIABLE). A non-zero value is mutually exclusive with incremental_slope/decremental_slope. | [optional] [default to 0]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


