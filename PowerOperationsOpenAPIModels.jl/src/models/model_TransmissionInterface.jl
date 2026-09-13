"""
    TransmissionInterface

A collection of transmission branches whose combined flow is monitored and constrained as an interface.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.
  - `active_power_flow_limits`: Minimum and maximum active power flow limits on the interface. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `violation_penalty`: Penalty cost for violating the flow limits in the interface.
  - `direction_mapping`: Dictionary of the line `name`s in the interface and their direction of flow (1 or -1) relative to the flow of the interface.
  - `base_power`: System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA.
  - `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.
"""
Base.@kwdef struct TransmissionInterface <: APIModel
    id::Int64
    name::String
    available::Bool
    active_power_flow_limits::MinMax
    violation_penalty::Union{Absent, Float64, Nothing} = ABSENT
    direction_mapping::Union{Absent, Nothing, TransmissionInterfaceDirectionMapping} =
        ABSENT
    base_power::Float64
    power_units::UnitSystem
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{TransmissionInterface}, value) = _decode(TransmissionInterface, value, true)
function _decode(::Type{TransmissionInterface}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-30c951f93e93cf03c552.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding TransmissionInterface";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "TransmissionInterface")
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "TransmissionInterface"),
        _openapi_validate,
    )
    _openapi_field_name = _decode(
        String,
        _required(_openapi_object, "name", "TransmissionInterface"),
        _openapi_validate,
    )
    _openapi_field_available = _decode(
        Bool,
        _required(_openapi_object, "available", "TransmissionInterface"),
        _openapi_validate,
    )
    _openapi_field_active_power_flow_limits = _decode(
        MinMax,
        _required(_openapi_object, "active_power_flow_limits", "TransmissionInterface"),
        _openapi_validate,
    )
    _openapi_field_violation_penalty =
        haskey(_openapi_object, "violation_penalty") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["violation_penalty"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_direction_mapping =
        haskey(_openapi_object, "direction_mapping") ?
        _decode(
            Union{Absent, Nothing, TransmissionInterfaceDirectionMapping},
            _openapi_object["direction_mapping"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_base_power = _decode(
        Float64,
        _required(_openapi_object, "base_power", "TransmissionInterface"),
        _openapi_validate,
    )
    _openapi_field_power_units = _decode(
        UnitSystem,
        _required(_openapi_object, "power_units", "TransmissionInterface"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "available",
            "active_power_flow_limits",
            "violation_penalty",
            "direction_mapping",
            "base_power",
            "power_units",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return TransmissionInterface(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        active_power_flow_limits=_openapi_field_active_power_flow_limits,
        violation_penalty=_openapi_field_violation_penalty,
        direction_mapping=_openapi_field_direction_mapping,
        base_power=_openapi_field_base_power,
        power_units=_openapi_field_power_units,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::TransmissionInterface)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.active_power_flow_limits isa Absent || (
        _openapi_output["active_power_flow_limits"] =
            _encode(_openapi_value.active_power_flow_limits)
    )
    _openapi_value.violation_penalty isa Absent ||
        (_openapi_output["violation_penalty"] = _encode(_openapi_value.violation_penalty))
    _openapi_value.direction_mapping isa Absent ||
        (_openapi_output["direction_mapping"] = _encode(_openapi_value.direction_mapping))
    _openapi_value.base_power isa Absent ||
        (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
    _openapi_value.power_units isa Absent ||
        (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
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
            resource="https://openapi.invalid/schema/external-30c951f93e93cf03c552.json",
            pointer="",
        ),
        _openapi_output,
        "encoding TransmissionInterface";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::TransmissionInterface)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.active_power_flow_limits isa Absent || push!(
        _openapi_output,
        "active_power_flow_limits" => _openapi_value.active_power_flow_limits,
    )
    _openapi_value.violation_penalty isa Absent ||
        push!(_openapi_output, "violation_penalty" => _openapi_value.violation_penalty)
    _openapi_value.direction_mapping isa Absent ||
        push!(_openapi_output, "direction_mapping" => _openapi_value.direction_mapping)
    _openapi_value.base_power isa Absent ||
        push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.power_units isa Absent ||
        push!(_openapi_output, "power_units" => _openapi_value.power_units)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
