@doc "    MonitoredLineB\n\nShunt susceptance, specified both on the `from` and `to` ends of the line. These are commonly modeled with the same value. Units: per parameter_units — NATURAL_UNITS: S, COMPONENT_BASE: pu ."
Base.@kwdef struct MonitoredLineB
    from::Union{Absent,Float64,Nothing} = ABSENT
    to::Union{Absent,Float64,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{MonitoredLineB}, value) = _decode(MonitoredLineB, value, true)
function _decode(::Type{MonitoredLineB}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/MonitoredLine/properties/b"), _openapi_raw, "decoding MonitoredLineB"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "MonitoredLineB")
    _openapi_field_from = haskey(_openapi_object, "from") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["from"], _openapi_validate) : ABSENT
    _openapi_field_to = haskey(_openapi_object, "to") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["to"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("from","to") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return MonitoredLineB(; from = _openapi_field_from, to = _openapi_field_to, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::MonitoredLineB)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.from isa Absent || (_openapi_output["from"] = _encode(_openapi_value.from))
    _openapi_value.to isa Absent || (_openapi_output["to"] = _encode(_openapi_value.to))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/MonitoredLine/properties/b"), _openapi_output, "encoding MonitoredLineB"; direction = :neutral)
end

function _form_fields(_openapi_value::MonitoredLineB)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.from isa Absent || push!(_openapi_output, "from" => _openapi_value.from)
    _openapi_value.to isa Absent || push!(_openapi_output, "to" => _openapi_value.to)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
