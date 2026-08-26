# SourceOperationCost



## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**value** | This is a oneOf model. The value must be exactly one of the following types: ImportExportCost, ImportExportTimeSeriesCost, MarketBidTimeSeriesCost | Cost of importing and exporting power at the source. or MarketBidCost | [optional] 

The discriminator field is `cost_type` with the following mapping:
 - `IMPORTEXPORT`: `ImportExportCost`
 - `IMPORT_EXPORT_TIME_SERIES`: `ImportExportTimeSeriesCost`
 - `MARKET_BID_TIME_SERIES`: `MarketBidTimeSeriesCost`



[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


