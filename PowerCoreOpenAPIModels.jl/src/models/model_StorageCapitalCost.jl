"""
    StorageCapitalCost

Investment cost for candidate generation and transmission technologies which includes overnight capital costs and last-mile interconnection costs.

  - `charge_capital_cost`: A cost or fuel curve: function data plus a declaration of how to read its y axis. `INPUT_OUTPUT` reads y as the total `f(x)`, `INCREMENTAL` as the marginal rate `f'(x)`, and `AVERAGE_RATE` as the average `f(x)/x`; the three can express the same underlying function and are inter-convertible given `initial_input`. The `TIME_SERIES_*` variants are the time-varying equivalents. Which form to use follows the data source: bid stacks are incremental, total cost tables input-output, efficiency tables average rate.
  - `discharge_capital_cost`: A cost or fuel curve: function data plus a declaration of how to read its y axis. `INPUT_OUTPUT` reads y as the total `f(x)`, `INCREMENTAL` as the marginal rate `f'(x)`, and `AVERAGE_RATE` as the average `f(x)/x`; the three can express the same underlying function and are inter-convertible given `initial_input`. The `TIME_SERIES_*` variants are the time-varying equivalents. Which form to use follows the data source: bid stacks are incremental, total cost tables input-output, efficiency tables average rate.
  - `energy_capital_cost`: A cost or fuel curve: function data plus a declaration of how to read its y axis. `INPUT_OUTPUT` reads y as the total `f(x)`, `INCREMENTAL` as the marginal rate `f'(x)`, and `AVERAGE_RATE` as the average `f(x)/x`; the three can express the same underlying function and are inter-convertible given `initial_input`. The `TIME_SERIES_*` variants are the time-varying equivalents. Which form to use follows the data source: bid stacks are incremental, total cost tables input-output, efficiency tables average rate.
"""
Base.@kwdef struct StorageCapitalCost <: APIModel
    charge_capital_cost::ValueCurve
    discharge_capital_cost::ValueCurve
    energy_capital_cost::ValueCurve
    interconnection_cost::Float64
    additional_properties::Dict{String, Any} = Dict{String, Any}()
end
_decode(::Type{StorageCapitalCost}, value) = _decode(StorageCapitalCost, value, true)
function _decode(::Type{StorageCapitalCost}, _openapi_raw, _openapi_validate::Bool)
    _openapi_validate && _validate_schema(
        _SPEC,
        (
            resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
            pointer="/\$defs/StorageCapitalCost",
        ),
        _openapi_raw,
        "decoding StorageCapitalCost";
        direction=:neutral,
    )
    _openapi_object = _object(_openapi_raw, "StorageCapitalCost")
    _openapi_field_charge_capital_cost = _decode(
        ValueCurve,
        _required(_openapi_object, "charge_capital_cost", "StorageCapitalCost"),
        false,
    )
    _openapi_field_discharge_capital_cost = _decode(
        ValueCurve,
        _required(_openapi_object, "discharge_capital_cost", "StorageCapitalCost"),
        false,
    )
    _openapi_field_energy_capital_cost = _decode(
        ValueCurve,
        _required(_openapi_object, "energy_capital_cost", "StorageCapitalCost"),
        false,
    )
    _openapi_field_interconnection_cost = _decode(
        Float64,
        _required(_openapi_object, "interconnection_cost", "StorageCapitalCost"),
        false,
    )
    _openapi_additional_properties = Dict{String, Any}()
    for (_openapi_key, _openapi_item) in _openapi_object
        String(_openapi_key) in (
            "charge_capital_cost",
            "discharge_capital_cost",
            "energy_capital_cost",
            "interconnection_cost",
        ) && continue
        _openapi_additional_properties[String(_openapi_key)] =
            _decode(Any, _openapi_item, false)
    end
    return StorageCapitalCost(;
        charge_capital_cost=_openapi_field_charge_capital_cost,
        discharge_capital_cost=_openapi_field_discharge_capital_cost,
        energy_capital_cost=_openapi_field_energy_capital_cost,
        interconnection_cost=_openapi_field_interconnection_cost,
        additional_properties=_openapi_additional_properties,
    )
end
function _encode_unvalidated(_openapi_value::StorageCapitalCost)
    _openapi_output = JSON.Object{String, Any}()
    _openapi_value.charge_capital_cost isa Absent || (
        _openapi_output["charge_capital_cost"] =
            _encode_unvalidated(_openapi_value.charge_capital_cost)
    )
    _openapi_value.discharge_capital_cost isa Absent || (
        _openapi_output["discharge_capital_cost"] =
            _encode_unvalidated(_openapi_value.discharge_capital_cost)
    )
    _openapi_value.energy_capital_cost isa Absent || (
        _openapi_output["energy_capital_cost"] =
            _encode_unvalidated(_openapi_value.energy_capital_cost)
    )
    _openapi_value.interconnection_cost isa Absent || (
        _openapi_output["interconnection_cost"] =
            _encode_unvalidated(_openapi_value.interconnection_cost)
    )
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
_encode(_openapi_value::StorageCapitalCost) = _validate_schema(
    _SPEC,
    (
        resource="https://openapi.invalid/schema/external-0936a17371037c3b813d.json",
        pointer="/\$defs/StorageCapitalCost",
    ),
    _encode_unvalidated(_openapi_value),
    "encoding StorageCapitalCost";
    direction=:neutral,
)

function _form_fields(_openapi_value::StorageCapitalCost)
    _openapi_output = Pair{String, Any}[]
    _openapi_value.charge_capital_cost isa Absent ||
        push!(_openapi_output, "charge_capital_cost" => _openapi_value.charge_capital_cost)
    _openapi_value.discharge_capital_cost isa Absent || push!(
        _openapi_output,
        "discharge_capital_cost" => _openapi_value.discharge_capital_cost,
    )
    _openapi_value.energy_capital_cost isa Absent ||
        push!(_openapi_output, "energy_capital_cost" => _openapi_value.energy_capital_cost)
    _openapi_value.interconnection_cost isa Absent || push!(
        _openapi_output,
        "interconnection_cost" => _openapi_value.interconnection_cost,
    )
    append!(_openapi_output, collect(_openapi_value.additional_properties))
    return _openapi_output
end
