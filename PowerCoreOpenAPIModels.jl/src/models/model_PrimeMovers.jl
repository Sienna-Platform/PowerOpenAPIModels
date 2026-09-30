"""
    PrimeMovers

Prime mover of a generating unit — the engine, turbine, water wheel, or similar machine that drives the generator — using the code set from the EIA Form 923 instructions. `PVe` is photovoltaic, spelled that way so it does not collide with the `PV` bus type.
"""
struct PrimeMovers <: EnumAPIModel
    value::String
    function PrimeMovers(value::String)
        value in (
            "BA",
            "BT",
            "CA",
            "CC",
            "CE",
            "CP",
            "CS",
            "CT",
            "ES",
            "FC",
            "FW",
            "GT",
            "HA",
            "HB",
            "HK",
            "HY",
            "IC",
            "PS",
            "OT",
            "ST",
            "PVe",
            "WT",
            "WS",
        ) || throw(ArgumentError("invalid PrimeMovers value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{PrimeMovers}, value) = _decode(PrimeMovers, value, true)
function _decode(::Type{PrimeMovers}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/PrimeMovers",
        ),
        value,
        "decoding PrimeMovers";
        direction=:neutral,
    )
    return PrimeMovers(_decode(String, value, false))
end
function _encode_unvalidated(value::PrimeMovers)
    output = _encode_unvalidated(value.value)
    return output
end
_encode(value::PrimeMovers) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
        pointer="/\$defs/PrimeMovers",
    ),
    _encode_unvalidated(value),
    "encoding PrimeMovers";
    direction=:neutral,
)
Base.string(value::PrimeMovers) = string(value.value)
