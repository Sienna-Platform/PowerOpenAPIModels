# ReactivePowerDroop

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`kq`** | **`Float64`** | frequency droop gain | [required]
**`reactive_power_filter_frequency`** | **`Float64`** | Filter cutoff frequency, in natural units. Units: Hz. | [required]
**`v_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference Voltage Set-point (pu). Units: pu. | [optional]
