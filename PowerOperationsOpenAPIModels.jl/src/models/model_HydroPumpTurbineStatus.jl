"""
    HydroPumpTurbineStatus

Initial Operating status of a pumped-storage hydro unit. See `HydroPumpTurbineStatus` for reference.
"""
struct HydroPumpTurbineStatus <: EnumAPIModel
    value::String
    function HydroPumpTurbineStatus(value::String)
        value in ("PUMP", "GEN", "OFF") ||
            throw(ArgumentError("invalid HydroPumpTurbineStatus value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{HydroPumpTurbineStatus}, value) =
    _decode(HydroPumpTurbineStatus, value, true)
function _decode(::Type{HydroPumpTurbineStatus}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-efb5741410bb1a426ad0.json",
            pointer="/components/schemas/HydroPumpTurbine/properties/status",
        ),
        value,
        "decoding HydroPumpTurbineStatus";
        direction=:neutral,
    )
    return HydroPumpTurbineStatus(_decode(String, value, _openapi_validate))
end
function _encode(value::HydroPumpTurbineStatus)
    output = _encode(value.value)
    return _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/root-efb5741410bb1a426ad0.json",
            pointer="/components/schemas/HydroPumpTurbine/properties/status",
        ),
        output,
        "encoding HydroPumpTurbineStatus";
        direction=:neutral,
    )
end
Base.string(value::HydroPumpTurbineStatus) = string(value.value)
