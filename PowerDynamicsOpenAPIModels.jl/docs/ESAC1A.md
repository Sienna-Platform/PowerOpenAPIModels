# ESAC1A


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [default to nothing]
**`Tr`** | **`Float64`** | Regulator input filter time constant | [default to nothing]
**`Tb`** | **`Float64`** | Regulator denominator (lag) time constant | [default to nothing]
**`Tc`** | **`Float64`** | Regulator numerator (lead) time constant | [default to nothing]
**`Ka`** | **`Float64`** | Regulator output gain | [default to nothing]
**`Ta`** | **`Float64`** | Regulator output time constant | [default to nothing]
**`Va_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`Te`** | **`Float64`** | Exciter field time constant | [default to nothing]
**`Kf`** | **`Float64`** | Rate feedback excitation system stabilizer gain | [default to nothing]
**`Tf`** | **`Float64`** | Rate feedback time constant | [default to nothing]
**`Kc`** | **`Float64`** | Rectifier loading factor proportional to commutating reactance | [default to nothing]
**`Kd`** | **`Float64`** | Demagnetizing factor, function of exciter alternator reactances | [default to nothing]
**`Ke`** | **`Float64`** | Exciter field proportional constant | [default to nothing]
**`E_sat`** | **`Vector{Float64}`** | Exciter output voltage for saturation factor | [default to nothing]
**`Se`** | **`Vector{Float64}`** | Exciter saturation factor at exciter output voltage | [default to nothing]
**`Vr_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`V_ref`** | **`Float64`** | Reference voltage set-point | [optional] [default to 1.0]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


