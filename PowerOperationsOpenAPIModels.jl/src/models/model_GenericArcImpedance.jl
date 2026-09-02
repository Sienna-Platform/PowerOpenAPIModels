@doc "    GenericArcImpedance\n\nA generic branch defined by a series impedance on an `Arc` between two buses.\n\n- `active_power_flow`: Initial condition of active power flow on the line. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `arc`: An `Arc` defining this line `from` a bus `to` another bus.\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.\n- `base_power`: System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA.\n- `id`: Unique integer identifier for this component.\n- `max_flow`: Maximum allowable flow on the generic impedance. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.\n- `parameter_units`: Unit basis for r and x. COMPONENT_BASE is per-unit on this component's base_power, which records the system base.\n- `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.\n- `r`: Resistance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu .\n- `reactive_power_flow`: Initial condition of reactive power flow on the line. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .\n- `x`: Reactance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu ."
Base.@kwdef struct GenericArcImpedance
    active_power_flow::Float64
    arc::Int64
    available::Bool
    base_power::Float64
    id::Int64
    max_flow::Float64
    name::String
    parameter_units::Union{Absent,GenericArcImpedanceParameterUnits,Nothing} = ABSENT
    power_units::GenericArcImpedancePowerUnits
    r::Float64
    reactive_power_flow::Float64
    x::Float64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{GenericArcImpedance}, value) = _decode(GenericArcImpedance, value, true)
function _decode(::Type{GenericArcImpedance}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/GenericArcImpedance"), _openapi_raw, "decoding GenericArcImpedance"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "GenericArcImpedance")
    _openapi_field_active_power_flow = _decode(Float64, _required(_openapi_object, "active_power_flow", "GenericArcImpedance"), _openapi_validate)
    _openapi_field_arc = _decode(Int64, _required(_openapi_object, "arc", "GenericArcImpedance"), _openapi_validate)
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "GenericArcImpedance"), _openapi_validate)
    _openapi_field_base_power = _decode(Float64, _required(_openapi_object, "base_power", "GenericArcImpedance"), _openapi_validate)
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "GenericArcImpedance"), _openapi_validate)
    _openapi_field_max_flow = _decode(Float64, _required(_openapi_object, "max_flow", "GenericArcImpedance"), _openapi_validate)
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "GenericArcImpedance"), _openapi_validate)
    _openapi_field_parameter_units = haskey(_openapi_object, "parameter_units") ? _decode(Union{Absent,GenericArcImpedanceParameterUnits,Nothing}, _openapi_object["parameter_units"], _openapi_validate) : ABSENT
    _openapi_field_power_units = _decode(GenericArcImpedancePowerUnits, _required(_openapi_object, "power_units", "GenericArcImpedance"), _openapi_validate)
    _openapi_field_r = _decode(Float64, _required(_openapi_object, "r", "GenericArcImpedance"), _openapi_validate)
    _openapi_field_reactive_power_flow = _decode(Float64, _required(_openapi_object, "reactive_power_flow", "GenericArcImpedance"), _openapi_validate)
    _openapi_field_x = _decode(Float64, _required(_openapi_object, "x", "GenericArcImpedance"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("active_power_flow","arc","available","base_power","id","max_flow","name","parameter_units","power_units","r","reactive_power_flow","x") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return GenericArcImpedance(; active_power_flow = _openapi_field_active_power_flow, arc = _openapi_field_arc, available = _openapi_field_available, base_power = _openapi_field_base_power, id = _openapi_field_id, max_flow = _openapi_field_max_flow, name = _openapi_field_name, parameter_units = _openapi_field_parameter_units, power_units = _openapi_field_power_units, r = _openapi_field_r, reactive_power_flow = _openapi_field_reactive_power_flow, x = _openapi_field_x, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::GenericArcImpedance)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.active_power_flow isa Absent || (_openapi_output["active_power_flow"] = _encode(_openapi_value.active_power_flow))
    _openapi_value.arc isa Absent || (_openapi_output["arc"] = _encode(_openapi_value.arc))
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.base_power isa Absent || (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.max_flow isa Absent || (_openapi_output["max_flow"] = _encode(_openapi_value.max_flow))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.parameter_units isa Absent || (_openapi_output["parameter_units"] = _encode(_openapi_value.parameter_units))
    _openapi_value.power_units isa Absent || (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
    _openapi_value.r isa Absent || (_openapi_output["r"] = _encode(_openapi_value.r))
    _openapi_value.reactive_power_flow isa Absent || (_openapi_output["reactive_power_flow"] = _encode(_openapi_value.reactive_power_flow))
    _openapi_value.x isa Absent || (_openapi_output["x"] = _encode(_openapi_value.x))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/GenericArcImpedance"), _openapi_output, "encoding GenericArcImpedance"; direction = :neutral)
end

function _form_fields(_openapi_value::GenericArcImpedance)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.active_power_flow isa Absent || push!(_openapi_output, "active_power_flow" => _openapi_value.active_power_flow)
    _openapi_value.arc isa Absent || push!(_openapi_output, "arc" => _openapi_value.arc)
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.base_power isa Absent || push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.max_flow isa Absent || push!(_openapi_output, "max_flow" => _openapi_value.max_flow)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.parameter_units isa Absent || push!(_openapi_output, "parameter_units" => _openapi_value.parameter_units)
    _openapi_value.power_units isa Absent || push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.r isa Absent || push!(_openapi_output, "r" => _openapi_value.r)
    _openapi_value.reactive_power_flow isa Absent || push!(_openapi_output, "reactive_power_flow" => _openapi_value.reactive_power_flow)
    _openapi_value.x isa Absent || push!(_openapi_output, "x" => _openapi_value.x)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
