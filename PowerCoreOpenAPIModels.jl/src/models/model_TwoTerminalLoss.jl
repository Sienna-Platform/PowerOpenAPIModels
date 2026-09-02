@doc "    TwoTerminalLoss\n\nLoss model of a two-terminal HVDC line as a function of flow, selected by `curve_type`. It accepts a linear model with a constant loss and a proportional loss rate (MW of loss per MW of flow), or a piecewise model giving different proportional losses on different flow segments."
struct TwoTerminalLoss
    value::Union{IncrementalCurve,InputOutputCurve}
end
_decode(::Type{TwoTerminalLoss}, value) = _decode(TwoTerminalLoss, value, true)
function _decode(::Type{TwoTerminalLoss}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/TwoTerminalLoss"), value, "decoding TwoTerminalLoss"; direction = :neutral)
    object = _object(value, "TwoTerminalLoss")
    tag = get(object, "curve_type", ABSENT)
    tag isa Absent || tag isa AbstractString || throw(DecodeError("discriminator value must be a string for TwoTerminalLoss"))
    selected = get(Dict(
        "INCREMENTAL" => (IncrementalCurve, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/IncrementalCurve")),
        "INPUT_OUTPUT" => (InputOutputCurve, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/InputOutputCurve")),
        "IncrementalCurve" => (IncrementalCurve, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/IncrementalCurve")),
        "InputOutputCurve" => (InputOutputCurve, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/InputOutputCurve")),
    ), tag isa Absent ? "" : String(tag), nothing)
    selected === nothing && throw(DecodeError("unknown discriminator value $(repr(tag)) for TwoTerminalLoss"))
    !_openapi_validate || _schema_valid(_SPEC, selected[2], value; direction = :neutral) || throw(DecodeError("discriminator-selected schema did not validate for TwoTerminalLoss"))
    return TwoTerminalLoss(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::TwoTerminalLoss)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/TwoTerminalLoss"), output, "encoding TwoTerminalLoss"; direction = :neutral)
end
