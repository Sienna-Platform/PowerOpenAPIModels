# TimeSeriesAssociation


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** |  | [default to nothing]
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
**`element_type`** | **`String`** | Canonical element type of the stored array: a dtype spelling (&#x60;f64&#x60;, &#x60;f32&#x60;, &#x60;i64&#x60;, &#x60;i32&#x60;, &#x60;u64&#x60;, &#x60;bool&#x60;) for plain scalars, else &#x60;tuple(N,dtype)&#x60; or a function-data kind (&#x60;linear_function&#x60;, &#x60;quadratic_function&#x60;, &#x60;piecewise_linear&#x60;, &#x60;piecewise_step&#x60;). It says what one timestep&#39;s value *means* and how it is laid out; the physical dtype of the bytes is derived from it rather than recorded separately. Unlike &#x60;units&#x60; and &#x60;quantity_kind&#x60; this is not a user-facing label — the writing package derives it from the array. | [optional] [default to nothing]
**`units`** | **`String`** | Unit string for the series values; must be a unit from the Core/units.json vocabulary allowed for &#x60;quantity_kind&#x60;. Absent when the series declares no unit, and meaningless on its own when &#x60;unit_system&#x60; is a per-unit basis, where the values are dimensionless. | [optional] [default to nothing]
**`quantity_kind`** | **`String`** | Kind of physical quantity the values measure; must be a &#x60;quantity_types&#x60; name from the Core/units.json vocabulary (e.g. ActivePower, ReactivePower, ElectricalEnergy). Not an enum here because Core/units.json is the single source of truth for the vocabulary and duplicating it would give it two homes. It is coarser than &#x60;units&#x60; but finer than a dimension: ActivePower, ReactivePower, and ApparentPower share the dimension {M:1,L:2,T:-3}, so a dimension cannot tell them apart and a quantity type can. It is also the only record of what the values measure when &#x60;unit_system&#x60; is a per-unit basis and they are therefore dimensionless. | [optional] [default to nothing]
**`unit_system`** | **`String`** | Basis the series values are already expressed in. A declaration, not a conversion: nothing here rescales values, and converting a DEVICE_BASE series back to natural units needs the owning component&#39;s base_power — as with every other per-unit quantity, system-base data records its base there and rides as DEVICE_BASE. Absent means unspecified, which is deliberately not the same as NATURAL_UNITS: a series that never declared a basis must not be read as though someone had said its values were natural. | [optional] [default to nothing]
**`application_data`** | **`String`** | Opaque, package-owned payload (typically JSON) carried verbatim for an application to reconstruct its own domain objects. Never parsed or interpreted here, and end users are not expected to set it. This is a property of the association, not the component-level &#x60;ext&#x60; that the PSY parity allowlist drops as an infra field. Element typing does *not* belong here — that is &#x60;element_type&#x60;, which this layer owns and validates. | [optional] [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


