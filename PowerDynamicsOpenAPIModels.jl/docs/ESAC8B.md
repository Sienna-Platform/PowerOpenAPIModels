# ESAC8B

Excitation System AC8B. Used to represent the Basler Digital Excitation Control System (DECS) with PID controller in PSSE

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`tr`** | **`Float64`** | Regulator input filter time constant | [required]
**`kp`** | **`Float64`** | Regulator proportional PID gain | [required]
**`ki`** | **`Float64`** | Regulator integral PID gain | [required]
**`kd`** | **`Float64`** | Regulator derivative PID gain | [required]
**`td`** | **`Float64`** | Regulator derivative PID time constant | [required]
**`ka`** | **`Float64`** | Regulator output gain | [required]
**`ta`** | **`Float64`** | Regulator output lag time constant | [required]
**`vr_lim`** | **`MinMax`** | A pair of values bounding a quantity from below (`min`) and from above (`max`). | [required]
**`te`** | **`Float64`** | Exciter field time constant | [required]
**`ke`** | **`Float64`** | Exciter field proportional constant | [required]
**`e_sat`** | **`Vector{Float64}`** | Exciter output voltage for saturation factor | [required]
**`se`** | **`Vector{Float64}`** | Exciter saturation factor at exciter output voltage | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference voltage set-point | [optional]
