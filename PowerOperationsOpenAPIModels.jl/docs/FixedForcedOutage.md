# FixedForcedOutage

Supplemental attribute recording a component's forced outage status directly, rather than as a probability. `outage_status` is 1 when the component is outaged and 0 when it is available, and it can be backed by a time series drawn from a stochastic simulation or from historical records.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** |  | [required]
**`monitored_components`** | **`Union{Absent,Nothing,Vector{Int64}}`** | IDs of devices whose post-contingency state should be modeled when this outage occurs. Empty by default; semantics of an empty list are decided by the downstream consumer. | [optional]
**`outage_status`** | **`Float64`** |  | [required]
