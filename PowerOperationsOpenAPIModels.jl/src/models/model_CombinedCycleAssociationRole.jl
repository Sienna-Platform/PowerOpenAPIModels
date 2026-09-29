"""
    CombinedCycleAssociationRole

Role of the entity within the combined cycle block (combustion turbine input or combustion-augmented steam output)
"""
struct CombinedCycleAssociationRole <: EnumAPIModel
    value::String
    function CombinedCycleAssociationRole(value::String)
        value in ("CT", "CA") || throw(
            ArgumentError("invalid CombinedCycleAssociationRole value $(repr(value))"),
        )
        return new(value)
    end
end
_decode(::Type{CombinedCycleAssociationRole}, value) =
    _decode(CombinedCycleAssociationRole, value, true)
function _decode(::Type{CombinedCycleAssociationRole}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-4d9260d9ca0249e48beb.json",
            pointer="/properties/role",
        ),
        value,
        "decoding CombinedCycleAssociationRole";
        direction=:neutral,
    )
    return CombinedCycleAssociationRole(_decode(String, value, false))
end
function _encode_unvalidated(value::CombinedCycleAssociationRole)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::CombinedCycleAssociationRole) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-4d9260d9ca0249e48beb.json",
        pointer="/properties/role",
    ),
    _encode_unvalidated(value),
    "encoding CombinedCycleAssociationRole";
    direction=:neutral,
)
Base.string(value::CombinedCycleAssociationRole) = string(value.value)
