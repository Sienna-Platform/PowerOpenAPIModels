@doc "    ReservoirLocation\n\nPosition of a hydro reservoir relative to its turbine: `HEAD` upstream of the turbine, typically at higher elevation; `TAIL` downstream, at lower or equal elevation."
struct ReservoirLocation
    value::String
    function ReservoirLocation(value::String)
        value in ("HEAD","TAIL") || throw(ArgumentError("invalid ReservoirLocation value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{ReservoirLocation}, value) = _decode(ReservoirLocation, value, true)
function _decode(::Type{ReservoirLocation}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/ReservoirLocation"), value, "decoding ReservoirLocation"; direction = :neutral)
    return ReservoirLocation(_decode(String, value, _openapi_validate))
end
function _encode(value::ReservoirLocation)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/ReservoirLocation"), output, "encoding ReservoirLocation"; direction = :neutral)
end
Base.string(value::ReservoirLocation) = string(value.value)
