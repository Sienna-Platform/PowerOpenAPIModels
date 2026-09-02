@doc "    StandardLoad\n\nA voltage-dependent ZIP load, most commonly used for dynamics modeling.\n\nA `StandardLoad` breaks the ZIP into three pieces: Z (constant impedance), I (constant current), and P (constant power), according to `P = P_P * V^0 + P_I * V^1 + P_Z * V^2` for active power and `Q = Q_P * V^0 + Q_I * V^1 + Q_Z * V^2` for reactive power. (Voltage V is in per unit.)\n\nFor an alternative exponential formulation of the ZIP model, see `ExponentialLoad`. For a simpler load model with no voltage dependency, see `PowerLoad`.\n\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.\n- `base_power`: Base power of the load for per unitization. Units: MVA.\n- `bus`: ID of the bus that this component is connected to.\n- `conformity`: Indicates whether the specified load is conforming or non-conforming.\n- `constant_active_power`: Constant active power demand (P_P). Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `constant_reactive_power`: Constant reactive power demand (Q_P). Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .\n- `current_active_power`: Active power coefficient for constant current load (P_I). Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `current_reactive_power`: Reactive power coefficient for constant current load (Q_I). Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .\n- `dynamic_injector`: ID of the corresponding dynamic injection device, if any.\n- `id`: Unique integer identifier for this component.\n- `impedance_active_power`: Active power coefficient for constant impedance load (P_Z). Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `impedance_reactive_power`: Reactive power coefficient for constant impedance load (Q_Z). Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .\n- `max_constant_active_power`: Maximum active power drawn by constant power load. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `max_constant_reactive_power`: Maximum reactive power drawn by constant power load. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .\n- `max_current_active_power`: Maximum active power drawn by constant current load. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `max_current_reactive_power`: Maximum reactive power drawn by constant current load. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .\n- `max_impedance_active_power`: Maximum active power drawn by constant impedance load. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `max_impedance_reactive_power`: Maximum reactive power drawn by constant impedance load. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .\n- `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.\n- `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
Base.@kwdef struct StandardLoad
    available::Bool
    base_power::Float64
    bus::Int64
    conformity::Union{Absent,Nothing,StandardLoadConformity} = ABSENT
    constant_active_power::Union{Absent,Float64,Nothing} = ABSENT
    constant_reactive_power::Union{Absent,Float64,Nothing} = ABSENT
    current_active_power::Union{Absent,Float64,Nothing} = ABSENT
    current_reactive_power::Union{Absent,Float64,Nothing} = ABSENT
    dynamic_injector::Union{Absent,Union{Int64,Nothing}} = ABSENT
    id::Int64
    impedance_active_power::Union{Absent,Float64,Nothing} = ABSENT
    impedance_reactive_power::Union{Absent,Float64,Nothing} = ABSENT
    max_constant_active_power::Union{Absent,Float64,Nothing} = ABSENT
    max_constant_reactive_power::Union{Absent,Float64,Nothing} = ABSENT
    max_current_active_power::Union{Absent,Float64,Nothing} = ABSENT
    max_current_reactive_power::Union{Absent,Float64,Nothing} = ABSENT
    max_impedance_active_power::Union{Absent,Float64,Nothing} = ABSENT
    max_impedance_reactive_power::Union{Absent,Float64,Nothing} = ABSENT
    name::String
    power_units::StandardLoadPowerUnits
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{StandardLoad}, value) = _decode(StandardLoad, value, true)
function _decode(::Type{StandardLoad}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/StandardLoad"), _openapi_raw, "decoding StandardLoad"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "StandardLoad")
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "StandardLoad"), _openapi_validate)
    _openapi_field_base_power = _decode(Float64, _required(_openapi_object, "base_power", "StandardLoad"), _openapi_validate)
    _openapi_field_bus = _decode(Int64, _required(_openapi_object, "bus", "StandardLoad"), _openapi_validate)
    _openapi_field_conformity = haskey(_openapi_object, "conformity") ? _decode(Union{Absent,Nothing,StandardLoadConformity}, _openapi_object["conformity"], _openapi_validate) : ABSENT
    _openapi_field_constant_active_power = haskey(_openapi_object, "constant_active_power") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["constant_active_power"], _openapi_validate) : ABSENT
    _openapi_field_constant_reactive_power = haskey(_openapi_object, "constant_reactive_power") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["constant_reactive_power"], _openapi_validate) : ABSENT
    _openapi_field_current_active_power = haskey(_openapi_object, "current_active_power") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["current_active_power"], _openapi_validate) : ABSENT
    _openapi_field_current_reactive_power = haskey(_openapi_object, "current_reactive_power") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["current_reactive_power"], _openapi_validate) : ABSENT
    _openapi_field_dynamic_injector = haskey(_openapi_object, "dynamic_injector") ? _decode(Union{Absent,Union{Int64,Nothing}}, _openapi_object["dynamic_injector"], _openapi_validate) : ABSENT
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "StandardLoad"), _openapi_validate)
    _openapi_field_impedance_active_power = haskey(_openapi_object, "impedance_active_power") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["impedance_active_power"], _openapi_validate) : ABSENT
    _openapi_field_impedance_reactive_power = haskey(_openapi_object, "impedance_reactive_power") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["impedance_reactive_power"], _openapi_validate) : ABSENT
    _openapi_field_max_constant_active_power = haskey(_openapi_object, "max_constant_active_power") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["max_constant_active_power"], _openapi_validate) : ABSENT
    _openapi_field_max_constant_reactive_power = haskey(_openapi_object, "max_constant_reactive_power") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["max_constant_reactive_power"], _openapi_validate) : ABSENT
    _openapi_field_max_current_active_power = haskey(_openapi_object, "max_current_active_power") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["max_current_active_power"], _openapi_validate) : ABSENT
    _openapi_field_max_current_reactive_power = haskey(_openapi_object, "max_current_reactive_power") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["max_current_reactive_power"], _openapi_validate) : ABSENT
    _openapi_field_max_impedance_active_power = haskey(_openapi_object, "max_impedance_active_power") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["max_impedance_active_power"], _openapi_validate) : ABSENT
    _openapi_field_max_impedance_reactive_power = haskey(_openapi_object, "max_impedance_reactive_power") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["max_impedance_reactive_power"], _openapi_validate) : ABSENT
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "StandardLoad"), _openapi_validate)
    _openapi_field_power_units = _decode(StandardLoadPowerUnits, _required(_openapi_object, "power_units", "StandardLoad"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("available","base_power","bus","conformity","constant_active_power","constant_reactive_power","current_active_power","current_reactive_power","dynamic_injector","id","impedance_active_power","impedance_reactive_power","max_constant_active_power","max_constant_reactive_power","max_current_active_power","max_current_reactive_power","max_impedance_active_power","max_impedance_reactive_power","name","power_units") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return StandardLoad(; available = _openapi_field_available, base_power = _openapi_field_base_power, bus = _openapi_field_bus, conformity = _openapi_field_conformity, constant_active_power = _openapi_field_constant_active_power, constant_reactive_power = _openapi_field_constant_reactive_power, current_active_power = _openapi_field_current_active_power, current_reactive_power = _openapi_field_current_reactive_power, dynamic_injector = _openapi_field_dynamic_injector, id = _openapi_field_id, impedance_active_power = _openapi_field_impedance_active_power, impedance_reactive_power = _openapi_field_impedance_reactive_power, max_constant_active_power = _openapi_field_max_constant_active_power, max_constant_reactive_power = _openapi_field_max_constant_reactive_power, max_current_active_power = _openapi_field_max_current_active_power, max_current_reactive_power = _openapi_field_max_current_reactive_power, max_impedance_active_power = _openapi_field_max_impedance_active_power, max_impedance_reactive_power = _openapi_field_max_impedance_reactive_power, name = _openapi_field_name, power_units = _openapi_field_power_units, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::StandardLoad)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.base_power isa Absent || (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
    _openapi_value.bus isa Absent || (_openapi_output["bus"] = _encode(_openapi_value.bus))
    _openapi_value.conformity isa Absent || (_openapi_output["conformity"] = _encode(_openapi_value.conformity))
    _openapi_value.constant_active_power isa Absent || (_openapi_output["constant_active_power"] = _encode(_openapi_value.constant_active_power))
    _openapi_value.constant_reactive_power isa Absent || (_openapi_output["constant_reactive_power"] = _encode(_openapi_value.constant_reactive_power))
    _openapi_value.current_active_power isa Absent || (_openapi_output["current_active_power"] = _encode(_openapi_value.current_active_power))
    _openapi_value.current_reactive_power isa Absent || (_openapi_output["current_reactive_power"] = _encode(_openapi_value.current_reactive_power))
    _openapi_value.dynamic_injector isa Absent || (_openapi_output["dynamic_injector"] = _encode(_openapi_value.dynamic_injector))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.impedance_active_power isa Absent || (_openapi_output["impedance_active_power"] = _encode(_openapi_value.impedance_active_power))
    _openapi_value.impedance_reactive_power isa Absent || (_openapi_output["impedance_reactive_power"] = _encode(_openapi_value.impedance_reactive_power))
    _openapi_value.max_constant_active_power isa Absent || (_openapi_output["max_constant_active_power"] = _encode(_openapi_value.max_constant_active_power))
    _openapi_value.max_constant_reactive_power isa Absent || (_openapi_output["max_constant_reactive_power"] = _encode(_openapi_value.max_constant_reactive_power))
    _openapi_value.max_current_active_power isa Absent || (_openapi_output["max_current_active_power"] = _encode(_openapi_value.max_current_active_power))
    _openapi_value.max_current_reactive_power isa Absent || (_openapi_output["max_current_reactive_power"] = _encode(_openapi_value.max_current_reactive_power))
    _openapi_value.max_impedance_active_power isa Absent || (_openapi_output["max_impedance_active_power"] = _encode(_openapi_value.max_impedance_active_power))
    _openapi_value.max_impedance_reactive_power isa Absent || (_openapi_output["max_impedance_reactive_power"] = _encode(_openapi_value.max_impedance_reactive_power))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.power_units isa Absent || (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/StandardLoad"), _openapi_output, "encoding StandardLoad"; direction = :neutral)
end

function _form_fields(_openapi_value::StandardLoad)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.base_power isa Absent || push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.bus isa Absent || push!(_openapi_output, "bus" => _openapi_value.bus)
    _openapi_value.conformity isa Absent || push!(_openapi_output, "conformity" => _openapi_value.conformity)
    _openapi_value.constant_active_power isa Absent || push!(_openapi_output, "constant_active_power" => _openapi_value.constant_active_power)
    _openapi_value.constant_reactive_power isa Absent || push!(_openapi_output, "constant_reactive_power" => _openapi_value.constant_reactive_power)
    _openapi_value.current_active_power isa Absent || push!(_openapi_output, "current_active_power" => _openapi_value.current_active_power)
    _openapi_value.current_reactive_power isa Absent || push!(_openapi_output, "current_reactive_power" => _openapi_value.current_reactive_power)
    _openapi_value.dynamic_injector isa Absent || push!(_openapi_output, "dynamic_injector" => _openapi_value.dynamic_injector)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.impedance_active_power isa Absent || push!(_openapi_output, "impedance_active_power" => _openapi_value.impedance_active_power)
    _openapi_value.impedance_reactive_power isa Absent || push!(_openapi_output, "impedance_reactive_power" => _openapi_value.impedance_reactive_power)
    _openapi_value.max_constant_active_power isa Absent || push!(_openapi_output, "max_constant_active_power" => _openapi_value.max_constant_active_power)
    _openapi_value.max_constant_reactive_power isa Absent || push!(_openapi_output, "max_constant_reactive_power" => _openapi_value.max_constant_reactive_power)
    _openapi_value.max_current_active_power isa Absent || push!(_openapi_output, "max_current_active_power" => _openapi_value.max_current_active_power)
    _openapi_value.max_current_reactive_power isa Absent || push!(_openapi_output, "max_current_reactive_power" => _openapi_value.max_current_reactive_power)
    _openapi_value.max_impedance_active_power isa Absent || push!(_openapi_output, "max_impedance_active_power" => _openapi_value.max_impedance_active_power)
    _openapi_value.max_impedance_reactive_power isa Absent || push!(_openapi_output, "max_impedance_reactive_power" => _openapi_value.max_impedance_reactive_power)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.power_units isa Absent || push!(_openapi_output, "power_units" => _openapi_value.power_units)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
