# GeometricDistributionForcedOutage

Supplemental attribute describing forced outages whose transitions follow geometric distributions, parameterized by the probability of entering an outage and the mean time to recovery. Both the outage and recovery probabilities can be backed by time series.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** |  | [required]
**`mean_time_to_recovery`** | **`Union{Absent,Float64,Nothing}`** | Mean time elapsed between a failure and the return to service, in minutes. Units: min. | [optional]
**`monitored_components`** | **`Union{Absent,Nothing,Vector{Int64}}`** | IDs of devices whose post-contingency state should be modeled when this outage occurs. Empty by default; semantics of an empty list are decided by the downstream consumer. | [optional]
**`outage_transition_probability`** | **`Union{Absent,Float64,Nothing}`** | Probability of transitioning into a forced outage in one minute, the same time step `mean_time_to_recovery` is stated in. | [optional]
