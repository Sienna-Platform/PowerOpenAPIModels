"""
    ImpedanceUnitBasis

Unit basis a branch/injection impedance is stored in. NATURAL_UNITS: physical ohms. COMPONENT_BASE: per-unit on the component's own base_power and voltage. A branch's shunt admittance halves share the branch's basis.
"""
struct ImpedanceUnitBasis <: EnumAPIModel
    value::String
    function ImpedanceUnitBasis(value::String)
        value in ("NATURAL_UNITS", "COMPONENT_BASE") ||
            throw(ArgumentError("invalid ImpedanceUnitBasis value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ImpedanceUnitBasis}, value) = _decode(ImpedanceUnitBasis, value, true)
function _decode(::Type{ImpedanceUnitBasis}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-73b8f5d70ab200b425bf.json",
            pointer="/components/schemas/ImpedanceUnitBasis",
        ),
        value,
        "decoding ImpedanceUnitBasis";
        direction=:neutral,
    )
    return ImpedanceUnitBasis(_decode(String, value, _openapi_validate))
end
function _encode(value::ImpedanceUnitBasis)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-73b8f5d70ab200b425bf.json",
            pointer="/components/schemas/ImpedanceUnitBasis",
        ),
        output,
        "encoding ImpedanceUnitBasis";
        direction=:neutral,
    )
end
Base.string(value::ImpedanceUnitBasis) = string(value.value)
