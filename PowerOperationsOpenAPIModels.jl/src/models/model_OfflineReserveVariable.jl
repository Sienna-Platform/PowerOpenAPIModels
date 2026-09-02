@doc "    OfflineReserveVariable\n\nOperating reserve demand curve, either static or time-series-backed. Time series values are carried via `time_series_associations` in the sidecar, never inline. Omit when the reserve has no demand curve.\n\n- `power_units`: Unit basis a stored value is expressed in. COMPONENT_BASE: per-unit against a base the component records itself. NATURAL_UNITS: the quantity's own physical unit. No system-wide option: a value per-unitized against a shared base records that base on the component and rides as COMPONENT_BASE. Used in three scopes, each read against its own record rather than a document-wide table: a component's own `power_units` (against that component's `base_power`), a cost payload's own `power_units` (e.g. `CostCurve`, against the owning component's `base_power`), and a time series association's own `unit_system` (governing only that one series).\n- `value_curve`: A cost or fuel curve: function data plus a declaration of how to read its y axis. `INPUT_OUTPUT` reads y as the total `f(x)`, `INCREMENTAL` as the marginal rate `f'(x)`, and `AVERAGE_RATE` as the average `f(x)/x`; the three can express the same underlying function and are inter-convertible given `initial_input`. The `TIME_SERIES_*` variants are the time-varying equivalents. Which form to use follows the data source: bid stacks are incremental, total cost tables input-output, efficiency tables average rate.\n- `vom_cost`: A curve whose y values are the total input `f(x)` at production level `x` — currency per hour against MW in a cost curve, fuel per hour against MW in a fuel curve. The y axis is an absolute quantity, not a rate; use `IncrementalCurve` for marginal-rate data."
Base.@kwdef struct OfflineReserveVariable
    power_units::UnitSystem
    value_curve::ValueCurve
    variable_cost_type::String
    vom_cost::InputOutputCurve
    additional_properties::Dict{String,Any} = Dict{String,Any}()
end
_decode(::Type{OfflineReserveVariable}, value) = _decode(OfflineReserveVariable, value, true)
function _decode(::Type{OfflineReserveVariable}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/OfflineReserve/properties/variable"), _openapi_raw, "decoding OfflineReserveVariable"; direction = :neutral)
    _openapi_object = _object(_openapi_raw, "OfflineReserveVariable")
    _openapi_field_power_units = _decode(UnitSystem, _required(_openapi_object, "power_units", "OfflineReserveVariable"), _openapi_validate)
    _openapi_field_value_curve = _decode(ValueCurve, _required(_openapi_object, "value_curve", "OfflineReserveVariable"), _openapi_validate)
    _openapi_field_variable_cost_type = _decode(String, _required(_openapi_object, "variable_cost_type", "OfflineReserveVariable"), _openapi_validate)
    _openapi_field_vom_cost = _decode(InputOutputCurve, _required(_openapi_object, "vom_cost", "OfflineReserveVariable"), _openapi_validate)
    _openapi_additional_properties = Dict{String,Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in ("power_units","value_curve","variable_cost_type","vom_cost") && continue
        _openapi_additional_properties[String(_openapi_key)] = _decode(Any, _openapi_item, _openapi_validate)
    end
    return OfflineReserveVariable(; power_units = _openapi_field_power_units, value_curve = _openapi_field_value_curve, variable_cost_type = _openapi_field_variable_cost_type, vom_cost = _openapi_field_vom_cost, additional_properties = _openapi_additional_properties)
end
function _encode(_openapi_value::OfflineReserveVariable)
    _openapi_output = JSON.Object{String,Any}()
    _openapi_value.power_units isa Absent || (_openapi_output["power_units"] = _encode(_openapi_value.power_units))
    _openapi_value.value_curve isa Absent || (_openapi_output["value_curve"] = _encode(_openapi_value.value_curve))
    _openapi_value.variable_cost_type isa Absent || (_openapi_output["variable_cost_type"] = _encode(_openapi_value.variable_cost_type))
    _openapi_value.vom_cost isa Absent || (_openapi_output["vom_cost"] = _encode(_openapi_value.vom_cost))
    for (_openapi_key, _openapi_item) in _openapi_value.additional_properties
        haskey(_openapi_output, _openapi_key) && throw(ArgumentError("additional property conflicts with declared field: " * _openapi_key))
        _openapi_output[_openapi_key] = _encode(_openapi_item)
    end
    return _validate_schema(_SPEC, (resource = "https://openapi.invalid/schema/root-1068b1dda553e6e25b3b.json", pointer = "/components/schemas/OfflineReserve/properties/variable"), _openapi_output, "encoding OfflineReserveVariable"; direction = :neutral)
end

function _form_fields(_openapi_value::OfflineReserveVariable)
    _openapi_output = Pair{String,Any}[]
    _openapi_value.power_units isa Absent || push!(_openapi_output, "power_units" => _openapi_value.power_units)
    _openapi_value.value_curve isa Absent || push!(_openapi_output, "value_curve" => _openapi_value.value_curve)
    _openapi_value.variable_cost_type isa Absent || push!(_openapi_output, "variable_cost_type" => _openapi_value.variable_cost_type)
    _openapi_value.vom_cost isa Absent || push!(_openapi_output, "vom_cost" => _openapi_value.vom_cost)
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
