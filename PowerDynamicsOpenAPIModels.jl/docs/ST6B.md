# ST6B


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [default to nothing]
**`OEL_Flag`** | **`Int64`** | OEL Flag for ST6B: 1: before HV gate, 2: after HV gate | [default to nothing]
**`Tr`** | **`Float64`** | Regulator input filter time constant | [default to nothing]
**`K_pa`** | **`Float64`** | Regulator proportional gain | [default to nothing]
**`K_ia`** | **`Float64`** | Regulator integral gain | [default to nothing]
**`K_da`** | **`Float64`** | Regulator derivative gain | [default to nothing]
**`T_da`** | **`Float64`** | Voltage regulator derivative channel time constant | [default to nothing]
**`Va_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`K_ff`** | **`Float64`** | Pre-control gain of the inner loop field regulator | [default to nothing]
**`K_m`** | **`Float64`** | Forward gain of the inner loop field regulator | [default to nothing]
**`K_ci`** | **`Float64`** | Exciter output current limit adjustment gain | [default to nothing]
**`K_lr`** | **`Float64`** | Exciter output current limiter gain | [default to nothing]
**`I_lr`** | **`Float64`** | Exciter current limiter reference | [default to nothing]
**`Vr_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`Kg`** | **`Float64`** | Feedback gain constant of the inner loop field regulator | [default to nothing]
**`Tg`** | **`Float64`** | Feedback time constant of the inner loop field voltage regulator | [default to nothing]
**`V_ref`** | **`Float64`** | Reference voltage set-point | [optional] [default to 1.0]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


