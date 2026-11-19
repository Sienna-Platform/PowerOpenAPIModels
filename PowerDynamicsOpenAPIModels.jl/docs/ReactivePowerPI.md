# ReactivePowerPI

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`kp_q`** | **`Float64`** | Proportional Gain | [required]
**`ki_q`** | **`Float64`** | Integral Gain | [required]
**`reactive_power_filter_frequency`** | **`Float64`** | Filter cutoff frequency, in natural units. Units: Hz. | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Voltage Set-point (pu). Units: pu. | [optional]
**`q_ref`** | **`Union{Absent,Float64,Nothing}`** | Reactive Power Set-point (pu). Units: pu. | [optional]
