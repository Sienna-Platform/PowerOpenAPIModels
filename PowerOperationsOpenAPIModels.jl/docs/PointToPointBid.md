# PointToPointBid

A priced point-to-point spread bid (e.g. an up-to-congestion or PTP obligation bid): a willingness-to-pay curve on the price spread between two locations. Clears as a withdrawal at the source terminal and an injection at the sink terminal.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Bool`** | Indicator of whether the bid is available for market clearing (`true`) or not (`false`). | [required]
**`from_id`** | **`Int64`** | ID of the source terminal (withdrawal side), resolved through the entity registry: a topology record or a trading hub. | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`linked_crr`** | **`Union{Absent,Union{Nothing,String}}`** | Identifier of a linked congestion-right instrument, when the market couples the bid to one. | [optional]
**`max_active_power`** | **`Float64`** | MW envelope for the bid. Units: MW. | [required]
**`name`** | **`String`** | Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name. | [required]
**`price_limits`** | **`PointToPointBidPriceLimits`** | Tariff bid-price bounds on the spread. Units: USD/MWh. | [required]
**`spread_bid`** | **`PointToPointBidSpreadBid`** | Willingness-to-pay curve on the to-minus-from price spread, as an offer-curve operating cost (incremental side only). | [required]
**`to_id`** | **`Int64`** | ID of the sink terminal (injection side), resolved through the entity registry: a topology record or a trading hub; must differ from `from_id`. | [required]
