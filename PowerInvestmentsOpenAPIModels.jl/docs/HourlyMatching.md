# HourlyMatching

Policy requirement that the qualified demand-side technologies have their demand met by an equal amount of generation from qualified supply in every hour, such that `sum(P)_qualified_supply >= sum(D)_qualified_demand`.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). | [required]
**`id`** | **`Int64`** | ID for individual component. | [required]
**`name`** | **`String`** | Name of the component. | [required]
