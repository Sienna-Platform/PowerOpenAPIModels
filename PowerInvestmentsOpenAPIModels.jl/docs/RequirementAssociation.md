# RequirementAssociation

Links a policy requirement to one member subject to it. One record per (requirement, member) pair: the many-to-many relation between a requirement and the components it constrains is normalized here rather than carried as a list on either side, so each membership is an individually addressable row. The type of either side is resolved through the entity registry rather than duplicated here, matching the shape of SupplementalAttributeAssociation. `requirement_id` names the policy requirement (a CapacityReserveMargin, CarbonCap, EnergyShareRequirement, ...); `entity_id` names the member the requirement applies to, so no member-type discriminator is needed.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`entity_id`** | **`Int64`** | ID of the member the requirement applies to. | [required]
**`requirement_id`** | **`Int64`** | ID of the policy requirement the membership belongs to. | [required]
