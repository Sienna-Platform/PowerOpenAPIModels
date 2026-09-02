@doc "    InterconnectingConverter\n\nInterconnecting Power Converter (IPC) for transforming power from an ACBus to a DCBus.\n\n- `ac_control`: AC-side control mode of the converter.\n- `ac_setpoint`: AC-voltage magnitude target (when `ac_control` regulates AC voltage) or power factor setpoint (otherwise). Units: per ac_control — AC_REACTIVE_POWER: 1, AC_VOLTAGE: (per voltage_setpoint_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu) .\n- `active_power`: Active power on the DC side. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `active_power_limits`: Minimum and maximum stable active power levels. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.\n- `base_power`: Base power of the converter for per unitization. Units: MVA.\n- `bus`: ID of the bus on the AC side of this converter.\n- `dc_bus`: ID of the bus on the DC side of this converter.\n- `dc_control`: DC-side control mode of the converter.\n- `dc_current`: DC current on the converter. Units: A.\n- `dc_setpoint`: DC-voltage target (when `dc_control` regulates DC voltage) or active-power order (otherwise). Units: per dc_control — DC_POWER: MW, DC_VOLTAGE: (per voltage_setpoint_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu), DC_VOLTAGE_DROOP: (per voltage_setpoint_units — NATURAL_UNITS: kV, COMPONENT_BASE: pu) .\n- `dc_voltage_droop`: DC-voltage droop gain relating DC voltage to converter active power as `V_dc = dc_setpoint - dc_voltage_droop * P_c`. A value of 0.0 disables droop. Units: pu.\n- `dynamic_injector`: ID of the corresponding dynamic injection device, if any.\n- `id`: Unique integer identifier for this component.\n- `loss_function`: Linear or quadratic loss function with respect to the converter current.\n- `max_dc_current`: Maximum stable dc current limits. Units: A.\n- `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.\n- `power_factor_weighting_fraction`: Power weighting factor fraction used in reducing the active power order and either the reactive power order when the converter rating is violated. When is 0.0, only the active power is reduced; when is 1.0, only the reactive power is reduced; otherwise, a weighted reduction of both active and reactive power is applied. Units: 1.\n- `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.\n- `rating`: Maximum output power rating of the converter. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .\n- `reactive_power_limits`: Minimum and maximum reactive power limits. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .\n- `remote_bus_control`: Number of the AC bus whose voltage the converter regulates when `ac_control` is `AC_VOLTAGE`; null regulates its own terminal bus.\n- `rmpct`: Percent of the total Mvar required to hold the voltage at the bus regulated by this converter that is contributed by this converter. Units: 1.\n- `voltage_limits`: Limits on the voltage at the DC bus in per unit. Units: pu.\n- `voltage_setpoint_units`: Unit basis for the DC/AC voltage setpoints."
Base.@kwdef struct InterconnectingConverter
    ac_control::Union{Absent,InterconnectingConverterAcControl,Nothing} = ABSENT
    ac_setpoint::Union{Absent,Float64,Nothing} = ABSENT
    active_power::Float64
    active_power_limits::InterconnectingConverterActivePowerLimits
    available::Bool
    base_power::Float64
    bus::Int64
    dc_bus::Int64
    dc_control::Union{Absent,InterconnectingConverterDcControl,Nothing} = ABSENT
    dc_current::Union{Absent,Float64,Nothing} = ABSENT
    dc_setpoint::Union{Absent,Float64,Nothing} = ABSENT
    dc_voltage_droop::Union{Absent,Float64,Nothing} = ABSENT
    dynamic_injector::Union{Absent,Union{Int64,Nothing}} = ABSENT
    id::Int64
    loss_function::Union{Absent,InterconnectingConverterLossFunction,Nothing} = ABSENT
    max_dc_current::Union{Absent,Float64,Nothing} = ABSENT
    name::String
    power_factor_weighting_fraction::Union{Absent,Float64,Nothing} = ABSENT
    power_units::InterconnectingConverterPowerUnits
    rating::Float64
    reactive_power_limits::Union{Absent,InterconnectingConverterReactivePowerLimits,Nothing} = ABSENT
    remote_bus_control::Union{Absent,Union{Int64,Nothing}} = ABSENT
    rmpct::Union{Absent,Float64,Nothing} = ABSENT
    voltage_limits::Union{Absent,InterconnectingConverterVoltageLimits,Nothing} = ABSENT
    voltage_setpoint_units::Union{Absent,InterconnectingConverterVoltageSetpointUnits,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{InterconnectingConverter}, value) = _decode(InterconnectingConverter, value, true)
