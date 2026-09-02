@doc "    HydroReservoirHeadToVolumeFactor\n\n`FunctionData` mapping reservoir head to stored volume."
struct HydroReservoirHeadToVolumeFactor
    value::Union{LinearFunctionData,PiecewiseLinearData,PiecewiseStepData,QuadraticFunctionData,TimeSeriesLinearFunctionData,TimeSeriesPiecewiseLinearData,TimeSeriesPiecewiseStepData,TimeSeriesQuadraticFunctionData}
end
_decode(::Type{HydroReservoirHeadToVolumeFactor}, value) = _decode(HydroReservoirHeadToVolumeFactor, value, true)
function _decode(::Type{HydroReservoirHeadToVolumeFactor}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/HydroReservoir/properties/head_to_volume_factor"), value, "decoding HydroReservoirHeadToVolumeFactor"; direction = :neutral)
    object = _object(value, "HydroReservoirHeadToVolumeFactor")
    tag = get(object, "function_type", ABSENT)
    tag isa Absent || tag isa AbstractString || throw(DecodeError("discriminator value must be a string for HydroReservoirHeadToVolumeFactor"))
    selected = get(Dict(
        "LINEAR" => (LinearFunctionData, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/LinearFunctionData")),
        "LinearFunctionData" => (LinearFunctionData, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/LinearFunctionData")),
        "PIECEWISE_LINEAR" => (PiecewiseLinearData, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/PiecewiseLinearData")),
        "PIECEWISE_STEP" => (PiecewiseStepData, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/PiecewiseStepData")),
        "PiecewiseLinearData" => (PiecewiseLinearData, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/PiecewiseLinearData")),
        "PiecewiseStepData" => (PiecewiseStepData, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/PiecewiseStepData")),
        "QUADRATIC" => (QuadraticFunctionData, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/QuadraticFunctionData")),
        "QuadraticFunctionData" => (QuadraticFunctionData, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/QuadraticFunctionData")),
        "TIME_SERIES_LINEAR" => (TimeSeriesLinearFunctionData, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TimeSeriesLinearFunctionData")),
        "TIME_SERIES_PIECEWISE_LINEAR" => (TimeSeriesPiecewiseLinearData, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TimeSeriesPiecewiseLinearData")),
        "TIME_SERIES_PIECEWISE_STEP" => (TimeSeriesPiecewiseStepData, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TimeSeriesPiecewiseStepData")),
        "TIME_SERIES_QUADRATIC" => (TimeSeriesQuadraticFunctionData, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TimeSeriesQuadraticFunctionData")),
        "TimeSeriesLinearFunctionData" => (TimeSeriesLinearFunctionData, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TimeSeriesLinearFunctionData")),
        "TimeSeriesPiecewiseLinearData" => (TimeSeriesPiecewiseLinearData, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TimeSeriesPiecewiseLinearData")),
        "TimeSeriesPiecewiseStepData" => (TimeSeriesPiecewiseStepData, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TimeSeriesPiecewiseStepData")),
        "TimeSeriesQuadraticFunctionData" => (TimeSeriesQuadraticFunctionData, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/TimeSeriesQuadraticFunctionData")),
    ), tag isa Absent ? "" : String(tag), nothing)
    selected === nothing && throw(DecodeError("unknown discriminator value $(repr(tag)) for HydroReservoirHeadToVolumeFactor"))
    !_openapi_validate || _schema_valid(_SPEC, selected[2], value; direction = :neutral) || throw(DecodeError("discriminator-selected schema did not validate for HydroReservoirHeadToVolumeFactor"))
    return HydroReservoirHeadToVolumeFactor(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::HydroReservoirHeadToVolumeFactor)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/HydroReservoir/properties/head_to_volume_factor"), output, "encoding HydroReservoirHeadToVolumeFactor"; direction = :neutral)
end
