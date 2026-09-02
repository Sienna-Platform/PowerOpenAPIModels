@doc "    DiscreteControlledACBranchNormalBranchStatus\n\nNormal (as-designed) open or close status of the device."
struct DiscreteControlledACBranchNormalBranchStatus
    value::String
    function DiscreteControlledACBranchNormalBranchStatus(value::String)
        value in ("OPEN","CLOSED") || throw(ArgumentError("invalid DiscreteControlledACBranchNormalBranchStatus value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{DiscreteControlledACBranchNormalBranchStatus}, value) = _decode(DiscreteControlledACBranchNormalBranchStatus, value, true)
function _decode(::Type{DiscreteControlledACBranchNormalBranchStatus}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/DiscreteControlledACBranch/properties/normal_branch_status"), value, "decoding DiscreteControlledACBranchNormalBranchStatus"; direction = :neutral)
    return DiscreteControlledACBranchNormalBranchStatus(_decode(String, value, _openapi_validate))
end
function _encode(value::DiscreteControlledACBranchNormalBranchStatus)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/DiscreteControlledACBranch/properties/normal_branch_status"), output, "encoding DiscreteControlledACBranchNormalBranchStatus"; direction = :neutral)
end
Base.string(value::DiscreteControlledACBranchNormalBranchStatus) = string(value.value)
