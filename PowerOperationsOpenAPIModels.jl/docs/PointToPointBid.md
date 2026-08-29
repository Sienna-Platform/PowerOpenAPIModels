# PointToPointBid


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., &#x60;PowerLoad&#x60;) must have unique names, but components of different types (e.g., &#x60;PowerLoad&#x60; and &#x60;ACBus&#x60;) can have the same name. | [default to nothing]
**`available`** | **`Bool`** | Indicator of whether the bid is available for market clearing (&#x60;true&#x60;) or not (&#x60;false&#x60;). | [default to nothing]
**`from_id`** | **`Int64`** | ID of the source terminal (withdrawal side), resolved through the entity registry: a topology record or a trading hub. | [default to nothing]
**`to_id`** | **`Int64`** | ID of the sink terminal (injection side), resolved through the entity registry: a topology record or a trading hub; must differ from &#x60;from_id&#x60;. | [default to nothing]
**`max_active_power`** | **`Float64`** | MW envelope for the bid. Units: MW. | [default to nothing]
**`spread_bid`** | [**`*PointToPointBidSpreadBid`**](PointToPointBidSpreadBid.md) |  | [default to nothing]
**`price_limits`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`linked_crr`** | **`String`** | Identifier of a linked congestion-right instrument, when the market couples the bid to one. | [optional] [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


