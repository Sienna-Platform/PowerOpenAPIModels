# MaximumCapacityRequirements

Policy requirement that the total capacity of all eligible technologies in the target year be less than the specified limit in MW.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). | [required]
**`id`** | **`Int64`** | ID for individual component. | [required]
**`max_capacity_mw`** | **`Union{Absent,Float64,Nothing}`** | Maximum total capacity across all eligible resources. Units: MW. | [optional]
**`name`** | **`String`** | Name of the component. | [required]
**`target_year`** | **`Union{Absent,Int64,Nothing}`** | Year in which this requirement is applied. | [optional]
