# EXPIC1

Generic Proportional/Integral Excitation System

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`tr`** | **`Float64`** | Regulator input filter time constant. Units: s. | [required]
**`ka`** | **`Float64`** | Voltage regulator gain | [required]
**`ta`** | **`Float64`** | Voltage regulator time constant. Units: s. | [required]
**`va_lim`** | **`MinMax`** | Limits for pi controller | [required]
**`ta_2`** | **`Float64`** | Voltage regulator time constant. Units: s. | [required]
**`ta_3`** | **`Float64`** | Voltage regulator time constant. Units: s. | [required]
**`ta_4`** | **`Float64`** | Voltage regulator time constant. Units: s. | [required]
**`vr_lim`** | **`MinMax`** | Voltage regulator limits (regulator output) | [required]
**`kf`** | **`Float64`** | Rate feedback excitation system stabilizer gain | [required]
**`tf_1`** | **`Float64`** | Rate feedback time constant. Units: s. | [required]
**`tf_2`** | **`Float64`** | Rate feedback time constant. Units: s. | [required]
**`efd_lim`** | **`MinMax`** | Field voltage regulator limits (regulator output) | [required]
**`ke`** | **`Float64`** | Exciter constant | [required]
**`te`** | **`Float64`** | Exciter time constant. Units: s. | [required]
**`e_sat`** | **`Vector{Float64}`** | Exciter output voltage for saturation factor | [required]
**`se`** | **`Vector{Float64}`** | Exciter saturation factor at exciter output voltage | [required]
**`kp`** | **`Float64`** | Potential source gain | [required]
**`ki`** | **`Float64`** | Current source gain | [required]
**`kc`** | **`Float64`** | Exciter regulator factor | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference voltage set-point | [optional]
