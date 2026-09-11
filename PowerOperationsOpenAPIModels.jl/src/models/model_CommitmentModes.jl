"""
    CommitmentModes

Why a committable unit is committed. UNCOMMITTED: not committed, available. COMMITTED: by the scheduling process. SELF_SCHEDULED: by its owner. RELIABILITY: by the system operator. MUST_RUN: required by contract or constraint.
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
            resource="https://openapi.invalid/schema/root-93346ccf4b7969b6d994.json",
            pointer="/components/schemas/CommitmentModes",
        ),
        value,
        "decoding CommitmentModes";
        direction=:neutral,
    )
    return CommitmentModes(_decode(String, value, _openapi_validate))
end
function _encode(value::CommitmentModes)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-93346ccf4b7969b6d994.json",
            pointer="/components/schemas/CommitmentModes",
        ),
        output,
        "encoding CommitmentModes";
        direction=:neutral,
    )
end
Base.string(value::CommitmentModes) = string(value.value)
