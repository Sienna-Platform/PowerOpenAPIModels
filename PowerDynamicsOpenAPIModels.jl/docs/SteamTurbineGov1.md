# SteamTurbineGov1


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component. | [default to nothing]
**`R`** | **`Float64`** | Droop parameter. | [default to nothing]
**`T1`** | **`Float64`** | Governor time constant. Units: s. | [default to nothing]
**`valve_position_limits`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`T2`** | **`Float64`** | Lead Lag Lead Time constant. Units: s. | [default to nothing]
**`T3`** | **`Float64`** | Lead Lag Lag Time constant. Units: s. | [default to nothing]
**`D_T`** | **`Float64`** | Turbine Damping. | [default to nothing]
**`DB_h`** | **`Float64`** | Deadband for overspeed. | [default to nothing]
**`DB_l`** | **`Float64`** | Deadband for underspeed. | [default to nothing]
**`T_rate`** | **`Float64`** | Turbine Rate. If zero, generator base is used. Units: MW. | [default to nothing]
**`P_ref`** | **`Float64`** | Reference Power Set-point. | [optional] [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


