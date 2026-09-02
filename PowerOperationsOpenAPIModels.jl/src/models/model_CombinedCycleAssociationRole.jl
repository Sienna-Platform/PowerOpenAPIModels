@doc "    CombinedCycleAssociationRole\n\nRole of the entity within the combined cycle block (combustion turbine input or combustion-augmented steam output)"
struct CombinedCycleAssociationRole
    value::String
    function CombinedCycleAssociationRole(value::String)
        value in ("CT","CA") || throw(ArgumentError("invalid CombinedCycleAssociationRole value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{CombinedCycleAssociationRole}, value) = _decode(CombinedCycleAssociationRole, value, true)
function _decode(::Type{CombinedCycleAssociationRole}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/CombinedCycleAssociation/properties/role"), value, "decoding CombinedCycleAssociationRole"; direction = :neutral)
    return CombinedCycleAssociationRole(_decode(String, value, _openapi_validate))
end
function _encode(value::CombinedCycleAssociationRole)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/CombinedCycleAssociation/properties/role"), output, "encoding CombinedCycleAssociationRole"; direction = :neutral)
end
Base.string(value::CombinedCycleAssociationRole) = string(value.value)
