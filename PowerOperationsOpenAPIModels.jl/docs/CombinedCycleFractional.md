# CombinedCycleFractional

Represents combined cycle generation when each unit models a specific configuration and aggregate heat rate. Operation exclusion groups are recorded as PlantAssociation rows with role='exclusion'.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`configuration`** | **`CombinedCycleConfiguration`** | Shaft and turbine arrangement of a combined cycle plant: one shaft with one combustion and one steam turbine, separate shafts for the two, two or three combustion turbines feeding one steam turbine, or Other. | [required]
**`id`** | **`Int64`** |  | [required]
**`name`** | **`String`** | Name of the combined cycle fractional plant | [required]
