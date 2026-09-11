# GeometricDistributionForcedOutage

Describes forced outages whose transitions follow geometric distributions, parameterized by the probability of entering an outage and the mean time to recovery. Both probabilities may be backed by time series.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** |  | [required]
**`identifier`** | **`Union{Absent,Union{Nothing,String}}`** | Optional user-supplied identifier for the outage, such as a name or a block id. Null when not set. | [optional]
**`mean_time_to_recovery`** | **`Union{Absent,Float64,Nothing}`** | Mean time elapsed between a failure and the return to service, in minutes. Units: min. | [optional]
**`monitored_components`** | **`Union{Absent,Nothing,Vector{Int64}}`** | IDs of devices whose post-contingency state to model for this outage. Empty by default. | [optional]
**`outage_transition_probability`** | **`Union{Absent,Float64,Nothing}`** | Probability of transitioning into a forced outage in one minute, the same time step `mean_time_to_recovery` is stated in. | [optional]
