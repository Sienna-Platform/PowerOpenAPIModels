# CapacityReserveMargin

Policy requirement enforcing a minimum capacity reserve margin in the target year, such that `(total_capacity - peak_demand) / peak_demand >= capacity_reserve_fraction`.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). | [required]
**`capacity_reserve_fraction`** | **`Union{Absent,Float64,Nothing}`** | Capacity reserve requirements, represented as a fraction of peak demand in a region. Units: 1. | [optional]
**`id`** | **`Int64`** | ID for individual component. | [required]
**`name`** | **`String`** | Name of the component. | [required]
**`target_year`** | **`Union{Absent,Int64,Nothing}`** | Year in which this requirement is applied. | [optional]
