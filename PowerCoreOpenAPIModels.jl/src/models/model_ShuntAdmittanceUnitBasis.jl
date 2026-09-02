@doc "    ShuntAdmittanceUnitBasis\n\nSubset of AdmittanceUnitBasis for fixed and switched shunts: omits COMPONENT_BASE because a shunt has no device MVA rating to per-unitize against. NATURAL_UNITS: physical siemens. COMPONENT_MVAR: reactive power at unity voltage (Mvar for susceptance, MW for conductance) — PSS/E RAW native for shunts."
struct ShuntAdmittanceUnitBasis
    value::String
    function ShuntAdmittanceUnitBasis(value::String)
        value in ("NATURAL_UNITS","COMPONENT_MVAR") || throw(ArgumentError("invalid ShuntAdmittanceUnitBasis value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ShuntAdmittanceUnitBasis}, value) = _decode(ShuntAdmittanceUnitBasis, value, true)
function _decode(::Type{ShuntAdmittanceUnitBasis}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/ShuntAdmittanceUnitBasis"), value, "decoding ShuntAdmittanceUnitBasis"; direction = :neutral)
    return ShuntAdmittanceUnitBasis(_decode(String, value, _openapi_validate))
end
function _encode(value::ShuntAdmittanceUnitBasis)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/ShuntAdmittanceUnitBasis"), output, "encoding ShuntAdmittanceUnitBasis"; direction = :neutral)
end
Base.string(value::ShuntAdmittanceUnitBasis) = string(value.value)
