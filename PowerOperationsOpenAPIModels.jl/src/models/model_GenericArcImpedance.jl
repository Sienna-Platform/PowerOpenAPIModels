"""
    GenericArcImpedance

A generic branch defined by a series impedance on an `Arc` between two buses.

  - `id`: Unique integer identifier for this component.
  - `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.
  - `active_power_flow`: Initial condition of active power flow on the line. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `reactive_power_flow`: Initial condition of reactive power flow on the line. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
  - `max_flow`: Maximum allowable flow on the generic impedance. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .
  - `arc`: An `Arc` defining this line `from` a bus `to` another bus.
  - `base_power`: System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA.
  - `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.
  - `parameter_units`: Unit basis for r and x. COMPONENT_BASE is per-unit on this component's base_power, which records the system base.
  - `r`: Resistance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu .
  - `x`: Reactance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu .
"""
Base.@kwdef struct GenericArcImpedance <: APIModel
    id::Int64
    name::String
    available::Bool
    active_power_flow::Float64
    reactive_power_flow::Float64
    max_flow::Float64
    arc::Int64
    base_power::Float64
    power_units::UnitSystem
    parameter_units::Union{Absent, ImpedanceUnitBasis, Nothing} = ABSENT
    r::Float64
    x::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{GenericArcImpedance}, value) = _decode(GenericArcImpedance, value, true)
function _decode(::Type{GenericArcImpedance}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-ba70bf8471cae8da9de1.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding GenericArcImpedance";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "GenericArcImpedance")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "GenericArcImpedance"), false)
    _openapi_field_name =
        _decode(String, _required(_openapi_object, "name", "GenericArcImpedance"), false)
    _openapi_field_available =
        _decode(Bool, _required(_openapi_object, "available", "GenericArcImpedance"), false)
    _openapi_field_active_power_flow = _decode(
        Float64,
        _required(_openapi_object, "active_power_flow", "GenericArcImpedance"),
        false,
    )
    _openapi_field_reactive_power_flow = _decode(
        Float64,
        _required(_openapi_object, "reactive_power_flow", "GenericArcImpedance"),
        false,
    )
    _openapi_field_max_flow = _decode(
        Float64,
        _required(_openapi_object, "max_flow", "GenericArcImpedance"),
        false,
    )
    _openapi_field_arc =
        _decode(Int64, _required(_openapi_object, "arc", "GenericArcImpedance"), false)
    _openapi_field_base_power = _decode(
        Float64,
        _required(_openapi_object, "base_power", "GenericArcImpedance"),
        false,
    )
    _openapi_field_power_units = _decode(
        UnitSystem,
        _required(_openapi_object, "power_units", "GenericArcImpedance"),
        false,
    )
    _openapi_field_parameter_units =
        haskey(_openapi_object, "parameter_units") ?
        _decode(
            Union{Absent, ImpedanceUnitBasis, Nothing},
            _openapi_object["parameter_units"],
            false,
        ) : ABSENT
    _openapi_field_r =
        _decode(Float64, _required(_openapi_object, "r", "GenericArcImpedance"), false)
    _openapi_field_x =
        _decode(Float64, _required(_openapi_object, "x", "GenericArcImpedance"), false)
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "available",
            "active_power_flow",
            "reactive_power_flow",
            "max_flow",
            "arc",
            "base_power",
            "power_units",
            "parameter_units",
            "r",
            "x",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return GenericArcImpedance(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        active_power_flow=_openapi_field_active_power_flow,
        reactive_power_flow=_openapi_field_reactive_power_flow,
        max_flow=_openapi_field_max_flow,
        arc=_openapi_field_arc,
        base_power=_openapi_field_base_power,
        power_units=_openapi_field_power_units,
        parameter_units=_openapi_field_parameter_units,
        r=_openapi_field_r,
        x=_openapi_field_x,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::GenericArcImpedance)
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
    _openapi_value.max_flow isa Absent ||
        (_openapi_output["max_flow"] = _encode_unvalidated(_openapi_value.max_flow))
    _openapi_value.arc isa Absent ||
        (_openapi_output["arc"] = _encode_unvalidated(_openapi_value.arc))
    _openapi_value.base_power isa Absent ||
        (_openapi_output["base_power"] = _encode_unvalidated(_openapi_value.base_power))
    _openapi_value.power_units isa Absent ||
        (_openapi_output["power_units"] = _encode_unvalidated(_openapi_value.power_units))
    _openapi_value.parameter_units isa Absent || (
        _openapi_output["parameter_units"] =
            _encode_unvalidated(_openapi_value.parameter_units)
    )
    _openapi_value.r isa Absent ||
        (_openapi_output["r"] = _encode_unvalidated(_openapi_value.r))
    _openapi_value.x isa Absent ||
        (_openapi_output["x"] = _encode_unvalidated(_openapi_value.x))
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
_encode(_openapi_value::GenericArcImpedance) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-ba70bf8471cae8da9de1.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding GenericArcImpedance";
    direction=:neutral,
)

function _form_fields(_openapi_value::GenericArcImpedance)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.active_power_flow isa Absent ||
        push!(_openapi_output, "active_power_flow" => _openapi_value.active_power_flow)
    _openapi_value.reactive_power_flow isa Absent ||
        push!(_openapi_output, "reactive_power_flow" => _openapi_value.reactive_power_flow)
    _openapi_value.max_flow isa Absent ||
        push!(_openapi_output, "max_flow" => _openapi_value.max_flow)
    _openapi_value.arc isa Absent || push!(_openapi_output, "arc" => _openapi_value.arc)
    _openapi_value.base_power isa Absent ||
        push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.power_units isa Absent ||
        push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.parameter_units isa Absent ||
        push!(_openapi_output, "parameter_units" => _openapi_value.parameter_units)
    _openapi_value.r isa Absent || push!(_openapi_output, "r" => _openapi_value.r)
    _openapi_value.x isa Absent || push!(_openapi_output, "x" => _openapi_value.x)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
