"""
    FACTSControlDevice

Facts control devices.

Most often used in AC power flow studies as a control of voltage and, active and reactive power.

  - `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.
  - `id`: Unique integer identifier for this component.
  - `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.
  - `bus`: Sending end bus number.
  - `control_mode`: Control mode. Used to describe the behavior of the control device.
  - `voltage_setpoint_units`: Unit basis for voltage_setpoint. COMPONENT_BASE (pu on the bus base voltage) is PSS/E RAW native (VSET).
  - `voltage_setpoint`: Voltage setpoint at the sending end bus in kV, it has to be a `PV` bus. Units: kV. Units: per voltage_setpoint_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu .
  - `max_shunt_current`: Maximum shunt current at the sending end bus; entered at unity voltage. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .
  - `reactive_power_required`: Total reactive power required to hold voltage at sending bus, as a fraction in the range 0-1. Units: 1.
  - `max_reactive_power`: Independent maximum reactive power ceiling; the device reactive limit is min(the current/susceptance law on max_shunt_current, this value). Non-binding at the 9999.0 default. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .
  - `shunt_control_type`: Device class selecting the reactive-limit law (SVC vs STATCOM).
  - `regulated_bus_number`: Bus whose voltage this device regulates; 0 means local (sending) bus (PSS/E FCREG). Units: 1.
  - `base_power`: System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA.
  - `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.
  - `dynamic_injector`: ID of the corresponding dynamic injection model for FACTS control device, if any.
"""
Base.@kwdef struct FACTSControlDevice <: APIModel
    name::String
    id::Int64
    available::Bool
    bus::Int64
    control_mode::Union{Absent, FACTSControlDeviceControlMode, Nothing} = ABSENT
    voltage_setpoint_units::Union{Absent, Nothing, VoltageUnitBasis} = ABSENT
    voltage_setpoint::Float64
    max_shunt_current::Float64
    reactive_power_required::Float64
    max_reactive_power::Union{Absent, Float64, Nothing} = ABSENT
    shunt_control_type::Union{Absent, FACTSControlDeviceShuntControlType, Nothing} = ABSENT
    regulated_bus_number::Union{Absent, Int64, Nothing} = ABSENT
    base_power::Float64
    power_units::UnitSystem
    dynamic_injector::Union{Absent, Union{Int64, Nothing}} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{FACTSControlDevice}, value) = _decode(FACTSControlDevice, value, true)
