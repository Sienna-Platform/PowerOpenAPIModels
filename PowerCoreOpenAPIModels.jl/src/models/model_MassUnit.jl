"""
    MassUnit

Mass unit an emission quantity is reported in: kilograms, pounds, short tons (2000 lb), or metric tons (1000 kg).
"""
struct MassUnit <: EnumAPIModel
    value::String
    function MassUnit(value::String)
        value in ("KG", "LB", "SHORT_TON", "METRIC_TON") ||
            throw(ArgumentError("invalid MassUnit value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{MassUnit}, value) = _decode(MassUnit, value, true)
function _decode(::Type{MassUnit}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/MassUnit",
        ),
        value,
        "decoding MassUnit";
        direction=:neutral,
    )
    return MassUnit(_decode(String, value, false))
end
function _encode_unvalidated(value::MassUnit)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::MassUnit) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
        pointer="/\$defs/MassUnit",
    ),
    _encode_unvalidated(value),
    "encoding MassUnit";
    direction=:neutral,
)
Base.string(value::MassUnit) = string(value.value)
