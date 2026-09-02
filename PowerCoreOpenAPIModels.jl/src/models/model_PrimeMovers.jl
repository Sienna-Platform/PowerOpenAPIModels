@doc "    PrimeMovers\n\nPrime mover of a generating unit — the engine, turbine, water wheel, or similar machine that drives the generator — using the code set from the EIA Form 923 instructions. `PVe` is photovoltaic, spelled that way so it does not collide with the `PV` bus type."
struct PrimeMovers
    value::String
    function PrimeMovers(value::String)
        value in ("BA","BT","CA","CC","CE","CP","CS","CT","ES","FC","FW","GT","HA","HB","HK","HY","IC","PS","OT","ST","PVe","WT","WS") || throw(ArgumentError("invalid PrimeMovers value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{PrimeMovers}, value) = _decode(PrimeMovers, value, true)
function _decode(::Type{PrimeMovers}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/PrimeMovers"), value, "decoding PrimeMovers"; direction = :neutral)
    return PrimeMovers(_decode(String, value, _openapi_validate))
end
function _encode(value::PrimeMovers)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-66da9c296f8dc2d2bc25.json", pointer = "/components/schemas/PrimeMovers"), output, "encoding PrimeMovers"; direction = :neutral)
end
Base.string(value::PrimeMovers) = string(value.value)
