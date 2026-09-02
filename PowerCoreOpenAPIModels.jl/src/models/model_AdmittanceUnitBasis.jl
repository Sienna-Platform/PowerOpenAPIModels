@doc "    AdmittanceUnitBasis\n\nUnit basis a shunt admittance is stored in. NATURAL_UNITS: physical siemens. COMPONENT_MVAR: reactive power at unity voltage (Mvar for susceptance, MW for conductance). COMPONENT_BASE: per-unit on the component's own base (base_power MVA and voltage base) — a per-unit base, not a power at unity voltage, and not an alternative spelling of COMPONENT_MVAR; components whose per-unit data was historically on the system base record that system base in base_power. Fixed and switched shunts use ShuntAdmittanceUnitBasis instead, which omits COMPONENT_BASE because a shunt has no device MVA rating."
struct AdmittanceUnitBasis
    value::String
    function AdmittanceUnitBasis(value::String)
        value in ("NATURAL_UNITS","COMPONENT_MVAR","COMPONENT_BASE") || throw(ArgumentError("invalid AdmittanceUnitBasis value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{AdmittanceUnitBasis}, value) = _decode(AdmittanceUnitBasis, value, true)
function _decode(::Type{AdmittanceUnitBasis}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/AdmittanceUnitBasis"), value, "decoding AdmittanceUnitBasis"; direction = :neutral)
    return AdmittanceUnitBasis(_decode(String, value, _openapi_validate))
end
function _encode(value::AdmittanceUnitBasis)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/AdmittanceUnitBasis"), output, "encoding AdmittanceUnitBasis"; direction = :neutral)
end
Base.string(value::AdmittanceUnitBasis) = string(value.value)
