# IEEEST


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [default to nothing]
**`input_code`** | **`Int64`** | Code input for stabilizer | [default to nothing]
**`remote_bus_control`** | **`Int64`** | ACBus identification number for control. 0 identifies the bus connected to this component | [default to nothing]
**`A1`** | **`Float64`** | Filter coefficient | [default to nothing]
**`A2`** | **`Float64`** | Filter coefficient | [default to nothing]
**`A3`** | **`Float64`** | Filter coefficient | [default to nothing]
**`A4`** | **`Float64`** | Filter coefficient | [default to nothing]
**`A5`** | **`Float64`** | Filter coefficient | [default to nothing]
**`A6`** | **`Float64`** | Filter coefficient | [default to nothing]
**`T1`** | **`Float64`** | Time constant | [default to nothing]
**`T2`** | **`Float64`** | Time constant | [default to nothing]
**`T3`** | **`Float64`** | Time constant | [default to nothing]
**`T4`** | **`Float64`** | Time constant | [default to nothing]
**`T5`** | **`Float64`** | Time constant | [default to nothing]
**`T6`** | **`Float64`** | Time constant | [default to nothing]
**`Ks`** | **`Float64`** | Proportional gain | [default to nothing]
**`Ls_lim`** | **`Vector{Float64}`** | PSS output limits for regulator output (Ls_min, Ls_max) | [default to nothing]
**`Vcu`** | **`Float64`** | Cutoff limiter upper bound | [default to nothing]
**`Vcl`** | **`Float64`** | Cutoff limiter lower bound | [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


