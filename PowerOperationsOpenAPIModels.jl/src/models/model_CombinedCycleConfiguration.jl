"""
    CombinedCycleConfiguration

Shaft and turbine arrangement of a combined cycle plant: a single shaft carrying one combustion and one steam turbine, separate shafts for the two, two or three combustion turbines feeding one steam turbine, or `Other` for any arrangement outside these.
"""
struct CombinedCycleConfiguration <: EnumAPIModel
    value::String
    function CombinedCycleConfiguration(value::String)
        value in (
            "SingleShaftCombustionSteam",
            "SeparateShaftCombustionSteam",
            "DoubleCombustionOneSteam",
            "TripleCombustionOneSteam",
            "Other",
        ) || throw(ArgumentError("invalid CombinedCycleConfiguration value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{CombinedCycleConfiguration}, value) =
    _decode(CombinedCycleConfiguration, value, true)
function _decode(::Type{CombinedCycleConfiguration}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-98ed6538b1d3543b4530.json",
            pointer="/\$defs/CombinedCycleConfiguration",
        ),
        value,
        "decoding CombinedCycleConfiguration";
        direction=:neutral,
    )
    return CombinedCycleConfiguration(_decode(String, value, false))
end
function _encode_unvalidated(value::CombinedCycleConfiguration)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::CombinedCycleConfiguration) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-98ed6538b1d3543b4530.json",
        pointer="/\$defs/CombinedCycleConfiguration",
    ),
    _encode_unvalidated(value),
    "encoding CombinedCycleConfiguration";
    direction=:neutral,
)
Base.string(value::CombinedCycleConfiguration) = string(value.value)
