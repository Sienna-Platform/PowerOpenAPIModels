# InterruptiblePowerLoadOperationCost



## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**value** | This is a oneOf model. The value must be exactly one of the following types: LoadCost, MarketBidCost | Operational cost of interrupting load. or MarketBidCost | [optional] 

The discriminator field is `cost_type` with the following mapping:
 - `LOAD`: `LoadCost`
 - `MARKET_BID`: `MarketBidCost`



[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


