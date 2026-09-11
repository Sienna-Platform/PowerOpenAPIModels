# EXPIC1

Generic Proportional/Integral Excitation System

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`e_sat`** | **`Vector{Float64}`** | Exciter output voltage for saturation factor | [required]
**`efd_lim`** | **`MinMax`** | Field voltage regulator limits (regulator output) | [required]
**`ka`** | **`Float64`** | Voltage regulator gain | [required]
**`kc`** | **`Float64`** | Exciter regulator factor | [required]
**`ke`** | **`Float64`** | Exciter constant | [required]
**`kf`** | **`Float64`** | Rate feedback excitation system stabilizer gain | [required]
**`kp`** | **`Float64`** | Potential source gain | [required]
**`se`** | **`Vector{Float64}`** | Exciter saturation factor at exciter output voltage | [required]
**`ta`** | **`Float64`** | Voltage regulator time constant | [required]
**`ta_2`** | **`Float64`** | Voltage regulator time constant | [required]
**`ta_3`** | **`Float64`** | Voltage regulator time constant | [required]
**`ta_4`** | **`Float64`** | Voltage regulator time constant | [required]
**`te`** | **`Float64`** | Exciter time constant | [required]
**`tf_1`** | **`Float64`** | Rate feedback time constant | [required]
**`tf_2`** | **`Float64`** | Rate feedback time constant | [required]
**`tr`** | **`Float64`** | Regulator input filter time constant | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference voltage set-point | [optional]
**`va_lim`** | **`MinMax`** | Limits for pi controller | [required]
**`vr_lim`** | **`MinMax`** | Voltage regulator limits (regulator output) | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