function _decode(::Type{FACTSControlDevice}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-865b3a15cab0f0d4981c.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding FACTSControlDevice";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "FACTSControlDevice")
    _openapi_field_name =
        _decode(String, _required(_openapi_object, "name", "FACTSControlDevice"), false)
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "FACTSControlDevice"), false)
    _openapi_field_available =
        _decode(Bool, _required(_openapi_object, "available", "FACTSControlDevice"), false)
    _openapi_field_bus =
        _decode(Int64, _required(_openapi_object, "bus", "FACTSControlDevice"), false)
    _openapi_field_control_mode =
        haskey(_openapi_object, "control_mode") ?
        _decode(
            Union{Absent, FACTSControlDeviceControlMode, Nothing},
            _openapi_object["control_mode"],
            false,
        ) : ABSENT
    _openapi_field_voltage_setpoint_units =
        haskey(_openapi_object, "voltage_setpoint_units") ?
        _decode(
            Union{Absent, Nothing, VoltageUnitBasis},
            _openapi_object["voltage_setpoint_units"],
            false,
        ) : ABSENT
    _openapi_field_voltage_setpoint = _decode(
        Float64,
        _required(_openapi_object, "voltage_setpoint", "FACTSControlDevice"),
        false,
    )
    _openapi_field_max_shunt_current = _decode(
        Float64,
        _required(_openapi_object, "max_shunt_current", "FACTSControlDevice"),
        false,
    )
    _openapi_field_reactive_power_required = _decode(
        Float64,
        _required(_openapi_object, "reactive_power_required", "FACTSControlDevice"),
        false,
    )
    _openapi_field_max_reactive_power =
        haskey(_openapi_object, "max_reactive_power") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["max_reactive_power"],
            false,
        ) : ABSENT
    _openapi_field_shunt_control_type =
        haskey(_openapi_object, "shunt_control_type") ?
        _decode(
            Union{Absent, FACTSControlDeviceShuntControlType, Nothing},
            _openapi_object["shunt_control_type"],
            false,
        ) : ABSENT
    _openapi_field_regulated_bus_number =
        haskey(_openapi_object, "regulated_bus_number") ?
        _decode(
            Union{Absent, Int64, Nothing},
            _openapi_object["regulated_bus_number"],
            false,
        ) : ABSENT
    _openapi_field_base_power = _decode(
        Float64,
        _required(_openapi_object, "base_power", "FACTSControlDevice"),
        false,
    )
    _openapi_field_power_units = _decode(
        UnitSystem,
        _required(_openapi_object, "power_units", "FACTSControlDevice"),
        false,
    )
    _openapi_field_dynamic_injector =
        haskey(_openapi_object, "dynamic_injector") ?
        _decode(
            Union{Absent, Union{Int64, Nothing}},
            _openapi_object["dynamic_injector"],
            false,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "name",
            "id",
            "available",
            "bus",
            "control_mode",
            "voltage_setpoint_units",
            "voltage_setpoint",
            "max_shunt_current",
            "reactive_power_required",
            "max_reactive_power",
            "shunt_control_type",
            "regulated_bus_number",
            "base_power",
            "power_units",
            "dynamic_injector",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return FACTSControlDevice(;
        name=_openapi_field_name,
        id=_openapi_field_id,
        available=_openapi_field_available,
        bus=_openapi_field_bus,
        control_mode=_openapi_field_control_mode,
        voltage_setpoint_units=_openapi_field_voltage_setpoint_units,
        voltage_setpoint=_openapi_field_voltage_setpoint,
        max_shunt_current=_openapi_field_max_shunt_current,
        reactive_power_required=_openapi_field_reactive_power_required,
        max_reactive_power=_openapi_field_max_reactive_power,
        shunt_control_type=_openapi_field_shunt_control_type,
        regulated_bus_number=_openapi_field_regulated_bus_number,
        base_power=_openapi_field_base_power,
        power_units=_openapi_field_power_units,
        dynamic_injector=_openapi_field_dynamic_injector,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::FACTSControlDevice)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.name isa Absent ||
        (_openapi_output["name"] = _encode_unvalidated(_openapi_value.name))
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.available isa Absent ||
        (_openapi_output["available"] = _encode_unvalidated(_openapi_value.available))
    _openapi_value.bus isa Absent ||
        (_openapi_output["bus"] = _encode_unvalidated(_openapi_value.bus))
    _openapi_value.control_mode isa Absent ||
        (_openapi_output["control_mode"] = _encode_unvalidated(_openapi_value.control_mode))
    _openapi_value.voltage_setpoint_units isa Absent || (
        _openapi_output["voltage_setpoint_units"] =
            _encode_unvalidated(_openapi_value.voltage_setpoint_units)
    )
    _openapi_value.voltage_setpoint isa Absent || (
        _openapi_output["voltage_setpoint"] =
            _encode_unvalidated(_openapi_value.voltage_setpoint)
    )
    _openapi_value.max_shunt_current isa Absent || (
        _openapi_output["max_shunt_current"] =
            _encode_unvalidated(_openapi_value.max_shunt_current)
    )
    _openapi_value.reactive_power_required isa Absent || (
        _openapi_output["reactive_power_required"] =
            _encode_unvalidated(_openapi_value.reactive_power_required)
    )
    _openapi_value.max_reactive_power isa Absent || (
        _openapi_output["max_reactive_power"] =
            _encode_unvalidated(_openapi_value.max_reactive_power)
    )
    _openapi_value.shunt_control_type isa Absent || (
        _openapi_output["shunt_control_type"] =
            _encode_unvalidated(_openapi_value.shunt_control_type)
    )
    _openapi_value.regulated_bus_number isa Absent || (
        _openapi_output["regulated_bus_number"] =
            _encode_unvalidated(_openapi_value.regulated_bus_number)
    )
    _openapi_value.base_power isa Absent ||
        (_openapi_output["base_power"] = _encode_unvalidated(_openapi_value.base_power))
    _openapi_value.power_units isa Absent ||
        (_openapi_output["power_units"] = _encode_unvalidated(_openapi_value.power_units))
    _openapi_value.dynamic_injector isa Absent || (
        _openapi_output["dynamic_injector"] =
            _encode_unvalidated(_openapi_value.dynamic_injector)
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
_encode(_openapi_value::FACTSControlDevice) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-865b3a15cab0f0d4981c.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding FACTSControlDevice";
    direction=:neutral,
)

function _form_fields(_openapi_value::FACTSControlDevice)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.available isa Absent ||
        push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.bus isa Absent || push!(_openapi_output, "bus" => _openapi_value.bus)
    _openapi_value.control_mode isa Absent ||
        push!(_openapi_output, "control_mode" => _openapi_value.control_mode)
    _openapi_value.voltage_setpoint_units isa Absent || push!(
        _openapi_output,
        "voltage_setpoint_units" => _openapi_value.voltage_setpoint_units,
    )
    _openapi_value.voltage_setpoint isa Absent ||
        push!(_openapi_output, "voltage_setpoint" => _openapi_value.voltage_setpoint)
    _openapi_value.max_shunt_current isa Absent ||
        push!(_openapi_output, "max_shunt_current" => _openapi_value.max_shunt_current)
    _openapi_value.reactive_power_required isa Absent || push!(
        _openapi_output,
        "reactive_power_required" => _openapi_value.reactive_power_required,
    )
    _openapi_value.max_reactive_power isa Absent ||
        push!(_openapi_output, "max_reactive_power" => _openapi_value.max_reactive_power)
    _openapi_value.shunt_control_type isa Absent ||
        push!(_openapi_output, "shunt_control_type" => _openapi_value.shunt_control_type)
    _openapi_value.regulated_bus_number isa Absent || push!(
        _openapi_output,
        "regulated_bus_number" => _openapi_value.regulated_bus_number,
    )
    _openapi_value.base_power isa Absent ||
        push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.power_units isa Absent ||
        push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.dynamic_injector isa Absent ||
        push!(_openapi_output, "dynamic_injector" => _openapi_value.dynamic_injector)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
