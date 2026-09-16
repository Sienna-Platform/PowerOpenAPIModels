# EXPIC1

Generic Proportional/Integral Excitation System

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`tr`** | **`Float64`** | Regulator input filter time constant | [required]
**`ka`** | **`Float64`** | Voltage regulator gain | [required]
**`ta`** | **`Float64`** | Voltage regulator time constant | [required]
**`va_lim`** | **`MinMax`** | A pair of values bounding a quantity from below (`min`) and from above (`max`). | [required]
**`ta_2`** | **`Float64`** | Voltage regulator time constant | [required]
**`ta_3`** | **`Float64`** | Voltage regulator time constant | [required]
**`ta_4`** | **`Float64`** | Voltage regulator time constant | [required]
**`vr_lim`** | **`MinMax`** | A pair of values bounding a quantity from below (`min`) and from above (`max`). | [required]
**`kf`** | **`Float64`** | Rate feedback excitation system stabilizer gain | [required]
**`tf_1`** | **`Float64`** | Rate feedback time constant | [required]
**`tf_2`** | **`Float64`** | Rate feedback time constant | [required]
**`efd_lim`** | **`MinMax`** | A pair of values bounding a quantity from below (`min`) and from above (`max`). | [required]
**`ke`** | **`Float64`** | Exciter constant | [required]
**`te`** | **`Float64`** | Exciter time constant | [required]
**`e_sat`** | **`Vector{Float64}`** | Exciter output voltage for saturation factor | [required]
**`se`** | **`Vector{Float64}`** | Exciter saturation factor at exciter output voltage | [required]
**`kp`** | **`Float64`** | Potential source gain | [required]
**`kc`** | **`Float64`** | Exciter regulator factor | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference voltage set-point | [optional]
