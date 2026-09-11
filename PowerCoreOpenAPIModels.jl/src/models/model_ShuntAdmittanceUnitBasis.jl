"""
    ShuntAdmittanceUnitBasis

Unit basis for fixed and switched shunts, omitting COMPONENT_BASE since a shunt has no device MVA rating. NATURAL_UNITS: physical siemens. COMPONENT_MVAR: reactive power at unity voltage.
"""
struct ShuntAdmittanceUnitBasis <: EnumAPIModel
    value::String
    function ShuntAdmittanceUnitBasis(value::String)
        value in ("NATURAL_UNITS", "COMPONENT_MVAR") ||
            throw(ArgumentError("invalid ShuntAdmittanceUnitBasis value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ShuntAdmittanceUnitBasis}, value) =
    _decode(ShuntAdmittanceUnitBasis, value, true)
function _decode(::Type{ShuntAdmittanceUnitBasis}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-73b8f5d70ab200b425bf.json",
            pointer="/components/schemas/ShuntAdmittanceUnitBasis",
        ),
        value,
        "decoding ShuntAdmittanceUnitBasis";
        direction=:neutral,
    )
    return ShuntAdmittanceUnitBasis(_decode(String, value, _openapi_validate))
end
function _encode(value::ShuntAdmittanceUnitBasis)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-73b8f5d70ab200b425bf.json",
            pointer="/components/schemas/ShuntAdmittanceUnitBasis",
        ),
        output,
        "encoding ShuntAdmittanceUnitBasis";
        direction=:neutral,
    )
end
Base.string(value::ShuntAdmittanceUnitBasis) = string(value.value)
