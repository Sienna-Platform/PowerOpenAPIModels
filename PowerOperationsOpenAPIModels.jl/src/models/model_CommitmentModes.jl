"""
    CommitmentModes

Why a committable unit is (or would be) committed, orthogonal to its operational state. UNCOMMITTED: not committed, offline but available. COMMITTED: committed by the scheduling process (a planning model's commitment decision or a cleared schedule). SELF_SCHEDULED: scheduled by its owner rather than by the scheduling process. RELIABILITY: committed by the system operator for reliability rather than by the scheduling process. MUST_RUN: required to run by contract or operating constraint.
"""
struct CommitmentModes <: EnumAPIModel
    value::String
    function CommitmentModes(value::String)
        value in
        ("UNCOMMITTED", "COMMITTED", "SELF_SCHEDULED", "RELIABILITY", "MUST_RUN") ||
            throw(ArgumentError("invalid CommitmentModes value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{CommitmentModes}, value) = _decode(CommitmentModes, value, true)
function _decode(::Type{CommitmentModes}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-452260947985e8a3e864.json",
            pointer="/\$defs/CommitmentModes",
        ),
        value,
        "decoding CommitmentModes";
        direction=:neutral,
    )
    return CommitmentModes(_decode(String, value, false))
end
function _encode_unvalidated(value::CommitmentModes)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::CommitmentModes) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-452260947985e8a3e864.json",
        pointer="/\$defs/CommitmentModes",
    ),
    _encode_unvalidated(value),
    "encoding CommitmentModes";
    direction=:neutral,
)
Base.string(value::CommitmentModes) = string(value.value)
