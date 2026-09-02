# CombinedCycleFractional

Attribute to represent combined cycle generation when each unit represents a specific configuration and aggregate heat rate. Operation exclusion groups (only units in the same group can operate simultaneously) are recorded as PlantAssociation rows with role='exclusion'.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`configuration`** | **`CombinedCycleFractionalConfiguration`** | Shaft and turbine arrangement of a combined cycle plant: a single shaft carrying one combustion and one steam turbine, separate shafts for the two, two or three combustion turbines feeding one steam turbine, or `Other` for any arrangement outside these. | [required]
**`id`** | **`Int64`** |  | [required]
**`name`** | **`String`** | Name of the combined cycle fractional plant | [required]
