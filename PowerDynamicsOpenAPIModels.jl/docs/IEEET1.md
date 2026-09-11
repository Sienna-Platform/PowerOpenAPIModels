# IEEET1

1968 IEEE type 1 excitation system model

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`e_sat`** | **`Vector{Float64}`** | Exciter output voltage for saturation factor | [required]
**`ka`** | **`Float64`** | Amplifier gain | [required]
**`ke`** | **`Float64`** | Exciter constant related to self-excited field | [required]
**`kf`** | **`Float64`** | Excitation control system stabilizer gain | [required]
**`se`** | **`Vector{Float64}`** | Exciter saturation factor at exciter output voltage | [required]
**`ta`** | **`Float64`** | Amplifier time constant | [required]
**`te`** | **`Float64`** | Exciter time constant, integration rate associated with exciter control | [required]
**`tf`** | **`Float64`** | Excitation control system stabilizer time constant | [required]
**`tr`** | **`Float64`** | Voltage measurement time constant | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference voltage set-point | [optional]
**`vr_lim`** | **`MinMax`** | Voltage regulator limits (regulator output) | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`switch`** | **`Int64`** | Switch | [required]
