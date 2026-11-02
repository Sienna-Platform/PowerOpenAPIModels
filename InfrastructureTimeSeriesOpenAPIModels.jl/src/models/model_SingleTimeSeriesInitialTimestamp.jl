"""
    SingleTimeSeriesInitialTimestamp

First timestamp of the regular grid; every later step lands at `initial_timestamp + k * resolution`. The store's floor is one millisecond, matching Julia's millisecond-precision DateTime. Written in one of two RFC 3339 forms, with at most 3 fractional-second digits: `date-time`, with `Z` or a UTC offset, names an instant; `date-time-local`, with no offset, is a wall clock and names no instant. `time_reference` fixes the form: `zoneless` requires `date-time-local`, `utc` requires a zero offset, and a fixed offset or an IANA zone requires `date-time`. With no `time_reference`, either form is accepted and none is assumed.
"""
struct SingleTimeSeriesInitialTimestamp <: OneOfAPIModel
    value::Union{Dates.DateTime, TimeZones.ZonedDateTime}
end
_decode(::Type{SingleTimeSeriesInitialTimestamp}, value) =
    _decode(SingleTimeSeriesInitialTimestamp, value, true)
function _decode(::Type{SingleTimeSeriesInitialTimestamp}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-9cca8c1ccce0c31208c1.json",
            pointer="/properties/initial_timestamp",
        ),
        value,
        "decoding SingleTimeSeriesInitialTimestamp";
        direction=:neutral,
    )
    matches = Any[]
    if _schema_valid(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-9cca8c1ccce0c31208c1.json",
            pointer="/properties/initial_timestamp/anyOf/0",
        ),
        value;
        direction=:neutral,
    )
        try
            push!(matches, _decode_zoned(TimeZones.ZonedDateTime, value, false))
        catch error
            error isa DecodeError || rethrow()
        end
    end
    if _schema_valid(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-9cca8c1ccce0c31208c1.json",
            pointer="/properties/initial_timestamp/anyOf/1",
        ),
        value;
        direction=:neutral,
    )
        try
            push!(matches, _decode_zoned(Dates.DateTime, value, false))
        catch error
            error isa DecodeError || rethrow()
        end
    end
    isempty(matches) && throw(
        DecodeError(
            "anyOf value did not select a variant of SingleTimeSeriesInitialTimestamp",
        ),
    )
    return SingleTimeSeriesInitialTimestamp(first(matches))
end
function _encode_unvalidated(value::SingleTimeSeriesInitialTimestamp)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::SingleTimeSeriesInitialTimestamp) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-9cca8c1ccce0c31208c1.json",
        pointer="/properties/initial_timestamp",
    ),
    _encode_unvalidated(value),
    "encoding SingleTimeSeriesInitialTimestamp";
    direction=:neutral,
)
