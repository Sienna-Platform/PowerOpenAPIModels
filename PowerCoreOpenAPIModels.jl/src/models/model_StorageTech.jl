"""
    StorageTech

defines the storage technology used in an energy Storage system, based on the options in EIA form 923.
"""
struct StorageTech <: EnumAPIModel
    value::String
    function StorageTech(value::String)
        value in (
            "PTES",
            "LIB",
            "LAB",
            "FLWB",
            "SIB",
            "ZIB",
            "HGS",
            "LAES",
            "OTHER_CHEM",
            "OTHER_MECH",
            "OTHER_THERM",
        ) || throw(ArgumentError("invalid StorageTech value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{StorageTech}, value) = _decode(StorageTech, value, true)
function _decode(::Type{StorageTech}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/StorageTech",
        ),
        value,
        "decoding StorageTech";
        direction=:neutral,
    )
    return StorageTech(_decode(String, value, false))
end
function _encode_unvalidated(value::StorageTech)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::StorageTech) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
        pointer="/\$defs/StorageTech",
    ),
    _encode_unvalidated(value),
    "encoding StorageTech";
    direction=:neutral,
)
Base.string(value::StorageTech) = string(value.value)
