# DataSource


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** |  | [default to nothing]
**`organization`** | **`String`** | Publishing organization, e.g. &#39;U.S. Energy Information Administration&#39;. | [optional] [default to nothing]
**`retrieved_at`** | **`ZonedDateTime`** | When the data was obtained. | [default to nothing]
**`dataset`** | **`String`** | Dataset identifier within the publishing organization, e.g. &#39;EIA-860 2023, Schedule 3&#39;. | [optional] [default to nothing]
**`url`** | **`String`** | URL the data was retrieved from. | [optional] [default to nothing]
**`version`** | **`String`** | Data version or vintage, e.g. &#39;2023 final&#39;. | [optional] [default to nothing]
**`published_at`** | **`ZonedDateTime`** | When the source published the data; null if unknown. | [optional] [default to nothing]
**`confidence`** | **`String`** | Confidence qualifier, e.g. &#39;high&#39;, &#39;medium&#39;. | [optional] [default to nothing]
**`recorded_by`** | **`String`** | User or agent that recorded the value. | [optional] [default to nothing]
**`fields`** | **`Vector{String}`** | Names of the component fields this provenance record applies to. | [default to nothing]
**`extra`** | **`Dict{String, String}`** | Additional string-valued provenance metadata. | [optional] [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


