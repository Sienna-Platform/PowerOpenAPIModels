"""
    ReservoirLocation

Position of a hydro reservoir relative to its turbine: `HEAD` upstream of the turbine, typically at higher elevation; `TAIL` downstream, at lower or equal elevation.
"""
struct ReservoirLocation <: EnumAPIModel
    value::String
    function ReservoirLocation(value::String)
        value in ("HEAD", "TAIL") ||
            throw(ArgumentError("invalid ReservoirLocation value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ReservoirLocation}, value) = _decode(ReservoirLocation, value, true)
function _decode(::Type{ReservoirLocation}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/ReservoirLocation",
        ),
        value,
        "decoding ReservoirLocation";
        direction=:neutral,
    )
    return ReservoirLocation(_decode(String, value, false))
end
function _encode_unvalidated(value::ReservoirLocation)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::ReservoirLocation) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
        pointer="/\$defs/ReservoirLocation",
    ),
    _encode_unvalidated(value),
    "encoding ReservoirLocation";
    direction=:neutral,
)
Base.string(value::ReservoirLocation) = string(value.value)
