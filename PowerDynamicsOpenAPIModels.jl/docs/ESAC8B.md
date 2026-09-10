# ESAC8B


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [default to nothing]
**`Tr`** | **`Float64`** | Regulator input filter time constant | [default to nothing]
**`Kp`** | **`Float64`** | Regulator proportional PID gain | [default to nothing]
**`Ki`** | **`Float64`** | Regulator integral PID gain | [default to nothing]
**`Kd`** | **`Float64`** | Regulator derivative PID gain | [default to nothing]
**`Td`** | **`Float64`** | Regulator derivative PID time constant | [default to nothing]
**`Ka`** | **`Float64`** | Regulator output gain | [default to nothing]
**`Ta`** | **`Float64`** | Regulator output lag time constant | [default to nothing]
**`Vr_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`Te`** | **`Float64`** | Exciter field time constant | [default to nothing]
**`Ke`** | **`Float64`** | Exciter field proportional constant | [default to nothing]
**`E_sat`** | **`Vector{Float64}`** | Exciter output voltage for saturation factor | [default to nothing]
**`Se`** | **`Vector{Float64}`** | Exciter saturation factor at exciter output voltage | [default to nothing]
**`V_ref`** | **`Float64`** | Reference voltage set-point | [optional] [default to 1.0]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


