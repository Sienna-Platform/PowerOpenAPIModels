# PIDGOV


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [default to nothing]
**`feedback_flag`** | **`Int64`** | Feedback signal for governor droop: 0 for electrical power, and 1 for gate position | [default to nothing]
**`Rperm`** | **`Float64`** | Speed permanent droop parameter | [default to nothing]
**`T_reg`** | **`Float64`** | Speed detector time constant | [default to nothing]
**`Kp`** | **`Float64`** | Governor proportional gain | [default to nothing]
**`Ki`** | **`Float64`** | Governor integral gain | [default to nothing]
**`Kd`** | **`Float64`** | Governor derivative gain | [default to nothing]
**`Ta`** | **`Float64`** | Governor derivative time constant | [default to nothing]
**`Tb`** | **`Float64`** | Gate-servo time constant | [default to nothing]
**`D_turb`** | **`Float64`** | Turbine damping factor | [default to nothing]
**`gate_openings`** | **`Vector{Float64}`** | Gate opening speed at different loads | [default to nothing]
**`power_gate_openings`** | **`Vector{Float64}`** | Power at gate_openings | [default to nothing]
**`G_lim`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`A_tw`** | **`Float64`** | Factor multiplying Tw | [default to nothing]
**`Tw`** | **`Float64`** | Water inertia time constant | [default to nothing]
**`P_ref`** | **`Float64`** | Reference load set-point | [optional] [default to 1.0]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


