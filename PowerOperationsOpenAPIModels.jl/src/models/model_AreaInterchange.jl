@doc "    AreaInterchange\n\nFlow exchanged between Areas. This Interchange is agnostic to the lines connecting the areas. It does not substitute Interface which is the total flow across a group of lines.\n\n- `active_power_flow`: Initial condition of active power flow on the line. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.\n- `base_power`: System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA.\n- `flow_limits`: Max flow between the areas. It ignores lines and other branches totals. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `from_area`: Area from which the power is extracted.\n- `id`: Unique integer identifier for this component.\n- `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.\n- `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.\n- `to_area`: Area to which the power is injected."
Base.@kwdef struct AreaInterchange
    active_power_flow::Float64
    available::Bool
    base_power::Float64
    flow_limits::AreaInterchangeFlowLimits
    from_area::Int64
    id::Int64
    name::String
    power_units::AreaInterchangePowerUnits
    to_area::Int64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{AreaInterchange}, value) = _decode(AreaInterchange, value, true)
function _decode(::Type{AreaInterchange}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/AreaInterchange"), _openapi_raw, "decoding AreaInterchange"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "AreaInterchange")
    _openapi_field_active_power_flow = _decode(Float64, _required(_openapi_object, "active_power_flow", "AreaInterchange"), _openapi_validate)
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "AreaInterchange"), _openapi_validate)
    _openapi_field_base_power = _decode(Float64, _required(_openapi_object, "base_power", "AreaInterchange"), _openapi_validate)
    _openapi_field_flow_limits = _decode(AreaInterchangeFlowLimits, _required(_openapi_object, "flow_limits", "AreaInterchange"), _openapi_validate)
    _openapi_field_from_area = _decode(Int64, _required(_openapi_object, "from_area", "AreaInterchange"), _openapi_validate)
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "AreaInterchange"), _openapi_validate)
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "AreaInterchange"), _openapi_validate)
    _openapi_field_power_units = _decode(AreaInterchangePowerUnits, _required(_openapi_object, "power_units", "AreaInterchange"), _openapi_validate)
    _openapi_field_to_area = _decode(Int64, _required(_openapi_object, "to_area", "AreaInterchange"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("active_power_flow","available","base_power","flow_limits","from_area","id","name","power_units","to_area") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return AreaInterchange(; active_power_flow = _openapi_field_active_power_flow, available = _openapi_field_available, base_power = _openapi_field_base_power, flow_limits = _openapi_field_flow_limits, from_area = _openapi_field_from_area, id = _openapi_field_id, name = _openapi_field_name, power_units = _openapi_field_power_units, to_area = _openapi_field_to_area, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::AreaInterchange)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.active_power_flow isa Absent || (_openapi_output["active_power_flow"] = _encode(_openapi_value.active_power_flow))
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.base_power isa Absent || (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
    _openapi_value.flow_limits isa Absent || (_openapi_output["flow_limits"] = _encode(_openapi_value.flow_limits))
    _openapi_value.from_area isa Absent || (_openapi_output["from_area"] = _encode(_openapi_value.from_area))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.power_units isa Absent || (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
    _openapi_value.to_area isa Absent || (_openapi_output["to_area"] = _encode(_openapi_value.to_area))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/AreaInterchange"), _openapi_output, "encoding AreaInterchange"; direction = :neutral)
end

function _form_fields(_openapi_value::AreaInterchange)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.active_power_flow isa Absent || push!(_openapi_output, "active_power_flow" => _openapi_value.active_power_flow)
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.base_power isa Absent || push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.flow_limits isa Absent || push!(_openapi_output, "flow_limits" => _openapi_value.flow_limits)
    _openapi_value.from_area isa Absent || push!(_openapi_output, "from_area" => _openapi_value.from_area)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.power_units isa Absent || push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.to_area isa Absent || push!(_openapi_output, "to_area" => _openapi_value.to_area)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
