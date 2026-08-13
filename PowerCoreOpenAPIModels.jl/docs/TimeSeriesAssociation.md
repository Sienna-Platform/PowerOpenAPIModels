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
**`units`** | **`String`** | Unit string for the series values; must be a unit from the Core/units.json vocabulary allowed for &#x60;quantity_type&#x60;. Absent when the series declares no unit, and meaningless on its own when &#x60;unit_system&#x60; is a per-unit basis, where the values are dimensionless. | [optional] [default to nothing]
**`quantity_type`** | **`String`** | Kind of physical quantity the values measure; must be a &#x60;quantity_types&#x60; name from the Core/units.json vocabulary (e.g. ActivePower, ReactivePower, ElectricalEnergy). Not an enum here because Core/units.json is the single source of truth for the vocabulary and duplicating it would give it two homes. It is coarser than &#x60;units&#x60; but finer than a dimension: ActivePower, ReactivePower, and ApparentPower share the dimension {M:1,L:2,T:-3}, so a dimension cannot tell them apart and a quantity type can. It is also the only record of what the values measure when &#x60;unit_system&#x60; is a per-unit basis and they are therefore dimensionless. | [optional] [default to nothing]
**`unit_system`** | **`String`** | Basis the series values are already expressed in. A declaration, not a conversion: nothing here rescales values, and converting a DEVICE_BASE series back to natural units needs the owning component&#39;s base_power — as with every other per-unit quantity, system-base data records its base there and rides as DEVICE_BASE. Absent means unspecified, which is deliberately not the same as NATURAL_UNITS: a series that never declared a basis must not be read as though someone had said its values were natural. | [optional] [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


