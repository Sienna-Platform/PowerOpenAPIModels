"""
    OnlineReserve

A reserve product provided by devices already synchronized with the system. The procurement requirement is static unless a `requirement` time series is attached, in which case `requirement` is the scaling factor. Attach an Operating Reserve Demand Curve through `variable` to price the requirement rather than enforce it; omit `variable` when the reserve has no demand curve.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.
  - `time_frame`: The saturation time frame to provide reserve contribution. Units: min.
  - `requirement`: The value of required reserves. Units: MW.
  - `variable`: Operating reserve demand curve, either static or time-series-backed. Time series values are carried via `time_series_associations` in the sidecar, never inline. Omit when the reserve has no demand curve.
  - `sustained_time`: The time reserve contribution must be sustained at a specified level. Units: min.
  - `max_output_fraction`: The maximum fraction of each device's output that can be assigned to the service.
  - `max_participation_factor`: The maximum portion [0, 1.0] of the reserve that can be contributed per device.
  - `deployed_fraction`: Fraction of service procurement that is assumed to be actually deployed. Most commonly, this is assumed to be either 0.0 or 1.0.
  - `reserve_direction`: Whether the reserve is an upward, downward, or symmetric reserve product.
"""
Base.@kwdef struct OnlineReserve <: APIModel
    id::Int64
    name::String
    available::Bool
    time_frame::Float64
    requirement::Union{Absent, Float64, Nothing} = ABSENT
    variable::Union{Absent, CostCurve, Nothing} = ABSENT
    sustained_time::Union{Absent, Float64, Nothing} = ABSENT
    max_output_fraction::Union{Absent, Float64, Nothing} = ABSENT
    max_participation_factor::Union{Absent, Float64, Nothing} = ABSENT
    deployed_fraction::Union{Absent, Float64, Nothing} = ABSENT
    reserve_direction::ReserveDirection
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{OnlineReserve}, value) = _decode(OnlineReserve, value, true)
function _decode(::Type{OnlineReserve}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-6458da5c582d70cf4979.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding OnlineReserve";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "OnlineReserve")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "OnlineReserve"), _openapi_validate)
    _openapi_field_name = _decode(
        String,
        _required(_openapi_object, "name", "OnlineReserve"),
        _openapi_validate,
    )
    _openapi_field_available = _decode(
        Bool,
        _required(_openapi_object, "available", "OnlineReserve"),
        _openapi_validate,
    )
    _openapi_field_time_frame = _decode(
        Float64,
        _required(_openapi_object, "time_frame", "OnlineReserve"),
        _openapi_validate,
    )
    _openapi_field_requirement =
        haskey(_openapi_object, "requirement") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["requirement"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_variable =
        haskey(_openapi_object, "variable") ?
        _decode(
            Union{Absent, CostCurve, Nothing},
            _openapi_object["variable"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_sustained_time =
        haskey(_openapi_object, "sustained_time") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["sustained_time"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_max_output_fraction =
        haskey(_openapi_object, "max_output_fraction") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["max_output_fraction"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_max_participation_factor =
        haskey(_openapi_object, "max_participation_factor") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["max_participation_factor"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_deployed_fraction =
        haskey(_openapi_object, "deployed_fraction") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["deployed_fraction"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_reserve_direction = _decode(
        ReserveDirection,
        _required(_openapi_object, "reserve_direction", "OnlineReserve"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "available",
            "time_frame",
            "requirement",
            "variable",
            "sustained_time",
            "max_output_fraction",
            "max_participation_factor",
            "deployed_fraction",
            "reserve_direction",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return OnlineReserve(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        time_frame=_openapi_field_time_frame,
        requirement=_openapi_field_requirement,
        variable=_openapi_field_variable,
        sustained_time=_openapi_field_sustained_time,
        max_output_fraction=_openapi_field_max_output_fraction,
        max_participation_factor=_openapi_field_max_participation_factor,
        deployed_fraction=_openapi_field_deployed_fraction,
        reserve_direction=_openapi_field_reserve_direction,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::OnlineReserve)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.time_frame isa Absent ||
        (_openapi_output["time_frame"] = _encode(_openapi_value.time_frame))
    _openapi_value.requirement isa Absent ||
        (_openapi_output["requirement"] = _encode(_openapi_value.requirement))
    _openapi_value.variable isa Absent ||
        (_openapi_output["variable"] = _encode(_openapi_value.variable))
    _openapi_value.sustained_time isa Absent ||
        (_openapi_output["sustained_time"] = _encode(_openapi_value.sustained_time))
    _openapi_value.max_output_fraction isa Absent || (
        _openapi_output["max_output_fraction"] =
            _encode(_openapi_value.max_output_fraction)
    )
    _openapi_value.max_participation_factor isa Absent || (
        _openapi_output["max_participation_factor"] =
            _encode(_openapi_value.max_participation_factor)
    )
    _openapi_value.deployed_fraction isa Absent ||
        (_openapi_output["deployed_fraction"] = _encode(_openapi_value.deployed_fraction))
    _openapi_value.reserve_direction isa Absent ||
        (_openapi_output["reserve_direction"] = _encode(_openapi_value.reserve_direction))
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
            resource="https://openapi.invalid/schema/external-6458da5c582d70cf4979.json",
            pointer="",
        ),
        _openapi_output,
        "encoding OnlineReserve";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::OnlineReserve)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.time_frame isa Absent ||
        push!(_openapi_output, "time_frame" => _openapi_value.time_frame)
    _openapi_value.requirement isa Absent ||
        push!(_openapi_output, "requirement" => _openapi_value.requirement)
    _openapi_value.variable isa Absent ||
        push!(_openapi_output, "variable" => _openapi_value.variable)
    _openapi_value.sustained_time isa Absent ||
        push!(_openapi_output, "sustained_time" => _openapi_value.sustained_time)
    _openapi_value.max_output_fraction isa Absent ||
        push!(_openapi_output, "max_output_fraction" => _openapi_value.max_output_fraction)
    _openapi_value.max_participation_factor isa Absent || push!(
        _openapi_output,
        "max_participation_factor" => _openapi_value.max_participation_factor,
    )
    _openapi_value.deployed_fraction isa Absent ||
        push!(_openapi_output, "deployed_fraction" => _openapi_value.deployed_fraction)
    _openapi_value.reserve_direction isa Absent ||
        push!(_openapi_output, "reserve_direction" => _openapi_value.reserve_direction)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
