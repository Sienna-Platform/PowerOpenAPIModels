# PlannedOutage

Supplemental attribute describing outages that are scheduled in advance, naming the time series that carries the schedule.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** |  | [required]
**`identifier`** | **`Union{Absent,Union{Nothing,String}}`** | Optional user-supplied identifier for the outage, such as a name or a block id. Null when not set. | [optional]
**`monitored_components`** | **`Union{Absent,Nothing,Vector{Int64}}`** | IDs of devices whose post-contingency state to model for this outage. Empty by default. | [optional]
**`outage_schedule`** | **`String`** |  | [required]
