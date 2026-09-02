@doc "    ThermalMultiStartCommitmentMode\n\nCommitment mode of the unit."
struct ThermalMultiStartCommitmentMode
    value::String
    function ThermalMultiStartCommitmentMode(value::String)
        value in ("UNCOMMITTED","COMMITTED","SELF_SCHEDULED","RELIABILITY","MUST_RUN") || throw(ArgumentError("invalid ThermalMultiStartCommitmentMode value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ThermalMultiStartCommitmentMode}, value) = _decode(ThermalMultiStartCommitmentMode, value, true)
function _decode(::Type{ThermalMultiStartCommitmentMode}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ThermalMultiStart/properties/commitment_mode"), value, "decoding ThermalMultiStartCommitmentMode"; direction = :neutral)
    return ThermalMultiStartCommitmentMode(_decode(String, value, _openapi_validate))
end
function _encode(value::ThermalMultiStartCommitmentMode)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/ThermalMultiStart/properties/commitment_mode"), output, "encoding ThermalMultiStartCommitmentMode"; direction = :neutral)
end
Base.string(value::ThermalMultiStartCommitmentMode) = string(value.value)
