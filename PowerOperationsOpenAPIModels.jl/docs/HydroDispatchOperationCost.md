# HydroDispatchOperationCost



## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**value** | This is a oneOf model. The value must be exactly one of the following types: HydroGenerationCost, ImportExportTimeSeriesCost, MarketBidCost, MarketBidTimeSeriesCost | Operating cost of generation. or MarketBidCost; default PSY.HydroGenerationCost(nothing) | [optional] 

The discriminator field is `cost_type` with the following mapping:
 - `HYDRO_GEN`: `HydroGenerationCost`
 - `IMPORT_EXPORT_TIME_SERIES`: `ImportExportTimeSeriesCost`
 - `MARKET_BID`: `MarketBidCost`
 - `MARKET_BID_TIME_SERIES`: `MarketBidTimeSeriesCost`



[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


