@doc "    VoltageUnitBasis\n\nUnit basis a voltage setpoint is stored in. NATURAL_UNITS: kilovolts. COMPONENT_BASE: per-unit on the component's own base voltage (the connected bus's base voltage for AC setpoints — PSS/E RAW native for FACTS VSET — and the device voltage base PSS/E supplies for DC-line converters and CZ=2 transformer windings). There is no separate system-base option: bus-base per-unit is the device base for voltage."
struct VoltageUnitBasis
    value::String
    function VoltageUnitBasis(value::String)
        value in ("NATURAL_UNITS","COMPONENT_BASE") || throw(ArgumentError("invalid VoltageUnitBasis value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{VoltageUnitBasis}, value) = _decode(VoltageUnitBasis, value, true)
function _decode(::Type{VoltageUnitBasis}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/VoltageUnitBasis"), value, "decoding VoltageUnitBasis"; direction = :neutral)
    return VoltageUnitBasis(_decode(String, value, _openapi_validate))
end
function _encode(value::VoltageUnitBasis)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/VoltageUnitBasis"), output, "encoding VoltageUnitBasis"; direction = :neutral)
end
Base.string(value::VoltageUnitBasis) = string(value.value)
