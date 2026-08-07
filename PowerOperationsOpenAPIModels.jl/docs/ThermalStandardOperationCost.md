# ThermalStandardOperationCost



## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**value** | This is a oneOf model. The value must be exactly one of the following types: MarketBidCost, ThermalGenerationCost | Operating cost of generation, or a MarketBidCost. | [optional] 

The discriminator field is `cost_type` with the following mapping:
 - `MARKET_BID`: `MarketBidCost`
 - `THERMAL`: `ThermalGenerationCost`



[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


