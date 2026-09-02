@doc "    TwoTerminalGenericHVDCLineLoss\n\nLoss model coefficients. It accepts a linear model with a constant loss and a proportional loss rate (MW of loss per MW of flow). It also accepts a Piecewise loss, with N segments to specify different proportional losses for different segments."
struct TwoTerminalGenericHVDCLineLoss
    value::Union{IncrementalCurve,InputOutputCurve}
end
_decode(::Type{TwoTerminalGenericHVDCLineLoss}, value) = _decode(TwoTerminalGenericHVDCLineLoss, value, true)
function _decode(::Type{TwoTerminalGenericHVDCLineLoss}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalGenericHVDCLine/properties/loss"), value, "decoding TwoTerminalGenericHVDCLineLoss"; direction = :neutral)
    object = _object(value, "TwoTerminalGenericHVDCLineLoss")
    tag = get(object, "curve_type", ABSENT)
    tag isa Absent || tag isa AbstractString || throw(DecodeError("discriminator value must be a string for TwoTerminalGenericHVDCLineLoss"))
    selected = get(Dict(
        "INCREMENTAL" => (IncrementalCurve, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/IncrementalCurve")),
        "INPUT_OUTPUT" => (InputOutputCurve, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/InputOutputCurve")),
        "IncrementalCurve" => (IncrementalCurve, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/IncrementalCurve")),
        "InputOutputCurve" => (InputOutputCurve, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/InputOutputCurve")),
    ), tag isa Absent ? "" : String(tag), nothing)
    selected === nothing && throw(DecodeError("unknown discriminator value $(repr(tag)) for TwoTerminalGenericHVDCLineLoss"))
    !_openapi_validate || _schema_valid(_SPEC, selected[2], value; direction = :neutral) || throw(DecodeError("discriminator-selected schema did not validate for TwoTerminalGenericHVDCLineLoss"))
    return TwoTerminalGenericHVDCLineLoss(_decode(selected[1], value, _openapi_validate))
end
function _encode(value::TwoTerminalGenericHVDCLineLoss)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/TwoTerminalGenericHVDCLine/properties/loss"), output, "encoding TwoTerminalGenericHVDCLineLoss"; direction = :neutral)
end
