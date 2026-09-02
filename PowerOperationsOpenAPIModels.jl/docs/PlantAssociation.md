# PlantAssociation

Association between a power plant supplemental attribute and a generating unit, identifying the group the unit belongs to within the plant. Covers 1-to-n cases: ThermalPowerPlant shafts, HydroPowerPlant penstocks, RenewablePowerPlant PCCs, and CombinedCycleFractional exclusion groups. The semantics of group_index are determined by the parent plant's type.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`entity_id`** | **`Int64`** | ID of the generating unit (entity) participating in the plant | [required]
**`group_index`** | **`Int64`** | Group number within the plant (shaft, penstock, PCC, or exclusion group, depending on the parent plant's type) | [required]
**`plant_id`** | **`Int64`** | ID of the parent plant supplemental attribute | [required]
