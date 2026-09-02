@doc "    CommitmentModes\n\nWhy a committable unit is (or would be) committed, orthogonal to its operational state. UNCOMMITTED: not committed, offline but available. COMMITTED: committed by the scheduling process (a planning model's commitment decision or a cleared schedule). SELF_SCHEDULED: scheduled by its owner rather than by the scheduling process. RELIABILITY: committed by the system operator for reliability rather than by the scheduling process. MUST_RUN: required to run by contract or operating constraint."
struct CommitmentModes
    value::String
    function CommitmentModes(value::String)
        value in ("UNCOMMITTED","COMMITTED","SELF_SCHEDULED","RELIABILITY","MUST_RUN") || throw(ArgumentError("invalid CommitmentModes value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{CommitmentModes}, value) = _decode(CommitmentModes, value, true)
function _decode(::Type{CommitmentModes}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/CommitmentModes"), value, "decoding CommitmentModes"; direction = :neutral)
    return CommitmentModes(_decode(String, value, _openapi_validate))
end
function _encode(value::CommitmentModes)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/CommitmentModes"), output, "encoding CommitmentModes"; direction = :neutral)
end
Base.string(value::CommitmentModes) = string(value.value)
