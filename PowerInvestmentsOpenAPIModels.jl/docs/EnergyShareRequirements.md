# EnergyShareRequirements

Policy requirement that the total generation of the eligible technologies be at least a pre-determined fraction of the total annual demand across the eligible zones in the target year.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`available`** | **`Bool`** | Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). | [required]
**`generation_fraction_requirement`** | **`Union{Absent,Float64,Nothing}`** | Fraction of total annual demand across all eligible zones that needs to be met by eligible resources. Units: 1. | [optional]
**`id`** | **`Int64`** | ID for individual component. | [required]
**`name`** | **`String`** | Name of the component. | [required]
**`target_year`** | **`Union{Absent,Int64,Nothing}`** | Year in which this requirement is applied. | [optional]
