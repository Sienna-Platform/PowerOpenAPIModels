"""
    CurrentLossCurve

Losses of a device as a function of the current through it (a converter's DC current), together with the basis the curve is expressed in. `power_units` governs both axes: the y values are power and the x values current, each per-unit on the component's base (current's base being base power over base voltage) or natural. Units: x-axis per power_units — NATURAL_UNITS: kA, COMPONENT_BASE: pu ; y-axis per power_units — NATURAL_UNITS: MW, COMPONENT_BASE: pu .

  - `power_units`: Unit basis a stored value is expressed in. COMPONENT_BASE: per-unit against a base the component records itself. NATURAL_UNITS: the quantity's own physical unit. No system-wide option: a value per-unitized against a shared base records that base on the component and rides as COMPONENT_BASE. Used in three scopes, each read against its own record rather than a document-wide table: a component's own `power_units` (against that component's `base_power`), a cost payload's own `power_units` (e.g. `CostCurve`, against the owning component's `base_power`), and a time series association's own `unit_system` (governing only that one series).
  - `value_curve`: The shape of a loss curve, selected by `curve_type`. `INPUT_OUTPUT` gives the total loss at each flow level -- a constant loss plus a proportional loss rate, in MW of loss per MW of flow. `INCREMENTAL` gives the marginal loss rate instead, the form a piecewise model uses to give different proportional losses on different flow segments. Individual loss fields accept narrower sets of shapes than this union admits; the consuming data layer enforces that, not this schema.
"""
Base.@kwdef struct CurrentLossCurve <: APIModel
    power_units::UnitSystem
    value_curve::LossValueCurve
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{CurrentLossCurve}, value) = _decode(CurrentLossCurve, value, true)
function _decode(::Type{CurrentLossCurve}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-3e112e0f84e55d01dc3d.json",
            pointer="/\$defs/CurrentLossCurve",
        ),
        _openapi_raw,
        "decoding CurrentLossCurve";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "CurrentLossCurve")
    _openapi_field_power_units = _decode(
        UnitSystem,
        _required(_openapi_object, "power_units", "CurrentLossCurve"),
        false,
    )
    _openapi_field_value_curve = _decode(
        LossValueCurve,
        _required(_openapi_object, "value_curve", "CurrentLossCurve"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("power_units", "value_curve") && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return CurrentLossCurve(;
        power_units=_openapi_field_power_units,
        value_curve=_openapi_field_value_curve,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::CurrentLossCurve)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.power_units isa Absent ||
        (_openapi_output["power_units"] = _encode_unvalidated(_openapi_value.power_units))
    _openapi_value.value_curve isa Absent ||
        (_openapi_output["value_curve"] = _encode_unvalidated(_openapi_value.value_curve))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(
            ArgumentError(
                "additional property conflicts with declared field: " * _openapi_key,
            ),
        )
        _openapi_output[_openapi_key] = _encode_unvalidated(_openapi_item)
    end
    return _openapi_output
end
_encode(_openapi_value::CurrentLossCurve) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-3e112e0f84e55d01dc3d.json",
        pointer="/\$defs/CurrentLossCurve",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding CurrentLossCurve";
    direction=:neutral,
)

function _form_fields(_openapi_value::CurrentLossCurve)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.power_units isa Absent ||
        push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.value_curve isa Absent ||
        push!(_openapi_output, "value_curve" => _openapi_value.value_curve)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
