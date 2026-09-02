@doc "    ColocatedSupplyStorageTechnologyCapitalCostsSolar\n\nCapital costs for investing in a solar technology. Units: USD/MW."
struct ColocatedSupplyStorageTechnologyCapitalCostsSolar
    value::Union{AverageRateCurve,IncrementalCurve,InputOutputCurve,TimeSeriesAverageRateCurve,TimeSeriesIncrementalCurve,TimeSeriesInputOutputCurve}
end
_decode(::Type{ColocatedSupplyStorageTechnologyCapitalCostsSolar}, value) = _decode(ColocatedSupplyStorageTechnologyCapitalCostsSolar, value, true)
function _decode(::Type{ColocatedSupplyStorageTechnologyCapitalCostsSolar}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/ColocatedSupplyStorageTechnology/properties/capital_costs_solar"), value, "decoding ColocatedSupplyStorageTechnologyCapitalCostsSolar"; direction = :neutral)
    object = _object(value, "ColocatedSupplyStorageTechnologyCapitalCostsSolar")
    tag = get(object, "curve_type", ABSENT)
    tag isa Absent || tag isa AbstractString || throw(DecodeError("discriminator value must be a string for ColocatedSupplyStorageTechnologyCapitalCostsSolar"))
    selected = get(Dict(
        "AVERAGE_RATE" => (AverageRateCurve, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/AverageRateCurve")),
        "AverageRateCurve" => (AverageRateCurve, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/AverageRateCurve")),
        "INCREMENTAL" => (IncrementalCurve, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/IncrementalCurve")),
        "INPUT_OUTPUT" => (InputOutputCurve, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/InputOutputCurve")),
        "IncrementalCurve" => (IncrementalCurve, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/IncrementalCurve")),
        "InputOutputCurve" => (InputOutputCurve, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/InputOutputCurve")),
        "TIME_SERIES_AVERAGE_RATE" => (TimeSeriesAverageRateCurve, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/TimeSeriesAverageRateCurve")),
        "TIME_SERIES_INCREMENTAL" => (TimeSeriesIncrementalCurve, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/TimeSeriesIncrementalCurve")),
        "TIME_SERIES_INPUT_OUTPUT" => (TimeSeriesInputOutputCurve, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/TimeSeriesInputOutputCurve")),
        "TimeSeriesAverageRateCurve" => (TimeSeriesAverageRateCurve, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/TimeSeriesAverageRateCurve")),
        "TimeSeriesIncrementalCurve" => (TimeSeriesIncrementalCurve, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/TimeSeriesIncrementalCurve")),
        "TimeSeriesInputOutputCurve" => (TimeSeriesInputOutputCurve, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/TimeSeriesInputOutputCurve")),
    ), tag isa Absent ? "" : String(tag), nothing)
    selected === nothing && throw(DecodeError("unknown discriminator value $(repr(tag)) for ColocatedSupplyStorageTechnologyCapitalCostsSolar"))
    !_openapi_validate || _schema_valid(_SPEC, selected[2], value; direction = :neutral) || throw(DecodeError("discriminator-selected schema did not validate for ColocatedSupplyStorageTechnologyCapitalCostsSolar"))
    return ColocatedSupplyStorageTechnologyCapitalCostsSolar(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::ColocatedSupplyStorageTechnologyCapitalCostsSolar)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-4643c51d11717913e8d0.json", pointer = "/components/schemas/ColocatedSupplyStorageTechnology/properties/capital_costs_solar"), output, "encoding ColocatedSupplyStorageTechnologyCapitalCostsSolar"; direction = :neutral)
end
