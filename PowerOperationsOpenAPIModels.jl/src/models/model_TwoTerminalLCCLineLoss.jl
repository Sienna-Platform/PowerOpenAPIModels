@doc "    TwoTerminalLCCLineLoss\n\nA generic loss model coefficients. It accepts a linear model with a constant loss and a proportional loss rate (MW of loss per MW of flow). It also accepts a Piecewise loss, with N segments to specify different proportional losses for different segments."
struct TwoTerminalLCCLineLoss
    value::Union{IncrementalCurve,InputOutputCurve}
end
_decode(::Type{TwoTerminalLCCLineLoss}, value) = _decode(TwoTerminalLCCLineLoss, value, true)
function _decode(::Type{TwoTerminalLCCLineLoss}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalLCCLine/properties/loss"), value, "decoding TwoTerminalLCCLineLoss"; direction = :neutral)
    object = _object(value, "TwoTerminalLCCLineLoss")
    tag = get(object, "curve_type", ABSENT)
    tag isa Absent || tag isa AbstractString || throw(DecodeError("discriminator value must be a string for TwoTerminalLCCLineLoss"))
    selected = get(Dict(
        "INCREMENTAL" => (IncrementalCurve, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/IncrementalCurve")),
        "INPUT_OUTPUT" => (InputOutputCurve, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/InputOutputCurve")),
        "IncrementalCurve" => (IncrementalCurve, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/IncrementalCurve")),
        "InputOutputCurve" => (InputOutputCurve, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/InputOutputCurve")),
    ), tag isa Absent ? "" : String(tag), nothing)
    selected === nothing && throw(DecodeError("unknown discriminator value $(repr(tag)) for TwoTerminalLCCLineLoss"))
    !_openapi_validate || _schema_valid(_SPEC, selected[2], value; direction = :neutral) || throw(DecodeError("discriminator-selected schema did not validate for TwoTerminalLCCLineLoss"))
    return TwoTerminalLCCLineLoss(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::TwoTerminalLCCLineLoss)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalLCCLine/properties/loss"), output, "encoding TwoTerminalLCCLineLoss"; direction = :neutral)
end
