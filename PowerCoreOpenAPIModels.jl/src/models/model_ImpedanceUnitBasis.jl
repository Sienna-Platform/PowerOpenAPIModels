@doc "    ImpedanceUnitBasis\n\nUnit basis a branch/injection impedance is stored in. NATURAL_UNITS: physical ohms (PSS/E RAW native for DC-line impedances). COMPONENT_BASE: per-unit on the component's own base (base_power MVA and voltage base); components whose per-unit data was historically on the system base record that system base in base_power, so there is no separate system-base option. PSS/E supplies device base for DC-line converters and CZ=2 transformer windings. A branch's shunt admittance halves (b, g) share the branch's one basis: NATURAL_UNITS stores them in siemens."
struct ImpedanceUnitBasis
    value::String
    function ImpedanceUnitBasis(value::String)
        value in ("NATURAL_UNITS","COMPONENT_BASE") || throw(ArgumentError("invalid ImpedanceUnitBasis value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ImpedanceUnitBasis}, value) = _decode(ImpedanceUnitBasis, value, true)
function _decode(::Type{ImpedanceUnitBasis}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/ImpedanceUnitBasis"), value, "decoding ImpedanceUnitBasis"; direction = :neutral)
    return ImpedanceUnitBasis(_decode(String, value, _openapi_validate))
end
function _encode(value::ImpedanceUnitBasis)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/ImpedanceUnitBasis"), output, "encoding ImpedanceUnitBasis"; direction = :neutral)
end
Base.string(value::ImpedanceUnitBasis) = string(value.value)