function _decode(::Type{InterconnectingConverter}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/InterconnectingConverter"), _openapi_raw, "decoding InterconnectingConverter"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "InterconnectingConverter")
    _openapi_field_ac_control = haskey(_openapi_object, "ac_control") ? _decode(Union{Absent,InterconnectingConverterAcControl,Nothing}, _openapi_object["ac_control"], _openapi_validate) : ABSENT
    _openapi_field_ac_setpoint = haskey(_openapi_object, "ac_setpoint") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["ac_setpoint"], _openapi_validate) : ABSENT
    _openapi_field_active_power = _decode(Float64, _required(_openapi_object, "active_power", "InterconnectingConverter"), _openapi_validate)
    _openapi_field_active_power_limits = _decode(InterconnectingConverterActivePowerLimits, _required(_openapi_object, "active_power_limits", "InterconnectingConverter"), _openapi_validate)
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "InterconnectingConverter"), _openapi_validate)
    _openapi_field_base_power = _decode(Float64, _required(_openapi_object, "base_power", "InterconnectingConverter"), _openapi_validate)
    _openapi_field_bus = _decode(Int64, _required(_openapi_object, "bus", "InterconnectingConverter"), _openapi_validate)
    _openapi_field_dc_bus = _decode(Int64, _required(_openapi_object, "dc_bus", "InterconnectingConverter"), _openapi_validate)
    _openapi_field_dc_control = haskey(_openapi_object, "dc_control") ? _decode(Union{Absent,InterconnectingConverterDcControl,Nothing}, _openapi_object["dc_control"], _openapi_validate) : ABSENT
    _openapi_field_dc_current = haskey(_openapi_object, "dc_current") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["dc_current"], _openapi_validate) : ABSENT
    _openapi_field_dc_setpoint = haskey(_openapi_object, "dc_setpoint") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["dc_setpoint"], _openapi_validate) : ABSENT
    _openapi_field_dc_voltage_droop = haskey(_openapi_object, "dc_voltage_droop") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["dc_voltage_droop"], _openapi_validate) : ABSENT
    _openapi_field_dynamic_injector = haskey(_openapi_object, "dynamic_injector") ? _decode(Union{Absent,Union{Int64,Nothing}}, _openapi_object["dynamic_injector"], _openapi_validate) : ABSENT
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "InterconnectingConverter"), _openapi_validate)
    _openapi_field_loss_function = haskey(_openapi_object, "loss_function") ? _decode(Union{Absent,InterconnectingConverterLossFunction,Nothing}, _openapi_object["loss_function"], _openapi_validate) : ABSENT
    _openapi_field_max_dc_current = haskey(_openapi_object, "max_dc_current") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["max_dc_current"], _openapi_validate) : ABSENT
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "InterconnectingConverter"), _openapi_validate)
    _openapi_field_power_factor_weighting_fraction = haskey(_openapi_object, "power_factor_weighting_fraction") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["power_factor_weighting_fraction"], _openapi_validate) : ABSENT
    _openapi_field_power_units = _decode(InterconnectingConverterPowerUnits, _required(_openapi_object, "power_units", "InterconnectingConverter"), _openapi_validate)
    _openapi_field_rating = _decode(Float64, _required(_openapi_object, "rating", "InterconnectingConverter"), _openapi_validate)
    _openapi_field_reactive_power_limits = haskey(_openapi_object, "reactive_power_limits") ? _decode(Union{Absent,InterconnectingConverterReactivePowerLimits,Nothing}, _openapi_object["reactive_power_limits"], _openapi_validate) : ABSENT
    _openapi_field_remote_bus_control = haskey(_openapi_object, "remote_bus_control") ? _decode(Union{Absent,Union{Int64,Nothing}}, _openapi_object["remote_bus_control"], _openapi_validate) : ABSENT
    _openapi_field_rmpct = haskey(_openapi_object, "rmpct") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["rmpct"], _openapi_validate) : ABSENT
    _openapi_field_voltage_limits = haskey(_openapi_object, "voltage_limits") ? _decode(Union{Absent,InterconnectingConverterVoltageLimits,Nothing}, _openapi_object["voltage_limits"], _openapi_validate) : ABSENT
    _openapi_field_voltage_setpoint_units = haskey(_openapi_object, "voltage_setpoint_units") ? _decode(Union{Absent,InterconnectingConverterVoltageSetpointUnits,Nothing}, _openapi_object["voltage_setpoint_units"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("ac_control","ac_setpoint","active_power","active_power_limits","available","base_power","bus","dc_bus","dc_control","dc_current","dc_setpoint","dc_voltage_droop","dynamic_injector","id","loss_function","max_dc_current","name","power_factor_weighting_fraction","power_units","rating","reactive_power_limits","remote_bus_control","rmpct","voltage_limits","voltage_setpoint_units") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return InterconnectingConverter(; ac_control = _openapi_field_ac_control, ac_setpoint = _openapi_field_ac_setpoint, active_power = _openapi_field_active_power, active_power_limits = _openapi_field_active_power_limits, available = _openapi_field_available, base_power = _openapi_field_base_power, bus = _openapi_field_bus, dc_bus = _openapi_field_dc_bus, dc_control = _openapi_field_dc_control, dc_current = _openapi_field_dc_current, dc_setpoint = _openapi_field_dc_setpoint, dc_voltage_droop = _openapi_field_dc_voltage_droop, dynamic_injector = _openapi_field_dynamic_injector, id = _openapi_field_id, loss_function = _openapi_field_loss_function, max_dc_current = _openapi_field_max_dc_current, name = _openapi_field_name, power_factor_weighting_fraction = _openapi_field_power_factor_weighting_fraction, power_units = _openapi_field_power_units, rating = _openapi_field_rating, reactive_power_limits = _openapi_field_reactive_power_limits, remote_bus_control = _openapi_field_remote_bus_control, rmpct = _openapi_field_rmpct, voltage_limits = _openapi_field_voltage_limits, voltage_setpoint_units = _openapi_field_voltage_setpoint_units, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::InterconnectingConverter)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.ac_control isa Absent || (_openapi_output["ac_control"] = _encode(_openapi_value.ac_control))
    _openapi_value.ac_setpoint isa Absent || (_openapi_output["ac_setpoint"] = _encode(_openapi_value.ac_setpoint))
    _openapi_value.active_power isa Absent || (_openapi_output["active_power"] = _encode(_openapi_value.active_power))
    _openapi_value.active_power_limits isa Absent || (_openapi_output["active_power_limits"] = _encode(_openapi_value.active_power_limits))
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.base_power isa Absent || (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
    _openapi_value.bus isa Absent || (_openapi_output["bus"] = _encode(_openapi_value.bus))
    _openapi_value.dc_bus isa Absent || (_openapi_output["dc_bus"] = _encode(_openapi_value.dc_bus))
    _openapi_value.dc_control isa Absent || (_openapi_output["dc_control"] = _encode(_openapi_value.dc_control))
    _openapi_value.dc_current isa Absent || (_openapi_output["dc_current"] = _encode(_openapi_value.dc_current))
    _openapi_value.dc_setpoint isa Absent || (_openapi_output["dc_setpoint"] = _encode(_openapi_value.dc_setpoint))
    _openapi_value.dc_voltage_droop isa Absent || (_openapi_output["dc_voltage_droop"] = _encode(_openapi_value.dc_voltage_droop))
    _openapi_value.dynamic_injector isa Absent || (_openapi_output["dynamic_injector"] = _encode(_openapi_value.dynamic_injector))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.loss_function isa Absent || (_openapi_output["loss_function"] = _encode(_openapi_value.loss_function))
    _openapi_value.max_dc_current isa Absent || (_openapi_output["max_dc_current"] = _encode(_openapi_value.max_dc_current))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.power_factor_weighting_fraction isa Absent || (_openapi_output["power_factor_weighting_fraction"] = _encode(_openapi_value.power_factor_weighting_fraction))
    _openapi_value.power_units isa Absent || (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
    _openapi_value.rating isa Absent || (_openapi_output["rating"] = _encode(_openapi_value.rating))
    _openapi_value.reactive_power_limits isa Absent || (_openapi_output["reactive_power_limits"] = _encode(_openapi_value.reactive_power_limits))
    _openapi_value.remote_bus_control isa Absent || (_openapi_output["remote_bus_control"] = _encode(_openapi_value.remote_bus_control))
    _openapi_value.rmpct isa Absent || (_openapi_output["rmpct"] = _encode(_openapi_value.rmpct))
    _openapi_value.voltage_limits isa Absent || (_openapi_output["voltage_limits"] = _encode(_openapi_value.voltage_limits))
    _openapi_value.voltage_setpoint_units isa Absent || (_openapi_output["voltage_setpoint_units"] = _encode(_openapi_value.voltage_setpoint_units))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/InterconnectingConverter"), _openapi_output, "encoding InterconnectingConverter"; direction = :neutral)
end

function _form_fields(_openapi_value::InterconnectingConverter)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.ac_control isa Absent || push!(_openapi_output, "ac_control" => _openapi_value.ac_control)
    _openapi_value.ac_setpoint isa Absent || push!(_openapi_output, "ac_setpoint" => _openapi_value.ac_setpoint)
    _openapi_value.active_power isa Absent || push!(_openapi_output, "active_power" => _openapi_value.active_power)
    _openapi_value.active_power_limits isa Absent || push!(_openapi_output, "active_power_limits" => _openapi_value.active_power_limits)
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.base_power isa Absent || push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.bus isa Absent || push!(_openapi_output, "bus" => _openapi_value.bus)
    _openapi_value.dc_bus isa Absent || push!(_openapi_output, "dc_bus" => _openapi_value.dc_bus)
    _openapi_value.dc_control isa Absent || push!(_openapi_output, "dc_control" => _openapi_value.dc_control)
    _openapi_value.dc_current isa Absent || push!(_openapi_output, "dc_current" => _openapi_value.dc_current)
    _openapi_value.dc_setpoint isa Absent || push!(_openapi_output, "dc_setpoint" => _openapi_value.dc_setpoint)
    _openapi_value.dc_voltage_droop isa Absent || push!(_openapi_output, "dc_voltage_droop" => _openapi_value.dc_voltage_droop)
    _openapi_value.dynamic_injector isa Absent || push!(_openapi_output, "dynamic_injector" => _openapi_value.dynamic_injector)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.loss_function isa Absent || push!(_openapi_output, "loss_function" => _openapi_value.loss_function)
    _openapi_value.max_dc_current isa Absent || push!(_openapi_output, "max_dc_current" => _openapi_value.max_dc_current)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.power_factor_weighting_fraction isa Absent || push!(_openapi_output, "power_factor_weighting_fraction" => _openapi_value.power_factor_weighting_fraction)
    _openapi_value.power_units isa Absent || push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.rating isa Absent || push!(_openapi_output, "rating" => _openapi_value.rating)
    _openapi_value.reactive_power_limits isa Absent || push!(_openapi_output, "reactive_power_limits" => _openapi_value.reactive_power_limits)
    _openapi_value.remote_bus_control isa Absent || push!(_openapi_output, "remote_bus_control" => _openapi_value.remote_bus_control)
    _openapi_value.rmpct isa Absent || push!(_openapi_output, "rmpct" => _openapi_value.rmpct)
    _openapi_value.voltage_limits isa Absent || push!(_openapi_output, "voltage_limits" => _openapi_value.voltage_limits)
    _openapi_value.voltage_setpoint_units isa Absent || push!(_openapi_output, "voltage_setpoint_units" => _openapi_value.voltage_setpoint_units)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
