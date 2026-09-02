@doc "    TwoTerminalGenericHVDCLine\n\nA High Voltage DC line, which must be connected to an ACBus on each end. This model is appropriate for operational simulations with a linearized DC power flow approximation with losses proportional to the power flow. For modeling a DC network, see TModelHVDCLine.\n\n- `active_power_flow`: Initial condition of active power flow on the line. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `active_power_limits_from`: Minimum and maximum active power flows to the FROM node. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `active_power_limits_to`: Minimum and maximum active power flows to the TO node. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `arc`: An Arc defining this line `from` a bus `to` another bus.\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.\n- `base_power`: System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA.\n- `id`: Unique integer identifier for this component.\n- `loss`: Loss model coefficients. It accepts a linear model with a constant loss and a proportional loss rate (MW of loss per MW of flow). It also accepts a Piecewise loss, with N segments to specify different proportional losses for different segments.\n- `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.\n- `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.\n- `reactive_power_limits_from`: Minimum and maximum reactive power limits to the FROM node. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .\n- `reactive_power_limits_to`: Minimum and maximum reactive power limits to the TO node. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu ."
Base.@kwdef struct TwoTerminalGenericHVDCLine
    active_power_flow::Float64
    active_power_limits_from::TwoTerminalGenericHVDCLineActivePowerLimitsFrom
    active_power_limits_to::TwoTerminalGenericHVDCLineActivePowerLimitsTo
    arc::Int64
    available::Bool
    base_power::Float64
    id::Int64
    loss::Union{Absent,Nothing,TwoTerminalGenericHVDCLineLoss} = ABSENT
    name::String
    power_units::TwoTerminalGenericHVDCLinePowerUnits
    reactive_power_limits_from::TwoTerminalGenericHVDCLineReactivePowerLimitsFrom
    reactive_power_limits_to::TwoTerminalGenericHVDCLineReactivePowerLimitsTo
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{TwoTerminalGenericHVDCLine}, value) = _decode(TwoTerminalGenericHVDCLine, value, true)
function _decode(::Type{TwoTerminalGenericHVDCLine}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalGenericHVDCLine"), _openapi_raw, "decoding TwoTerminalGenericHVDCLine"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "TwoTerminalGenericHVDCLine")
    _openapi_field_active_power_flow = _decode(Float64, _required(_openapi_object, "active_power_flow", "TwoTerminalGenericHVDCLine"), _openapi_validate)
    _openapi_field_active_power_limits_from = _decode(TwoTerminalGenericHVDCLineActivePowerLimitsFrom, _required(_openapi_object, "active_power_limits_from", "TwoTerminalGenericHVDCLine"), _openapi_validate)
    _openapi_field_active_power_limits_to = _decode(TwoTerminalGenericHVDCLineActivePowerLimitsTo, _required(_openapi_object, "active_power_limits_to", "TwoTerminalGenericHVDCLine"), _openapi_validate)
    _openapi_field_arc = _decode(Int64, _required(_openapi_object, "arc", "TwoTerminalGenericHVDCLine"), _openapi_validate)
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "TwoTerminalGenericHVDCLine"), _openapi_validate)
    _openapi_field_base_power = _decode(Float64, _required(_openapi_object, "base_power", "TwoTerminalGenericHVDCLine"), _openapi_validate)
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "TwoTerminalGenericHVDCLine"), _openapi_validate)
    _openapi_field_loss = haskey(_openapi_object, "loss") ? _decode(Union{Absent,Nothing,TwoTerminalGenericHVDCLineLoss}, _openapi_object["loss"], _openapi_validate) : ABSENT
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "TwoTerminalGenericHVDCLine"), _openapi_validate)
    _openapi_field_power_units = _decode(TwoTerminalGenericHVDCLinePowerUnits, _required(_openapi_object, "power_units", "TwoTerminalGenericHVDCLine"), _openapi_validate)
    _openapi_field_reactive_power_limits_from = _decode(TwoTerminalGenericHVDCLineReactivePowerLimitsFrom, _required(_openapi_object, "reactive_power_limits_from", "TwoTerminalGenericHVDCLine"), _openapi_validate)
    _openapi_field_reactive_power_limits_to = _decode(TwoTerminalGenericHVDCLineReactivePowerLimitsTo, _required(_openapi_object, "reactive_power_limits_to", "TwoTerminalGenericHVDCLine"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("active_power_flow","active_power_limits_from","active_power_limits_to","arc","available","base_power","id","loss","name","power_units","reactive_power_limits_from","reactive_power_limits_to") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return TwoTerminalGenericHVDCLine(; active_power_flow = _openapi_field_active_power_flow, active_power_limits_from = _openapi_field_active_power_limits_from, active_power_limits_to = _openapi_field_active_power_limits_to, arc = _openapi_field_arc, available = _openapi_field_available, base_power = _openapi_field_base_power, id = _openapi_field_id, loss = _openapi_field_loss, name = _openapi_field_name, power_units = _openapi_field_power_units, reactive_power_limits_from = _openapi_field_reactive_power_limits_from, reactive_power_limits_to = _openapi_field_reactive_power_limits_to, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::TwoTerminalGenericHVDCLine)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.active_power_flow isa Absent || (_openapi_output["active_power_flow"] = _encode(_openapi_value.active_power_flow))
    _openapi_value.active_power_limits_from isa Absent || (_openapi_output["active_power_limits_from"] = _encode(_openapi_value.active_power_limits_from))
    _openapi_value.active_power_limits_to isa Absent || (_openapi_output["active_power_limits_to"] = _encode(_openapi_value.active_power_limits_to))
    _openapi_value.arc isa Absent || (_openapi_output["arc"] = _encode(_openapi_value.arc))
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.base_power isa Absent || (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.loss isa Absent || (_openapi_output["loss"] = _encode(_openapi_value.loss))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.power_units isa Absent || (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
    _openapi_value.reactive_power_limits_from isa Absent || (_openapi_output["reactive_power_limits_from"] = _encode(_openapi_value.reactive_power_limits_from))
    _openapi_value.reactive_power_limits_to isa Absent || (_openapi_output["reactive_power_limits_to"] = _encode(_openapi_value.reactive_power_limits_to))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalGenericHVDCLine"), _openapi_output, "encoding TwoTerminalGenericHVDCLine"; direction = :neutral)
end

function _form_fields(_openapi_value::TwoTerminalGenericHVDCLine)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.active_power_flow isa Absent || push!(_openapi_output, "active_power_flow" => _openapi_value.active_power_flow)
    _openapi_value.active_power_limits_from isa Absent || push!(_openapi_output, "active_power_limits_from" => _openapi_value.active_power_limits_from)
    _openapi_value.active_power_limits_to isa Absent || push!(_openapi_output, "active_power_limits_to" => _openapi_value.active_power_limits_to)
    _openapi_value.arc isa Absent || push!(_openapi_output, "arc" => _openapi_value.arc)
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.base_power isa Absent || push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.loss isa Absent || push!(_openapi_output, "loss" => _openapi_value.loss)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.power_units isa Absent || push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.reactive_power_limits_from isa Absent || push!(_openapi_output, "reactive_power_limits_from" => _openapi_value.reactive_power_limits_from)
    _openapi_value.reactive_power_limits_to isa Absent || push!(_openapi_output, "reactive_power_limits_to" => _openapi_value.reactive_power_limits_to)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
