# SupplementalAttributeAssociation


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`attribute_id`** | **`Int64`** | ID of the supplemental attribute, or of the service, for a membership row. | [default to nothing]
**`entity_id`** | **`Int64`** | ID of the component, or other entity, that the attribute describes or the service contains. | [default to nothing]
**`attribute_type`** | **`String`** | Schema title of the referenced supplemental attribute or service (e.g. \&quot;EmissionsData\&quot;, \&quot;GeographicInfo\&quot;, \&quot;ThermalPowerPlant\&quot;, \&quot;CombinedCycleBlock\&quot;, \&quot;OnlineReserve\&quot;). A free-form string, not an enum: new attribute and service types are added elsewhere in this repo continuously, and a closed enum here would go stale. | [default to nothing]
**`group_index`** | **`Int64`** | Optional group number within the parent named by attribute_id: the shaft/penstock/PCC number for a ThermalPowerPlant, HydroPowerPlant, or RenewablePowerPlant row, the HRSG index for a CombinedCycleBlock row, or the exclusion group number for an exclusion grouping. Omitted for a plain supplemental attribute or a service membership, neither of which has a group to index. | [optional] [default to nothing]
**`role`** | **`String`** | Optional role of entity_id within the parent named by attribute_id. Meaningful only for a CombinedCycleBlock row, where it is CT (combustion turbine) or CA (combustion-augmented steam); omitted for every other attribute_type. | [optional] [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


