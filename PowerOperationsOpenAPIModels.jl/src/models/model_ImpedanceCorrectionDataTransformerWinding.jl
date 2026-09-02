struct ImpedanceCorrectionDataTransformerWinding
    value::String
    function ImpedanceCorrectionDataTransformerWinding(value::String)
        value in ("TR2W_WINDING","PRIMARY_WINDING","SECONDARY_WINDING","TERTIARY_WINDING") || throw(ArgumentError("invalid ImpedanceCorrectionDataTransformerWinding value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ImpedanceCorrectionDataTransformerWinding}, value) = _decode(ImpedanceCorrectionDataTransformerWinding, value, true)
function _decode(::Type{ImpedanceCorrectionDataTransformerWinding}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ImpedanceCorrectionData/properties/transformer_winding"), value, "decoding ImpedanceCorrectionDataTransformerWinding"; direction = :neutral)
    return ImpedanceCorrectionDataTransformerWinding(_decode(String, value, _openapi_validate))
end
function _encode(value::ImpedanceCorrectionDataTransformerWinding)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ImpedanceCorrectionData/properties/transformer_winding"), output, "encoding ImpedanceCorrectionDataTransformerWinding"; direction = :neutral)
end
Base.string(value::ImpedanceCorrectionDataTransformerWinding) = string(value.value)
