# GeneralGovModel


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [default to nothing]
**`R_select`** | **`Int64`** | Feedback signal for governor droop | [optional] [default to nothing]
**`fuel_flag`** | **`Int64`** | Flag switch for fuel source characteristic | [default to nothing]
**`R`** | **`Float64`** | Speed droop parameter | [optional] [default to nothing]
**`Tpelec`** | **`Float64`** | Electrical power transducer time constant | [default to nothing]
**`speed_error_signal`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`Kp_gov`** | **`Float64`** | Governor proportional gain | [default to nothing]
**`Ki_gov`** | **`Float64`** | Governor integral gain | [default to nothing]
**`Kd_gov`** | **`Float64`** | Governor derivative gain | [default to nothing]
**`Td_gov`** | **`Float64`** | Governor derivative time constant | [default to nothing]
**`valve_position_limits`** | [**`*MinMax`**](MinMax.md) |  | [default to nothing]
**`T_act`** | **`Float64`** | Actuator time constant | [default to nothing]
**`K_turb`** | **`Float64`** | Turbine gain | [default to nothing]
**`Wf_nl`** | **`Float64`** | No load fuel flow | [default to nothing]
**`Tb`** | **`Float64`** | Turbine lag time constant | [default to nothing]
**`Tc`** | **`Float64`** | Turbine lead time constant | [default to nothing]
**`T_eng`** | **`Float64`** | Transport lag time constant for diesel engine | [default to nothing]
**`Tf_load`** | **`Float64`** | Load limiter time constant | [default to nothing]
**`Kp_load`** | **`Float64`** | Load limiter proportional gain for PI controller | [default to nothing]
**`Ki_load`** | **`Float64`** | Load integral gain for PI controller | [default to nothing]
**`Ld_ref`** | **`Float64`** | Load limiter integral gain for PI controller | [default to nothing]
**`Dm`** | **`Float64`** | Mechanical damping coefficient | [default to nothing]
**`R_open`** | **`Float64`** | Maximum valve opening rate | [default to nothing]
**`R_close`** | **`Float64`** | Maximum valve closing rate | [default to nothing]
**`Ki_mw`** | **`Float64`** | Power controller (reset) gain | [default to nothing]
**`A_set`** | **`Float64`** | Acceleration limiter setpoint | [default to nothing]
**`Ka`** | **`Float64`** | Acceleration limiter gain | [default to nothing]
**`Ta`** | **`Float64`** | Acceleration limiter time constant | [default to nothing]
**`T_rate`** | **`Float64`** | Turbine rating | [default to nothing]
**`db`** | **`Float64`** | Speed governor deadband | [default to nothing]
**`Tsa`** | **`Float64`** | Temperature detection lead time constant | [default to nothing]
**`Tsb`** | **`Float64`** | Temperature detection lag time constant | [default to nothing]
**`R_lim`** | [**`*UpDown`**](UpDown.md) |  | [default to nothing]
**`P_ref`** | **`Float64`** | Reference power set-point | [optional] [default to 1.0]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


