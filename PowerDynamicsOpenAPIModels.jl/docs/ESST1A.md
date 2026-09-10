# ESST1A


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [default to nothing]
**`UEL_flags`** | **`Int64`** | Code input for Underexcitization limiter (UEL) entry | [default to nothing]
**`PSS_flags`** | **`Int64`** | Code input for Power System Stabilizer (PSS) or (VOS) entry | [default to nothing]
**`Tr`** | **`Float64`** | Regulator input filter time constant | [default to nothing]
**`Vi_lim`** | **`Vector{Float64}`** | Voltage error limits (regulator input) | [default to nothing]
**`Tc`** | **`Float64`** | First regulator numerator (lead) time constant | [default to nothing]
**`Tb`** | **`Float64`** | First regulator denominator (lag) time constant | [default to nothing]
**`Tc1`** | **`Float64`** | Second regulator numerator (lead) time constant | [default to nothing]
**`Tb1`** | **`Float64`** | Second regulator denominator (lag) time constant | [default to nothing]
**`Ka`** | **`Float64`** | Voltage regulator gain | [default to nothing]
**`Ta`** | **`Float64`** | Voltage regulator time constant | [default to nothing]
**`Va_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`Vr_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`Kc`** | **`Float64`** | Rectifier loading factor proportional to commutating reactance | [default to nothing]
**`Kf`** | **`Float64`** | Rate feedback gain | [default to nothing]
**`Tf`** | **`Float64`** | Rate feedback time constant | [default to nothing]
**`K_lr`** | **`Float64`** | Exciter output current limiter gain | [default to nothing]
**`I_lr`** | **`Float64`** | Exciter output current limit reference | [default to nothing]
**`V_ref`** | **`Float64`** | Reference voltage set-point | [optional] [default to 1.0]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


