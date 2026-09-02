@doc "    DeterministicOwnerCategory\n\nWhether the owner is a component or a supplemental attribute."
struct DeterministicOwnerCategory
    value::String
    function DeterministicOwnerCategory(value::String)
        value in ("Component","SupplementalAttribute") || throw(ArgumentError("invalid DeterministicOwnerCategory value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{DeterministicOwnerCategory}, value) = _decode(DeterministicOwnerCategory, value, true)
function _decode(::Type{DeterministicOwnerCategory}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/Deterministic/properties/owner_category"), value, "decoding DeterministicOwnerCategory"; direction = :neutral)
    return DeterministicOwnerCategory(_decode(String, value, _openapi_validate))
end
function _encode(value::DeterministicOwnerCategory)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-6d38bd66b0c6b6ed2d32.json", pointer = "/components/schemas/Deterministic/properties/owner_category"), output, "encoding DeterministicOwnerCategory"; direction = :neutral)
end
Base.string(value::DeterministicOwnerCategory) = string(value.value)
