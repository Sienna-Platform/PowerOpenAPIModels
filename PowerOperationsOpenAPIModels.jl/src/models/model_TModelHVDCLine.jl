@doc "    TModelHVDCLine\n\nA High Voltage DC transmission line for modeling DC transmission networks.\n\nThis line must be connected to a `DCBus` on each end. It uses a T-Model of the line impedance. This is suitable for operational simulations with a multi-terminal DC network. This line has no independent per-component power base, so its power fields are always natural units.\n\n- `active_power_flow`: Initial condition of active power flow on the line. Units: MW.\n- `active_power_limits_from`: Minimum and maximum active power flows to the FROM node. Units: MW.\n- `active_power_limits_to`: Minimum and maximum active power flows to the TO node. Units: MW.\n- `arc`: An `Arc` defining this line `from` a bus `to` another bus.\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.\n- `base_current`: Base current for per-unitization of this line's per-unit fields — this DC line per-unitizes against a current base, not a power base. Units: A.\n- `c`: Shunt capacitance. Per-unit on this line's `base_current`. Units: pu.\n- `id`: Unique integer identifier for this component.\n- `l`: Total series inductance, split equally on both sides of the shunt capacitance. Per-unit on this line's `base_current`. Units: pu.\n- `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.\n- `parameter_units`: Unit basis for this line's impedance field (r).\n- `r`: Total series resistance, split equally on both sides of the shunt capacitance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu ."
Base.@kwdef struct TModelHVDCLine
    active_power_flow::Float64
    active_power_limits_from::TModelHVDCLineActivePowerLimitsFrom
    active_power_limits_to::TModelHVDCLineActivePowerLimitsTo
    arc::Int64
    available::Bool
    base_current::Float64
    c::Float64
    id::Int64
    l::Float64
    name::String
    parameter_units::Union{Absent,Nothing,TModelHVDCLineParameterUnits} = ABSENT
    r::Float64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{TModelHVDCLine}, value) = _decode(TModelHVDCLine, value, true)
function _decode(::Type{TModelHVDCLine}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TModelHVDCLine"), _openapi_raw, "decoding TModelHVDCLine"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "TModelHVDCLine")
    _openapi_field_active_power_flow = _decode(Float64, _required(_openapi_object, "active_power_flow", "TModelHVDCLine"), _openapi_validate)
    _openapi_field_active_power_limits_from = _decode(TModelHVDCLineActivePowerLimitsFrom, _required(_openapi_object, "active_power_limits_from", "TModelHVDCLine"), _openapi_validate)
    _openapi_field_active_power_limits_to = _decode(TModelHVDCLineActivePowerLimitsTo, _required(_openapi_object, "active_power_limits_to", "TModelHVDCLine"), _openapi_validate)
    _openapi_field_arc = _decode(Int64, _required(_openapi_object, "arc", "TModelHVDCLine"), _openapi_validate)
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "TModelHVDCLine"), _openapi_validate)
    _openapi_field_base_current = _decode(Float64, _required(_openapi_object, "base_current", "TModelHVDCLine"), _openapi_validate)
    _openapi_field_c = _decode(Float64, _required(_openapi_object, "c", "TModelHVDCLine"), _openapi_validate)
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "TModelHVDCLine"), _openapi_validate)
    _openapi_field_l = _decode(Float64, _required(_openapi_object, "l", "TModelHVDCLine"), _openapi_validate)
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "TModelHVDCLine"), _openapi_validate)
    _openapi_field_parameter_units = haskey(_openapi_object, "parameter_units") ? _decode(Union{Absent,Nothing,TModelHVDCLineParameterUnits}, _openapi_object["parameter_units"], _openapi_validate) : ABSENT
    _openapi_field_r = _decode(Float64, _required(_openapi_object, "r", "TModelHVDCLine"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("active_power_flow","active_power_limits_from","active_power_limits_to","arc","available","base_current","c","id","l","name","parameter_units","r") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return TModelHVDCLine(; active_power_flow = _openapi_field_active_power_flow, active_power_limits_from = _openapi_field_active_power_limits_from, active_power_limits_to = _openapi_field_active_power_limits_to, arc = _openapi_field_arc, available = _openapi_field_available, base_current = _openapi_field_base_current, c = _openapi_field_c, id = _openapi_field_id, l = _openapi_field_l, name = _openapi_field_name, parameter_units = _openapi_field_parameter_units, r = _openapi_field_r, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::TModelHVDCLine)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.active_power_flow isa Absent || (_openapi_output["active_power_flow"] = _encode(_openapi_value.active_power_flow))
    _openapi_value.active_power_limits_from isa Absent || (_openapi_output["active_power_limits_from"] = _encode(_openapi_value.active_power_limits_from))
    _openapi_value.active_power_limits_to isa Absent || (_openapi_output["active_power_limits_to"] = _encode(_openapi_value.active_power_limits_to))
    _openapi_value.arc isa Absent || (_openapi_output["arc"] = _encode(_openapi_value.arc))
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.base_current isa Absent || (_openapi_output["base_current"] = _encode(_openapi_value.base_current))
    _openapi_value.c isa Absent || (_openapi_output["c"] = _encode(_openapi_value.c))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.l isa Absent || (_openapi_output["l"] = _encode(_openapi_value.l))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.parameter_units isa Absent || (_openapi_output["parameter_units"] = _encode(_openapi_value.parameter_units))
    _openapi_value.r isa Absent || (_openapi_output["r"] = _encode(_openapi_value.r))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TModelHVDCLine"), _openapi_output, "encoding TModelHVDCLine"; direction = :neutral)
end

function _form_fields(_openapi_value::TModelHVDCLine)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.active_power_flow isa Absent || push!(_openapi_output, "active_power_flow" => _openapi_value.active_power_flow)
    _openapi_value.active_power_limits_from isa Absent || push!(_openapi_output, "active_power_limits_from" => _openapi_value.active_power_limits_from)
    _openapi_value.active_power_limits_to isa Absent || push!(_openapi_output, "active_power_limits_to" => _openapi_value.active_power_limits_to)
    _openapi_value.arc isa Absent || push!(_openapi_output, "arc" => _openapi_value.arc)
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.base_current isa Absent || push!(_openapi_output, "base_current" => _openapi_value.base_current)
    _openapi_value.c isa Absent || push!(_openapi_output, "c" => _openapi_value.c)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.l isa Absent || push!(_openapi_output, "l" => _openapi_value.l)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.parameter_units isa Absent || push!(_openapi_output, "parameter_units" => _openapi_value.parameter_units)
    _openapi_value.r isa Absent || push!(_openapi_output, "r" => _openapi_value.r)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
