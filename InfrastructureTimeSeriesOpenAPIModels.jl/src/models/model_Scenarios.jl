@doc "    Scenarios\n\nA scenarios forecast: per-scenario, per-window horizon arrays. Adds a scenario axis in front of the deterministic layout.\n\n- `application_data`: Opaque, package-owned payload (typically JSON) carried verbatim for an application to reconstruct its own domain objects. Never parsed or interpreted here, and end users are not expected to set it. Element typing does not belong here — that is `element_type`.\n- `array_shape`: Full native shape of the stored array, in the order the store holds it: the first axis is the array's length and the trailing axes end with `element_shape`. Static types are `[length, *element_shape]`; a deterministic forecast stacks windows as `[horizon_count, count, *element_shape]`; probabilistic and scenarios forecasts add a percentile or scenario axis in front of that. Optional, and redundant for the static types, where it is exactly `[length] + element_shape`. It earns its place on the forecasts, whose array layout is a convention the producing package owns rather than a rule this layer enforces, so the stored geometry cannot be reconstructed from `horizon`, `count`, `percentiles`, and `scenario_count` alone. A consumer that has it should prefer it; one that does not falls back to those fields, which is exact for the static types and a best effort for the forecasts.\n- `association_id`: Surrogate id of this association, minted by the store that holds it. Assigned once when the association is created and never changed: renaming the series or reassigning its owner leaves it alone, so a consumer may persist it as a durable reference. Ids are never reused, and they are store-local — resolve one against the same store the document was exported from, not against an independently built store. Assigned by the store, never by a document author.\n- `component_field`: The field on the owning component or supplemental attribute whose value these values are the time-varying form of (e.g. max_active_power, rating). Free-form: it names a field in the consumer's own object model. Records what the values are for, where `name` only says which series they are.\n- `count`: Number of forecast windows. Descriptive, not part of the series' identity.\n- `data_hash`: Content hash of the stored array: SHA-256, hex-encoded. Optional — not every producer computes it.\n- `element_shape`: Per-step element shape: the trailing dims after time. An empty array means a scalar element.\n- `element_type`: What one timestep's values mean and how they are laid out. The physical dtype of the stored bytes derives from this and is not recorded separately. Unlike `units` and `quantity_kind` this is not a user-facing label — the writing package derives it from the array.\n- `features`: User-defined key/value tags that are part of the series' identity: two series differing only by a feature are distinct series. Feature names that collide with a field of a series or of the tuple addressing one are rejected.\n- `horizon`: Length of one forecast window. Descriptive, not part of the series' identity.\n- `initial_timestamp`: Start of the first forecast window.\n- `interval`: Step between the start of consecutive forecast windows. Part of the series' identity: two forecasts of one variable at the same resolution but different intervals — a day-ahead and a real-time forecast — are distinct series. `PT0S` is the canonical interval of a single-window forecast, which has no second window to step to.\n- `name`: Time series name (e.g. max_active_power). Part of the series' identity, and often carrying a disambiguating suffix; `component_field` records what the values are for.\n- `owner_category`: Whether the owner is a component or a supplemental attribute.\n- `owner_id`: ID of the owning component or supplemental attribute. The producing data layer allocates both from one id stream, so an `owner_id` never collides across the two categories; `owner_category` remains required because the store's catalog contract still supports independent streams from other producers, and it is still the store's disambiguator.\n- `owner_type`: Type name of the owning entity. Descriptive, not part of the series' identity.\n- `quantity_kind`: Kind of physical quantity the values measure (e.g. ActivePower, ReactivePower, ElectricalEnergy). Coarser than `units` but finer than a dimension: ActivePower, ReactivePower, and ApparentPower share the dimension {M:1,L:2,T:-3}, so a dimension cannot tell them apart and a quantity kind can. It is also the only record of what the values measure when `unit_system` is a per-unit basis.\n- `resolution`: Cadence within a forecast window. Always present for a forecast, and part of the series' identity.\n- `scenario_count`: Number of scenarios, one per leading axis entry of the stored array. The store's catalog has no column for this and reads it off the array's shape; it is recorded explicitly here because this layer carries no array.\n- `time_reference`: How this series' timestamps were spelled, so a read hands back what the write declared instead of relabelling everything UTC. Absent means unspecified, which is not a claim the timestamps were written as UTC.\n- `time_series_type`: Discriminator. Fixed to Scenarios for this schema, pinned with `const` to match this repo's existing discriminators (Core/common.json's `curve_type`), which generate a plain string literal in both toolchains.\n- `unit_system`: Basis the series values are already expressed in. A declaration, not a conversion: nothing here rescales values, and converting a COMPONENT_BASE series back to natural units needs the owning component's base_power. Absent means unspecified, which is deliberately not the same as NATURAL_UNITS.\n- `units`: Unit label for the series values. Set by whoever creates the series and returned unchanged; not part of the series' identity, so two series differing only in this label are duplicates. Meaningless on its own when `unit_system` is a per-unit basis, where the values are dimensionless. By convention drawn from the unit vocabulary in Core/units.json, though this field is a free-text label the store does not validate against it.\n- `uri`: Locator for the dense data, unique within one store. No required format — typically a file path or an HDF5 dataset path; the backing store decides what it means and resolves it (infrastore uses its content hash as this value). Never parsed or interpreted here. This layer records where the values are, never the values."
Base.@kwdef struct Scenarios
    application_data::Union{Absent,Nothing,String} = ABSENT
    array_shape::Union{Absent,Nothing,Vector{Int64}} = ABSENT
    association_id::Int64
    component_field::Union{Absent,Nothing,String} = ABSENT
    count::Int64
    data_hash::Union{Absent,Nothing,String} = ABSENT
    element_shape::Vector{Int64}
    element_type::String
    features::ScenariosFeatures
    horizon::String
    initial_timestamp::Dates.DateTime
    interval::String
    name::String
    owner_category::ScenariosOwnerCategory
    owner_id::Int64
    owner_type::String
    quantity_kind::Union{Absent,Nothing,String} = ABSENT
    resolution::String
    scenario_count::Int64
    time_reference::Union{Absent,Nothing,String} = ABSENT
    time_series_type::String
    unit_system::Union{Absent,Nothing,ScenariosUnitSystem} = ABSENT
    units::Union{Absent,Nothing,String} = ABSENT
    uri::String
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{Scenarios}, value) = _decode(Scenarios, value, true)
function _decode(::Type{Scenarios}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/Scenarios"), _openapi_raw, "decoding Scenarios"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "Scenarios")
    _openapi_field_application_data = haskey(_openapi_object, "application_data") ? _decode(Union{Absent,Nothing,String}, _openapi_object["application_data"], _openapi_validate) : ABSENT
    _openapi_field_array_shape = haskey(_openapi_object, "array_shape") ? _decode(Union{Absent,Nothing,Vector{Int64}}, _openapi_object["array_shape"], _openapi_validate) : ABSENT
    _openapi_field_association_id = _decode(Int64, _required(_openapi_object, "association_id", "Scenarios"), _openapi_validate)
    _openapi_field_component_field = haskey(_openapi_object, "component_field") ? _decode(Union{Absent,Nothing,String}, _openapi_object["component_field"], _openapi_validate) : ABSENT
    _openapi_field_count = _decode(Int64, _required(_openapi_object, "count", "Scenarios"), _openapi_validate)
    _openapi_field_data_hash = haskey(_openapi_object, "data_hash") ? _decode(Union{Absent,Nothing,String}, _openapi_object["data_hash"], _openapi_validate) : ABSENT
    _openapi_field_element_shape = _decode(Vector{Int64}, _required(_openapi_object, "element_shape", "Scenarios"), _openapi_validate)
    _openapi_field_element_type = _decode(String, _required(_openapi_object, "element_type", "Scenarios"), _openapi_validate)
    _openapi_field_features = _decode(ScenariosFeatures, _required(_openapi_object, "features", "Scenarios"), _openapi_validate)
    _openapi_field_horizon = _decode(String, _required(_openapi_object, "horizon", "Scenarios"), _openapi_validate)
    _openapi_field_initial_timestamp = _decode(Dates.DateTime, _required(_openapi_object, "initial_timestamp", "Scenarios"), _openapi_validate)
    _openapi_field_interval = _decode(String, _required(_openapi_object, "interval", "Scenarios"), _openapi_validate)
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "Scenarios"), _openapi_validate)
    _openapi_field_owner_category = _decode(ScenariosOwnerCategory, _required(_openapi_object, "owner_category", "Scenarios"), _openapi_validate)
    _openapi_field_owner_id = _decode(Int64, _required(_openapi_object, "owner_id", "Scenarios"), _openapi_validate)
    _openapi_field_owner_type = _decode(String, _required(_openapi_object, "owner_type", "Scenarios"), _openapi_validate)
    _openapi_field_quantity_kind = haskey(_openapi_object, "quantity_kind") ? _decode(Union{Absent,Nothing,String}, _openapi_object["quantity_kind"], _openapi_validate) : ABSENT
    _openapi_field_resolution = _decode(String, _required(_openapi_object, "resolution", "Scenarios"), _openapi_validate)
    _openapi_field_scenario_count = _decode(Int64, _required(_openapi_object, "scenario_count", "Scenarios"), _openapi_validate)
    _openapi_field_time_reference = haskey(_openapi_object, "time_reference") ? _decode(Union{Absent,Nothing,String}, _openapi_object["time_reference"], _openapi_validate) : ABSENT
    _openapi_field_time_series_type = _decode(String, _required(_openapi_object, "time_series_type", "Scenarios"), _openapi_validate)
    _openapi_field_unit_system = haskey(_openapi_object, "unit_system") ? _decode(Union{Absent,Nothing,ScenariosUnitSystem}, _openapi_object["unit_system"], _openapi_validate) : ABSENT
    _openapi_field_units = haskey(_openapi_object, "units") ? _decode(Union{Absent,Nothing,String}, _openapi_object["units"], _openapi_validate) : ABSENT
    _openapi_field_uri = _decode(String, _required(_openapi_object, "uri", "Scenarios"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("application_data","array_shape","association_id","component_field","count","data_hash","element_shape","element_type","features","horizon","initial_timestamp","interval","name","owner_category","owner_id","owner_type","quantity_kind","resolution","scenario_count","time_reference","time_series_type","unit_system","units","uri") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return Scenarios(; application_data = _openapi_field_application_data, array_shape = _openapi_field_array_shape, association_id = _openapi_field_association_id, component_field = _openapi_field_component_field, count = _openapi_field_count, data_hash = _openapi_field_data_hash, element_shape = _openapi_field_element_shape, element_type = _openapi_field_element_type, features = _openapi_field_features, horizon = _openapi_field_horizon, initial_timestamp = _openapi_field_initial_timestamp, interval = _openapi_field_interval, name = _openapi_field_name, owner_category = _openapi_field_owner_category, owner_id = _openapi_field_owner_id, owner_type = _openapi_field_owner_type, quantity_kind = _openapi_field_quantity_kind, resolution = _openapi_field_resolution, scenario_count = _openapi_field_scenario_count, time_reference = _openapi_field_time_reference, time_series_type = _openapi_field_time_series_type, unit_system = _openapi_field_unit_system, units = _openapi_field_units, uri = _openapi_field_uri, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::Scenarios)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.application_data isa Absent || (_openapi_output["application_data"] = _encode(_openapi_value.application_data))
    _openapi_value.array_shape isa Absent || (_openapi_output["array_shape"] = _encode(_openapi_value.array_shape))
    _openapi_value.association_id isa Absent || (_openapi_output["association_id"] = _encode(_openapi_value.association_id))
    _openapi_value.component_field isa Absent || (_openapi_output["component_field"] = _encode(_openapi_value.component_field))
    _openapi_value.count isa Absent || (_openapi_output["count"] = _encode(_openapi_value.count))
    _openapi_value.data_hash isa Absent || (_openapi_output["data_hash"] = _encode(_openapi_value.data_hash))
    _openapi_value.element_shape isa Absent || (_openapi_output["element_shape"] = _encode(_openapi_value.element_shape))
    _openapi_value.element_type isa Absent || (_openapi_output["element_type"] = _encode(_openapi_value.element_type))
    _openapi_value.features isa Absent || (_openapi_output["features"] = _encode(_openapi_value.features))
    _openapi_value.horizon isa Absent || (_openapi_output["horizon"] = _encode(_openapi_value.horizon))
    _openapi_value.initial_timestamp isa Absent || (_openapi_output["initial_timestamp"] = _encode(_openapi_value.initial_timestamp))
    _openapi_value.interval isa Absent || (_openapi_output["interval"] = _encode(_openapi_value.interval))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.owner_category isa Absent || (_openapi_output["owner_category"] = _encode(_openapi_value.owner_category))
    _openapi_value.owner_id isa Absent || (_openapi_output["owner_id"] = _encode(_openapi_value.owner_id))
    _openapi_value.owner_type isa Absent || (_openapi_output["owner_type"] = _encode(_openapi_value.owner_type))
    _openapi_value.quantity_kind isa Absent || (_openapi_output["quantity_kind"] = _encode(_openapi_value.quantity_kind))
    _openapi_value.resolution isa Absent || (_openapi_output["resolution"] = _encode(_openapi_value.resolution))
    _openapi_value.scenario_count isa Absent || (_openapi_output["scenario_count"] = _encode(_openapi_value.scenario_count))
    _openapi_value.time_reference isa Absent || (_openapi_output["time_reference"] = _encode(_openapi_value.time_reference))
    _openapi_value.time_series_type isa Absent || (_openapi_output["time_series_type"] = _encode(_openapi_value.time_series_type))
    _openapi_value.unit_system isa Absent || (_openapi_output["unit_system"] = _encode(_openapi_value.unit_system))
    _openapi_value.units isa Absent || (_openapi_output["units"] = _encode(_openapi_value.units))
    _openapi_value.uri isa Absent || (_openapi_output["uri"] = _encode(_openapi_value.uri))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/Scenarios"), _openapi_output, "encoding Scenarios"; direction = :neutral)
end

function _form_fields(_openapi_value::Scenarios)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.application_data isa Absent || push!(_openapi_output, "application_data" => _openapi_value.application_data)
    _openapi_value.array_shape isa Absent || push!(_openapi_output, "array_shape" => _openapi_value.array_shape)
    _openapi_value.association_id isa Absent || push!(_openapi_output, "association_id" => _openapi_value.association_id)
    _openapi_value.component_field isa Absent || push!(_openapi_output, "component_field" => _openapi_value.component_field)
    _openapi_value.count isa Absent || push!(_openapi_output, "count" => _openapi_value.count)
    _openapi_value.data_hash isa Absent || push!(_openapi_output, "data_hash" => _openapi_value.data_hash)
    _openapi_value.element_shape isa Absent || push!(_openapi_output, "element_shape" => _openapi_value.element_shape)
    _openapi_value.element_type isa Absent || push!(_openapi_output, "element_type" => _openapi_value.element_type)
    _openapi_value.features isa Absent || push!(_openapi_output, "features" => _openapi_value.features)
    _openapi_value.horizon isa Absent || push!(_openapi_output, "horizon" => _openapi_value.horizon)
    _openapi_value.initial_timestamp isa Absent || push!(_openapi_output, "initial_timestamp" => _openapi_value.initial_timestamp)
    _openapi_value.interval isa Absent || push!(_openapi_output, "interval" => _openapi_value.interval)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.owner_category isa Absent || push!(_openapi_output, "owner_category" => _openapi_value.owner_category)
    _openapi_value.owner_id isa Absent || push!(_openapi_output, "owner_id" => _openapi_value.owner_id)
    _openapi_value.owner_type isa Absent || push!(_openapi_output, "owner_type" => _openapi_value.owner_type)
    _openapi_value.quantity_kind isa Absent || push!(_openapi_output, "quantity_kind" => _openapi_value.quantity_kind)
    _openapi_value.resolution isa Absent || push!(_openapi_output, "resolution" => _openapi_value.resolution)
    _openapi_value.scenario_count isa Absent || push!(_openapi_output, "scenario_count" => _openapi_value.scenario_count)
    _openapi_value.time_reference isa Absent || push!(_openapi_output, "time_reference" => _openapi_value.time_reference)
    _openapi_value.time_series_type isa Absent || push!(_openapi_output, "time_series_type" => _openapi_value.time_series_type)
    _openapi_value.unit_system isa Absent || push!(_openapi_output, "unit_system" => _openapi_value.unit_system)
    _openapi_value.units isa Absent || push!(_openapi_output, "units" => _openapi_value.units)
    _openapi_value.uri isa Absent || push!(_openapi_output, "uri" => _openapi_value.uri)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
