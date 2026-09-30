"""
    DiscreteControlledACBranchBranchStatus

Open or Close status.
"""
struct DiscreteControlledACBranchBranchStatus <: EnumAPIModel
    value::String
    function DiscreteControlledACBranchBranchStatus(value::String)
        value in ("OPEN", "CLOSED") || throw(
            ArgumentError(
                "invalid DiscreteControlledACBranchBranchStatus value $(repr(value))",
            ),
        )
        return new(value)
    end
end
_decode(::Type{DiscreteControlledACBranchBranchStatus}, value) =
    _decode(DiscreteControlledACBranchBranchStatus, value, true)
function _decode(
    ::Type{DiscreteControlledACBranchBranchStatus},
    value,
    _openapi_validate::Bool,
)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-a19739e398fbec984537.json",
            pointer="/properties/branch_status",
        ),
        value,
        "decoding DiscreteControlledACBranchBranchStatus";
        direction=:neutral,
    )
    return DiscreteControlledACBranchBranchStatus(_decode(String, value, false))
end
function _encode_unvalidated(value::DiscreteControlledACBranchBranchStatus)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::DiscreteControlledACBranchBranchStatus) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-a19739e398fbec984537.json",
        pointer="/properties/branch_status",
    ),
    _encode_unvalidated(value),
    "encoding DiscreteControlledACBranchBranchStatus";
    direction=:neutral,
)
Base.string(value::DiscreteControlledACBranchBranchStatus) = string(value.value)
