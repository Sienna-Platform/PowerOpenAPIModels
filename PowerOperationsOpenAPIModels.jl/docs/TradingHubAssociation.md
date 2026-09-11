# TradingHubAssociation

Links a trading hub to one associated entity. One record per (hub, member) pair. entity_id may name a bus or a market transaction settling at the hub; no member-type discriminator is needed.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`entity_id`** | **`Int64`** | ID of the associated entity: a bus or a market transaction. | [required]
**`trading_hub_id`** | **`Int64`** | ID of the trading hub the association belongs to. | [required]
