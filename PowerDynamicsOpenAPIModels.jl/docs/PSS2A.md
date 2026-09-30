# PSS2A

IEEE dual-input stabilizer model

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`input_code_1`** | **`Int64`** | First input code for stabilizer | [required]
**`remote_bus_control_1`** | **`Int64`** | First input remote bus identification number for control. 0 identifies the local bus connected to this component | [required]
**`input_code_2`** | **`Int64`** | Second input code for stabilizer | [required]
**`remote_bus_control_2`** | **`Int64`** | Second input remote bus identification number for control. 0 identifies the local bus connected to this component | [required]
**`m_rtf`** | **`Int64`** | M parameter for ramp tracking filter | [required]
**`n_rtf`** | **`Int64`** | N parameter for ramp tracking filter | [required]
**`tw1`** | **`Float64`** | Time constant for first washout filter for first input | [required]
**`tw2`** | **`Float64`** | Time constant for second washout filter for first input | [required]
**`t6`** | **`Float64`** | Time constant for low-pass filter for first input | [required]
**`tw3`** | **`Float64`** | Time constant for first washout filter for second input | [required]
**`tw4`** | **`Float64`** | Time constant for second washout filter for second input | [required]
**`t7`** | **`Float64`** | Time constant for low-pass filter for second input | [required]
**`ks2`** | **`Float64`** | Gain for low-pass filter for second input | [required]
**`ks3`** | **`Float64`** | Gain for second input | [required]
**`t8`** | **`Float64`** | Time constant for ramp tracking filter | [required]
**`t9`** | **`Float64`** | Time constant for ramp tracking filter | [required]
**`ks1`** | **`Float64`** | Gain before lead-lag blocks | [required]
**`t1`** | **`Float64`** | Time constant for first lead-lag block | [required]
**`t2`** | **`Float64`** | Time constant for first lead-lag block | [required]
**`t3`** | **`Float64`** | Time constant for second lead-lag block | [required]
**`t4`** | **`Float64`** | Time constant for second lead-lag block | [required]
**`vst_lim`** | **`Vector{Float64}`** | PSS output limits (Vst_min, Vst_max) | [required]
