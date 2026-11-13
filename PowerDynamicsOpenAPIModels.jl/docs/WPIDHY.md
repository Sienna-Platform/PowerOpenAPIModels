# WPIDHY

Woodward PID Hydro Governor

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`t_reg`** | **`Float64`** | Input time constant of the governor. Units: s. | [required]
**`reg`** | **`Float64`** | Input governor gain | [required]
**`kp`** | **`Float64`** | Governor proportional gain | [required]
**`ki`** | **`Float64`** | Governor integral gain | [required]
**`kd`** | **`Float64`** | Governor derivative gain | [required]
**`ta`** | **`Float64`** | Governor derivative/high-frequency time constant. Units: s. | [required]
**`tb`** | **`Float64`** | Gate-servo time constant. Units: s. | [required]
**`v_lim`** | **`MinMax`** | Gate opening velocity limits | [required]
**`g_lim`** | **`MinMax`** | Minimum and maximum gate velocity | [required]
**`tw`** | **`Float64`** | Water inertia time constant. Units: s. | [required]
**`p_lim`** | **`MinMax`** | Minimum and maximum gate openings | [required]
**`d`** | **`Float64`** | Turbine damping coefficient | [required]
**`gate_openings`** | **`Vector{Float64}`** | Gate opening speed at different loads | [required]
**`power_gate_openings`** | **`Vector{Float64}`** | Power at gate_openings | [required]
**`p_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference load set-point | [optional]
