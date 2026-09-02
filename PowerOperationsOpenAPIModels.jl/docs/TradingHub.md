# TradingHub

A market trading hub: a named set of member buses at which hub-settled bids are priced. Membership is carried as TradingHubAssociation rows rather than a list on this record, matching the service-membership convention.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [required]
**`name`** | **`String`** | Name of the hub. | [required]
