@doc "    UnitSystem\n\nUnit basis a stored value is expressed in. COMPONENT_BASE: per-unit against a base the component records itself. NATURAL_UNITS: the quantity's own physical unit. No system-wide option: a value per-unitized against a shared base records that base on the component and rides as COMPONENT_BASE. Used in three scopes, each read against its own record rather than a document-wide table: a component's own `power_units` (against that component's `base_power`), a cost payload's own `power_units` (e.g. `CostCurve`, against the owning component's `base_power`), and a time series association's own `unit_system` (governing only that one series)."
struct UnitSystem
    value::String
    function UnitSystem(value::String)
        value in ("COMPONENT_BASE","NATURAL_UNITS") || throw(ArgumentError("invalid UnitSystem value $(repr(value))"))
        return new(value)
    end
end
_decode(::Type{UnitSystem}, value) = _decode(UnitSystem, value, true)
function _decode(::Type{UnitSystem}, value, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/UnitSystem"), value, "decoding UnitSystem"; direction = :neutral)
    return UnitSystem(_decode(String, value, _openapi_validate))
end
function _encode(value::UnitSystem)
    output = _encode(value.value)
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-3647af479ce96eb73174.json", pointer = "/components/schemas/UnitSystem"), output, "encoding UnitSystem"; direction = :neutral)
end
Base.string(value::UnitSystem) = string(value.value)
