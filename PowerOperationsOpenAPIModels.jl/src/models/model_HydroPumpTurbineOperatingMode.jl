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
            resource="https://openapi.invalid/schema/external-e18af837c2d0e608e9b3.json",
            pointer="/properties/operating_mode",
        ),
        value,
        "decoding HydroPumpTurbineOperatingMode";
        direction=:neutral,
    )
    return HydroPumpTurbineOperatingMode(_decode(String, value, false))
end
function _encode_unvalidated(value::HydroPumpTurbineOperatingMode)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::HydroPumpTurbineOperatingMode) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-e18af837c2d0e608e9b3.json",
        pointer="/properties/operating_mode",
    ),
    _encode_unvalidated(value),
    "encoding HydroPumpTurbineOperatingMode";
    direction=:neutral,
)
Base.string(value::HydroPumpTurbineOperatingMode) = string(value.value)
