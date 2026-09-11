# ESAC8B

Excitation System AC8B. Used to represent the Basler Digital Excitation Control System (DECS) with PID controller in PSSE

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`e_sat`** | **`Vector{Float64}`** | Exciter output voltage for saturation factor | [required]
**`ka`** | **`Float64`** | Regulator output gain | [required]
**`kd`** | **`Float64`** | Regulator derivative PID gain | [required]
**`ke`** | **`Float64`** | Exciter field proportional constant | [required]
**`ki`** | **`Float64`** | Regulator integral PID gain | [required]
**`kp`** | **`Float64`** | Regulator proportional PID gain | [required]
**`se`** | **`Vector{Float64}`** | Exciter saturation factor at exciter output voltage | [required]
**`ta`** | **`Float64`** | Regulator output lag time constant | [required]
**`td`** | **`Float64`** | Regulator derivative PID time constant | [required]
**`te`** | **`Float64`** | Exciter field time constant | [required]
**`tr`** | **`Float64`** | Regulator input filter time constant | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference voltage set-point | [optional]
**`vr_lim`** | **`MinMax`** | Limits for excitor field voltage | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
