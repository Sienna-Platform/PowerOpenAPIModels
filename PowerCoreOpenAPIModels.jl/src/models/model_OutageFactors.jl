"""
    OutageFactors

A pair of values representing planned and forced outage factors as fractions of total availability.
"""
Base.@kwdef struct OutageFactors <: APIModel
    forced::Union{Absent, Float64, Nothing} = ABSENT
    planned::Union{Absent, Float64, Nothing} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{OutageFactors}, value) = _decode(OutageFactors, value, true)
function _decode(::Type{OutageFactors}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-8b7a0b23509734856b11.json",
            pointer="/components/schemas/OutageFactors",
        ),
        _openapi_raw,
        "decoding OutageFactors";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "OutageFactors")
    _openapi_field_forced =
        haskey(_openapi_object, "forced") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["forced"],
            _openapi_validate,
        ) : ABSENT
    _openapi_field_planned =
        haskey(_openapi_object, "planned") ?
        _decode(
            Union{Absent, Float64, Nothing},
            _openapi_object["planned"],
            _openapi_validate,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("forced", "planned") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, _openapi_validate)
    end
    return OutageFactors(;
        forced=_openapi_field_forced,
        planned=_openapi_field_planned,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode(_openapi_value::OutageFactors)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.forced isa Absent ||
        (_openapi_output["forced"] = _encode(_openapi_value.forced))
    _openapi_value.planned isa Absent ||
        (_openapi_output["planned"] = _encode(_openapi_value.planned))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(
            ArgumentError(
                "additional property conflicts with declared field: " * _openapi_key,
            ),
        )
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-8b7a0b23509734856b11.json",
            pointer="/components/schemas/OutageFactors",
        ),
        _openapi_output,
        "encoding OutageFactors";
        direction=:neutral,
    )
end

function _form_fields(_openapi_value::OutageFactors)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.forced isa Absent ||
        push!(_openapi_output, "forced" => _openapi_value.forced)
    _openapi_value.planned isa Absent ||
        push!(_openapi_output, "planned" => _openapi_value.planned)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
