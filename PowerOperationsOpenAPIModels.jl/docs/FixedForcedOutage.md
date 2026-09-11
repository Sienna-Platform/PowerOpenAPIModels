# FixedForcedOutage

Records a component's forced outage status directly rather than as a probability. outage_status is 1 when outaged, 0 when available; may be backed by a time series from simulation or historical records.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** |  | [required]
**`identifier`** | **`Union{Absent,Union{Nothing,String}}`** | Optional user-supplied identifier for the outage, such as a name or a block id. Null when not set. | [optional]
**`monitored_components`** | **`Union{Absent,Nothing,Vector{Int64}}`** | IDs of devices whose post-contingency state to model for this outage. Empty by default. | [optional]
**`outage_status`** | **`Float64`** |  | [required]
