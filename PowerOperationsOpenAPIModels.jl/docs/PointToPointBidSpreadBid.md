# PointToPointBidSpreadBid



## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**value** | This is a oneOf model. The value must be exactly one of the following types: MarketBidCost, MarketBidTimeSeriesCost | Willingness-to-pay curve on the to-minus-from price spread, as an offer-curve operating cost (incremental side only). | [optional] 

The discriminator field is `cost_type` with the following mapping:
 - `MARKET_BID`: `MarketBidCost`
 - `MARKET_BID_TIME_SERIES`: `MarketBidTimeSeriesCost`



[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


