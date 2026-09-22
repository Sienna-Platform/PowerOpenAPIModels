"""
    DiscreteControlledACBranchDiscreteBranchType

Type of discrete control.
"""
struct DiscreteControlledACBranchDiscreteBranchType <: EnumAPIModel
    value::String
    function DiscreteControlledACBranchDiscreteBranchType(value::String)
        value in ("SWITCH", "BREAKER", "OTHER") || throw(
            ArgumentError(
                "invalid DiscreteControlledACBranchDiscreteBranchType value $(repr(value))",
            ),
        )
        return new(value)
    end
end
_decode(::Type{DiscreteControlledACBranchDiscreteBranchType}, value) =
    _decode(DiscreteControlledACBranchDiscreteBranchType, value, true)
function _decode(
    ::Type{DiscreteControlledACBranchDiscreteBranchType},
    value,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-a19739e398fbec984537.json",
            pointer="/properties/discrete_branch_type",
        ),
        value,
        "decoding DiscreteControlledACBranchDiscreteBranchType";
        direction=:neutral,
    )
    return DiscreteControlledACBranchDiscreteBranchType(_decode(String, value, false))
end
function _encode_unvalidated(value::DiscreteControlledACBranchDiscreteBranchType)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::DiscreteControlledACBranchDiscreteBranchType) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-a19739e398fbec984537.json",
        pointer="/properties/discrete_branch_type",
    ),
    _encode_unvalidated(value),
    "encoding DiscreteControlledACBranchDiscreteBranchType";
    direction=:neutral,
)
Base.string(value::DiscreteControlledACBranchDiscreteBranchType) = string(value.value)
