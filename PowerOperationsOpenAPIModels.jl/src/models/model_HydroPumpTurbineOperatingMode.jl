"""
    HydroPumpTurbineOperatingMode

Which mode the pumped-storage unit is operating in at the start of a simulation: pumping, generating, or idle.
"""
struct HydroPumpTurbineOperatingMode <: EnumAPIModel
    value::String
    function HydroPumpTurbineOperatingMode(value::String)
        value in ("PUMP", "GEN", "OFF") || throw(
            ArgumentError("invalid HydroPumpTurbineOperatingMode value $(repr(value))"),
        )
        return new(value)
    end
end
_decode(::Type{HydroPumpTurbineOperatingMode}, value) =
    _decode(HydroPumpTurbineOperatingMode, value, true)
function _decode(::Type{HydroPumpTurbineOperatingMode}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-7e224747fa2ab31185c8.json",
            pointer="/components/schemas/HydroPumpTurbine/properties/operating_mode",
        ),
        value,
        "decoding HydroPumpTurbineOperatingMode";
        direction=:neutral,
    )
    return HydroPumpTurbineOperatingMode(_decode(String, value, _openapi_validate))
end
function _encode(value::HydroPumpTurbineOperatingMode)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-7e224747fa2ab31185c8.json",
            pointer="/components/schemas/HydroPumpTurbine/properties/operating_mode",
        ),
        output,
        "encoding HydroPumpTurbineOperatingMode";
        direction=:neutral,
    )
end
Base.string(value::HydroPumpTurbineOperatingMode) = string(value.value)
