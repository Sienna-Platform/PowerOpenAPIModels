# IEEET1

1968 IEEE type 1 excitation system model

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`tr`** | **`Float64`** | Voltage measurement time constant | [required]
**`ka`** | **`Float64`** | Amplifier gain | [required]
**`ta`** | **`Float64`** | Amplifier time constant | [required]
**`vr_lim`** | **`MinMax`** | A pair of values bounding a quantity from below (`min`) and from above (`max`). | [required]
**`ke`** | **`Float64`** | Exciter constant related to self-excited field | [required]
**`te`** | **`Float64`** | Exciter time constant, integration rate associated with exciter control | [required]
**`kf`** | **`Float64`** | Excitation control system stabilizer gain | [required]
**`tf`** | **`Float64`** | Excitation control system stabilizer time constant | [required]
**`switch`** | **`Int64`** | Switch | [required]
**`e_sat`** | **`Vector{Float64}`** | Exciter output voltage for saturation factor | [required]
**`se`** | **`Vector{Float64}`** | Exciter saturation factor at exciter output voltage | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference voltage set-point | [optional]
