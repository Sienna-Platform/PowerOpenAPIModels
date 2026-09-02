@doc "    HydroTurbineTurbineType\n\nType of the turbine."
struct HydroTurbineTurbineType
    value::String
    function HydroTurbineTurbineType(value::String)
        value in ("UNKNOWN","PELTON","FRANCIS","KAPLAN","TURGO","CROSSFLOW","BULB","DERIAZ","PROPELLER","OTHER") || throw(ArgumentError("invalid HydroTurbineTurbineType value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{HydroTurbineTurbineType}, value) = _decode(HydroTurbineTurbineType, value, true)
function _decode(::Type{HydroTurbineTurbineType}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/HydroTurbine/properties/turbine_type"), value, "decoding HydroTurbineTurbineType"; direction = :neutral)
    return HydroTurbineTurbineType(_decode(String, value, _openapi_validate))
end
function _encode(value::HydroTurbineTurbineType)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/HydroTurbine/properties/turbine_type"), output, "encoding HydroTurbineTurbineType"; direction = :neutral)
end
Base.string(value::HydroTurbineTurbineType) = string(value.value)
