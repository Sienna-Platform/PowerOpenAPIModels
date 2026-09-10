# ESST4B


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [default to nothing]
**`K_pr`** | **`Float64`** | Regulator proportional gain | [default to nothing]
**`K_ir`** | **`Float64`** | Regulator integral gain | [default to nothing]
**`Vr_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`Ta`** | **`Float64`** | Voltage regulator time constant | [default to nothing]
**`K_pm`** | **`Float64`** | Voltage regulator proportional gain output | [default to nothing]
**`K_im`** | **`Float64`** | Voltage regulator integral gain output | [default to nothing]
**`Vm_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`Kg`** | **`Float64`** | Feedback gain constant of the inner loop field regulator | [default to nothing]
**`Kp`** | **`Float64`** | Potential circuit (voltage) gain coefficient | [default to nothing]
**`Ki`** | **`Float64`** | Compound circuit (current) gain coefficient | [default to nothing]
**`VB_max`** | **`Float64`** | Maximum available exciter voltage | [default to nothing]
**`Kc`** | **`Float64`** | Rectifier loading factor proportional to commutating reactance | [default to nothing]
**`Xl`** | **`Float64`** | Reactance associated with potential source | [default to nothing]
**`thetap`** | **`Float64`** | Potential circuit phase angle (degrees) | [default to nothing]
**`V_ref`** | **`Float64`** | Reference voltage set-point | [optional] [default to 1.0]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


