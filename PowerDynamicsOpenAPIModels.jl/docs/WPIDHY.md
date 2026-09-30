# WPIDHY

Woodward PID Hydro Governor

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`t_reg`** | **`Float64`** | Input time constant of the governor | [required]
**`reg`** | **`Float64`** | Input governor gain | [required]
**`kp`** | **`Float64`** | Governor proportional gain | [required]
**`ki`** | **`Float64`** | Governor integral gain | [required]
**`kd`** | **`Float64`** | Governor derivative gain | [required]
**`ta`** | **`Float64`** | Governor derivative/high-frequency time constant | [required]
**`tb`** | **`Float64`** | Gate-servo time constant | [required]
**`v_lim`** | **`MinMax`** | A pair of values bounding a quantity from below (`min`) and from above (`max`). | [required]
**`g_lim`** | **`MinMax`** | A pair of values bounding a quantity from below (`min`) and from above (`max`). | [required]
**`tw`** | **`Float64`** | Water inertia time constant | [required]
**`p_lim`** | **`MinMax`** | A pair of values bounding a quantity from below (`min`) and from above (`max`). | [required]
**`d_turb`** | **`Union{Absent,Float64,Nothing}`** | Turbine damping coefficient | [optional]
**`gate_openings`** | **`Vector{Float64}`** | Gate opening speed at different loads | [required]
**`power_gate_openings`** | **`Vector{Float64}`** | Power at gate_openings | [required]
**`p_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference load set-point | [optional]
