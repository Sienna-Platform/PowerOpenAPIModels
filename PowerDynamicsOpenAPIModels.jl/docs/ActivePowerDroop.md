# ActivePowerDroop

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`rp`** | **`Float64`** | Droop Gain | [required]
**`active_power_filter_frequency`** | **`Float64`** | Filter cutoff frequency, in natural units. Units: Hz. | [required]
**`p_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference Power Set-point (pu). Units: pu. | [optional]
