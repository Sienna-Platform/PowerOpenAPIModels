@doc "    RECurrentControlBIqinjLim\n\nLimits for Iqinj `(I_qh1, I_ql1)`."
Base.@kwdef struct RECurrentControlBIqinjLim
    max::Union{Absent,Float64,Nothing} = ABSENT
    min::Union{Absent,Float64,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{RECurrentControlBIqinjLim}, value) = _decode(RECurrentControlBIqinjLim, value, true)
function _decode(::Type{RECurrentControlBIqinjLim}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-832ddeca7e6e67b0c295.json", pointer = "/components/schemas/RECurrentControlB/properties/Iqinj_lim"), _openapi_raw, "decoding RECurrentControlBIqinjLim"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "RECurrentControlBIqinjLim")
    _openapi_field_max = haskey(_openapi_object, "max") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["max"], _openapi_validate) : ABSENT
    _openapi_field_min = haskey(_openapi_object, "min") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["min"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("max","min") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return RECurrentControlBIqinjLim(; max = _openapi_field_max, min = _openapi_field_min, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::RECurrentControlBIqinjLim)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.max isa Absent || (_openapi_output["max"] = _encode(_openapi_value.max))
    _openapi_value.min isa Absent || (_openapi_output["min"] = _encode(_openapi_value.min))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-832ddeca7e6e67b0c295.json", pointer = "/components/schemas/RECurrentControlB/properties/Iqinj_lim"), _openapi_output, "encoding RECurrentControlBIqinjLim"; direction = :neutral)
end

function _form_fields(_openapi_value::RECurrentControlBIqinjLim)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.max isa Absent || push!(_openapi_output, "max" => _openapi_value.max)
    _openapi_value.min isa Absent || push!(_openapi_output, "min" => _openapi_value.min)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
