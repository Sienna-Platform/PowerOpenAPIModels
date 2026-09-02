@doc "    Source\n\nAn infinite bus with a constant voltage output.\n\nCommonly used in dynamics simulations to represent a very large machine on a single bus or for the representation of import/exports in operational simulations.\n\n- `r_th`: Source Thevenin resistance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu .\n- `x_th`: Source Thevenin reactance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu .\n- `active_power`: Initial active power set point of the unit. For power flow, this is the steady state operating point of the system. For production cost modeling, this may or may not be used as the initial starting point for the solver, depending on the solver used. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `active_power_limits`: Minimum and maximum stable active power levels. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.\n- `base_power`: Base power of the unit for per unitization. Units: MVA.\n- `base_voltage`: The base voltage. Units: kV.\n- `bus`: ID of the bus that this component is connected to.\n- `dynamic_injector`: ID of the corresponding dynamic injection device, if any.\n- `id`: Unique integer identifier for this component.\n- `internal_angle`: Internal angle. Units: rad.\n- `internal_voltage`: Internal voltage. Units: pu.\n- `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.\n- `operation_cost`: Cost of importing and exporting power at the source. or MarketBidCost\n- `parameter_units`: Unit basis for this source's impedance fields (R_th, X_th).\n- `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.\n- `reactive_power`: Initial reactive power set point of the unit. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .\n- `reactive_power_limits`: Minimum and maximum reactive power limits. Set to `null` if not applicable. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu ."
Base.@kwdef struct Source
    r_th::Union{Absent,Float64,Nothing} = ABSENT
    x_th::Union{Absent,Float64,Nothing} = ABSENT
    active_power::Union{Absent,Float64,Nothing} = ABSENT
    active_power_limits::Union{Absent,Nothing,SourceActivePowerLimits} = ABSENT
    available::Bool
    base_power::Union{Absent,Float64,Nothing} = ABSENT
    base_voltage::Union{Absent,Float64,Nothing} = ABSENT
    bus::Int64
    dynamic_injector::Union{Absent,Union{Int64,Nothing}} = ABSENT
    id::Int64
    internal_angle::Union{Absent,Float64,Nothing} = ABSENT
    internal_voltage::Union{Absent,Float64,Nothing} = ABSENT
    name::String
    operation_cost::SourceOperationCost
    parameter_units::Union{Absent,Nothing,SourceParameterUnits} = ABSENT
    power_units::SourcePowerUnits
    reactive_power::Union{Absent,Float64,Nothing} = ABSENT
    reactive_power_limits::Union{Absent,Nothing,SourceReactivePowerLimits} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{Source}, value) = _decode(Source, value, true)
