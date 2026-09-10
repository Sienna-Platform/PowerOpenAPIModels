# DEGOV1


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [default to nothing]
**`droop_flag`** | **`Int64`** | Droop control Flag. 0 for throttle feedback and 1 for electric power feedback | [optional] [default to nothing]
**`T1`** | **`Float64`** | Governor mechanism time constant | [default to nothing]
**`T2`** | **`Float64`** | Turbine power time constant | [default to nothing]
**`T3`** | **`Float64`** | Turbine exhaust temperature time constant | [default to nothing]
**`K`** | **`Float64`** | Governor gain for actuator | [default to nothing]
**`T4`** | **`Float64`** | Governor lead time constant | [default to nothing]
**`T5`** | **`Float64`** | Governor lag time constant | [default to nothing]
**`T6`** | **`Float64`** | Actuator time constant | [default to nothing]
**`Td`** | **`Float64`** | Engine time delay | [default to nothing]
**`T_lim`** | **`Vector{Float64}`** | Operational control limits on actuator (Tmin, Tmax) | [default to nothing]
**`R`** | **`Float64`** | Steady state droop parameter | [default to nothing]
**`Te`** | **`Float64`** | Power transducer time constant | [default to nothing]
**`P_ref`** | **`Float64`** | Reference power set-point | [optional] [default to 1.0]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


