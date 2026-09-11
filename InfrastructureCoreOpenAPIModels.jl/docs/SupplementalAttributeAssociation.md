# SupplementalAttributeAssociation

Links a supplemental attribute to the component it describes: one row per (component_id, attribute_id) pair. `component_type` and `attribute_type` are denormalized labels for filtering, not part of the row's identity.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`attribute_id`** | **`Int64`** | ID of the supplemental attribute. | [required]
**`attribute_type`** | **`String`** | Schema title of the referenced supplemental attribute (e.g. EmissionsData). Free-form, not an enum: attribute types are added continuously. | [required]
**`component_id`** | **`Int64`** | ID of the component the attribute describes. | [required]
**`component_type`** | **`String`** | Type name of the component the attribute describes. A denormalized label for filtering; not part of the row's identity. | [required]
