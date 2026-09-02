@doc "    ValueCurve\n\nA cost or fuel curve: function data plus a declaration of how to read its y axis. `INPUT_OUTPUT` reads y as the total `f(x)`, `INCREMENTAL` as the marginal rate `f'(x)`, and `AVERAGE_RATE` as the average `f(x)/x`; the three can express the same underlying function and are inter-convertible given `initial_input`. The `TIME_SERIES_*` variants are the time-varying equivalents. Which form to use follows the data source: bid stacks are incremental, total cost tables input-output, efficiency tables average rate."
struct ValueCurve
    value::Union{AverageRateCurve,IncrementalCurve,InputOutputCurve,TimeSeriesAverageRateCurve,TimeSeriesIncrementalCurve,TimeSeriesInputOutputCurve}
end
_decode(::Type{ValueCurve}, value) = _decode(ValueCurve, value, true)
function _decode(::Type{ValueCurve}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/ValueCurve"), value, "decoding ValueCurve"; direction = :neutral)
    object = _object(value, "ValueCurve")
    tag = get(object, "curve_type", ABSENT)
    tag isa Absent || tag isa AbstractString || throw(DecodeError("discriminator value must be a string for ValueCurve"))
    selected = get(Dict(
        "AVERAGE_RATE" => (AverageRateCurve, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/AverageRateCurve")),
        "AverageRateCurve" => (AverageRateCurve, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/AverageRateCurve")),
        "INCREMENTAL" => (IncrementalCurve, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/IncrementalCurve")),
        "INPUT_OUTPUT" => (InputOutputCurve, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/InputOutputCurve")),
        "IncrementalCurve" => (IncrementalCurve, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/IncrementalCurve")),
        "InputOutputCurve" => (InputOutputCurve, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/InputOutputCurve")),
        "TIME_SERIES_AVERAGE_RATE" => (TimeSeriesAverageRateCurve, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/TimeSeriesAverageRateCurve")),
        "TIME_SERIES_INCREMENTAL" => (TimeSeriesIncrementalCurve, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/TimeSeriesIncrementalCurve")),
        "TIME_SERIES_INPUT_OUTPUT" => (TimeSeriesInputOutputCurve, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/TimeSeriesInputOutputCurve")),
        "TimeSeriesAverageRateCurve" => (TimeSeriesAverageRateCurve, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/TimeSeriesAverageRateCurve")),
        "TimeSeriesIncrementalCurve" => (TimeSeriesIncrementalCurve, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/TimeSeriesIncrementalCurve")),
        "TimeSeriesInputOutputCurve" => (TimeSeriesInputOutputCurve, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/TimeSeriesInputOutputCurve")),
    ), tag isa Absent ? "" : String(tag), nothing)
    selected === nothing && throw(DecodeError("unknown discriminator value $(repr(tag)) for ValueCurve"))
    !_openapi_validate || _schema_valid(_SPEC, selected[2], value; direction = :neutral) || throw(DecodeError("discriminator-selected schema did not validate for ValueCurve"))
    return ValueCurve(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::ValueCurve)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/ValueCurve"), output, "encoding ValueCurve"; direction = :neutral)
end
