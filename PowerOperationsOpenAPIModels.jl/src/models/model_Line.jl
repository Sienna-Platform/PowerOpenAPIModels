@doc "    Line\n\nAn AC transmission line.\n\n- `active_power_flow`: Initial condition of active power flow on the line. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `angle_limits`: Minimum and maximum angle limits. Units: rad.\n- `arc`: An `Arc` defining this line `from` a bus `to` another bus.\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.\n- `b`: Shunt susceptance, specified both on the `from` and `to` ends of the line. These are commonly modeled with the same value. Units: per parameter_units — NATURAL_UNITS: S, COMPONENT_BASE: pu .\n- `base_power`: System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA.\n- `g`: Shunt conductance, specified both on the `from` and `to` ends of the line. These are commonly modeled with the same value. Units: per parameter_units — NATURAL_UNITS: S, COMPONENT_BASE: pu .\n- `id`: Unique integer identifier for this component.\n- `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.\n- `parameter_units`: Unit basis for this line's impedance and shunt admittance fields (r, x, b, g).\n- `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit.\n- `r`: Resistance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu .\n- `rating`: Thermal rating. Flow on the line must be between -`rating` and `rating`. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .\n- `rating_b`: Second current rating. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .\n- `rating_c`: Third current rating. Units: per power_units — NATURAL_UNITS: MVA, COMPONENT_BASE: pu .\n- `reactive_power_flow`: Initial condition of reactive power flow on the line. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .\n- `x`: Reactance. Units: per parameter_units — NATURAL_UNITS: ohm, COMPONENT_BASE: pu ."
Base.@kwdef struct Line
    active_power_flow::Float64
    angle_limits::LineAngleLimits
    arc::Int64
    available::Bool
    b::Union{Absent,LineB,Nothing} = ABSENT
    base_power::Float64
    g::Union{Absent,LineG,Nothing} = ABSENT
    id::Int64
    name::String
    parameter_units::Union{Absent,LineParameterUnits,Nothing} = ABSENT
    power_units::LinePowerUnits
    r::Float64
    rating::Float64
    rating_b::Union{Absent,Float64,Nothing} = ABSENT
    rating_c::Union{Absent,Float64,Nothing} = ABSENT
    reactive_power_flow::Float64
    x::Float64
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{Line}, value) = _decode(Line, value, true)
function _decode(::Type{Line}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/Line"), _openapi_raw, "decoding Line"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "Line")
    _openapi_field_active_power_flow = _decode(Float64, _required(_openapi_object, "active_power_flow", "Line"), _openapi_validate)
    _openapi_field_angle_limits = _decode(LineAngleLimits, _required(_openapi_object, "angle_limits", "Line"), _openapi_validate)
    _openapi_field_arc = _decode(Int64, _required(_openapi_object, "arc", "Line"), _openapi_validate)
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "Line"), _openapi_validate)
    _openapi_field_b = haskey(_openapi_object, "b") ? _decode(Union{Absent,LineB,Nothing}, _openapi_object["b"], _openapi_validate) : ABSENT
    _openapi_field_base_power = _decode(Float64, _required(_openapi_object, "base_power", "Line"), _openapi_validate)
    _openapi_field_g = haskey(_openapi_object, "g") ? _decode(Union{Absent,LineG,Nothing}, _openapi_object["g"], _openapi_validate) : ABSENT
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "Line"), _openapi_validate)
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "Line"), _openapi_validate)
    _openapi_field_parameter_units = haskey(_openapi_object, "parameter_units") ? _decode(Union{Absent,LineParameterUnits,Nothing}, _openapi_object["parameter_units"], _openapi_validate) : ABSENT
    _openapi_field_power_units = _decode(LinePowerUnits, _required(_openapi_object, "power_units", "Line"), _openapi_validate)
    _openapi_field_r = _decode(Float64, _required(_openapi_object, "r", "Line"), _openapi_validate)
    _openapi_field_rating = _decode(Float64, _required(_openapi_object, "rating", "Line"), _openapi_validate)
    _openapi_field_rating_b = haskey(_openapi_object, "rating_b") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["rating_b"], _openapi_validate) : ABSENT
    _openapi_field_rating_c = haskey(_openapi_object, "rating_c") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["rating_c"], _openapi_validate) : ABSENT
    _openapi_field_reactive_power_flow = _decode(Float64, _required(_openapi_object, "reactive_power_flow", "Line"), _openapi_validate)
    _openapi_field_x = _decode(Float64, _required(_openapi_object, "x", "Line"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("active_power_flow","angle_limits","arc","available","b","base_power","g","id","name","parameter_units","power_units","r","rating","rating_b","rating_c","reactive_power_flow","x") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return Line(; active_power_flow = _openapi_field_active_power_flow, angle_limits = _openapi_field_angle_limits, arc = _openapi_field_arc, available = _openapi_field_available, b = _openapi_field_b, base_power = _openapi_field_base_power, g = _openapi_field_g, id = _openapi_field_id, name = _openapi_field_name, parameter_units = _openapi_field_parameter_units, power_units = _openapi_field_power_units, r = _openapi_field_r, rating = _openapi_field_rating, rating_b = _openapi_field_rating_b, rating_c = _openapi_field_rating_c, reactive_power_flow = _openapi_field_reactive_power_flow, x = _openapi_field_x, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::Line)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.active_power_flow isa Absent || (_openapi_output["active_power_flow"] = _encode(_openapi_value.active_power_flow))
    _openapi_value.angle_limits isa Absent || (_openapi_output["angle_limits"] = _encode(_openapi_value.angle_limits))
    _openapi_value.arc isa Absent || (_openapi_output["arc"] = _encode(_openapi_value.arc))
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.b isa Absent || (_openapi_output["b"] = _encode(_openapi_value.b))
    _openapi_value.base_power isa Absent || (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
    _openapi_value.g isa Absent || (_openapi_output["g"] = _encode(_openapi_value.g))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.parameter_units isa Absent || (_openapi_output["parameter_units"] = _encode(_openapi_value.parameter_units))
    _openapi_value.power_units isa Absent || (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
    _openapi_value.r isa Absent || (_openapi_output["r"] = _encode(_openapi_value.r))
    _openapi_value.rating isa Absent || (_openapi_output["rating"] = _encode(_openapi_value.rating))
    _openapi_value.rating_b isa Absent || (_openapi_output["rating_b"] = _encode(_openapi_value.rating_b))
    _openapi_value.rating_c isa Absent || (_openapi_output["rating_c"] = _encode(_openapi_value.rating_c))
    _openapi_value.reactive_power_flow isa Absent || (_openapi_output["reactive_power_flow"] = _encode(_openapi_value.reactive_power_flow))
    _openapi_value.x isa Absent || (_openapi_output["x"] = _encode(_openapi_value.x))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/Line"), _openapi_output, "encoding Line"; direction = :neutral)
end

function _form_fields(_openapi_value::Line)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.active_power_flow isa Absent || push!(_openapi_output, "active_power_flow" => _openapi_value.active_power_flow)
    _openapi_value.angle_limits isa Absent || push!(_openapi_output, "angle_limits" => _openapi_value.angle_limits)
    _openapi_value.arc isa Absent || push!(_openapi_output, "arc" => _openapi_value.arc)
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.b isa Absent || push!(_openapi_output, "b" => _openapi_value.b)
    _openapi_value.base_power isa Absent || push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.g isa Absent || push!(_openapi_output, "g" => _openapi_value.g)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.parameter_units isa Absent || push!(_openapi_output, "parameter_units" => _openapi_value.parameter_units)
    _openapi_value.power_units isa Absent || push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.r isa Absent || push!(_openapi_output, "r" => _openapi_value.r)
    _openapi_value.rating isa Absent || push!(_openapi_output, "rating" => _openapi_value.rating)
    _openapi_value.rating_b isa Absent || push!(_openapi_output, "rating_b" => _openapi_value.rating_b)
    _openapi_value.rating_c isa Absent || push!(_openapi_output, "rating_c" => _openapi_value.rating_c)
    _openapi_value.reactive_power_flow isa Absent || push!(_openapi_output, "reactive_power_flow" => _openapi_value.reactive_power_flow)
    _openapi_value.x isa Absent || push!(_openapi_output, "x" => _openapi_value.x)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
