@doc "    Area\n\nA collection of buses for control purposes. The `Area` can be specified when defining each `ACBus` or `DCBus` in the area.\n\n- `base_power`: System base power for per-unitization of this component's per-unit fields, recorded per component in lieu of a system-level table. Units: MVA.\n- `id`: Unique integer identifier for this component.\n- `load_response`: Load-frequency damping parameter modeling how much the load in the area changes due to changes in frequency. Units: MW/Hz.\n- `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.\n- `peak_active_power`: Peak active power in the area. Units: per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .\n- `peak_reactive_power`: Peak reactive power in the area. Units: per power_units — NATURAL_UNITS: MVAr, COMPONENT_BASE: pu .\n- `power_units`: Unit basis for this component's power-family fields (active/reactive/apparent power, ratings, limits, ramp rates). COMPONENT_BASE: per unit on this component's own base_power. NATURAL_UNITS: the field's physical unit."
Base.@kwdef struct Area
    base_power::Float64
    id::Int64
    load_response::Union{Absent,Float64,Nothing} = ABSENT
    name::String
    peak_active_power::Union{Absent,Float64,Nothing} = ABSENT
    peak_reactive_power::Union{Absent,Float64,Nothing} = ABSENT
    power_units::AreaPowerUnits
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{Area}, value) = _decode(Area, value, true)
function _decode(::Type{Area}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/Area"), _openapi_raw, "decoding Area"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "Area")
    _openapi_field_base_power = _decode(Float64, _required(_openapi_object, "base_power", "Area"), _openapi_validate)
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "Area"), _openapi_validate)
    _openapi_field_load_response = haskey(_openapi_object, "load_response") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["load_response"], _openapi_validate) : ABSENT
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "Area"), _openapi_validate)
    _openapi_field_peak_active_power = haskey(_openapi_object, "peak_active_power") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["peak_active_power"], _openapi_validate) : ABSENT
    _openapi_field_peak_reactive_power = haskey(_openapi_object, "peak_reactive_power") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["peak_reactive_power"], _openapi_validate) : ABSENT
    _openapi_field_power_units = _decode(AreaPowerUnits, _required(_openapi_object, "power_units", "Area"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("base_power","id","load_response","name","peak_active_power","peak_reactive_power","power_units") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return Area(; base_power = _openapi_field_base_power, id = _openapi_field_id, load_response = _openapi_field_load_response, name = _openapi_field_name, peak_active_power = _openapi_field_peak_active_power, peak_reactive_power = _openapi_field_peak_reactive_power, power_units = _openapi_field_power_units, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::Area)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.base_power isa Absent || (_openapi_output["base_power"] = _encode(_openapi_value.base_power))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.load_response isa Absent || (_openapi_output["load_response"] = _encode(_openapi_value.load_response))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.peak_active_power isa Absent || (_openapi_output["peak_active_power"] = _encode(_openapi_value.peak_active_power))
    _openapi_value.peak_reactive_power isa Absent || (_openapi_output["peak_reactive_power"] = _encode(_openapi_value.peak_reactive_power))
    _openapi_value.power_units isa Absent || (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/Area"), _openapi_output, "encoding Area"; direction = :neutral)
end

function _form_fields(_openapi_value::Area)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.base_power isa Absent || push!(_openapi_output, "base_power" => _openapi_value.base_power)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.load_response isa Absent || push!(_openapi_output, "load_response" => _openapi_value.load_response)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.peak_active_power isa Absent || push!(_openapi_output, "peak_active_power" => _openapi_value.peak_active_power)
    _openapi_value.peak_reactive_power isa Absent || push!(_openapi_output, "peak_reactive_power" => _openapi_value.peak_reactive_power)
    _openapi_value.power_units isa Absent || push!(_openapi_output, "power_units" => _openapi_value.power_units)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
