# VirtualInertia

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Unique integer identifier for this component | [required]
**`ta`** | **`Float64`** | VSM inertia constant. Units: s. | [required]
**`kd`** | **`Float64`** | VSM damping constant | [required]
**`k_frequency`** | **`Float64`** | frequency droop gain | [required]
**`p_ref`** | **`Union{Absent,Float64,Nothing}`** | Reference Power Set-point (pu). Units: pu. | [optional]
