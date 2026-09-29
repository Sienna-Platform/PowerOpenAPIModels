struct HydroReservoirLevelDataType <: EnumAPIModel
    value::String
    function HydroReservoirLevelDataType(value::String)
        value in ("USABLE_VOLUME", "TOTAL_VOLUME", "HEAD", "ENERGY") ||
            throw(ArgumentError("invalid HydroReservoirLevelDataType value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{HydroReservoirLevelDataType}, value) =
    _decode(HydroReservoirLevelDataType, value, true)
function _decode(::Type{HydroReservoirLevelDataType}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-af97cc7bb8185ba70477.json",
            pointer="/properties/level_data_type",
        ),
        value,
        "decoding HydroReservoirLevelDataType";
        direction=:neutral,
    )
    return HydroReservoirLevelDataType(_decode(String, value, false))
end
function _encode_unvalidated(value::HydroReservoirLevelDataType)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::HydroReservoirLevelDataType) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-af97cc7bb8185ba70477.json",
        pointer="/properties/level_data_type",
    ),
    _encode_unvalidated(value),
    "encoding HydroReservoirLevelDataType";
    direction=:neutral,
)
Base.string(value::HydroReservoirLevelDataType) = string(value.value)
