# PIDGOV

Hydro Turbine-Governor with PID controller

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`feedback_flag`** | **`Int64`** | Feedback signal for governor droop: 0 for electrical power, and 1 for gate position | [required]
**`rperm`** | **`Float64`** | Speed permanent droop parameter | [required]
**`t_reg`** | **`Float64`** | Speed detector time constant | [required]
**`kp`** | **`Float64`** | Governor proportional gain | [required]
**`ki`** | **`Float64`** | Governor integral gain | [required]
**`kd`** | **`Float64`** | Governor derivative gain | [required]
**`ta`** | **`Float64`** | Governor derivative time constant | [required]
**`tb`** | **`Float64`** | Gate-servo time constant | [required]
**`d_turb`** | **`Float64`** | Turbine damping factor | [required]
**`gate_openings`** | **`Vector{Float64}`** | Gate opening speed at different loads | [required]
**`power_gate_openings`** | **`Vector{Float64}`** | Power at gate_openings | [required]
**`g_lim`** | **`MinMax`** | A pair of values bounding a quantity from below (`min`) and from above (`max`). | [required]
**`a_tw`** | **`Float64`** | Factor multiplying Tw | [required]
**`tw`** | **`Float64`** | Water inertia time constant | [required]
**`p_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference load set-point | [optional]
