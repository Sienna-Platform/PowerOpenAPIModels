@doc "    ScenariosOwnerCategory\n\nWhether the owner is a component or a supplemental attribute."
struct ScenariosOwnerCategory
    value::String
    function ScenariosOwnerCategory(value::String)
        value in ("Component","SupplementalAttribute") || throw(ArgumentError("invalid ScenariosOwnerCategory value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ScenariosOwnerCategory}, value) = _decode(ScenariosOwnerCategory, value, true)
function _decode(::Type{ScenariosOwnerCategory}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-d907e2d1c7ab387eab6d.json", pointer = "/components/schemas/Scenarios/properties/owner_category"), value, "decoding ScenariosOwnerCategory"; direction = :neutral)
    return ScenariosOwnerCategory(_decode(String, value, _openapi_validate))
end
function _encode(value::ScenariosOwnerCategory)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-d907e2d1c7ab387eab6d.json", pointer = "/components/schemas/Scenarios/properties/owner_category"), output, "encoding ScenariosOwnerCategory"; direction = :neutral)
end
Base.string(value::ScenariosOwnerCategory) = string(value.value)
