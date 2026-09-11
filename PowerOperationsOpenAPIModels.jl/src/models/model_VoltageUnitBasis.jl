"""
    VoltageUnitBasis

Unit basis a voltage setpoint is stored in. NATURAL_UNITS: kilovolts. COMPONENT_BASE: per-unit on the component's own base voltage. No separate system-base option.
"""
struct VoltageUnitBasis <: EnumAPIModel
    value::String
    function VoltageUnitBasis(value::String)
        value in ("NATURAL_UNITS", "COMPONENT_BASE") ||
            throw(ArgumentError("invalid VoltageUnitBasis value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{VoltageUnitBasis}, value) = _decode(VoltageUnitBasis, value, true)
function _decode(::Type{VoltageUnitBasis}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-93346ccf4b7969b6d994.json",
            pointer="/components/schemas/VoltageUnitBasis",
        ),
        value,
        "decoding VoltageUnitBasis";
        direction=:neutral,
    )
    return VoltageUnitBasis(_decode(String, value, _openapi_validate))
end
function _encode(value::VoltageUnitBasis)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-93346ccf4b7969b6d994.json",
            pointer="/components/schemas/VoltageUnitBasis",
        ),
        output,
        "encoding VoltageUnitBasis";
        direction=:neutral,
    )
end
Base.string(value::VoltageUnitBasis) = string(value.value)
