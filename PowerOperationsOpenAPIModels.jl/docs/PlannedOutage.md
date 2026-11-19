# PlannedOutage

Supplemental attribute describing outages that are scheduled in advance, naming the time series that carries the schedule. A planned outage is not a contingency, so it has no monitored components.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** |  | [required]
**`outage_schedule`** | **`String`** |  | [required]
**`identifier`** | **`Union{Absent,Union{Nothing,String}}`** | Optional user-supplied identifier for the outage, such as a name or a block id. Null when not set. | [optional]
