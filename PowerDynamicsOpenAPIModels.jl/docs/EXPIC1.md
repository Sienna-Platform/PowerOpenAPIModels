# EXPIC1


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [default to nothing]
**`Tr`** | **`Float64`** | Regulator input filter time constant | [default to nothing]
**`Ka`** | **`Float64`** | Voltage regulator gain | [default to nothing]
**`Ta`** | **`Float64`** | Voltage regulator time constant | [default to nothing]
**`Va_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`Ta_2`** | **`Float64`** | Voltage regulator time constant | [default to nothing]
**`Ta_3`** | **`Float64`** | Voltage regulator time constant | [default to nothing]
**`Ta_4`** | **`Float64`** | Voltage regulator time constant | [default to nothing]
**`Vr_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`Kf`** | **`Float64`** | Rate feedback excitation system stabilizer gain | [default to nothing]
**`Tf_1`** | **`Float64`** | Rate feedback time constant | [default to nothing]
**`Tf_2`** | **`Float64`** | Rate feedback time constant | [default to nothing]
**`Efd_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`Ke`** | **`Float64`** | Exciter constant | [default to nothing]
**`Te`** | **`Float64`** | Exciter time constant | [default to nothing]
**`E_sat`** | **`Vector{Float64}`** | Exciter output voltage for saturation factor | [default to nothing]
**`Se`** | **`Vector{Float64}`** | Exciter saturation factor at exciter output voltage | [default to nothing]
**`Kp`** | **`Float64`** | Potential source gain | [default to nothing]
**`Kc`** | **`Float64`** | Exciter regulator factor | [default to nothing]
**`V_ref`** | **`Float64`** | Reference voltage set-point | [optional] [default to 1.0]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


