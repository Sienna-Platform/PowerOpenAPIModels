"""
    SeriesCompensator

A series compensator on an `Arc`: a series capacitor or reactor, or a thyristor-controlled or static synchronous series compensator, with one series reactance. Devices that also inject at a bus, such as a UPFC, are not covered.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.
  - `active_power_flow`: Initial condition of active power flow through the compensator. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `reactive_power_flow`: Initial condition of reactive power flow through the compensator. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
  - `arc`: An `Arc` defining this line `from` a bus `to` another bus.
  - `r`: Resistance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu .
  - `x`: Series reactance; negative for a capacitor. Under `DISPATCHABLE` and `ACTIVE_POWER_FLOW`, the present value. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu .
  - `rating`: Thermal rating. Flow through the compensator must be between -`rating` and `rating`. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .
  - `control_mode`: How the series reactance is set. `FIXED` holds `x`; `BYPASSED` shorts the compensator into a zero-impedance tie; `DISPATCHABLE` makes the reactance a decision within `reactance_limits`; `ACTIVE_POWER_FLOW` sets it to hold `active_power_flow_setpoint`.
  - `reactance_limits`: Minimum and maximum series reactance. Required when `control_mode` is `DISPATCHABLE` or `ACTIVE_POWER_FLOW`. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu .
  - `active_power_flow_setpoint`: Active power flow, from the `from` bus to the `to` bus, the compensator holds. Required when `control_mode` is `ACTIVE_POWER_FLOW`. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `rating_b`: Second current rating. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .
  - `rating_c`: Third current rating. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .
  - `operational_flow_limit`: Operator-set minimum and maximum flow in each direction. Absent means no operational limit. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `base_power`: System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA.
  - `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.
  - `parameter_units`: Unit basis for r and x. COMPONENT_BASE is per-unit on this component's base_power, which records the system base.
"""
Base.@kwdef struct SeriesCompensator <: APIModel
    id::Int64
    name::String
    available::Bool
    active_power_flow::Float64
    reactive_power_flow::Float64
    arc::Int64
    r::Float64
    x::Float64
    rating::Float64
    control_mode::Union{Absent, Nothing, SeriesCompensatorControlMode} = ABSENT
    reactance_limits::Union{Absent, Nothing, MinMax} = ABSENT
    active_power_flow_setpoint::Union{Absent, Float64, Nothing} = ABSENT
    rating_b::Union{Absent, Float64, Nothing} = ABSENT
    rating_c::Union{Absent, Float64, Nothing} = ABSENT
    operational_flow_limit::Union{Absent, Nothing, OperationalFlowLimit} = ABSENT
    base_power::Float64
    power_units::UnitSystem
    parameter_units::Union{Absent, ImpedanceUnitBasis, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{SeriesCompensator}, value) = _decode(SeriesCompensator, value, true)
