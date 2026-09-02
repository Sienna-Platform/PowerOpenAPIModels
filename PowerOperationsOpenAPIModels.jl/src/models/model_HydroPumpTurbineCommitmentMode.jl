@doc "    HydroPumpTurbineCommitmentMode\n\nCommitment mode of the unit."
struct HydroPumpTurbineCommitmentMode
    value::String
    function HydroPumpTurbineCommitmentMode(value::String)
        value in ("UNCOMMITTED","COMMITTED","SELF_SCHEDULED","RELIABILITY","MUST_RUN") || throw(ArgumentError("invalid HydroPumpTurbineCommitmentMode value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{HydroPumpTurbineCommitmentMode}, value) = _decode(HydroPumpTurbineCommitmentMode, value, true)
function _decode(::Type{HydroPumpTurbineCommitmentMode}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/HydroPumpTurbine/properties/commitment_mode"), value, "decoding HydroPumpTurbineCommitmentMode"; direction = :neutral)
    return HydroPumpTurbineCommitmentMode(_decode(String, value, _openapi_validate))
end
function _encode(value::HydroPumpTurbineCommitmentMode)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/HydroPumpTurbine/properties/commitment_mode"), output, "encoding HydroPumpTurbineCommitmentMode"; direction = :neutral)
end
Base.string(value::HydroPumpTurbineCommitmentMode) = string(value.value)
