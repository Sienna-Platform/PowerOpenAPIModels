# MarketBidCost1


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`cost_type`** | **`String`** |  | [optional] [default to "MARKET_BID"]
**`no_load_cost`** | [**`*InputOutputCurve`**](InputOutputCurve.md) |  | [default to nothing]
**`start_up`** | [**`*StartUpStages`**](StartUpStages.md) |  | [default to nothing]
**`shut_down`** | [**`*InputOutputCurve`**](InputOutputCurve.md) |  | [default to nothing]
**`incremental_offer_curves`** | [**`*CostCurve`**](CostCurve.md) |  | [default to nothing]
**`decremental_offer_curves`** | [**`*CostCurve`**](CostCurve.md) |  | [default to nothing]
**`ancillary_service_offers`** | **`Vector{Int64}`** | IDs of the ancillary service components that this market bid offers into. | [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