function _decode(::Type{SeriesCompensator}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-a11a39bc189f8f9a62dc.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding SeriesCompensator";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "SeriesCompensator")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "SeriesCompensator"), false)
    _openapi_field_name =
        _decode(String, _required(_openapi_object, "name", "SeriesCompensator"), false)
    _openapi_field_available =
        _decode(Bool, _required(_openapi_object, "available", "SeriesCompensator"), false)
    _openapi_field_active_power_flow = _decode(
        Float64,
        _required(_openapi_object, "active_power_flow", "SeriesCompensator"),
        false,
    )
    _openapi_field_reactive_power_flow = _decode(
        Float64,
        _required(_openapi_object, "reactive_power_flow", "SeriesCompensator"),
        false,
    )
    _openapi_field_arc =
        _decode(Int64, _required(_openapi_object, "arc", "SeriesCompensator"), false)
    _openapi_field_r =
        _decode(Float64, _required(_openapi_object, "r", "SeriesCompensator"), false)
    _openapi_field_x =
        _decode(Float64, _required(_openapi_object, "x", "SeriesCompensator"), false)
    _openapi_field_rating =
        _decode(Float64, _required(_openapi_object, "rating", "SeriesCompensator"), false)
    _openapi_field_control_mode =
        haskey(_openapi_object, "control_mode") ?
        _decode(
            Union{Absent, Nothing, SeriesCompensatorControlMode},
            _openapi_object["control_mode"],
            false,
        ) : ABSENT
    _openapi_field_reactance_limits =
        haskey(_openapi_object, "reactance_limits") ?
        _decode(
            Union{Absent, Nothing, MinMax},
            _openapi_object["reactance_limits"],
            false,
        ) : ABSENT
    _openapi_field_active_power_flow_setpoint =
        haskey(_openapi_object, "active_power_flow_setpoint") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["active_power_flow_setpoint"],
            false,
        ) : ABSENT
    _openapi_field_rating_b =
        haskey(_openapi_object, "rating_b") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["rating_b"], false) :
        ABSENT
    _openapi_field_rating_c =
        haskey(_openapi_object, "rating_c") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["rating_c"], false) :
        ABSENT
    _openapi_field_operational_flow_limit =
        haskey(_openapi_object, "operational_flow_limit") ?
        _decode(
            Union{Absent, Nothing, OperationalFlowLimit},
            _openapi_object["operational_flow_limit"],
            false,
        ) : ABSENT
    _openapi_field_base_power = _decode(
        Float64,
        _required(_openapi_object, "base_power", "SeriesCompensator"),
        false,
    )
    _openapi_field_power_units = _decode(
        UnitSystem,
        _required(_openapi_object, "power_units", "SeriesCompensator"),
        false,
    )
    _openapi_field_parameter_units =
        haskey(_openapi_object, "parameter_units") ?
        _decode(
            Union{Absent, ImpedanceUnitBasis, Nothing},
            _openapi_object["parameter_units"],
            false,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "available",
            "active_power_flow",
            "reactive_power_flow",
            "arc",
            "r",
            "x",
            "rating",
            "control_mode",
            "reactance_limits",
            "active_power_flow_setpoint",
            "rating_b",
            "rating_c",
            "operational_flow_limit",
            "base_power",
            "power_units",
            "parameter_units",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return SeriesCompensator(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        active_power_flow=_openapi_field_active_power_flow,
        reactive_power_flow=_openapi_field_reactive_power_flow,
        arc=_openapi_field_arc,
        r=_openapi_field_r,
        x=_openapi_field_x,
        rating=_openapi_field_rating,
        control_mode=_openapi_field_control_mode,
        reactance_limits=_openapi_field_reactance_limits,
        active_power_flow_setpoint=_openapi_field_active_power_flow_setpoint,
        rating_b=_openapi_field_rating_b,
        rating_c=_openapi_field_rating_c,
        operational_flow_limit=_openapi_field_operational_flow_limit,
        base_power=_openapi_field_base_power,
        power_units=_openapi_field_power_units,
        parameter_units=_openapi_field_parameter_units,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::SeriesCompensator)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode_unvalidated(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode_unvalidated(_openapi_value.available))
    _openapi_value.active_power_flow isa Absent || (
        _openapi_output["active_power_flow"] =
            _encode_unvalidated(_openapi_value.active_power_flow)
    )
    _openapi_value.reactive_power_flow isa Absent || (
        _openapi_output["reactive_power_flow"] =
            _encode_unvalidated(_openapi_value.reactive_power_flow)
    )
    _openapi_value.arc isa Absent ||
        (_openapi_output["arc"] = _encode_unvalidated(_openapi_value.arc))
    _openapi_value.r isa Absent ||
        (_openapi_output["r"] = _encode_unvalidated(_openapi_value.r))
    _openapi_value.x isa Absent ||
        (_openapi_output["x"] = _encode_unvalidated(_openapi_value.x))
    _openapi_value.rating isa Absent ||
        (_openapi_output["rating"] = _encode_unvalidated(_openapi_value.rating))
    _openapi_value.control_mode isa Absent ||
        (_openapi_output["control_mode"] = _encode_unvalidated(_openapi_value.control_mode))
    _openapi_value.reactance_limits isa Absent || (
        _openapi_output["reactance_limits"] =
            _encode_unvalidated(_openapi_value.reactance_limits)
    )
    _openapi_value.active_power_flow_setpoint isa Absent || (
        _openapi_output["active_power_flow_setpoint"] =
            _encode_unvalidated(_openapi_value.active_power_flow_setpoint)
    )
    _openapi_value.rating_b isa Absent ||
        (_openapi_output["rating_b"] = _encode_unvalidated(_openapi_value.rating_b))
    _openapi_value.rating_c isa Absent ||
        (_openapi_output["rating_c"] = _encode_unvalidated(_openapi_value.rating_c))
    _openapi_value.operational_flow_limit isa Absent || (
        _openapi_output["operational_flow_limit"] =
            _encode_unvalidated(_openapi_value.operational_flow_limit)
    )
    _openapi_value.base_power isa Absent ||
        (_openapi_output["base_power"] = _encode_unvalidated(_openapi_value.base_power))
    _openapi_value.power_units isa Absent ||
        (_openapi_output["power_units"] = _encode_unvalidated(_openapi_value.power_units))
    _openapi_value.parameter_units isa Absent || (
        _openapi_output["parameter_units"] =
            _encode_unvalidated(_openapi_value.parameter_units)
    )
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(
            ArgumentError(
                "additional property conflicts with declared field: " * _openapi_key,
            ),
        )
        _openapi_output[_openapi_key] = _encode_unvalidated(_openapi_item)
    end
    return _openapi_output
end
_encode(_openapi_value::SeriesCompensator) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-a11a39bc189f8f9a62dc.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding SeriesCompensator";
    direction=:neutral,
)

function _form_fields(_openapi_value::SeriesCompensator)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.active_power_flow isa Absent ||
        push!(_openapi_output, "active_power_flow" => _openapi_value.active_power_flow)
    _openapi_value.reactive_power_flow isa Absent ||
        push!(_openapi_output, "reactive_power_flow" => _openapi_value.reactive_power_flow)
    _openapi_value.arc isa Absent || push!(_openapi_output, "arc" => _openapi_value.arc)
    _openapi_value.r isa Absent || push!(_openapi_output, "r" => _openapi_value.r)
    _openapi_value.x isa Absent || push!(_openapi_output, "x" => _openapi_value.x)
    _openapi_value.rating isa Absent ||
        push!(_openapi_output, "rating" => _openapi_value.rating)
    _openapi_value.control_mode isa Absent ||
        push!(_openapi_output, "control_mode" => _openapi_value.control_mode)
    _openapi_value.reactance_limits isa Absent ||
        push!(_openapi_output, "reactance_limits" => _openapi_value.reactance_limits)
    _openapi_value.active_power_flow_setpoint isa Absent || push!(
        _openapi_output,
        "active_power_flow_setpoint" => _openapi_value.active_power_flow_setpoint,
    )
    _openapi_value.rating_b isa Absent ||
        push!(_openapi_output, "rating_b" => _openapi_value.rating_b)
    _openapi_value.rating_c isa Absent ||
        push!(_openapi_output, "rating_c" => _openapi_value.rating_c)
    _openapi_value.operational_flow_limit isa Absent || push!(
        _openapi_output,
        "operational_flow_limit" => _openapi_value.operational_flow_limit,
    )
    _openapi_value.base_power isa Absent ||
        push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.power_units isa Absent ||
        push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.parameter_units isa Absent ||
        push!(_openapi_output, "parameter_units" => _openapi_value.parameter_units)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
