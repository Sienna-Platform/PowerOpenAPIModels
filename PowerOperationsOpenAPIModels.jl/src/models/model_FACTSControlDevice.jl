@doc "    FACTSControlDevice\n\nFacts control devices.\n\nMost often used in AC power flow studies as a control of voltage and, active and reactive power.\n\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.\n- `base_power`: System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA.\n- `bus`: Sending end bus number.\n- `control_mode`: Control mode. Used to describe the behavior of the control device. in psy5 a required param with an option to be nothing\n- `dynamic_injector`: ID of the corresponding dynamic injection model for FACTS control device, if any.\n- `id`: Unique integer identifier for this component.\n- `max_reactive_power`: Independent maximum reactive power ceiling; the device reactive limit is min(the current/susceptance law on max_shunt_current, this value). Non-binding at the 9999.0 default. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .\n- `max_shunt_current`: Maximum shunt current at the sending end bus; entered at unity voltage. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .\n- `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.\n- `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.\n- `reactive_power_required`: Total reactive power required to hold voltage at sending bus, as a fraction in the range 0-1. Units: 1.\n- `regulated_bus_number`: Bus whose voltage this device regulates; 0 means local (sending) bus (PSS/E FCREG). Units: 1.\n- `shunt_control_type`: Device class selecting the reactive-limit law (SVC vs STATCOM).\n- `voltage_setpoint`: Voltage setpoint at the sending end bus in kV, it has to be a `PV` bus. Units: kV. Units: per voltage_setpoint_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu .\n- `voltage_setpoint_units`: Unit basis for voltage_setpoint. COMPONENT_BASE (pu on the bus base voltage) is PSS/E RAW native (VSET)."
Base.@kwdef struct FACTSControlDevice
    available::Bool
    base_power::Float64
    bus::Int64
    control_mode::Union{Absent,FACTSControlDeviceControlMode,Nothing} = ABSENT
    dynamic_injector::Union{Absent,Union{Int64,Nothing}} = ABSENT
    id::Int64
    max_reactive_power::Union{Absent,Float64,Nothing} = ABSENT
    max_shunt_current::Float64
    name::String
    power_units::FACTSControlDevicePowerUnits
    reactive_power_required::Float64
    regulated_bus_number::Union{Absent,Int64,Nothing} = ABSENT
    shunt_control_type::Union{Absent,FACTSControlDeviceShuntControlType,Nothing} = ABSENT
    voltage_setpoint::Float64
    voltage_setpoint_units::Union{Absent,FACTSControlDeviceVoltageSetpointUnits,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{FACTSControlDevice}, value) = _decode(FACTSControlDevice, value, true)
