# HydroDispatchOperationCost



## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**value** | This is a oneOf model. The value must be exactly one of the following types: HydroGenerationCost, MarketBidCost | Operating cost of generation. or MarketBidCost; default PSY.HydroGenerationCost(nothing) | [optional] 

The discriminator field is `cost_type` with the following mapping:
 - `HYDRO_GEN`: `HydroGenerationCost`
 - `MARKET_BID`: `MarketBidCost`



[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


