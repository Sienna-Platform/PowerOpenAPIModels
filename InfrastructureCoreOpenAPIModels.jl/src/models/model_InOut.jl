@doc "    InOut\n\nA pair of values, one for the inbound (`in`) and one for the outbound (`out`) direction of a quantity."
Base.@kwdef struct InOut
    in::Union{Absent,Float64,Nothing} = ABSENT
    out::Union{Absent,Float64,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{InOut}, value) = _decode(InOut, value, true)
function _decode(::Type{InOut}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/InOut"), _openapi_raw, "decoding InOut"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "InOut")
    _openapi_field_in = haskey(_openapi_object, "in") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["in"], _openapi_validate) : ABSENT
    _openapi_field_out = haskey(_openapi_object, "out") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["out"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("in","out") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return InOut(; in = _openapi_field_in, out = _openapi_field_out, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::InOut)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.in isa Absent || (_openapi_output["in"] = _encode(_openapi_value.in))
    _openapi_value.out isa Absent || (_openapi_output["out"] = _encode(_openapi_value.out))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/InOut"), _openapi_output, "encoding InOut"; direction = :neutral)
end

function _form_fields(_openapi_value::InOut)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.in isa Absent || push!(_openapi_output, "in" => _openapi_value.in)
    _openapi_value.out isa Absent || push!(_openapi_output, "out" => _openapi_value.out)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
