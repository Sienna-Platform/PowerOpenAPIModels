# MinimumCapacityRequirements

Policy requirement that the total capacity of all eligible technologies in the target year be greater than or equal to the specified minimum in MW.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | ID for individual component. | [required]
**`name`** | **`String`** | Name of the component. | [required]
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). | [required]
**`target_year`** | **`Union{Absent,Int64,Nothing}`** | Year in which this requirement is applied. | [optional]
**`min_capacity_mw`** | **`Union{Absent,Float64,Nothing}`** | Minimum total capacity across all eligible resources. Units: MW. | [optional]
