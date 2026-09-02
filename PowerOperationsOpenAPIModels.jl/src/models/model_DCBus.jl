@doc "    DCBus\n\nA DC bus.\n\n- `area`: ID of the area containing the DC bus.\n- `available`: Indicator of whether the component is connected and online (`true`) or disconnected, offline, or down (`false`). Unavailable components are excluded during simulations.\n- `base_voltage`: The base voltage. in psy5 a required param with an option to be nothing Units: kV.\n- `id`: Unique integer identifier for this component.\n- `load_zone`: ID of the load zone containing the DC bus.\n- `magnitude`: Voltage as a multiple of `base_voltage`. in psy5 a required param with an option to be nothing Units: pu.\n- `name`: Name of the component. Components of the same type (e.g., `PowerLoad`) must have unique names, but components of different types (e.g., `PowerLoad` and `ACBus`) can have the same name.\n- `number`: A unique bus identification number (positive integer).\n- `voltage_limits`: Limits on the voltage variation as multiples of `base_voltage`. in psy5 a required param with an option to be nothing Units: pu."
Base.@kwdef struct DCBus
    area::Union{Absent,Int64,Nothing} = ABSENT
    available::Bool
    base_voltage::Union{Absent,Float64,Nothing} = ABSENT
    id::Int64
    load_zone::Union{Absent,Int64,Nothing} = ABSENT
    magnitude::Union{Absent,Float64,Nothing} = ABSENT
    name::String
    number::Float64
    voltage_limits::Union{Absent,DCBusVoltageLimits,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{DCBus}, value) = _decode(DCBus, value, true)
function _decode(::Type{DCBus}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/DCBus"), _openapi_raw, "decoding DCBus"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "DCBus")
    _openapi_field_area = haskey(_openapi_object, "area") ? _decode(Union{Absent,Int64,Nothing}, _openapi_object["area"], _openapi_validate) : ABSENT
    _openapi_field_available = _decode(Bool, _required(_openapi_object, "available", "DCBus"), _openapi_validate)
    _openapi_field_base_voltage = haskey(_openapi_object, "base_voltage") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["base_voltage"], _openapi_validate) : ABSENT
    _openapi_field_id = _decode(Int64, _required(_openapi_object, "id", "DCBus"), _openapi_validate)
    _openapi_field_load_zone = haskey(_openapi_object, "load_zone") ? _decode(Union{Absent,Int64,Nothing}, _openapi_object["load_zone"], _openapi_validate) : ABSENT
    _openapi_field_magnitude = haskey(_openapi_object, "magnitude") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["magnitude"], _openapi_validate) : ABSENT
    _openapi_field_name = _decode(String, _required(_openapi_object, "name", "DCBus"), _openapi_validate)
    _openapi_field_number = _decode(Float64, _required(_openapi_object, "number", "DCBus"), _openapi_validate)
    _openapi_field_voltage_limits = haskey(_openapi_object, "voltage_limits") ? _decode(Union{Absent,DCBusVoltageLimits,Nothing}, _openapi_object["voltage_limits"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("area","available","base_voltage","id","load_zone","magnitude","name","number","voltage_limits") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return DCBus(; area = _openapi_field_area, available = _openapi_field_available, base_voltage = _openapi_field_base_voltage, id = _openapi_field_id, load_zone = _openapi_field_load_zone, magnitude = _openapi_field_magnitude, name = _openapi_field_name, number = _openapi_field_number, voltage_limits = _openapi_field_voltage_limits, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::DCBus)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.area isa Absent || (_openapi_output["area"] = _encode(_openapi_value.area))
    _openapi_value.available isa Absent || (_openapi_output["available"] = _encode(_openapi_value.available))
    _openapi_value.base_voltage isa Absent || (_openapi_output["base_voltage"] = _encode(_openapi_value.base_voltage))
    _openapi_value.id isa Absent || (_openapi_output["id"] = _encode(_openapi_value.id))
    _openapi_value.load_zone isa Absent || (_openapi_output["load_zone"] = _encode(_openapi_value.load_zone))
    _openapi_value.magnitude isa Absent || (_openapi_output["magnitude"] = _encode(_openapi_value.magnitude))
    _openapi_value.name isa Absent || (_openapi_output["name"] = _encode(_openapi_value.name))
    _openapi_value.number isa Absent || (_openapi_output["number"] = _encode(_openapi_value.number))
    _openapi_value.voltage_limits isa Absent || (_openapi_output["voltage_limits"] = _encode(_openapi_value.voltage_limits))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/DCBus"), _openapi_output, "encoding DCBus"; direction = :neutral)
end

function _form_fields(_openapi_value::DCBus)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.area isa Absent || push!(_openapi_output, "area" => _openapi_value.area)
    _openapi_value.available isa Absent || push!(_openapi_output, "available" => _openapi_value.available)
    _openapi_value.base_voltage isa Absent || push!(_openapi_output, "base_voltage" => _openapi_value.base_voltage)
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.load_zone isa Absent || push!(_openapi_output, "load_zone" => _openapi_value.load_zone)
    _openapi_value.magnitude isa Absent || push!(_openapi_output, "magnitude" => _openapi_value.magnitude)
    _openapi_value.name isa Absent || push!(_openapi_output, "name" => _openapi_value.name)
    _openapi_value.number isa Absent || push!(_openapi_output, "number" => _openapi_value.number)
    _openapi_value.voltage_limits isa Absent || push!(_openapi_output, "voltage_limits" => _openapi_value.voltage_limits)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
