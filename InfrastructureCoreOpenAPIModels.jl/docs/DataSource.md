# DataSource

Records data provenance for a component's field values: the organization or dataset it came from, the URL retrieved from, and when. Linked to the entity it describes via SupplementalAttributeAssociation with attribute_type: DataSource.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`confidence`** | **`Union{Absent,Nothing,String}`** | Confidence qualifier, e.g. 'high', 'medium'. | [optional]
**`dataset`** | **`Union{Absent,Nothing,String}`** | Dataset identifier within the publishing organization, e.g. 'EIA-860 2023, Schedule 3'. | [optional]
**`extra`** | **`Union{Absent,DataSourceExtra,Nothing}`** | Additional string-valued provenance metadata. | [optional]
**`fields`** | **`Vector{String}`** | Names of the component fields this provenance record applies to. | [required]
**`id`** | **`Int64`** |  | [required]
**`organization`** | **`Union{Absent,Nothing,String}`** | Publishing organization, e.g. 'U.S. Energy Information Administration'. | [optional]
**`published_at`** | **`Union{Absent,Union{Dates.DateTime,Nothing}}`** | When the source published the data; null if unknown. | [optional]
**`recorded_by`** | **`Union{Absent,Union{Nothing,String}}`** | User or agent that recorded the value. | [optional]
**`retrieved_at`** | **`Dates.DateTime`** | When the data was obtained. | [required]
**`url`** | **`Union{Absent,Nothing,String}`** | URL the data was retrieved from. | [optional]
**`version`** | **`Union{Absent,Nothing,String}`** | Data version or vintage, e.g. '2023 final'. | [optional]
