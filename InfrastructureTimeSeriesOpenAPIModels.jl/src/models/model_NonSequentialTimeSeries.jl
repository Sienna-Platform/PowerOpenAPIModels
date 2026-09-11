"""
    NonSequentialTimeSeries

An irregular static time series sampled at explicit timestamps rather than on a grid. Carries no initial_timestamp or resolution. Its timestamp vector lives in the store; timestamps_uri names which axis it sits on.

  - `application_data`: Opaque payload, typically JSON, carried verbatim for the owning application to reconstruct its own objects. Never parsed here.
  - `array_shape`: Full native shape of the stored array: length, then `element_shape`. Forecasts add a horizon/percentile/scenario axis. Optional for static types.
  - `association_id`: Surrogate id for this association, minted by the store. Fixed once assigned and never reused; a consumer may persist it as a durable reference.
  - `component_field`: Field on the owning object whose time-varying values these are (e.g. max_active_power). Free-form; records what the values are for.
  - `data_hash`: Content hash of the stored array: SHA-256, hex-encoded. Optional — not every producer computes it.
  - `element_shape`: Per-step element shape: the trailing dims after time. An empty array means a scalar element.
  - `element_type`: What one timestep's values mean and how they are laid out. The stored dtype derives from this and is not recorded separately.
  - `features`: User-defined key/value tags, part of the series' identity: two series differing only by a feature are distinct. Names cannot collide with another series field.
  - `length`: Number of timesteps. Together with name, identifies the series; its explicit, strictly-increasing timestamp vector lives in the store, content-addressed.
  - `name`: Series name (e.g. max_active_power), part of its identity. `component_field` records what the values represent.
  - `owner_category`: Whether the owner is a component or a supplemental attribute.
  - `owner_id`: ID of the owning component or supplemental attribute. `owner_category` says which.
  - `owner_type`: Type name of the owning entity. Descriptive, not part of the series' identity.
  - `quantity_kind`: Physical quantity the values measure (e.g. ActivePower, ReactivePower). Finer-grained than a dimension; the only quantity record when `unit_system` is per-unit.
  - `time_reference`: How this series' timestamps are spelled, returned as declared rather than relabeled as UTC. Absent means unspecified, not a UTC claim.
  - `time_series_type`: Discriminator, fixed to NonSequentialTimeSeries for this schema.
  - `timestamps_uri`: Locator for this series' explicit timestamp vector, unique within one store. Optional; absent from the other five types, which have no explicit axis.
  - `unit_system`: Basis the series values are already expressed in. A declaration only; nothing here rescales values. Absent means unspecified, not NATURAL_UNITS.
  - `units`: Unit label for the series values, set by the writer. Drawn from the vocabulary in Core/units.json by convention, not validated against it.
  - `uri`: Locator for the dense data, unique within its store. Format is store-defined, often a file or dataset path. Never parsed or interpreted here.
"""
Base.@kwdef struct NonSequentialTimeSeries <: APIModel
    application_data::Union{Absent, Nothing, String} = ABSENT
    array_shape::Union{Absent, Nothing, Vector{Int64}} = ABSENT
    association_id::Int64
    component_field::Union{Absent, Nothing, String} = ABSENT
    data_hash::Union{Absent, Nothing, String} = ABSENT
    element_shape::Vector{Int64}
    element_type::ElementType
    features::TimeSeriesFeatures
    length::Int64
    name::String
    owner_category::OwnerCategory
    owner_id::Int64
    owner_type::String
    quantity_kind::Union{Absent, Nothing, String} = ABSENT
    time_reference::Union{Absent, Nothing, TimeReference} = ABSENT
    time_series_type::String = "NonSequentialTimeSeries"
    timestamps_uri::Union{Absent, Nothing, String} = ABSENT
    unit_system::Union{Absent, Nothing, UnitSystem} = ABSENT
    units::Union{Absent, Nothing, String} = ABSENT
    uri::String
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{NonSequentialTimeSeries}, value) =
    _decode(NonSequentialTimeSeries, value, true)
