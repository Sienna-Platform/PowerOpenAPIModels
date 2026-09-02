# CombinedCycleBlock

Attribute to represent combined cycle generation by block configuration that shares heat recovery conversions. CT and CA unit assignments to HRSGs are recorded as CombinedCycleAssociation rows.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`configuration`** | **`CombinedCycleConfiguration`** | Shaft and turbine arrangement of a combined cycle plant: a single shaft carrying one combustion and one steam turbine, separate shafts for the two, two or three combustion turbines feeding one steam turbine, or `Other` for any arrangement outside these. | [required]
**`heat_recovery_to_steam_factor`** | **`Union{Absent,Float64,Nothing}`** | Factor for heat recovery to steam conversion | [optional]
**`id`** | **`Int64`** |  | [required]
**`name`** | **`String`** | Name of the combined cycle block | [required]
