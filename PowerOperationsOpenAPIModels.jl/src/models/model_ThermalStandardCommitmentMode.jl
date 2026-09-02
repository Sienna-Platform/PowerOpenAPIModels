@doc "    ThermalStandardCommitmentMode\n\nCommitment mode of the unit."
struct ThermalStandardCommitmentMode
    value::String
    function ThermalStandardCommitmentMode(value::String)
        value in ("UNCOMMITTED","COMMITTED","SELF_SCHEDULED","RELIABILITY","MUST_RUN") || throw(ArgumentError("invalid ThermalStandardCommitmentMode value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ThermalStandardCommitmentMode}, value) = _decode(ThermalStandardCommitmentMode, value, true)
function _decode(::Type{ThermalStandardCommitmentMode}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ThermalStandard/properties/commitment_mode"), value, "decoding ThermalStandardCommitmentMode"; direction = :neutral)
    return ThermalStandardCommitmentMode(_decode(String, value, _openapi_validate))
end
function _encode(value::ThermalStandardCommitmentMode)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/ThermalStandard/properties/commitment_mode"), output, "encoding ThermalStandardCommitmentMode"; direction = :neutral)
end
Base.string(value::ThermalStandardCommitmentMode) = string(value.value)
