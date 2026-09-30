"""
    ShuntAdmittanceUnitBasis

Subset of AdmittanceUnitBasis for fixed and switched shunts: omits COMPONENT_BASE because a shunt has no device MVA rating to per-unitize against. NATURAL_UNITS: physical siemens. COMPONENT_MVAR: reactive power at unity voltage (Mvar for susceptance, MW for conductance) — PSS/E RAW native for shunts.
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
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/ShuntAdmittanceUnitBasis",
        ),
        value,
        "decoding ShuntAdmittanceUnitBasis";
        direction=:neutral,
    )
    return ShuntAdmittanceUnitBasis(_decode(String, value, false))
end
function _encode_unvalidated(value::ShuntAdmittanceUnitBasis)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::ShuntAdmittanceUnitBasis) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
        pointer="/\$defs/ShuntAdmittanceUnitBasis",
    ),
    _encode_unvalidated(value),
    "encoding ShuntAdmittanceUnitBasis";
    direction=:neutral,
)
Base.string(value::ShuntAdmittanceUnitBasis) = string(value.value)
