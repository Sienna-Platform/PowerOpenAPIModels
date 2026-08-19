# SingleTimeSeries


## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`id`** | **`Int64`** | Surrogate primary key of the association row (&#x60;id INTEGER PRIMARY KEY&#x60; in infrastore&#39;s catalog). Not part of the uniqueness tuple, which is (owner_id, owner_category, time_series_type, name, resolution, interval, features). | [default to nothing]
**`owner_id`** | **`Int64`** | ID of the owning component or supplemental attribute. Component and supplemental-attribute id streams are independent, so &#x60;owner_category&#x60; is what disambiguates an &#x60;owner_id&#x60; reused across the two. | [default to nothing]
**`owner_type`** | **`String`** | Type name of the owning entity. Descriptive, not part of the series&#39; identity. | [default to nothing]
**`owner_category`** | **`String`** | Whether the owner is a component or a supplemental attribute. | [default to nothing]
**`time_series_type`** | **`String`** | Discriminator. Fixed to SingleTimeSeries for this schema, pinned with &#x60;const&#x60; to match this repo&#39;s existing discriminators (Core/common.json&#39;s &#x60;curve_type&#x60;), which generate a plain string literal in both toolchains. | [default to "SingleTimeSeries"]
**`name`** | **`String`** | Time series name (e.g. max_active_power). Part of the series&#39; identity, and often carrying a disambiguating suffix; &#x60;component_field&#x60; records what the values are for. | [default to nothing]
**`features`** | [**`Dict{String, TimeSeriesFeatureValue}`**](TimeSeriesFeatureValue.md) | User-defined key/value tags that are part of the series&#39; identity: two series differing only by a feature are distinct series. Feature names that collide with a field of a series or of the tuple addressing one are rejected. | [default to nothing]
**`address`** | **`String`** | Opaque locator for the dense data. Never parsed or interpreted here — the owner of the store decides what it means; in Sienna, infrastore resolves it. This layer records where the values are, never the values. | [default to nothing]
**`element_type`** | **`String`** | What one timestep&#39;s values mean and how they are laid out. The physical dtype of the stored bytes derives from this and is not recorded separately. Unlike &#x60;units&#x60; and &#x60;quantity_kind&#x60; this is not a user-facing label — the writing package derives it from the array. | [default to nothing]
**`element_shape`** | **`Vector{Int64}`** | Per-step element shape: the trailing dims after time. An empty array means a scalar element. | [default to nothing]
**`units`** | **`String`** | Unit label for the series values. Set by whoever creates the series and returned unchanged; not part of the series&#39; identity, so two series differing only in this label are duplicates. Meaningless on its own when &#x60;unit_system&#x60; is a per-unit basis, where the values are dimensionless. | [optional] [default to nothing]
**`quantity_kind`** | **`String`** | Kind of physical quantity the values measure (e.g. ActivePower, ReactivePower, ElectricalEnergy). Coarser than &#x60;units&#x60; but finer than a dimension: ActivePower, ReactivePower, and ApparentPower share the dimension {M:1,L:2,T:-3}, so a dimension cannot tell them apart and a quantity kind can. It is also the only record of what the values measure when &#x60;unit_system&#x60; is a per-unit basis. | [optional] [default to nothing]
**`unit_system`** | **`String`** | Basis the series values are already expressed in. A declaration, not a conversion: nothing here rescales values, and converting a COMPONENT_BASE series back to natural units needs the owning component&#39;s base_power. Absent means unspecified, which is deliberately not the same as NATURAL_UNITS. | [optional] [default to nothing]
**`component_field`** | **`String`** | The field on the owning component or supplemental attribute whose value these values are the time-varying form of (e.g. max_active_power, rating). Free-form: it names a field in the consumer&#39;s own object model. Records what the values are for, where &#x60;name&#x60; only says which series they are. | [optional] [default to nothing]
**`application_data`** | **`String`** | Opaque, package-owned payload (typically JSON) carried verbatim for an application to reconstruct its own domain objects. Never parsed or interpreted here, and end users are not expected to set it. Element typing does not belong here — that is &#x60;element_type&#x60;. | [optional] [default to nothing]
**`initial_timestamp`** | **`ZonedDateTime`** | First timestamp of the regular grid; every later step lands at &#x60;initial_timestamp + k * resolution&#x60;. Stored as an RFC3339 string and keeps nanoseconds, so a grid may be millisecond-spaced while being nanosecond-offset in its phase. | [default to nothing]
**`resolution`** | **`String`** | Cadence of the regular grid. Always present for a SingleTimeSeries, and part of the series&#39; identity. | [default to nothing]
**`length`** | **`Int64`** | Number of timesteps. | [default to nothing]


[[Back to Model list]](../README.md#models) [[Back to API list]](../README.md#api-endpoints) [[Back to README]](../README.md)


