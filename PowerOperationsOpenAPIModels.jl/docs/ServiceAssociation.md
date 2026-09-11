# ServiceAssociation

Links a service to one contributing component. One record per (service, member) pair. entity_id may name a Device, a Branch (TransmissionInterface), or another Service (GroupReserve), so no member-type discriminator is needed.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`entity_id`** | **`Int64`** | ID of the contributing member: a Device, a Branch, or another Service. | [required]
**`service_id`** | **`Int64`** | ID of the service the membership belongs to. | [required]
