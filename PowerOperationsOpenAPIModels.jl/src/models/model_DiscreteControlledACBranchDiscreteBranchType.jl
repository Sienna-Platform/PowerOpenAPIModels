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
            resource="https://openapi.invalid/schema/external-a19badda82631e875c89.json",
            pointer="/properties/discrete_branch_type",
        ),
        value,
        "decoding DiscreteControlledACBranchDiscreteBranchType";
        direction=:neutral,
    )
    return DiscreteControlledACBranchDiscreteBranchType(
        _decode(String, value, _openapi_validate),
    )
end
function _encode(value::DiscreteControlledACBranchDiscreteBranchType)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-a19badda82631e875c89.json",
            pointer="/properties/discrete_branch_type",
        ),
        output,
        "encoding DiscreteControlledACBranchDiscreteBranchType";
        direction=:neutral,
    )
end
Base.string(value::DiscreteControlledACBranchDiscreteBranchType) = string(value.value)
