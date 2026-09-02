@doc "    FromToToFrom\n\nA pair of values for a directed edge, one for each orientation: `from_to` and `to_from`. The two are carried separately because the quantity need not be equal in the two directions."
Base.@kwdef struct FromToToFrom
    from_to::Union{Absent,Float64,Nothing} = ABSENT
    to_from::Union{Absent,Float64,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{FromToToFrom}, value) = _decode(FromToToFrom, value, true)
function _decode(::Type{FromToToFrom}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/FromTo_ToFrom"), _openapi_raw, "decoding FromToToFrom"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "FromToToFrom")
    _openapi_field_from_to = haskey(_openapi_object, "from_to") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["from_to"], _openapi_validate) : ABSENT
    _openapi_field_to_from = haskey(_openapi_object, "to_from") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["to_from"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("from_to","to_from") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return FromToToFrom(; from_to = _openapi_field_from_to, to_from = _openapi_field_to_from, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::FromToToFrom)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.from_to isa Absent || (_openapi_output["from_to"] = _encode(_openapi_value.from_to))
    _openapi_value.to_from isa Absent || (_openapi_output["to_from"] = _encode(_openapi_value.to_from))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/FromTo_ToFrom"), _openapi_output, "encoding FromToToFrom"; direction = :neutral)
end

function _form_fields(_openapi_value::FromToToFrom)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.from_to isa Absent || push!(_openapi_output, "from_to" => _openapi_value.from_to)
    _openapi_value.to_from isa Absent || push!(_openapi_output, "to_from" => _openapi_value.to_from)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
