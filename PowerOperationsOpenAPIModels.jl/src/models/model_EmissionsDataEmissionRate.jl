@doc "    EmissionsDataEmissionRate\n\nEmission rate as a ValueCurve, typically an IncrementalCurve with LinearFunctionData (constant or linearly varying rate) or PiecewiseStepData (piecewise step rates). Rates must be non-negative and finite."
struct EmissionsDataEmissionRate
    value::Union{AverageRateCurve,IncrementalCurve,InputOutputCurve,TimeSeriesAverageRateCurve,TimeSeriesIncrementalCurve,TimeSeriesInputOutputCurve}
end
_decode(::Type{EmissionsDataEmissionRate}, value) = _decode(EmissionsDataEmissionRate, value, true)
function _decode(::Type{EmissionsDataEmissionRate}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/EmissionsData/properties/emission_rate"), value, "decoding EmissionsDataEmissionRate"; direction = :neutral)
    object = _object(value, "EmissionsDataEmissionRate")
    tag = get(object, "curve_type", ABSENT)
    tag isa Absent || tag isa AbstractString || throw(DecodeError("discriminator value must be a string for EmissionsDataEmissionRate"))
    selected = get(Dict(
        "AVERAGE_RATE" => (AverageRateCurve, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/AverageRateCurve")),
        "AverageRateCurve" => (AverageRateCurve, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/AverageRateCurve")),
        "INCREMENTAL" => (IncrementalCurve, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/IncrementalCurve")),
        "INPUT_OUTPUT" => (InputOutputCurve, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/InputOutputCurve")),
        "IncrementalCurve" => (IncrementalCurve, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/IncrementalCurve")),
        "InputOutputCurve" => (InputOutputCurve, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/InputOutputCurve")),
        "TIME_SERIES_AVERAGE_RATE" => (TimeSeriesAverageRateCurve, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TimeSeriesAverageRateCurve")),
        "TIME_SERIES_INCREMENTAL" => (TimeSeriesIncrementalCurve, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TimeSeriesIncrementalCurve")),
        "TIME_SERIES_INPUT_OUTPUT" => (TimeSeriesInputOutputCurve, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TimeSeriesInputOutputCurve")),
        "TimeSeriesAverageRateCurve" => (TimeSeriesAverageRateCurve, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TimeSeriesAverageRateCurve")),
        "TimeSeriesIncrementalCurve" => (TimeSeriesIncrementalCurve, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TimeSeriesIncrementalCurve")),
        "TimeSeriesInputOutputCurve" => (TimeSeriesInputOutputCurve, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TimeSeriesInputOutputCurve")),
    ), tag isa Absent ? "" : String(tag), nothing)
    selected === nothing && throw(DecodeError("unknown discriminator value $(repr(tag)) for EmissionsDataEmissionRate"))
    !_openapi_validate || _schema_valid(_SPEC, selected[2], value; direction = :neutral) || throw(DecodeError("discriminator-selected schema did not validate for EmissionsDataEmissionRate"))
    return EmissionsDataEmissionRate(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::EmissionsDataEmissionRate)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/EmissionsData/properties/emission_rate"), output, "encoding EmissionsDataEmissionRate"; direction = :neutral)
end
