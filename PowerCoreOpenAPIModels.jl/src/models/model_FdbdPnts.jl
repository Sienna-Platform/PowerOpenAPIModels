@doc "    FdbdPnts\n\nA pair of deadband thresholds `(fdbd1, fdbd2)` on a frequency error signal, inside which the controller does not act."
Base.@kwdef struct FdbdPnts
    fdbd1::Union{Absent,Float64,Nothing} = ABSENT
    fdbd2::Union{Absent,Float64,Nothing} = ABSENT
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{FdbdPnts}, value) = _decode(FdbdPnts, value, true)
function _decode(::Type{FdbdPnts}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/FdbdPnts"), _openapi_raw, "decoding FdbdPnts"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "FdbdPnts")
    _openapi_field_fdbd1 = haskey(_openapi_object, "fdbd1") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["fdbd1"], _openapi_validate) : ABSENT
    _openapi_field_fdbd2 = haskey(_openapi_object, "fdbd2") ? _decode(Union{Absent,Float64,Nothing}, _openapi_object["fdbd2"], _openapi_validate) : ABSENT
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("fdbd1","fdbd2") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return FdbdPnts(; fdbd1 = _openapi_field_fdbd1, fdbd2 = _openapi_field_fdbd2, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::FdbdPnts)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.fdbd1 isa Absent || (_openapi_output["fdbd1"] = _encode(_openapi_value.fdbd1))
    _openapi_value.fdbd2 isa Absent || (_openapi_output["fdbd2"] = _encode(_openapi_value.fdbd2))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/FdbdPnts"), _openapi_output, "encoding FdbdPnts"; direction = :neutral)
end

function _form_fields(_openapi_value::FdbdPnts)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.fdbd1 isa Absent || push!(_openapi_output, "fdbd1" => _openapi_value.fdbd1)
    _openapi_value.fdbd2 isa Absent || push!(_openapi_output, "fdbd2" => _openapi_value.fdbd2)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
