@doc "    ProbabilisticOwnerCategory\n\nWhether the owner is a component or a supplemental attribute."
struct ProbabilisticOwnerCategory
    value::String
    function ProbabilisticOwnerCategory(value::String)
        value in ("Component","SupplementalAttribute") || throw(ArgumentError("invalid ProbabilisticOwnerCategory value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ProbabilisticOwnerCategory}, value) = _decode(ProbabilisticOwnerCategory, value, true)
function _decode(::Type{ProbabilisticOwnerCategory}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/Probabilistic/properties/owner_category"), value, "decoding ProbabilisticOwnerCategory"; direction = :neutral)
    return ProbabilisticOwnerCategory(_decode(String, value, _openapi_validate))
end
function _encode(value::ProbabilisticOwnerCategory)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/Probabilistic/properties/owner_category"), output, "encoding ProbabilisticOwnerCategory"; direction = :neutral)
end
Base.string(value::ProbabilisticOwnerCategory) = string(value.value)
