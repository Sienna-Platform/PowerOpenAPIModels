# GasTG


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [default to nothing]
**`R`** | **`Float64`** | Speed droop parameter | [default to nothing]
**`T1`** | **`Float64`** | Governor time constant | [default to nothing]
**`T2`** | **`Float64`** | Combustion chamber time constant | [default to nothing]
**`T3`** | **`Float64`** | Load limit time constant (exhaust gas measurement time) | [default to nothing]
**`AT`** | **`Float64`** | Ambient temperature load limit | [default to nothing]
**`Kt`** | **`Float64`** | Load limit feedback gain | [default to nothing]
**`V_lim`** | **`Vector{Float64}`** | Operational control limits on fuel valve opening (Vmin, Vmax) | [default to nothing]
**`D_turb`** | **`Float64`** | Speed damping coefficient of gas turbine rotor | [default to nothing]
**`P_ref`** | **`Float64`** | Reference load set-point | [optional] [default to 1.0]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


