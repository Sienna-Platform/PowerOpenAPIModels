# CombinedCycleAssociation

Association between a CombinedCycleBlock plant and a CT or CA unit, identifying which HRSG the unit feeds into or receives from. Supports n-to-m relationships: a single CT or CA can participate in multiple HRSGs by appearing in multiple rows.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`entity_id`** | **`Int64`** | ID of the CT or CA generating unit | [required]
**`hrsg_index`** | **`Int64`** | HRSG (heat recovery steam generator) index this unit is associated with | [required]
**`plant_id`** | **`Int64`** | ID of the parent CombinedCycleBlock supplemental attribute | [required]
**`role`** | **`CombinedCycleAssociationRole`** | Role of the entity within the combined cycle block (combustion turbine input or combustion-augmented steam output) | [required]
