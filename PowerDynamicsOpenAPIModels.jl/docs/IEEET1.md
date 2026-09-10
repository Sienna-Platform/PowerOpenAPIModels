# IEEET1


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [default to nothing]
**`Tr`** | **`Float64`** | Voltage measurement time constant | [default to nothing]
**`Ka`** | **`Float64`** | Amplifier gain | [default to nothing]
**`Ta`** | **`Float64`** | Amplifier time constant | [default to nothing]
**`Vr_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`Ke`** | **`Float64`** | Exciter constant related to self-excited field | [default to nothing]
**`Te`** | **`Float64`** | Exciter time constant, integration rate associated with exciter control | [default to nothing]
**`Kf`** | **`Float64`** | Excitation control system stabilizer gain | [default to nothing]
**`Tf`** | **`Float64`** | Excitation control system stabilizer time constant | [default to nothing]
**`switch`** | **`Int64`** | Switch | [default to nothing]
**`E_sat`** | **`Vector{Float64}`** | Exciter output voltage for saturation factor | [default to nothing]
**`Se`** | **`Vector{Float64}`** | Exciter saturation factor at exciter output voltage | [default to nothing]
**`V_ref`** | **`Float64`** | Reference voltage set-point | [optional] [default to 1.0]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


