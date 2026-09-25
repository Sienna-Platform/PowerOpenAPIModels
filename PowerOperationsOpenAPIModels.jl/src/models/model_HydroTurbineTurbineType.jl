"""
    HydroTurbineTurbineType

Type of the turbine.
"""
struct HydroTurbineTurbineType <: EnumAPIModel
    value::String
    function HydroTurbineTurbineType(value::String)
        value in (
            "UNKNOWN",
            "PELTON",
            "FRANCIS",
            "KAPLAN",
            "TURGO",
            "CROSSFLOW",
            "BULB",
            "DERIAZ",
            "PROPELLER",
            "OTHER",
        ) || throw(ArgumentError("invalid HydroTurbineTurbineType value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{HydroTurbineTurbineType}, value) =
    _decode(HydroTurbineTurbineType, value, true)
function _decode(::Type{HydroTurbineTurbineType}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-19c873cb98e3de7cff11.json",
            pointer="/properties/turbine_type",
        ),
        value,
        "decoding HydroTurbineTurbineType";
        direction=:neutral,
    )
    return HydroTurbineTurbineType(_decode(String, value, false))
end
function _encode_unvalidated(value::HydroTurbineTurbineType)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::HydroTurbineTurbineType) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-19c873cb98e3de7cff11.json",
        pointer="/properties/turbine_type",
    ),
    _encode_unvalidated(value),
    "encoding HydroTurbineTurbineType";
    direction=:neutral,
)
Base.string(value::HydroTurbineTurbineType) = string(value.value)