function _decode(::Type{Source}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/Source"), _openapi_raw, "decoding Source"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "Source")
    _openapi_field_r_th = haskey(_openapi_object, "R_th") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["R_th"], _openapi_validate) : ABSENT
    _openapi_field_x_th = haskey(_openapi_object, "X_th") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["X_th"], _openapi_validate) : ABSENT
    _openapi_field_active_power = haskey(_openapi_object, "active_power") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["active_power"], _openapi_validate) : ABSENT
    _openapi_field_active_power_limits = haskey(_openapi_object, "active_power_limits") ? _decode(Union{Absent,Nothing,SourceActivePowerLimits}, _openapi_object["active_power_limits"], _openapi_validate) : ABSENT
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "Source"), _openapi_validate)
    _openapi_field_base_power = haskey(_openapi_object, "base_power") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["base_power"], _openapi_validate) : ABSENT
    _openapi_field_base_voltage = haskey(_openapi_object, "base_voltage") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["base_voltage"], _openapi_validate) : ABSENT
    _openapi_field_bus = _decode(Int64, _required(_openapi_object, "bus", "Source"), _openapi_validate)
    _openapi_field_dynamic_injector = haskey(_openapi_object, "dynamic_injector") ? _decode(Union{Absent,Union{Int64,Nothing}}, _openapi_object["dynamic_injector"], _openapi_validate) : ABSENT
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "Source"), _openapi_validate)
    _openapi_field_internal_angle = haskey(_openapi_object, "internal_angle") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["internal_angle"], _openapi_validate) : ABSENT
    _openapi_field_internal_voltage = haskey(_openapi_object, "internal_voltage") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["internal_voltage"], _openapi_validate) : ABSENT
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "Source"), _openapi_validate)
    _openapi_field_operation_cost = _decode(SourceOperationCost, _required(_openapi_object, "operation_cost", "Source"), _openapi_validate)
    _openapi_field_parameter_units = haskey(_openapi_object, "parameter_units") ? _decode(Union{Absent,Nothing,SourceParameterUnits}, _openapi_object["parameter_units"], _openapi_validate) : ABSENT
    _openapi_field_power_units = _decode(SourcePowerUnits, _required(_openapi_object, "power_units", "Source"), _openapi_validate)
    _openapi_field_reactive_power = haskey(_openapi_object, "reactive_power") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["reactive_power"], _openapi_validate) : ABSENT
    _openapi_field_reactive_power_limits = haskey(_openapi_object, "reactive_power_limits") ? _decode(Union{Absent,Nothing,SourceReactivePowerLimits}, _openapi_object["reactive_power_limits"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("R_th","X_th","active_power","active_power_limits","available","base_power","base_voltage","bus","dynamic_injector","id","internal_angle","internal_voltage","name","operation_cost","parameter_units","power_units","reactive_power","reactive_power_limits") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return Source(; r_th = _openapi_field_r_th, x_th = _openapi_field_x_th, active_power = _openapi_field_active_power, active_power_limits = _openapi_field_active_power_limits, available = _openapi_field_available, base_power = _openapi_field_base_power, base_voltage = _openapi_field_base_voltage, bus = _openapi_field_bus, dynamic_injector = _openapi_field_dynamic_injector, id = _openapi_field_id, internal_angle = _openapi_field_internal_angle, internal_voltage = _openapi_field_internal_voltage, name = _openapi_field_name, operation_cost = _openapi_field_operation_cost, parameter_units = _openapi_field_parameter_units, power_units = _openapi_field_power_units, reactive_power = _openapi_field_reactive_power, reactive_power_limits = _openapi_field_reactive_power_limits, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::Source)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.r_th isa Absent || (_openapi_output["R_th"] = _encode(_openapi_value.r_th))
    _openapi_value.x_th isa Absent || (_openapi_output["X_th"] = _encode(_openapi_value.x_th))
    _openapi_value.active_power isa Absent || (_openapi_output["active_power"] = _encode(_openapi_value.active_power))
    _openapi_value.active_power_limits isa Absent || (_openapi_output["active_power_limits"] = _encode(_openapi_value.active_power_limits))
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.base_power isa Absent || (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
    _openapi_value.base_voltage isa Absent || (_openapi_output["base_voltage"] = _encode(_openapi_value.base_voltage))
    _openapi_value.bus isa Absent || (_openapi_output["bus"] = _encode(_openapi_value.bus))
    _openapi_value.dynamic_injector isa Absent || (_openapi_output["dynamic_injector"] = _encode(_openapi_value.dynamic_injector))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.internal_angle isa Absent || (_openapi_output["internal_angle"] = _encode(_openapi_value.internal_angle))
    _openapi_value.internal_voltage isa Absent || (_openapi_output["internal_voltage"] = _encode(_openapi_value.internal_voltage))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.operation_cost isa Absent || (_openapi_output["operation_cost"] = _encode(_openapi_value.operation_cost))
    _openapi_value.parameter_units isa Absent || (_openapi_output["parameter_units"] = _encode(_openapi_value.parameter_units))
    _openapi_value.power_units isa Absent || (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
    _openapi_value.reactive_power isa Absent || (_openapi_output["reactive_power"] = _encode(_openapi_value.reactive_power))
    _openapi_value.reactive_power_limits isa Absent || (_openapi_output["reactive_power_limits"] = _encode(_openapi_value.reactive_power_limits))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/Source"), _openapi_output, "encoding Source"; direction = :neutral)
end

function _form_fields(_openapi_value::Source)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.r_th isa Absent || push!(_openapi_output, "R_th" => _openapi_value.r_th)
    _openapi_value.x_th isa Absent || push!(_openapi_output, "X_th" => _openapi_value.x_th)
    _openapi_value.active_power isa Absent || push!(_openapi_output, "active_power" => _openapi_value.active_power)
    _openapi_value.active_power_limits isa Absent || push!(_openapi_output, "active_power_limits" => _openapi_value.active_power_limits)
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.base_power isa Absent || push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.base_voltage isa Absent || push!(_openapi_output, "base_voltage" => _openapi_value.base_voltage)
    _openapi_value.bus isa Absent || push!(_openapi_output, "bus" => _openapi_value.bus)
    _openapi_value.dynamic_injector isa Absent || push!(_openapi_output, "dynamic_injector" => _openapi_value.dynamic_injector)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.internal_angle isa Absent || push!(_openapi_output, "internal_angle" => _openapi_value.internal_angle)
    _openapi_value.internal_voltage isa Absent || push!(_openapi_output, "internal_voltage" => _openapi_value.internal_voltage)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.operation_cost isa Absent || push!(_openapi_output, "operation_cost" => _openapi_value.operation_cost)
    _openapi_value.parameter_units isa Absent || push!(_openapi_output, "parameter_units" => _openapi_value.parameter_units)
    _openapi_value.power_units isa Absent || push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.reactive_power isa Absent || push!(_openapi_output, "reactive_power" => _openapi_value.reactive_power)
    _openapi_value.reactive_power_limits isa Absent || push!(_openapi_output, "reactive_power_limits" => _openapi_value.reactive_power_limits)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
