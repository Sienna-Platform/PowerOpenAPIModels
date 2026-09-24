"""
    VoltageDroopControl

Supplemental attribute for a voltage droop controller (PSS/E voltage droop control): a set of generators jointly regulating the reactive power at one bus along a Q–V characteristic. While the controller is available its regulated bus overrides each member's own target and their voltage setpoints are ignored; while it is unavailable the members fall back to their own targets. Membership and each member's relative reactive power weight are VoltageControlAssociation rows. The characteristic holds `reactive_power_limits.max` below `voltage_limits.min`, ramps to `deadband_reactive_power` at `deadband_voltage_limits.min`, holds it through `deadband_voltage_limits.max`, ramps to `reactive_power_limits.min` at `voltage_limits.max`, and holds it above.

  - `id`: Unique integer identifier for this supplemental attribute.
  - `name`: Name of the voltage droop controller.
  - `available`: Whether the controller is in service (PSS/E STATUS). While false, members regulate their own targets.
  - `regulated_bus_id`: ID of the bus whose reactive power the controller regulates; overrides every member's own regulated bus while the controller is available.
  - `reactive_power_limits`: Reactive power held below `voltage_limits.min` (max, PSS/E QMAX) and above `voltage_limits.max` (min, PSS/E QMIN). Units: MVAr.
  - `deadband_reactive_power`: Reactive power held while the regulated bus voltage is inside `deadband_voltage_limits` (PSS/E QDB). Must lie strictly between `reactive_power_limits.min` and `reactive_power_limits.max`. Units: MVAr.
  - `voltage_units`: Unit basis for the voltage fields. COMPONENT_BASE (per-unit on the regulated bus base voltage) is PSS/E RAW native.
  - `deadband_voltage_limits`: Voltage band inside which the controller holds `deadband_reactive_power` (PSS/E VDBLOW, VDBHIGH). Must lie inside `voltage_limits`. Units: per voltage_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu .
  - `voltage_limits`: Voltages at which the characteristic reaches `reactive_power_limits.max` (min, PSS/E VLOW) and `reactive_power_limits.min` (max, PSS/E VHIGH). Units: per voltage_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu .
"""
Base.@kwdef struct VoltageDroopControl <: APIModel
    id::Int64
    name::String
    available::Union{Absent, Bool, Nothing} = ABSENT
    regulated_bus_id::Int64
    reactive_power_limits::MinMax
    deadband_reactive_power::Float64
    voltage_units::Union{Absent, Nothing, VoltageUnitBasis} = ABSENT
    deadband_voltage_limits::MinMax
    voltage_limits::MinMax
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{VoltageDroopControl}, value) = _decode(VoltageDroopControl, value, true)
function _decode(::Type{VoltageDroopControl}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-ccc65dc7c969526c2489.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding VoltageDroopControl";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "VoltageDroopControl")
    _openapi_field_id = _decode(
        Int64,
        _required(_openapi_object, "id", "VoltageDroopControl"),
        _openapi_validate,
    )
    _openapi_field_name = _decode(
        String,
        _required(_openapi_object, "name", "VoltageDroopControl"),
        _openapi_validate,
    )
    _openapi_field_available =
        haskey(_openapi_object, "available") ?
        _decode(
            Union{Absent, Bool, Nothing},
            _openapi_object["available"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_regulated_bus_id = _decode(
        Int64,
        _required(_openapi_object, "regulated_bus_id", "VoltageDroopControl"),
        _openapi_validate,
    )
    _openapi_field_reactive_power_limits = _decode(
        MinMax,
        _required(_openapi_object, "reactive_power_limits", "VoltageDroopControl"),
        _openapi_validate,
    )
    _openapi_field_deadband_reactive_power = _decode(
        Float64,
        _required(_openapi_object, "deadband_reactive_power", "VoltageDroopControl"),
        _openapi_validate,
    )
    _openapi_field_voltage_units =
        haskey(_openapi_object, "voltage_units") ?
        _decode(
            Union{Absent, Nothing, VoltageUnitBasis},
            _openapi_object["voltage_units"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_deadband_voltage_limits = _decode(
        MinMax,
        _required(_openapi_object, "deadband_voltage_limits", "VoltageDroopControl"),
        _openapi_validate,
    )
    _openapi_field_voltage_limits = _decode(
        MinMax,
        _required(_openapi_object, "voltage_limits", "VoltageDroopControl"),
        _openapi_validate,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "id",
            "name",
            "available",
            "regulated_bus_id",
            "reactive_power_limits",
            "deadband_reactive_power",
            "voltage_units",
            "deadband_voltage_limits",
            "voltage_limits",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return VoltageDroopControl(;
        id=_openapi_field_id,
        name=_openapi_field_name,
        available=_openapi_field_available,
        regulated_bus_id=_openapi_field_regulated_bus_id,
        reactive_power_limits=_openapi_field_reactive_power_limits,
        deadband_reactive_power=_openapi_field_deadband_reactive_power,
        voltage_units=_openapi_field_voltage_units,
        deadband_voltage_limits=_openapi_field_deadband_voltage_limits,
        voltage_limits=_openapi_field_voltage_limits,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::VoltageDroopControl)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.regulated_bus_id isa Absent ||
        (_openapi_output["regulated_bus_id"] = _encode(_openapi_value.regulated_bus_id))
    _openapi_value.reactive_power_limits isa Absent || (
        _openapi_output["reactive_power_limits"] =
            _encode(_openapi_value.reactive_power_limits)
    )
    _openapi_value.deadband_reactive_power isa Absent || (
        _openapi_output["deadband_reactive_power"] =
            _encode(_openapi_value.deadband_reactive_power)
    )
    _openapi_value.voltage_units isa Absent ||
        (_openapi_output["voltage_units"] = _encode(_openapi_value.voltage_units))
    _openapi_value.deadband_voltage_limits isa Absent || (
        _openapi_output["deadband_voltage_limits"] =
            _encode(_openapi_value.deadband_voltage_limits)
    )
    _openapi_value.voltage_limits isa Absent ||
        (_openapi_output["voltage_limits"] = _encode(_openapi_value.voltage_limits))
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
            resource="https://openapi.invalid/schema/external-ccc65dc7c969526c2489.json",
            pointer="",
        ),
        _openapi_output,
        "encoding VoltageDroopControl";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::VoltageDroopControl)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.regulated_bus_id isa Absent ||
        push!(_openapi_output, "regulated_bus_id" => _openapi_value.regulated_bus_id)
    _openapi_value.reactive_power_limits isa Absent || push!(
        _openapi_output,
        "reactive_power_limits" => _openapi_value.reactive_power_limits,
    )
    _openapi_value.deadband_reactive_power isa Absent || push!(
        _openapi_output,
        "deadband_reactive_power" => _openapi_value.deadband_reactive_power,
    )
    _openapi_value.voltage_units isa Absent ||
        push!(_openapi_output, "voltage_units" => _openapi_value.voltage_units)
    _openapi_value.deadband_voltage_limits isa Absent || push!(
        _openapi_output,
        "deadband_voltage_limits" => _openapi_value.deadband_voltage_limits,
    )
    _openapi_value.voltage_limits isa Absent ||
        push!(_openapi_output, "voltage_limits" => _openapi_value.voltage_limits)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
