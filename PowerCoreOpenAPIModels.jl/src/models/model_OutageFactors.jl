"""
    OutageFactors

A pair of values representing planned and forced outage factors as fractions of total availability.
"""
Base.@kwdef struct OutageFactors <: APIModel
    planned::Union{Absent, Float64, Nothing} = ABSENT
    forced::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{OutageFactors}, value) = _decode(OutageFactors, value, true)
function _decode(::Type{OutageFactors}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/OutageFactors",
        ),
        _openapi_raw,
        "decoding OutageFactors";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "OutageFactors")
    _openapi_field_planned =
        haskey(_openapi_object, "planned") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["planned"], false) : ABSENT
    _openapi_field_forced =
        haskey(_openapi_object, "forced") ?
        _decode(Union{Absent, Float64, Nothing}, _openapi_object["forced"], false) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("planned", "forced") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return OutageFactors(;
        planned=_openapi_field_planned,
        forced=_openapi_field_forced,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::OutageFactors)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.planned isa Absent ||
        (_openapi_output["planned"] = _encode_unvalidated(_openapi_value.planned))
    _openapi_value.forced isa Absent ||
        (_openapi_output["forced"] = _encode_unvalidated(_openapi_value.forced))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(
            ArgumentError(
                "additional property conflicts with declared field: " * _openapi_key,
            ),
        )
        _openapi_output[_openapi_key] = _encode_unvalidated(_openapi_item)
    end
    return _openapi_output
end
_encode(_openapi_value::OutageFactors) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
        pointer="/\$defs/OutageFactors",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding OutageFactors";
    direction=:neutral,
)

function _form_fields(_openapi_value::OutageFactors)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.planned isa Absent ||
        push!(_openapi_output, "planned" => _openapi_value.planned)
    _openapi_value.forced isa Absent ||
        push!(_openapi_output, "forced" => _openapi_value.forced)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
