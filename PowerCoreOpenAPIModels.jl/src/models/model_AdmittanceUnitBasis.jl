"""
    AdmittanceUnitBasis

Unit basis a shunt admittance is stored in. NATURAL_UNITS: siemens. COMPONENT_MVAR: reactive power at unity voltage. COMPONENT_BASE: per-unit on the component's base_power and voltage. Shunts may use ShuntAdmittanceUnitBasis instead.
"""
struct AdmittanceUnitBasis <: EnumAPIModel
    value::String
    function AdmittanceUnitBasis(value::String)
        value in ("NATURAL_UNITS", "COMPONENT_MVAR", "COMPONENT_BASE") ||
            throw(ArgumentError("invalid AdmittanceUnitBasis value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{AdmittanceUnitBasis}, value) = _decode(AdmittanceUnitBasis, value, true)
function _decode(::Type{AdmittanceUnitBasis}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-73b8f5d70ab200b425bf.json",
            pointer="/components/schemas/AdmittanceUnitBasis",
        ),
        value,
        "decoding AdmittanceUnitBasis";
        direction=:neutral,
    )
    return AdmittanceUnitBasis(_decode(String, value, _openapi_validate))
end
function _encode(value::AdmittanceUnitBasis)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-73b8f5d70ab200b425bf.json",
            pointer="/components/schemas/AdmittanceUnitBasis",
        ),
        output,
        "encoding AdmittanceUnitBasis";
        direction=:neutral,
    )
end
Base.string(value::AdmittanceUnitBasis) = string(value.value)
