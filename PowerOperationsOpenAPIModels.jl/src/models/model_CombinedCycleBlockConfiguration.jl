@doc "    CombinedCycleBlockConfiguration\n\nShaft and turbine arrangement of a combined cycle plant: a single shaft carrying one combustion and one steam turbine, separate shafts for the two, two or three combustion turbines feeding one steam turbine, or `Other` for any arrangement outside these."
struct CombinedCycleBlockConfiguration
    value::String
    function CombinedCycleBlockConfiguration(value::String)
        value in ("SingleShaftCombustionSteam","SeparateShaftCombustionSteam","DoubleCombustionOneSteam","TripleCombustionOneSteam","Other") || throw(ArgumentError("invalid CombinedCycleBlockConfiguration value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{CombinedCycleBlockConfiguration}, value) = _decode(CombinedCycleBlockConfiguration, value, true)
function _decode(::Type{CombinedCycleBlockConfiguration}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/CombinedCycleBlock/properties/configuration"), value, "decoding CombinedCycleBlockConfiguration"; direction = :neutral)
    return CombinedCycleBlockConfiguration(_decode(String, value, _openapi_validate))
end
function _encode(value::CombinedCycleBlockConfiguration)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/CombinedCycleBlock/properties/configuration"), output, "encoding CombinedCycleBlockConfiguration"; direction = :neutral)
end
Base.string(value::CombinedCycleBlockConfiguration) = string(value.value)
