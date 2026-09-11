# PIDGOV

Hydro Turbine-Governor with PID controller

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`a_tw`** | **`Float64`** | Factor multiplying Tw | [required]
**`d_turb`** | **`Float64`** | Turbine damping factor | [required]
**`g_lim`** | **`MinMax`** | Gate opening velocity limits | [required]
**`kd`** | **`Float64`** | Governor derivative gain | [required]
**`ki`** | **`Float64`** | Governor integral gain | [required]
**`kp`** | **`Float64`** | Governor proportional gain | [required]
**`p_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference load set-point | [optional]
**`rperm`** | **`Float64`** | Speed permanent droop parameter | [required]
**`t_reg`** | **`Float64`** | Speed detector time constant | [required]
**`ta`** | **`Float64`** | Governor derivative time constant | [required]
**`tb`** | **`Float64`** | Gate-servo time constant | [required]
**`tw`** | **`Float64`** | Water inertia time constant | [required]
**`feedback_flag`** | **`Int64`** | Feedback signal for governor droop: 0 for electrical power, and 1 for gate position | [required]
**`gate_openings`** | **`Vector{Float64}`** | Gate opening speed at different loads | [required]
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`power_gate_openings`** | **`Vector{Float64}`** | Power at gate_openings | [required]
