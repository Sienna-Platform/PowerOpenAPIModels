"""
    DiscreteControlledACBranchNormalBranchStatus

Normal (as-designed) open or close status of the device.
"""
struct DiscreteControlledACBranchNormalBranchStatus <: EnumAPIModel
    value::String
    function DiscreteControlledACBranchNormalBranchStatus(value::String)
        value in ("OPEN", "CLOSED") || throw(
            ArgumentError(
                "invalid DiscreteControlledACBranchNormalBranchStatus value $(repr(value))",
            ),
        )
        return new(value)
    end
end
_decode(::Type{DiscreteControlledACBranchNormalBranchStatus}, value) =
    _decode(DiscreteControlledACBranchNormalBranchStatus, value, true)
function _decode(
    ::Type{DiscreteControlledACBranchNormalBranchStatus},
    value,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-a19739e398fbec984537.json",
            pointer="/properties/normal_branch_status",
        ),
        value,
        "decoding DiscreteControlledACBranchNormalBranchStatus";
        direction=:neutral,
    )
    return DiscreteControlledACBranchNormalBranchStatus(_decode(String, value, false))
end
function _encode_unvalidated(value::DiscreteControlledACBranchNormalBranchStatus)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::DiscreteControlledACBranchNormalBranchStatus) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-a19739e398fbec984537.json",
        pointer="/properties/normal_branch_status",
    ),
    _encode_unvalidated(value),
    "encoding DiscreteControlledACBranchNormalBranchStatus";
    direction=:neutral,
)
Base.string(value::DiscreteControlledACBranchNormalBranchStatus) = string(value.value)
