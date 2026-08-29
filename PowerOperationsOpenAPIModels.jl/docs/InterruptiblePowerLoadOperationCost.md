# InterruptiblePowerLoadOperationCost



## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**value** | This is a oneOf model. The value must be exactly one of the following types: ImportExportTimeSeriesCost, LoadCost, MarketBidCost, MarketBidTimeSeriesCost | Operational cost of interrupting load. or MarketBidCost | [optional] 

The discriminator field is `cost_type` with the following mapping:
 - `IMPORT_EXPORT_TIME_SERIES`: `ImportExportTimeSeriesCost`
 - `LOAD`: `LoadCost`
 - `MARKET_BID`: `MarketBidCost`
 - `MARKET_BID_TIME_SERIES`: `MarketBidTimeSeriesCost`



[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


