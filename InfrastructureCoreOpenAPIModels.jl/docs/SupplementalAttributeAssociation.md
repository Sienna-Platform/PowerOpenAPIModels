# SupplementalAttributeAssociation

Links a supplemental attribute to the component it describes — the JSON form of a row in the store's `supplemental_attribute_associations` catalog table, field-for-field. `component_type` and `attribute_type` are denormalized labels carried for filtering and reporting, not identity: identity is the `(component_id, attribute_id)` pair. Lives in Core because either side may be a Core or an Operations type. Unlike `components`, `supplemental_attributes` is a flat, untyped array, so `attribute_type` is this record's only per-row type discriminator.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`attribute_id`** | **`Int64`** | ID of the supplemental attribute. | [required]
**`attribute_type`** | **`String`** | Schema title of the referenced supplemental attribute (e.g. "EmissionsData", "GeographicInfo"). A free-form string, not an enum: new attribute types are added elsewhere in this repo continuously, and a closed enum here would go stale. | [required]
**`component_id`** | **`Int64`** | ID of the component the attribute describes. | [required]
**`component_type`** | **`String`** | Type name of the component the attribute describes. A denormalized label matching the relational mirror's column, used for filtering; not part of the row's identity, which is the `(component_id, attribute_id)` pair. | [required]
