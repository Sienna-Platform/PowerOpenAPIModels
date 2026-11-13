# ActivePowerPI

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`kp_p`** | **`Float64`** | Proportional Gain | [required]
**`ki_p`** | **`Float64`** | Integral Gain | [required]
**`active_power_filter_frequency`** | **`Float64`** | Filter cutoff frequency, in natural units. Units: Hz. | [required]
**`p_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference Power Set-point (pu). Units: pu. | [optional]
