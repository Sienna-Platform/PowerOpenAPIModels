# Probabilistic

A probabilistic forecast: per-percentile, per-window horizon arrays. Adds a percentile axis in front of the deterministic layout.

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**`application_data`** | **`Union{Absent,Nothing,String}`** | Opaque payload, typically JSON, carried verbatim for the owning application to reconstruct its own objects. Never parsed here. | [optional]
**`array_shape`** | **`Union{Absent,Nothing,Vector{Int64}}`** | Full native shape of the stored array: length, then `element_shape`. Forecasts add a horizon/percentile/scenario axis. Optional for static types. | [optional]
**`association_id`** | **`Int64`** | Surrogate id for this association, minted by the store. Fixed once assigned and never reused; a consumer may persist it as a durable reference. | [required]
**`component_field`** | **`Union{Absent,Nothing,String}`** | Field on the owning object whose time-varying values these are (e.g. max_active_power). Free-form; records what the values are for. | [optional]
**`count`** | **`Int64`** | Number of forecast windows. Descriptive, not part of the series' identity. | [required]
**`data_hash`** | **`Union{Absent,Nothing,String}`** | Content hash of the stored array: SHA-256, hex-encoded. Optional — not every producer computes it. | [optional]
**`element_shape`** | **`Vector{Int64}`** | Per-step element shape: the trailing dims after time. An empty array means a scalar element. | [required]
**`element_type`** | **`ElementType`** | What one timestep's values mean and how they are laid out. The stored dtype derives from this and is not recorded separately. | [required]
**`features`** | **`TimeSeriesFeatures`** | User-defined key/value tags, part of the series' identity: two series differing only by a feature are distinct. Names cannot collide with another series field. | [required]
**`horizon`** | **`Period`** | Length of one forecast window. Descriptive, not part of the series' identity. | [required]
**`initial_timestamp`** | **`Dates.DateTime`** | Start of the first forecast window. | [required]
**`interval`** | **`Period`** | Step between the start of consecutive forecast windows. Part of the series' identity. `PT0S` is canonical for a single-window forecast. | [required]
**`name`** | **`String`** | Series name (e.g. max_active_power), part of its identity. `component_field` records what the values represent. | [required]
**`owner_category`** | **`OwnerCategory`** | Whether the owner is a component or a supplemental attribute. | [required]
**`owner_id`** | **`Int64`** | ID of the owning component or supplemental attribute. `owner_category` says which. | [required]
**`owner_type`** | **`String`** | Type name of the owning entity. Descriptive, not part of the series' identity. | [required]
**`percentiles`** | **`Vector{Float64}`** | The percentiles this forecast carries, one per leading axis entry of the stored array. | [required]
**`quantity_kind`** | **`Union{Absent,Nothing,String}`** | Physical quantity the values measure (e.g. ActivePower, ReactivePower). Finer-grained than a dimension; the only quantity record when `unit_system` is per-unit. | [optional]
**`resolution`** | **`Period`** | Cadence within a forecast window. Always present for a forecast, and part of the series' identity. | [required]
**`time_reference`** | **`Union{Absent,Nothing,TimeReference}`** | How this series' timestamps are spelled, returned as declared rather than relabeled as UTC. Absent means unspecified, not a UTC claim. | [optional]
**`time_series_type`** | **`String`** | Discriminator, fixed to Probabilistic for this schema. | [required]
**`unit_system`** | **`Union{Absent,Nothing,UnitSystem}`** | Basis the series values are already expressed in. A declaration only; nothing here rescales values. Absent means unspecified, not NATURAL_UNITS. | [optional]
**`units`** | **`Union{Absent,Nothing,String}`** | Unit label for the series values, set by the writer. Drawn from the vocabulary in Core/units.json by convention, not validated against it. | [optional]
**`uri`** | **`String`** | Locator for the dense data, unique within its store. Format is store-defined, often a file or dataset path. Never parsed or interpreted here. | [required]
