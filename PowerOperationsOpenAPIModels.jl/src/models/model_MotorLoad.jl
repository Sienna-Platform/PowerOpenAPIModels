"""
    MotorLoad

An induction-motor static load, representing the steady-state power draw of motor-driven demand.

This load models the aggregate real and reactive power consumed by induction motors, along with the motor technology parameters that characterize their electrical behavior. For a simple constant-power load with no motor characteristics, see `PowerLoad`. For voltage-dependent ZIP loads used in dynamics modeling, see `StandardLoad`.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the component. Components of the same type (e.g., `MotorLoad`) must have unique names, but components of different types (e.g., `MotorLoad` and `ACBus`) can have the same name.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.
  - `bus`: ID of the bus that this component is connected to.
  - `active_power`: Initial steady-state active power demand. A positive value indicates power consumption. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `reactive_power`: Initial steady-state reactive power demand. A positive value indicates reactive power consumption. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
  - `base_power`: Base power of the unit for per unitization. Units: MVA.
  - `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.
  - `rating`: Maximum AC side output power rating of the unit. Not to be confused with base_power. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .
  - `max_active_power`: Maximum active power that this load can demand. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `reactive_power_limits`: Minimum and maximum reactive power limits. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
  - `motor_technology`: AC Motor type.
  - `dynamic_injector`: ID of the corresponding dynamic injection device, if any.
"""
Base.@kwdef struct MotorLoad <: APIModel
    id::Int64
    name::String
    available::Bool
    bus::Int64
    active_power::Float64
    reactive_power::Float64
    base_power::Float64
    power_units::UnitSystem
    rating::Float64
    max_active_power::Float64
    reactive_power_limits::Union{Absent, MinMax, Nothing} = ABSENT
    motor_technology::Union{Absent, MotorLoadMotorTechnology, Nothing} = ABSENT
    dynamic_injector::Union{Absent, Union{Int64, Nothing}} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{MotorLoad}, value) = _decode(MotorLoad, value, true)
function _decode(::Type{MotorLoad}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-029c10e4acb30156e5de.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding MotorLoad";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "MotorLoad")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "MotorLoad"), _openapi_validate)
    _openapi_field_name =
        _decode(String, _required(_openapi_object, "name", "MotorLoad"), _openapi_validate)
    _openapi_field_available = _decode(
        Bool,
        _required(_openapi_object, "available", "MotorLoad"),
        _openapi_validate,
    )
    _openapi_field_bus =
        _decode(Int64, _required(_openapi_object, "bus", "MotorLoad"), _openapi_validate)
    _openapi_field_active_power = _decode(
        Float64,
        _required(_openapi_object, "active_power", "MotorLoad"),
        _openapi_validate,
    )
    _openapi_field_reactive_power = _decode(
        Float64,
        _required(_openapi_object, "reactive_power", "MotorLoad"),
        _openapi_validate,
    )
    _openapi_field_base_power = _decode(
        Float64,
        _required(_openapi_object, "base_power", "MotorLoad"),
        _openapi_validate,
    )
    _openapi_field_power_units = _decode(
        UnitSystem,
        _required(_openapi_object, "power_units", "MotorLoad"),
        _openapi_validate,
    )
    _openapi_field_rating = _decode(
        Float64,
        _required(_openapi_object, "rating", "MotorLoad"),
        _openapi_validate,
    )
    _openapi_field_max_active_power = _decode(
        Float64,
        _required(_openapi_object, "max_active_power", "MotorLoad"),
        _openapi_validate,
    )
    _openapi_field_reactive_power_limits =
        haskey(_openapi_object, "reactive_power_limits") ?
        _decode(
            Union{Absent, MinMax, Nothing},
            _openapi_object["reactive_power_limits"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_motor_technology =
        haskey(_openapi_object, "motor_technology") ?
        _decode(
            Union{Absent, MotorLoadMotorTechnology, Nothing},
            _openapi_object["motor_technology"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_dynamic_injector =
        haskey(_openapi_object, "dynamic_injector") ?
        _decode(
            Union{Absent, Union{Int64, Nothing}},
            _openapi_object["dynamic_injector"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "available",
            "bus",
            "active_power",
            "reactive_power",
            "base_power",
            "power_units",
            "rating",
            "max_active_power",
            "reactive_power_limits",
            "motor_technology",
            "dynamic_injector",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return MotorLoad(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        bus=_openapi_field_bus,
        active_power=_openapi_field_active_power,
        reactive_power=_openapi_field_reactive_power,
        base_power=_openapi_field_base_power,
        power_units=_openapi_field_power_units,
        rating=_openapi_field_rating,
        max_active_power=_openapi_field_max_active_power,
        reactive_power_limits=_openapi_field_reactive_power_limits,
        motor_technology=_openapi_field_motor_technology,
        dynamic_injector=_openapi_field_dynamic_injector,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::MotorLoad)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.bus isa Absent || (_openapi_output["bus"] = _encode(_openapi_value.bus))
    _openapi_value.active_power isa Absent ||
        (_openapi_output["active_power"] = _encode(_openapi_value.active_power))
    _openapi_value.reactive_power isa Absent ||
        (_openapi_output["reactive_power"] = _encode(_openapi_value.reactive_power))
    _openapi_value.base_power isa Absent ||
        (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
    _openapi_value.power_units isa Absent ||
        (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
    _openapi_value.rating isa Absent ||
        (_openapi_output["rating"] = _encode(_openapi_value.rating))
    _openapi_value.max_active_power isa Absent ||
        (_openapi_output["max_active_power"] = _encode(_openapi_value.max_active_power))
    _openapi_value.reactive_power_limits isa Absent || (
        _openapi_output["reactive_power_limits"] =
            _encode(_openapi_value.reactive_power_limits)
    )
    _openapi_value.motor_technology isa Absent ||
        (_openapi_output["motor_technology"] = _encode(_openapi_value.motor_technology))
    _openapi_value.dynamic_injector isa Absent ||
        (_openapi_output["dynamic_injector"] = _encode(_openapi_value.dynamic_injector))
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
            resource="https://openapi.invalid/schema/external-029c10e4acb30156e5de.json",
            pointer="",
        ),
        _openapi_output,
        "encoding MotorLoad";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::MotorLoad)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.bus isa Absent || push!(_openapi_output, "bus" => _openapi_value.bus)
    _openapi_value.active_power isa Absent ||
        push!(_openapi_output, "active_power" => _openapi_value.active_power)
    _openapi_value.reactive_power isa Absent ||
        push!(_openapi_output, "reactive_power" => _openapi_value.reactive_power)
    _openapi_value.base_power isa Absent ||
        push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.power_units isa Absent ||
        push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.rating isa Absent ||
        push!(_openapi_output, "rating" => _openapi_value.rating)
    _openapi_value.max_active_power isa Absent ||
        push!(_openapi_output, "max_active_power" => _openapi_value.max_active_power)
    _openapi_value.reactive_power_limits isa Absent || push!(
        _openapi_output,
        "reactive_power_limits" => _openapi_value.reactive_power_limits,
    )
    _openapi_value.motor_technology isa Absent ||
        push!(_openapi_output, "motor_technology" => _openapi_value.motor_technology)
    _openapi_value.dynamic_injector isa Absent ||
        push!(_openapi_output, "dynamic_injector" => _openapi_value.dynamic_injector)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
