struct ImpedanceCorrectionDataTransformerControlMode
    value::String
    function ImpedanceCorrectionDataTransformerControlMode(value::String)
        value in ("PHASE_SHIFT_ANGLE","TAP_RATIO") || throw(ArgumentError("invalid ImpedanceCorrectionDataTransformerControlMode value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ImpedanceCorrectionDataTransformerControlMode}, value) = _decode(ImpedanceCorrectionDataTransformerControlMode, value, true)
function _decode(::Type{ImpedanceCorrectionDataTransformerControlMode}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ImpedanceCorrectionData/properties/transformer_control_mode"), value, "decoding ImpedanceCorrectionDataTransformerControlMode"; direction = :neutral)
    return ImpedanceCorrectionDataTransformerControlMode(_decode(String, value, _openapi_validate))
end
function _encode(value::ImpedanceCorrectionDataTransformerControlMode)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ImpedanceCorrectionData/properties/transformer_control_mode"), output, "encoding ImpedanceCorrectionDataTransformerControlMode"; direction = :neutral)
end
Base.string(value::ImpedanceCorrectionDataTransformerControlMode) = string(value.value)
