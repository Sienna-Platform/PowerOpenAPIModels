"""
    SwitchingSchedule

Supplemental attribute naming the time series that schedules the open or closed state of the switches it is attached to. Schedule values: 1 = closed, 0 = open.

  - `status_schedule`: Name of the time series, stored on this attribute, that carries the switch status schedule.
  - `identifier`: Optional user-supplied identifier for the schedule, such as a name or a switching plan id. Null when not set.
"""
Base.@kwdef struct SwitchingSchedule <: APIModel
    id::Int64
    status_schedule::String
    identifier::Union{Absent, Union{Nothing, String}} = ABSENT
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{SwitchingSchedule}, value) = _decode(SwitchingSchedule, value, true)
function _decode(::Type{SwitchingSchedule}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-30b5c16a897e05fb814e.json",
            pointer="",
        ),
        _openapi_raw,
        "decoding SwitchingSchedule";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "SwitchingSchedule")
    _openapi_field_id =
        _decode(Int64, _required(_openapi_object, "id", "SwitchingSchedule"), false)
    _openapi_field_status_schedule = _decode(
        String,
        _required(_openapi_object, "status_schedule", "SwitchingSchedule"),
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
        String(_openapi_key) in ("id", "status_schedule", "identifier") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return SwitchingSchedule(;
        id=_openapi_field_id,
        status_schedule=_openapi_field_status_schedule,
        identifier=_openapi_field_identifier,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::SwitchingSchedule)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.id isa Absent ||
        (_openapi_output["id"] = _encode_unvalidated(_openapi_value.id))
    _openapi_value.status_schedule isa Absent || (
        _openapi_output["status_schedule"] =
            _encode_unvalidated(_openapi_value.status_schedule)
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
_encode(_openapi_value::SwitchingSchedule) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-30b5c16a897e05fb814e.json",
        pointer="",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding SwitchingSchedule";
    direction=:neutral,
)

function _form_fields(_openapi_value::SwitchingSchedule)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.id isa Absent || push!(_openapi_output, "id" => _openapi_value.id)
    _openapi_value.status_schedule isa Absent ||
        push!(_openapi_output, "status_schedule" => _openapi_value.status_schedule)
    _openapi_value.identifier isa Absent ||
        push!(_openapi_output, "identifier" => _openapi_value.identifier)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
