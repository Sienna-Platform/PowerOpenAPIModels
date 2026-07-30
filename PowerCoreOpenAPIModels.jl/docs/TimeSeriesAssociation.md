# TimeSeriesAssociation


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** |  | [default to nothing]
**`time_series_uuid`** | **`String`** | UUID of the time series data. May reference inline data or an external store (e.g., HDF5). | [default to nothing]
**`time_series_type`** | **`String`** |  | [default to nothing]
**`initial_timestamp`** | **`ZonedDateTime`** |  | [default to nothing]
**`resolution`** | **`String`** | ISO 8601 duration (e.g., PT1H, PT5M). | [default to nothing]
**`horizon`** | **`String`** | ISO 8601 duration for forecast horizon. | [optional] [default to nothing]
**`interval`** | **`String`** | ISO 8601 duration for forecast interval. | [optional] [default to nothing]
**`window_count`** | **`Int64`** |  | [optional] [default to nothing]
**`length`** | **`Int64`** |  | [optional] [default to nothing]
**`name`** | **`String`** | Time series name (e.g., max_active_power). | [default to nothing]
**`owner_id`** | **`Int64`** | ID of the owning component. | [default to nothing]
**`owner_type`** | **`String`** | Type name of the owning component. | [default to nothing]
**`owner_category`** | **`String`** | Whether the owner is component or supplemental attribute | [default to nothing]
**`features`** | **`Vector{Dict{String, FeatureValue}}`** |  | [default to nothing]
**`scaling_factor_multiplier`** | **`String`** | Dot-encoded function name like PowerSystems.get_max_active_power. | [optional] [default to nothing]
**`metadata_uuid`** | **`String`** | Usually unique for each association, but not necessarily | [default to nothing]
**`units`** | **`String`** | Unit string for the series values; must be a unit from the Core/units.json vocabulary for the series&#39; quantity type. | [optional] [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


