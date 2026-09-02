@doc "    DiscreteControlledACBranchBranchStatus\n\nOpen or Close status."
struct DiscreteControlledACBranchBranchStatus
    value::String
    function DiscreteControlledACBranchBranchStatus(value::String)
        value in ("OPEN","CLOSED") || throw(ArgumentError("invalid DiscreteControlledACBranchBranchStatus value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{DiscreteControlledACBranchBranchStatus}, value) = _decode(DiscreteControlledACBranchBranchStatus, value, true)
function _decode(::Type{DiscreteControlledACBranchBranchStatus}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/DiscreteControlledACBranch/properties/branch_status"), value, "decoding DiscreteControlledACBranchBranchStatus"; direction = :neutral)
    return DiscreteControlledACBranchBranchStatus(_decode(String, value, _openapi_validate))
end
function _encode(value::DiscreteControlledACBranchBranchStatus)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/DiscreteControlledACBranch/properties/branch_status"), output, "encoding DiscreteControlledACBranchBranchStatus"; direction = :neutral)
end
Base.string(value::DiscreteControlledACBranchBranchStatus) = string(value.value)
