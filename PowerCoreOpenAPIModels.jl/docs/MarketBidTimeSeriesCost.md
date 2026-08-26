# MarketBidTimeSeriesCost


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`cost_type`** | **`String`** |  | [default to "MARKET_BID_TIME_SERIES"]
**`no_load_cost`** | [**`*TimeSeriesInputOutputCurve2`**](TimeSeriesInputOutputCurve2.md) |  | [default to nothing]
**`start_up_association_id`** | **`Int64`** | Store-minted id of a time series of three-stage (hot, warm, cold) start-up costs. | [default to nothing]
**`shut_down`** | [**`*TimeSeriesInputOutputCurve3`**](TimeSeriesInputOutputCurve3.md) |  | [default to nothing]
**`incremental_offer_curves`** | [**`*CostCurve`**](CostCurve.md) |  | [default to nothing]
**`decremental_offer_curves`** | [**`*CostCurve`**](CostCurve.md) |  | [default to nothing]
**`ancillary_service_offers`** | **`Vector{Int64}`** | IDs of the ancillary service components that this bid offers into. | [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