function _decode(::Type{NonSequentialTimeSeries}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-463dad90dca1b0053108.json",
            pointer="/components/schemas/NonSequentialTimeSeries",
        ),
        _openapi_raw,
        "decoding NonSequentialTimeSeries";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "NonSequentialTimeSeries")
    _openapi_field_application_data =
        haskey(_openapi_object, "application_data") ?
        _decode(
            Union{Absent, Nothing, String},
            _openapi_object["application_data"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_array_shape =
        haskey(_openapi_object, "array_shape") ?
        _decode(
            Union{Absent, Nothing, Vector{Int64}},
            _openapi_object["array_shape"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_association_id = _decode(
        Int64,
        _required(_openapi_object, "association_id", "NonSequentialTimeSeries"),
        _openapi_validate,
    )
    _openapi_field_component_field =
        haskey(_openapi_object, "component_field") ?
        _decode(
            Union{Absent, Nothing, String},
            _openapi_object["component_field"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_data_hash =
        haskey(_openapi_object, "data_hash") ?
        _decode(
            Union{Absent, Nothing, String},
            _openapi_object["data_hash"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_element_shape = _decode(
        Vector{Int64},
        _required(_openapi_object, "element_shape", "NonSequentialTimeSeries"),
        _openapi_validate,
    )
    _openapi_field_element_type = _decode(
        ElementType,
        _required(_openapi_object, "element_type", "NonSequentialTimeSeries"),
        _openapi_validate,
    )
    _openapi_field_features = _decode(
        TimeSeriesFeatures,
        _required(_openapi_object, "features", "NonSequentialTimeSeries"),
        _openapi_validate,
    )
    _openapi_field_length = _decode(
        Int64,
        _required(_openapi_object, "length", "NonSequentialTimeSeries"),
        _openapi_validate,
    )
    _openapi_field_name = _decode(
        String,
        _required(_openapi_object, "name", "NonSequentialTimeSeries"),
        _openapi_validate,
    )
    _openapi_field_owner_category = _decode(
        OwnerCategory,
        _required(_openapi_object, "owner_category", "NonSequentialTimeSeries"),
        _openapi_validate,
    )
    _openapi_field_owner_id = _decode(
        Int64,
        _required(_openapi_object, "owner_id", "NonSequentialTimeSeries"),
        _openapi_validate,
    )
    _openapi_field_owner_type = _decode(
        String,
        _required(_openapi_object, "owner_type", "NonSequentialTimeSeries"),
        _openapi_validate,
    )
    _openapi_field_quantity_kind =
        haskey(_openapi_object, "quantity_kind") ?
        _decode(
            Union{Absent, Nothing, String},
            _openapi_object["quantity_kind"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_time_reference =
        haskey(_openapi_object, "time_reference") ?
        _decode(
            Union{Absent, Nothing, TimeReference},
            _openapi_object["time_reference"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_time_series_type = _decode(
        String,
        _required(_openapi_object, "time_series_type", "NonSequentialTimeSeries"),
        _openapi_validate,
    )
    _openapi_field_timestamps_uri =
        haskey(_openapi_object, "timestamps_uri") ?
        _decode(
            Union{Absent, Nothing, String},
            _openapi_object["timestamps_uri"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_unit_system =
        haskey(_openapi_object, "unit_system") ?
        _decode(
            Union{Absent, Nothing, UnitSystem},
            _openapi_object["unit_system"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_units =
        haskey(_openapi_object, "units") ?
        _decode(
            Union{Absent, Nothing, String},
            _openapi_object["units"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_uri = _decode(
        String,
        _required(_openapi_object, "uri", "NonSequentialTimeSeries"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "application_data",
            "array_shape",
            "association_id",
            "component_field",
            "data_hash",
            "element_shape",
            "element_type",
            "features",
            "length",
            "name",
            "owner_category",
            "owner_id",
            "owner_type",
            "quantity_kind",
            "time_reference",
            "time_series_type",
            "timestamps_uri",
            "unit_system",
            "units",
            "uri",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return NonSequentialTimeSeries(;
        application_data=_openapi_field_application_data,
        array_shape=_openapi_field_array_shape,
        association_id=_openapi_field_association_id,
        component_field=_openapi_field_component_field,
        data_hash=_openapi_field_data_hash,
        element_shape=_openapi_field_element_shape,
        element_type=_openapi_field_element_type,
        features=_openapi_field_features,
        length=_openapi_field_length,
        name=_openapi_field_name,
        owner_category=_openapi_field_owner_category,
        owner_id=_openapi_field_owner_id,
        owner_type=_openapi_field_owner_type,
        quantity_kind=_openapi_field_quantity_kind,
        time_reference=_openapi_field_time_reference,
        time_series_type=_openapi_field_time_series_type,
        timestamps_uri=_openapi_field_timestamps_uri,
        unit_system=_openapi_field_unit_system,
        units=_openapi_field_units,
        uri=_openapi_field_uri,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::NonSequentialTimeSeries)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.application_data isa Absent ||
        (_openapi_output["application_data"] = _encode(_openapi_value.application_data))
    _openapi_value.array_shape isa Absent ||
        (_openapi_output["array_shape"] = _encode(_openapi_value.array_shape))
    _openapi_value.association_id isa Absent ||
        (_openapi_output["association_id"] = _encode(_openapi_value.association_id))
    _openapi_value.component_field isa Absent ||
        (_openapi_output["component_field"] = _encode(_openapi_value.component_field))
    _openapi_value.data_hash isa Absent ||
        (_openapi_output["data_hash"] = _encode(_openapi_value.data_hash))
    _openapi_value.element_shape isa Absent ||
        (_openapi_output["element_shape"] = _encode(_openapi_value.element_shape))
    _openapi_value.element_type isa Absent ||
        (_openapi_output["element_type"] = _encode(_openapi_value.element_type))
    _openapi_value.features isa Absent ||
        (_openapi_output["features"] = _encode(_openapi_value.features))
    _openapi_value.length isa Absent ||
        (_openapi_output["length"] = _encode(_openapi_value.length))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.owner_category isa Absent ||
        (_openapi_output["owner_category"] = _encode(_openapi_value.owner_category))
    _openapi_value.owner_id isa Absent ||
        (_openapi_output["owner_id"] = _encode(_openapi_value.owner_id))
    _openapi_value.owner_type isa Absent ||
        (_openapi_output["owner_type"] = _encode(_openapi_value.owner_type))
    _openapi_value.quantity_kind isa Absent ||
        (_openapi_output["quantity_kind"] = _encode(_openapi_value.quantity_kind))
    _openapi_value.time_reference isa Absent ||
        (_openapi_output["time_reference"] = _encode(_openapi_value.time_reference))
    _openapi_value.time_series_type isa Absent ||
        (_openapi_output["time_series_type"] = _encode(_openapi_value.time_series_type))
    _openapi_value.timestamps_uri isa Absent ||
        (_openapi_output["timestamps_uri"] = _encode(_openapi_value.timestamps_uri))
    _openapi_value.unit_system isa Absent ||
        (_openapi_output["unit_system"] = _encode(_openapi_value.unit_system))
    _openapi_value.units isa Absent ||
        (_openapi_output["units"] = _encode(_openapi_value.units))
    _openapi_value.uri isa Absent || (_openapi_output["uri"] = _encode(_openapi_value.uri))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(
            ArgumentError(
                "additional property conflicts with declared field: " * _openapi_key,
            ),
        )
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-463dad90dca1b0053108.json",
            pointer="/components/schemas/NonSequentialTimeSeries",
        ),
        _openapi_output,
        "encoding NonSequentialTimeSeries";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::NonSequentialTimeSeries)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.application_data isa Absent ||
        push!(_openapi_output, "application_data" => _openapi_value.application_data)
    _openapi_value.array_shape isa Absent ||
        push!(_openapi_output, "array_shape" => _openapi_value.array_shape)
    _openapi_value.association_id isa Absent ||
        push!(_openapi_output, "association_id" => _openapi_value.association_id)
    _openapi_value.component_field isa Absent ||
        push!(_openapi_output, "component_field" => _openapi_value.component_field)
    _openapi_value.data_hash isa Absent ||
        push!(_openapi_output, "data_hash" => _openapi_value.data_hash)
    _openapi_value.element_shape isa Absent ||
        push!(_openapi_output, "element_shape" => _openapi_value.element_shape)
    _openapi_value.element_type isa Absent ||
        push!(_openapi_output, "element_type" => _openapi_value.element_type)
    _openapi_value.features isa Absent ||
        push!(_openapi_output, "features" => _openapi_value.features)
    _openapi_value.length isa Absent ||
        push!(_openapi_output, "length" => _openapi_value.length)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.owner_category isa Absent ||
        push!(_openapi_output, "owner_category" => _openapi_value.owner_category)
    _openapi_value.owner_id isa Absent ||
        push!(_openapi_output, "owner_id" => _openapi_value.owner_id)
    _openapi_value.owner_type isa Absent ||
        push!(_openapi_output, "owner_type" => _openapi_value.owner_type)
    _openapi_value.quantity_kind isa Absent ||
        push!(_openapi_output, "quantity_kind" => _openapi_value.quantity_kind)
    _openapi_value.time_reference isa Absent ||
        push!(_openapi_output, "time_reference" => _openapi_value.time_reference)
    _openapi_value.time_series_type isa Absent ||
        push!(_openapi_output, "time_series_type" => _openapi_value.time_series_type)
    _openapi_value.timestamps_uri isa Absent ||
        push!(_openapi_output, "timestamps_uri" => _openapi_value.timestamps_uri)
    _openapi_value.unit_system isa Absent ||
        push!(_openapi_output, "unit_system" => _openapi_value.unit_system)
    _openapi_value.units isa Absent ||
        push!(_openapi_output, "units" => _openapi_value.units)
    _openapi_value.uri isa Absent || push!(_openapi_output, "uri" => _openapi_value.uri)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
