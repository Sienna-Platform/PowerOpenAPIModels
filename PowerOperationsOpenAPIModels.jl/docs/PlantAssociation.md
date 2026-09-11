# PlantAssociation

Association between a power plant supplemental attribute and a generating unit, identifying the unit's group within the plant: shafts, penstocks, PCCs, or exclusion groups. group_index semantics depend on the parent plant's type.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`entity_id`** | **`Int64`** | ID of the generating unit (entity) participating in the plant | [required]
**`group_index`** | **`Int64`** | Group number within the plant (shaft, penstock, PCC, or exclusion group, depending on the parent plant's type) | [required]
**`plant_id`** | **`Int64`** | ID of the parent plant supplemental attribute | [required]
