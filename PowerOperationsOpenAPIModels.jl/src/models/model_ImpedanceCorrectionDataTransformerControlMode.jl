struct ImpedanceCorrectionDataTransformerControlMode <: EnumAPIModel
    value::String
    function ImpedanceCorrectionDataTransformerControlMode(value::String)
        value in ("PHASE_SHIFT_ANGLE", "TAP_RATIO") || throw(
            ArgumentError(
                "invalid ImpedanceCorrectionDataTransformerControlMode value $(repr(value))",
            ),
        )
        return new(value)
    end
end
_decode(::Type{ImpedanceCorrectionDataTransformerControlMode}, value) =
    _decode(ImpedanceCorrectionDataTransformerControlMode, value, true)
function _decode(
    ::Type{ImpedanceCorrectionDataTransformerControlMode},
    value,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-e26ecdf21236a2bd007d.json",
            pointer="/properties/transformer_control_mode",
        ),
        value,
        "decoding ImpedanceCorrectionDataTransformerControlMode";
        direction=:neutral,
    )
    return ImpedanceCorrectionDataTransformerControlMode(_decode(String, value, false))
end
function _encode_unvalidated(value::ImpedanceCorrectionDataTransformerControlMode)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::ImpedanceCorrectionDataTransformerControlMode) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-e26ecdf21236a2bd007d.json",
        pointer="/properties/transformer_control_mode",
    ),
    _encode_unvalidated(value),
    "encoding ImpedanceCorrectionDataTransformerControlMode";
    direction=:neutral,
)
Base.string(value::ImpedanceCorrectionDataTransformerControlMode) = string(value.value)
