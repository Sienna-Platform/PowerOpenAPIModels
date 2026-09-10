# PSS2A


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [default to nothing]
**`input_code_1`** | **`Int64`** | First input code for stabilizer | [default to nothing]
**`remote_bus_control_1`** | **`Int64`** | First input remote bus identification number for control. 0 identifies the local bus connected to this component | [default to nothing]
**`input_code_2`** | **`Int64`** | Second input code for stabilizer | [default to nothing]
**`remote_bus_control_2`** | **`Int64`** | Second input remote bus identification number for control. 0 identifies the local bus connected to this component | [default to nothing]
**`M_rtf`** | **`Int64`** | M parameter for ramp tracking filter | [default to nothing]
**`N_rtf`** | **`Int64`** | N parameter for ramp tracking filter | [default to nothing]
**`Tw1`** | **`Float64`** | Time constant for first washout filter for first input | [default to nothing]
**`Tw2`** | **`Float64`** | Time constant for second washout filter for first input | [default to nothing]
**`T6`** | **`Float64`** | Time constant for low-pass filter for first input | [default to nothing]
**`Tw3`** | **`Float64`** | Time constant for first washout filter for second input | [default to nothing]
**`Tw4`** | **`Float64`** | Time constant for second washout filter for second input | [default to nothing]
**`T7`** | **`Float64`** | Time constant for low-pass filter for second input | [default to nothing]
**`Ks2`** | **`Float64`** | Gain for low-pass filter for second input | [default to nothing]
**`Ks3`** | **`Float64`** | Gain for second input | [default to nothing]
**`T8`** | **`Float64`** | Time constant for ramp tracking filter | [default to nothing]
**`T9`** | **`Float64`** | Time constant for ramp tracking filter | [default to nothing]
**`Ks1`** | **`Float64`** | Gain before lead-lag blocks | [default to nothing]
**`T1`** | **`Float64`** | Time constant for first lead-lag block | [default to nothing]
**`T2`** | **`Float64`** | Time constant for first lead-lag block | [default to nothing]
**`T3`** | **`Float64`** | Time constant for second lead-lag block | [default to nothing]
**`T4`** | **`Float64`** | Time constant for second lead-lag block | [default to nothing]
**`Vst_lim`** | **`Vector{Float64}`** | PSS output limits (Vst_min, Vst_max) | [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


