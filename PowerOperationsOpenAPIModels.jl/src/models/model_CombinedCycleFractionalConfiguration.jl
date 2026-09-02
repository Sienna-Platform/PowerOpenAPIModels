@doc "    CombinedCycleFractionalConfiguration\n\nShaft and turbine arrangement of a combined cycle plant: a single shaft carrying one combustion and one steam turbine, separate shafts for the two, two or three combustion turbines feeding one steam turbine, or `Other` for any arrangement outside these."
struct CombinedCycleFractionalConfiguration
    value::String
    function CombinedCycleFractionalConfiguration(value::String)
        value in ("SingleShaftCombustionSteam","SeparateShaftCombustionSteam","DoubleCombustionOneSteam","TripleCombustionOneSteam","Other") || throw(ArgumentError("invalid CombinedCycleFractionalConfiguration value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{CombinedCycleFractionalConfiguration}, value) = _decode(CombinedCycleFractionalConfiguration, value, true)
function _decode(::Type{CombinedCycleFractionalConfiguration}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/CombinedCycleFractional/properties/configuration"), value, "decoding CombinedCycleFractionalConfiguration"; direction = :neutral)
    return CombinedCycleFractionalConfiguration(_decode(String, value, _openapi_validate))
end
function _encode(value::CombinedCycleFractionalConfiguration)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/CombinedCycleFractional/properties/configuration"), output, "encoding CombinedCycleFractionalConfiguration"; direction = :neutral)
end
Base.string(value::CombinedCycleFractionalConfiguration) = string(value.value)
