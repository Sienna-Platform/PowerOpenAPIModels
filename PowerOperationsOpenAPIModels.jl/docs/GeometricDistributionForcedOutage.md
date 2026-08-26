# GeometricDistributionForcedOutage


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** |  | [default to nothing]
**`mean_time_to_recovery`** | **`Float64`** | Mean time elapsed between a failure and the return to service, in minutes. Units: min. | [optional] [default to 0.0]
**`outage_transition_probability`** | **`Float64`** | Probability of transitioning into a forced outage in one minute, the same time step &#x60;mean_time_to_recovery&#x60; is stated in. | [optional] [default to 0.0]
**`monitored_components`** | **`Vector{Int64}`** | IDs of devices whose post-contingency state should be modeled when this outage occurs. Empty by default; semantics of an empty list are decided by the downstream consumer. | [optional] [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


