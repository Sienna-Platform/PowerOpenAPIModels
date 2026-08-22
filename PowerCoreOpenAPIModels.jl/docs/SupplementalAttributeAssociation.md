# SupplementalAttributeAssociation


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`component_id`** | **`Int64`** | ID of the component the attribute describes. | [default to nothing]
**`component_type`** | **`String`** | Type name of the component the attribute describes. A denormalized label matching the relational mirror&#39;s column, used for filtering; not part of the row&#39;s identity, which is the &#x60;(component_id, attribute_id)&#x60; pair. | [default to nothing]
**`attribute_id`** | **`Int64`** | ID of the supplemental attribute. | [default to nothing]
**`attribute_type`** | **`String`** | Schema title of the referenced supplemental attribute (e.g. \&quot;EmissionsData\&quot;, \&quot;GeographicInfo\&quot;). A free-form string, not an enum: new attribute types are added elsewhere in this repo continuously, and a closed enum here would go stale. | [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