function _decode(::Type{FACTSControlDevice}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/FACTSControlDevice"), _openapi_raw, "decoding FACTSControlDevice"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "FACTSControlDevice")
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "FACTSControlDevice"), _openapi_validate)
    _openapi_field_base_power = _decode(Float64, _required(_openapi_object, "base_power", "FACTSControlDevice"), _openapi_validate)
    _openapi_field_bus = _decode(Int64, _required(_openapi_object, "bus", "FACTSControlDevice"), _openapi_validate)
    _openapi_field_control_mode = haskey(_openapi_object, "control_mode") ? _decode(Union{Absent,FACTSControlDeviceControlMode,Nothing}, _openapi_object["control_mode"], _openapi_validate) : ABSENT
    _openapi_field_dynamic_injector = haskey(_openapi_object, "dynamic_injector") ? _decode(Union{Absent,Union{Int64,Nothing}}, _openapi_object["dynamic_injector"], _openapi_validate) : ABSENT
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "FACTSControlDevice"), _openapi_validate)
    _openapi_field_max_reactive_power = haskey(_openapi_object, "max_reactive_power") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["max_reactive_power"], _openapi_validate) : ABSENT
    _openapi_field_max_shunt_current = _decode(Float64, _required(_openapi_object, "max_shunt_current", "FACTSControlDevice"), _openapi_validate)
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "FACTSControlDevice"), _openapi_validate)
    _openapi_field_power_units = _decode(FACTSControlDevicePowerUnits, _required(_openapi_object, "power_units", "FACTSControlDevice"), _openapi_validate)
    _openapi_field_reactive_power_required = _decode(Float64, _required(_openapi_object, "reactive_power_required", "FACTSControlDevice"), _openapi_validate)
    _openapi_field_regulated_bus_number = haskey(_openapi_object, "regulated_bus_number") ? _decode(Union{Absent,Int64,Nothing}, _openapi_object["regulated_bus_number"], _openapi_validate) : ABSENT
    _openapi_field_shunt_control_type = haskey(_openapi_object, "shunt_control_type") ? _decode(Union{Absent,FACTSControlDeviceShuntControlType,Nothing}, _openapi_object["shunt_control_type"], _openapi_validate) : ABSENT
    _openapi_field_voltage_setpoint = _decode(Float64, _required(_openapi_object, "voltage_setpoint", "FACTSControlDevice"), _openapi_validate)
    _openapi_field_voltage_setpoint_units = haskey(_openapi_object, "voltage_setpoint_units") ? _decode(Union{Absent,FACTSControlDeviceVoltageSetpointUnits,Nothing}, _openapi_object["voltage_setpoint_units"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("available","base_power","bus","control_mode","dynamic_injector","id","max_reactive_power","max_shunt_current","name","power_units","reactive_power_required","regulated_bus_number","shunt_control_type","voltage_setpoint","voltage_setpoint_units") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return FACTSControlDevice(; available = _openapi_field_available, base_power = _openapi_field_base_power, bus = _openapi_field_bus, control_mode = _openapi_field_control_mode, dynamic_injector = _openapi_field_dynamic_injector, id = _openapi_field_id, max_reactive_power = _openapi_field_max_reactive_power, max_shunt_current = _openapi_field_max_shunt_current, name = _openapi_field_name, power_units = _openapi_field_power_units, reactive_power_required = _openapi_field_reactive_power_required, regulated_bus_number = _openapi_field_regulated_bus_number, shunt_control_type = _openapi_field_shunt_control_type, voltage_setpoint = _openapi_field_voltage_setpoint, voltage_setpoint_units = _openapi_field_voltage_setpoint_units, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::FACTSControlDevice)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.base_power isa Absent || (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
    _openapi_value.bus isa Absent || (_openapi_output["bus"] = _encode(_openapi_value.bus))
    _openapi_value.control_mode isa Absent || (_openapi_output["control_mode"] = _encode(_openapi_value.control_mode))
    _openapi_value.dynamic_injector isa Absent || (_openapi_output["dynamic_injector"] = _encode(_openapi_value.dynamic_injector))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.max_reactive_power isa Absent || (_openapi_output["max_reactive_power"] = _encode(_openapi_value.max_reactive_power))
    _openapi_value.max_shunt_current isa Absent || (_openapi_output["max_shunt_current"] = _encode(_openapi_value.max_shunt_current))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.power_units isa Absent || (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
    _openapi_value.reactive_power_required isa Absent || (_openapi_output["reactive_power_required"] = _encode(_openapi_value.reactive_power_required))
    _openapi_value.regulated_bus_number isa Absent || (_openapi_output["regulated_bus_number"] = _encode(_openapi_value.regulated_bus_number))
    _openapi_value.shunt_control_type isa Absent || (_openapi_output["shunt_control_type"] = _encode(_openapi_value.shunt_control_type))
    _openapi_value.voltage_setpoint isa Absent || (_openapi_output["voltage_setpoint"] = _encode(_openapi_value.voltage_setpoint))
    _openapi_value.voltage_setpoint_units isa Absent || (_openapi_output["voltage_setpoint_units"] = _encode(_openapi_value.voltage_setpoint_units))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/FACTSControlDevice"), _openapi_output, "encoding FACTSControlDevice"; direction = :neutral)
end

function _form_fields(_openapi_value::FACTSControlDevice)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.base_power isa Absent || push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.bus isa Absent || push!(_openapi_output, "bus" => _openapi_value.bus)
    _openapi_value.control_mode isa Absent || push!(_openapi_output, "control_mode" => _openapi_value.control_mode)
    _openapi_value.dynamic_injector isa Absent || push!(_openapi_output, "dynamic_injector" => _openapi_value.dynamic_injector)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.max_reactive_power isa Absent || push!(_openapi_output, "max_reactive_power" => _openapi_value.max_reactive_power)
    _openapi_value.max_shunt_current isa Absent || push!(_openapi_output, "max_shunt_current" => _openapi_value.max_shunt_current)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.power_units isa Absent || push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.reactive_power_required isa Absent || push!(_openapi_output, "reactive_power_required" => _openapi_value.reactive_power_required)
    _openapi_value.regulated_bus_number isa Absent || push!(_openapi_output, "regulated_bus_number" => _openapi_value.regulated_bus_number)
    _openapi_value.shunt_control_type isa Absent || push!(_openapi_output, "shunt_control_type" => _openapi_value.shunt_control_type)
    _openapi_value.voltage_setpoint isa Absent || push!(_openapi_output, "voltage_setpoint" => _openapi_value.voltage_setpoint)
    _openapi_value.voltage_setpoint_units isa Absent || push!(_openapi_output, "voltage_setpoint_units" => _openapi_value.voltage_setpoint_units)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
