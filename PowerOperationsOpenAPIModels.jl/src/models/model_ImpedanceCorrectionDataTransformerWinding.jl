struct ImpedanceCorrectionDataTransformerWinding <: EnumAPIModel
    value::String
    function ImpedanceCorrectionDataTransformerWinding(value::String)
        value in
        ("TR2W_WINDING", "PRIMARY_WINDING", "SECONDARY_WINDING", "TERTIARY_WINDING") ||
            throw(
                ArgumentError(
                    "invalid ImpedanceCorrectionDataTransformerWinding value $(repr(value))",
                ),
            )
        return new(value)
    end
end
_decode(::Type{ImpedanceCorrectionDataTransformerWinding}, value) =
    _decode(ImpedanceCorrectionDataTransformerWinding, value, true)
function _decode(
    ::Type{ImpedanceCorrectionDataTransformerWinding},
    value,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-6b773fd2b09ee939b42d.json",
            pointer="/properties/transformer_winding",
        ),
        value,
        "decoding ImpedanceCorrectionDataTransformerWinding";
        direction=:neutral,
    )
    return ImpedanceCorrectionDataTransformerWinding(_decode(String, value, false))
end
function _encode_unvalidated(value::ImpedanceCorrectionDataTransformerWinding)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::ImpedanceCorrectionDataTransformerWinding) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-6b773fd2b09ee939b42d.json",
        pointer="/properties/transformer_winding",
    ),
    _encode_unvalidated(value),
    "encoding ImpedanceCorrectionDataTransformerWinding";
    direction=:neutral,
)
Base.string(value::ImpedanceCorrectionDataTransformerWinding) = string(value.value)
