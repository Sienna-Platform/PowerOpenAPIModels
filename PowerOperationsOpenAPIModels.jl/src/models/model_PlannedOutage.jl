"""
    PlannedOutage

Supplemental attribute describing outages that are scheduled in advance, naming the time series that carries the schedule. Schedule values: 1 = out of service, 0 = in service.

  - `identifier`: Optional user-supplied identifier for the outage, such as a name or a block id. Null when not set.
"""
Base.@kwdef struct PlannedOutage <: APIModel
    id::Int64
    outage_schedule::String
    identifier::Union{Absent, Union{Nothing, String}} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{PlannedOutage}, value) = _decode(PlannedOutage, value, true)
function _decode(::Type{PlannedOutage}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-4acd7db136246c1aee10.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding PlannedOutage";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "PlannedOutage")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "PlannedOutage"), false)
    _openapi_field_outage_schedule = _decode(
        String,
        _required(_openapi_object, "outage_schedule", "PlannedOutage"),
        false,
    )
    _openapi_field_identifier =
        haskey(_openapi_object, "identifier") ?
        _decode(
            Union{Absent, Union{Nothing, String}},
            _openapi_object["identifier"],
            false,
        ) : ABSENT
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("id", "outage_schedule", "identifier") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return PlannedOutage(;
        id=_openapi_field_id,
        outage_schedule=_openapi_field_outage_schedule,
        identifier=_openapi_field_identifier,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::PlannedOutage)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.outage_schedule isa Absent || (
        _openapi_output["outage_schedule"] =
            _encode_unvalidated(_openapi_value.outage_schedule)
    )
    _openapi_value.identifier isa Absent ||
        (_openapi_output["identifier"] = _encode_unvalidated(_openapi_value.identifier))
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
_encode(_openapi_value::PlannedOutage) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-4acd7db136246c1aee10.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding PlannedOutage";
    direction=:neutral,
)

function _form_fields(_openapi_value::PlannedOutage)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.outage_schedule isa Absent ||
        push!(_openapi_output, "outage_schedule" => _openapi_value.outage_schedule)
    _openapi_value.identifier isa Absent ||
        push!(_openapi_output, "identifier" => _openapi_value.identifier)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
