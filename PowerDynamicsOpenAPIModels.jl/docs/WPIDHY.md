# WPIDHY

Woodward PID Hydro Governor

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`d_turb`** | **`Union{Absent,Float64,Nothing}`** | Turbine damping coefficient | [optional]
**`g_lim`** | **`MinMax`** | Minimum and maximum gate velocity | [required]
**`kd`** | **`Float64`** | Governor derivative gain | [required]
**`ki`** | **`Float64`** | Governor integral gain | [required]
**`kp`** | **`Float64`** | Governor proportional gain | [required]
**`p_lim`** | **`MinMax`** | Minimum and maximum gate openings | [required]
**`p_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference load set-point | [optional]
**`t_reg`** | **`Float64`** | Input time constant of the governor | [required]
**`ta`** | **`Float64`** | Governor derivative/high-frequency time constant | [required]
**`tb`** | **`Float64`** | Gate-servo time constant | [required]
**`tw`** | **`Float64`** | Water inertia time constant | [required]
**`v_lim`** | **`MinMax`** | Gate opening velocity limits | [required]
**`gate_openings`** | **`Vector{Float64}`** | Gate opening speed at different loads | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`power_gate_openings`** | **`Vector{Float64}`** | Power at gate_openings | [required]
**`reg`** | **`Float64`** | Input governor gain | [required]
