@doc "    CombinedCycleConfiguration\n\nShaft and turbine arrangement of a combined cycle plant: a single shaft carrying one combustion and one steam turbine, separate shafts for the two, two or three combustion turbines feeding one steam turbine, or `Other` for any arrangement outside these."
struct CombinedCycleConfiguration
    value::String
    function CombinedCycleConfiguration(value::String)
        value in ("SingleShaftCombustionSteam","SeparateShaftCombustionSteam","DoubleCombustionOneSteam","TripleCombustionOneSteam","Other") || throw(ArgumentError("invalid CombinedCycleConfiguration value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{CombinedCycleConfiguration}, value) = _decode(CombinedCycleConfiguration, value, true)
function _decode(::Type{CombinedCycleConfiguration}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/CombinedCycleConfiguration"), value, "decoding CombinedCycleConfiguration"; direction = :neutral)
    return CombinedCycleConfiguration(_decode(String, value, _openapi_validate))
end
function _encode(value::CombinedCycleConfiguration)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-fd257d251032567e8241.json", pointer = "/components/schemas/CombinedCycleConfiguration"), output, "encoding CombinedCycleConfiguration"; direction = :neutral)
end
Base.string(value::CombinedCycleConfiguration) = string(value.value)
